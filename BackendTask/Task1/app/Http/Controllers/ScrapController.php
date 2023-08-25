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
            $title = $node->filter('.title a')->text();
            $author = $node->filter('.author-label a')->text();

            $insertResults = $this->InsertScrapedData($author, $title);
            
            $results[] = [
                'title' => $title,
                'author' => $author,
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
}
