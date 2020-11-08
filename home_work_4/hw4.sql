SELECT 'ФИО: Давыдова Елизавета Кантемировна';

-- create table for our data from csv
CREATE TABLE content_genres ( movieid int, genre text );

-- copy data from genres.csv to content_genres table
\copy content_genres FROM '/usr/share/data_store/raw_data/genres.csv' DELIMITER ',' CSV HEADER;

-- transform our data 
WITH top_rated AS 
(SELECT movieid, AVG(rating) as avg_rating FROM movie.ratings GROUP BY movieid HAVING COUNT(*) > 50 ORDER BY movieid, avg_rating  DESC LIMIT 150) SELECT top_rated.movieid, top_rated.avg_rating, genres.keywords INTO top_rated_tags FROM top_rated 
INNER JOIN 
(SELECT public.content_genres.movieid, array_agg(genre) as keywords FROM public.content_genres GROUP BY public.content_genres.movieid) AS genres 
ON genres.movieid = top_rated.movieid;

--load our data in top_rated_tags.csv
\copy movie.top_rated_tags TO '/usr/share/data_store/raw_data/top_rated_tags.csv' WITH CSV HEADER DELIMITER as ',';

