<!DOCTYPE html>
<html lang="en">
<head>
<title>Scrapping</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script src="{{ asset('js/Loadmore.js') }}"></script>
</head>
<body>
<h1>Results</h1>
<div id="resultsContainer">
        <h2>Scraped Results:</h2>
        <ul>
            @foreach ($results as $result)
                <li>Book Title: {{ $result['title'] }}</li>
                <li>Book Author: {{ $result['author'] }}</li>
            @endforeach
        </ul>
        <button type="button" id="load-more-button" data-page="{{ $pageUrl }}" onclick="loadMore()">Load More</button>
    </div>
</body>
</html>