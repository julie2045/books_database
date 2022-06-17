--sort by highest public rating to least 
SELECT book_profile.book_title, author_profile.author_name, genre_profile.genre_name, book_profile.public_rating 
FROM book_profile
JOIN author_profile ON book_profile.author_id = author_profile.id
JOIN genre_profile ON book_profile.genre_id = genre_profile.id
ORDER BY public_rating DESC;

--filter books only written by James Dashner 
SELECT book_title, author_name, genre_name, public_rating 
FROM book_profile
JOIN author_profile ON book_profile.author_id = author_profile.id
JOIN genre_profile ON book_profile.genre_id = genre_profile.id
WHERE author_profile.id = 1;


--average rating of books by James Dashner
SELECT AVG(public_rating)
FROM book_profile
JOIN author_profile ON book_profile.author_id = author_profile.id
WHERE author_id = 1;

--filter books that has a genre of mystery 
SELECT book_profile.book_title, author_profile.author_name, genre_profile.genre_name, book_profile.public_rating 
FROM book_profile
JOIN author_profile ON book_profile.author_id = author_profile.id
JOIN genre_profile ON book_profile.genre_id = genre_profile.id
WHERE genre_name = 'Mystery';

--gets the average rating in each genre
SELECT genre_name, AVG(public_rating)
FROM book_profile
JOIN genre_profile ON book_profile.genre_id = genre_profile.id
GROUP BY genre_name
ORDER BY AVG(public_rating) ASC;

--if I read the book or not
SELECT book_profile.book_title, reading_profile.status
FROM book_profile
JOIN reading_profile ON book_profile.id = reading_profile.book_id;

--see if a book has a movie where it is on Disney+ and the duration is greater than 130 minutes
SELECT book_profile.book_title, movie_adaptation.duration_min, movie_adaptation.streaming_platform
FROM book_profile
JOIN movie_adaptation ON book_profile.id = movie_adaptation.book_id
WHERE streaming_platform = 'Disney+' AND duration_min > 130;

--which branch the books are available and see if it is at the Main Branch or Westminster Square Branch
SELECT book_profile.book_title, library_branches.branch_name 
FROM library_availability
JOIN book_profile ON library_availability.book_id = book_profile.id 
RIGHT JOIN library_branches ON library_availability.branch_id = library_branches.id 
WHERE branch_name = 'Main Branch' or branch_name = 'Westminster Square Branch';
