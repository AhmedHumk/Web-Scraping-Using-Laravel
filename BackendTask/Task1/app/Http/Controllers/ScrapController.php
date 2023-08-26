<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Symfony\Component\BrowserKit\HttpBrowser;
use Symfony\Component\DomCrawler\Crawler;
use App\Http\Controllers\Constants;
use App\Models\ScrapedData;

class ScrapController extends Controller
{
    public function Scraper(Request $request){
        try {
            // Get the necessary data from the request
            $Pagenumber = $request->input('page');
            $targeturl = Constants::SiteUrl;
            $loadMore = strlen($Pagenumber) >=1;
            // Create a new HttpBrowser instance
            $browser = new HttpBrowser();

             // Make a GET request to the target URL
             if($loadMore){
                $crawler = $browser->request('GET', $targeturl."?page=".$Pagenumber);
             } else {
                $crawler = $browser->request('GET', $targeturl);
             }
             // Scrape the data from the crawler
             $results = $this->scrapeData($crawler);
            // Check if there is a "Load more" button so we cant grab more books similar to the Target pagination.
            $loadMoreLink = $crawler->filter('.pager__item a.button[rel="next"]');
            $pagesCount = $loadMoreLink->count();
            $pageUrl = null;
            if ($pagesCount > 0) {
                $pageUrl = $loadMoreLink->attr('href');
            }
            // Return the response
            if ($loadMore){
                // Check if $pageUrl is null
                if ($pageUrl === null) {
                    return response()->json(['message' => 'No pages found']);
                }
                return response()->json(['results' => $results, 'pagesCount' => $pagesCount, 'pageUrl' => $pageUrl]);
            } else {
                return view("Scraper", compact('results', 'pagesCount', 'pageUrl'));
            }
        } catch (\Exception $e) {
            // Handle Exceptions
            return response()->json(['error' => $e->getMessage()], 500);
        }
    }

    // a private function to scrap the data from crawler
    private function scrapeData(Crawler $crawler)
    {
        $results = [];
        
        $crawler->filter('.book-teaser')->each(function (Crawler $node) use (&$results) {
            $bookhref = $node->filter('.title a');
            $author = $node->filter('.author-label a')->text();
            $title = $bookhref->text();
            $bookUrl = $bookhref->attr('href');

            $insertResults = $this->InsertScrapedData($author, $title);
            
            $results[] = [
                'title' => $title,
                'author' => $author,
                'bookurl' => $bookUrl,
            ];
        });
        
        return $results;
    }
    // insert record to a database 
    private function InsertScrapedData($author, $BookName){
        try {
            // Check if the book already exists
            $existingBook = ScrapedData::where('BookName', $BookName)->first();

            if ($existingBook) {
                // Book already exists, return failure indicator
                return false;
            }
            // Insert the scraped data into the table
            ScrapedData::create([
                'BookName' => $BookName,
                'Author' => $author,
            ]);
            return true;
        } catch (\Exception $e) {
            return false;
        }
    }


    public function getBookDetails(Request $request)
    {
    try {
        $BookName = $request->input('book_name');
        $bookUrl = Constants::BaseUrl.$BookName;
        // Create a new HttpBrowser instance
        $browser = new HttpBrowser();

        // Make a GET request to the book URL
        $crawler = $browser->request('GET', $bookUrl);
        // Scrape the book details
        $navItems = $crawler->filter('.book-table-info');
        $bookPages = $navItems->filter('p')->eq(1)->text();
        $bookLang = $navItems->filter('p')->eq(3)->text();
        $bookDownloads = $navItems->filter('p')->eq(7)->text();
        $bookSize =  $navItems->filter('p')->eq(5)->text();
        $bookFileType = $navItems->filter('p')->eq(9)->text();
        $bookPdfLink = $crawler->filter('.box-btn .download')->attr('href');
        $bookPdfDownload = Constants::BaseUrl.$bookPdfLink;

        // Return the book details as JSON response
        return response()->json([
            'bookPages' => $bookPages,
            'bookLang' => $bookLang,
            'bookSize' => $bookSize,
            'bookDownloads' => $bookDownloads,
            'bookFileType' => $bookFileType,
            'bookPdfLink' => $bookPdfDownload,
        ]);
    } catch (\Exception $e) {
        // Handle Exceptions
        return response()->json(['error' => $e->getMessage()], 500);
    }
}

}