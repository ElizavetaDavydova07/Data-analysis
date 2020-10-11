SELECT 'ФИО: Давыдова Елизавета Кантемировна'
-- 1.Простые выборки
-- 1.1
SELECT * FROM movie.ratings LIMIT 10;
-- 1.2
SELECT * FROM movie.links WHERE imdbid LIKE '%42' AND movieid BETWEEN 100 AND 1000;
-- 2.Сложные выборки
SELECT * FROM movie.links INNER JOIN movie.ratings ON movie.links.movieid = movie.ratings.movieid WHERE rating = 5;
-- 3.Аггрегация данных: базовые статистики
-- 3.1
SELECT COUNT(*) FROM movie.ratings WHERE rating = NULL;
-- 3.2
SELECT userid, AVG(rating)  FROM movie.ratings GROUP BY userid HAVING AVG(rating) > 3.5 LIMIT 10;
-- 4.Иерархические запросы
-- 4.1
SELECT imdbid FROM movie.links WHERE links.movieid IN (SELECT movieid FROM movie.ratings GROUP BY movieid HAVING AVG(rating) > 3.5) LIMIT 10;
-- 4.2
WITH avg_user
AS (
    SELECT userid, AVG(rating) AS avg_rating FROM movie.ratings GROUP BY userid HAVING count(rating) > 10
)
SELECT
    avg_rating FROM avg_user LIMIT 10;
