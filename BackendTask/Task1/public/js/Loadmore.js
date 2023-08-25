function loadMore() {
    var pageUrl = document.getElementById('load-more-button').getAttribute('data-page');
    var xhr = new XMLHttpRequest();
    xhr.open('GET', '/Scraper' + (pageUrl), true);
    xhr.setRequestHeader('X-Requested-With', 'XMLHttpRequest');
    xhr.onreadystatechange = function() {
        if (xhr.readyState === 4 && xhr.status === 200) {
            var response = JSON.parse(xhr.responseText);
            // Append the scraped results to the existing list
            var resultsContainer = document.getElementById('resultsContainer');
            var ul = resultsContainer.getElementsByTagName('ul')[0];
            response.results.forEach(function(result) {
                var BookTitle = document.createElement('li');
                var BookAuthor = document.createElement('li');
                BookTitle.innerHTML = 'Book Title: ' + result.title;
                BookAuthor.innerHTML = 'Book Author: ' + result.author;
                ul.appendChild(BookTitle);
                ul.appendChild(BookAuthor);
            });
            // Update the data-page attribute of the button
            document.getElementById('load-more-button').setAttribute('data-page', response.pageUrl);
            // Hide the button if there are no more pages
            if (response.pagesCount === 0) {
                document.getElementById('load-more-button').style.display = 'none';
            }
        }
    };
    xhr.send();
}