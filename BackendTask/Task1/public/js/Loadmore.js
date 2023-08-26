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
                var DetailesButton = document.createElement('li');
                var dbtn = document.createElement('button');
                var hrline = document.createElement('hr');
                BookTitle.innerHTML = 'Book Title: ' + result.title;
                BookAuthor.innerHTML = 'Book Author: ' + result.author;
                dbtn.type = "button";
                dbtn.setAttribute('onClick', "getBookDetails(this)");
                dbtn.setAttribute('data-bookurl', result.bookurl);
                dbtn.textContent = "View Details";
                DetailesButton.appendChild(dbtn);
                ul.appendChild(BookTitle);
                ul.appendChild(BookAuthor);
                ul.appendChild(DetailesButton);
                ul.appendChild(hrline);

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

function getBookDetails(button) {
    var xhr = new XMLHttpRequest();
    var dataBookName = button.getAttribute('data-bookurl');
    console.log(dataBookName);
    xhr.open('GET', '/getBookDetails?book_name=' + dataBookName, true);
    xhr.setRequestHeader('X-Requested-With', 'XMLHttpRequest');
    xhr.onreadystatechange = function() {
        if (xhr.readyState === 4 && xhr.status === 200) {
            var response = JSON.parse(xhr.responseText);
            console.log(response);
            // Update the book details in the UI
            var bookDetailsContainer = document.getElementById('book-details-container');
            bookDetailsContainer.innerHTML = '';
            var bookPages = document.createElement('p');
            var bookSize = document.createElement('p');
            var booklanguage = document.createElement('p');
            var bookDownloads = document.createElement('p');
            var bookFileType = document.createElement('p');
            var bookPdfLink = document.createElement('a');
            bookPages.textContent = 'Book Pages: ' + response.bookPages;
            bookSize.textContent = 'Book Size: ' + response.bookSize;
            booklanguage.textContent = 'Book Language: ' + response.bookLang;
            bookDownloads.textContent = 'Book Downloads: ' + response.bookDownloads;
            bookFileType.textContent = 'Book File Type: ' + response.bookFileType;
            bookPdfLink.textContent = 'Book PDF Link';
            bookPdfLink.href = response.bookPdfLink;
            bookDetailsContainer.appendChild(bookPages);
            bookDetailsContainer.appendChild(bookSize);
            bookDetailsContainer.appendChild(booklanguage);
            bookDetailsContainer.appendChild(bookDownloads);
            bookDetailsContainer.appendChild(bookFileType);
            bookDetailsContainer.appendChild(bookPdfLink);
        }
    };
    xhr.send();
}