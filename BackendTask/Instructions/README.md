## # Step 1 Creating the Project for this Task1
- Option 1 : `laravel new Task1`
- Option 2 : `composer create-project --prefer-dist laravel/laravel Task1`

## Step 2
Enter to your Project destination in your terminal :  `cd Task1`

## Step3 Install Required Package List
- `composer require symfony/browser-kit`
- `composer require symfony/http-client`

## Step4 Create your controllers
- `php artisan make:controller ScrapController`
- `php artisan make:controller Constants`

###### Constants is user to hold our constant variables that we aim to use without changes.

## Step5 run the server
- Option 1 : `php artisan serve`
- Option 2 : `php artisan serve --port=[PortNumber]`

###### I do scraping for this Target based on the sent Task.
https://www.kotobati.com/section/%D8%B1%D9%88%D8%A7%D9%8A%D8%A7%D8%AA
###### you can add `?page=[numbers]`  to the end of the url to simulate the pagination on the targeted website.
###### Example when you run the Project
`http://127.0.0.1:6753/Scraper?page=10`

This Will Gives You A Simulation Of The Loadmore Pagination Event On The Target Website. The Out Put Will Be Given As Json.



## Step6 Store our Scraped data into Database
1- set your database connection in .env file
2- create scraped table by running migration : `php artisan make:migration create_scraped_data_table --create=scraped_data`
3- run Migration command : `php artisan migrate`
##### Optional if you want to reset the migration process just execute this command.
`php artisan migrate:reset`
4- Create A Model to Start Communicating with our database table :
`php artisan make:model ScrapedData`

## Extra Details to setup the machine that will hold this Project
- You need to have Xampp or any other sql driver.
- You need to install composer.

###### if you are using vs code then run the following command in terminal.
`composer global require laravel/installer`