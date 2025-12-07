create schema airdnb_analysis;
use airdnb_analysis;
CREATE TABLE airbnb_listings (
    id BIGINT,
    name VARCHAR(255),
    host_id BIGINT,
    host_name VARCHAR(255),
    neighbourhood_group VARCHAR(100),
    neighbourhood VARCHAR(200),
    room_type VARCHAR(100),
    price INT,
    minimum_nights INT,
    number_of_reviews INT,
    last_review DATE,
    calculated_host_listings_count INT,
    availability_365 INT,
    license VARCHAR(255),
    rating FLOAT,
    bedrooms INT,
    beds INT,
    baths FLOAT,
    license_grouped VARCHAR(100)
);
desc airdnb_analysis.airbnb_listings;
select * from airdnb_analysis.airbnb_listings;
-- 1Q. Get all listings where the price is below 200 and the rating is above 4.5.
SELECT id, name, price, rating
FROM airbnb_listings
WHERE price < 200 AND rating > 4.5;
-- 2Q. Show listings located in Manhattan or Brooklyn.
SELECT id, name, neighbourhood_group
FROM airbnb_listings
WHERE neighbourhood_group = 'Manhattan'
   OR neighbourhood_group = 'Brooklyn';
-- 3Q. Get listings for hosts who manage more than 5 properties and have availability under 50 days.
SELECT id, host_id, calculated_host_listings_count, availability_365
FROM airbnb_listings
WHERE calculated_host_listings_count > 5
  AND availability_365 < 50;
-- 4Q. Find listings priced above 500 or those with more than 100 reviews.
SELECT id, name, price, number_of_reviews
FROM airbnb_listings
WHERE price > 500
   OR number_of_reviews > 100;
-- 5Q. Show all "Entire home/apt" listings where minimum nights is greater than 3 and rating is above 4.
SELECT id, name, room_type, minimum_nights, rating
FROM airbnb_listings
WHERE room_type = 'Entire home/apt'
  AND minimum_nights > 3
  AND rating > 4;
--  6Q. Show listings that either have proper license numbers or are marked as Exempt.
  SELECT id, name, license
FROM airbnb_listings
WHERE license_grouped = 'Licensed'
   OR license_grouped = 'Exempt';
