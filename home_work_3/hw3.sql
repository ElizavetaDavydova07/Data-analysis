SELECT 'ФИО: Давыдова Елизавета Кантемировна';
-- Оконные функции
SELECT userid, movieid, 
(rating - MIN(rating) OVER (PARTITION BY userid))/(MAX(rating) OVER (PARTITION BY userid) - MIN(rating) OVER (PARTITION BY userid)) 
as normed_rating, 
AVG(rating) OVER (PARTITION BY userid) as avg_rating 
FROM (SELECT DISTINCT userId, movieId, rating
    FROM movie.ratings WHERE userId <> 1
    LIMIT 1000
) as sample 
ORDER BY userId, rating DESC 
LIMIT 30;
