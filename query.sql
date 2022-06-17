--sort by highest public rating to least 
--helps determined which books are good or bad according to the public 
SELECT book_profile.book_title, author_profile.author_name, genre_profile.genre_name, book_profile.public_rating 
FROM book_profile
JOIN author_profile ON book_profile.author_id = author_profile.id
JOIN genre_profile ON book_profile.genre_id = genre_profile.id
ORDER BY public_rating DESC;

--filter books only written by James Dashner 
--helpful if a person likes his books or wants to see different books by that author
SELECT book_title, author_name, genre_name, public_rating 
FROM book_profile
JOIN author_profile ON book_profile.author_id = author_profile.id
JOIN genre_profile ON book_profile.genre_id = genre_profile.id
WHERE author_profile.id = 1;


--average rating of books by James Dashner
--see if an author has a good rating 
SELECT AVG(public_rating)
FROM book_profile
JOIN author_profile ON book_profile.author_id = author_profile.id
WHERE author_id = 1;

--filter books that has a genre of mystery
--if a person likes mystery books and they can see the books is a mystery genre
SELECT book_profile.book_title, author_profile.author_name, genre_profile.genre_name, book_profile.public_rating 
FROM book_profile
JOIN author_profile ON book_profile.author_id = author_profile.id
JOIN genre_profile ON book_profile.genre_id = genre_profile.id
WHERE genre_name = 'Mystery';

--gets the average rating in each genre and see which genre has the best rating 
SELECT genre_name, AVG(public_rating)
FROM book_profile
JOIN genre_profile ON book_profile.genre_id = genre_profile.id
GROUP BY genre_name
ORDER BY AVG(public_rating) ASC;

--if I read the book or not
--helpful to keep track if a person has read it or not to know in the future
SELECT book_profile.book_title, reading_profile.status
FROM book_profile
JOIN reading_profile ON book_profile.id = reading_profile.book_id;

--updates the reading status. for example changed Dune book from a no to a yes 
UPDATE reading_profile
SET status = 'yes'
WHERE book_id = 11;

SELECT book_profile.book_title, reading_profile.status
FROM book_profile
JOIN reading_profile ON book_profile.id = reading_profile.book_id;
WHERE book_profile.id = 11;


--see if a book has a movie where it is on Disney+ and the duration is greater than 130 minutes
--helpful if a person want to watch the movie version of the book
SELECT book_profile.book_title, movie_adaptation.duration_min, movie_adaptation.streaming_platform
FROM book_profile
JOIN movie_adaptation ON book_profile.id = movie_adaptation.book_id
WHERE streaming_platform = 'Disney+' AND duration_min > 130;

--which branch the books are available and see if it is at the Main Branch or Westminster Square Branch
--a person can find out what books are available at the branches they go to 
SELECT book_profile.book_title, library_branches.branch_name 
FROM library_availability
JOIN book_profile ON library_availability.book_id = book_profile.id 
RIGHT JOIN library_branches ON library_availability.branch_id = library_branches.id 
WHERE branch_name = 'Main Branch' or branch_name = 'Westminster Square Branch';