-- 7Q. Find all listings with prices between 100 and 300.
SELECT id, name, price
FROM airbnb_listings
WHERE price BETWEEN 100 AND 300;
-- 8Q. Show listings where minimum_nights are between 2 and 10.
SELECT id, name, minimum_nights
FROM airbnb_listings
WHERE minimum_nights BETWEEN 2 AND 10;
-- 9Q.  Find all listings that have "Studio" in their name.
SELECT id, name, neighbourhood
FROM airbnb_listings
WHERE name LIKE '%Studio%';
-- 10Q. Find listings hosted by names starting with "John".
SELECT id, name, host_name
FROM airbnb_listings
WHERE host_name LIKE 'John%';
-- 11Q. Show listings located in Manhattan, Brooklyn, or Queens.
SELECT id, name, neighbourhood_group
FROM airbnb_listings
WHERE neighbourhood_group IN ('Manhattan', 'Brooklyn', 'Queens');
-- 12Q. Get listings that are NOT "Shared room" or "Private room".
SELECT id, name, room_type
FROM airbnb_listings
WHERE room_type NOT IN ('Shared room', 'Private room');
-- 13Q. Find the average price for each room type.
SELECT room_type, AVG(price) AS avg_price
FROM airbnb_listings
GROUP BY room_type;
-- 14Q. How many listings are there in each neighbourhood group?
SELECT neighbourhood_group, COUNT(*) AS listing_count
FROM airbnb_listings
GROUP BY neighbourhood_group;
-- 15Q. Find the highest-rated listing in each neighbourhood group.
SELECT neighbourhood_group, MAX(rating) AS max_rating
FROM airbnb_listings
GROUP BY neighbourhood_group;
-- 16Q. Calculate the average number of reviews for each room type.
SELECT room_type, AVG(number_of_reviews) AS avg_reviews
FROM airbnb_listings
GROUP BY room_type;
-- 17Q. Show room types where the average price is greater than 300.
SELECT room_type, AVG(price) AS avg_price
FROM airbnb_listings
GROUP BY room_type
HAVING AVG(price) > 300;
-- 18Q. Find neighbourhood groups that have more than 500 listings.
SELECT neighbourhood_group, COUNT(*) AS listing_count
FROM airbnb_listings
GROUP BY neighbourhood_group
HAVING COUNT(*) > 500;
-- 19Q. List hosts whose average rating across all their listings is above 4.7.
SELECT host_id, host_name, AVG(rating) AS avg_rating
FROM airbnb_listings
GROUP BY host_id, host_name
HAVING AVG(rating) > 4.7;
-- 20Q. Find room types where the total number of reviews exceeds 1000.
SELECT room_type, SUM(number_of_reviews) AS total_reviews
FROM airbnb_listings
GROUP BY room_type
HAVING SUM(number_of_reviews) > 1000;
-- 21Q. Find the average price of each room type and list them from highest to lowest.
SELECT room_type, AVG(price) AS avg_price
FROM airbnb_listings
GROUP BY room_type
ORDER BY avg_price DESC
LIMIT 5;
-- 22Q. Count listings in each neighbourhood group and show them in descending order.
SELECT neighbourhood_group, COUNT(*) AS listing_count
FROM airbnb_listings
GROUP BY neighbourhood_group
ORDER BY listing_count DESC;
-- 23Q. Find hosts with their average rating and order them from highest to lowest rating.
SELECT host_id, host_name, AVG(rating) AS avg_rating
FROM airbnb_listings
GROUP BY host_id, host_name
ORDER BY avg_rating DESC
LIMIT 10;
-- 24Q. Show total number of reviews per room type, sorted from most to least.
SELECT room_type, SUM(number_of_reviews) AS total_reviews
FROM airbnb_listings
GROUP BY room_type
ORDER BY total_reviews DESC;
-- 25Q. Find the total availability per neighbourhood group and show in descending order.
SELECT neighbourhood_group, SUM(availability_365) AS total_availability
FROM airbnb_listings
GROUP BY neighbourhood_group
ORDER BY total_availability DESC;
-- 26Q. Find listings where the price is higher than the average price of all listings.
SELECT id, name, price
FROM airbnb_listings
WHERE price > (SELECT AVG(price) FROM airbnb_listings);
-- 27Q. Find all listings belonging to the host who has the maximum number of listings.
SELECT id, name, host_id, calculated_host_listings_count
FROM airbnb_listings
WHERE host_id = (
    SELECT host_id
    FROM airbnb_listings
    GROUP BY host_id
    ORDER BY COUNT(*) DESC
    LIMIT 1
);
-- 28Q. Find listings in the neighbourhood that has the highest average rating.
SELECT id, name, neighbourhood, rating
FROM airbnb_listings
WHERE neighbourhood = (
    SELECT neighbourhood
    FROM airbnb_listings
    GROUP BY neighbourhood
    ORDER BY AVG(rating) DESC
    LIMIT 1
);
-- 29Q. Show listings where the price is lower than the minimum price in Manhattan.
SELECT id, name, price, neighbourhood_group
FROM airbnb_listings
WHERE price < (
    SELECT MIN(price)
    FROM airbnb_listings
    WHERE neighbourhood_group = 'Manhattan'
);
-- 30Q. Get all listings from hosts whose average rating across their listings is above 4.8.
SELECT id, name, host_id, rating
FROM airbnb_listings
WHERE host_id IN (
    SELECT host_id
    FROM airbnb_listings
    GROUP BY host_id
    HAVING AVG(rating) > 4.8
);
-- 31Q. Find the top 5 hosts who manage the most listings using a CTE.
WITH host_listing_count AS (
    SELECT host_id, host_name, COUNT(*) AS listings_count
    FROM airbnb_listings
    GROUP BY host_id, host_name
)
SELECT *
FROM host_listing_count
ORDER BY listings_count DESC
LIMIT 5;
-- 32Q. List room types whose average price is above 300 using a CTE.
WITH avg_price_per_room AS (
    SELECT room_type, AVG(price) AS avg_price
    FROM airbnb_listings
    GROUP BY room_type
)
SELECT *
FROM avg_price_per_room
WHERE avg_price > 300;
-- 33Q. Get hosts whose average listing rating is above 4.7 using a CTE.
WITH host_avg_rating AS (
    SELECT host_id, host_name, AVG(rating) AS avg_rating
    FROM airbnb_listings
    GROUP BY host_id, host_name
)
SELECT *
FROM host_avg_rating
WHERE avg_rating > 4.7;
-- 34Q. Create a view showing all listings with price above 500.
CREATE VIEW high_price_listings AS
SELECT id, name, room_type, price, neighbourhood_group
FROM airbnb_listings
WHERE price > 500;
SELECT * FROM high_price_listings;
-- 35Q. Create a view showing the average rating and number of listings per neighbourhood group.
CREATE VIEW neighbourhood_rating_summary AS
SELECT neighbourhood_group,
       COUNT(*) AS total_listings,
       AVG(rating) AS avg_rating
FROM airbnb_listings
GROUP BY neighbourhood_group;
SELECT * FROM neighbourhood_rating_summary
ORDER BY avg_rating DESC;
-- 36Q. Assign a rank to listings based on price within their neighbourhood group.
SELECT id, name, neighbourhood_group, price,
       RANK() OVER (PARTITION BY neighbourhood_group ORDER BY price DESC) AS price_rank
FROM airbnb_listings;
-- 37Q. Calculate the cumulative sum of reviews for each host ordered by id.
SELECT id, host_id, name, number_of_reviews,
       SUM(number_of_reviews) OVER (PARTITION BY host_id ORDER BY id) AS cumulative_reviews
FROM airbnb_listings;
-- 38Q. Show listings with their rating and the average rating of their room type.
SELECT id, name, room_type, rating,
       AVG(rating) OVER (PARTITION BY room_type) AS avg_rating_room_type
FROM airbnb_listings;