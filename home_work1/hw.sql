CREATE TABLE films (
title TEXT, id INT, country TEXT, box_office INT, release_date DATE, PRIMARY KEY(id)
);
CREATE TABLE persons ( 
id INT, fio TEXT, PRIMARY KEY(id) 
);
CREATE TABLE persons2content ( 
person_id INT, film_id INT, person_type TEXT, FOREIGN KEY (person_id) REFERENCES persons(id) 
);
ALTER TABLE persons2content ADD FOREIGN KEY (film_id) REFERENCES films(id) ;
INSERT INTO films (title, id, country, box_office, release_date) VALUES 
('Meet Joe Black', 5059, 'USA', 142940100, '1998-11-02'),
('Interstellar', 258687, 'USA, United Kingdom, Canada', 677463813, '2014-10-26'),
('The Platform', 1134778, 'Spain', 1090116, '2019-09-06'),
('Oblivion', 470185, 'USA', 286168572, '2013-03-26'),
('Twilight', 401177, 'USA', 392616625, '2008-11-17');
INSERT INTO persons (id, fio) VALUES
(1, 'Martin Brest'),
(2, 'Brad Pitt'),
(3, 'Catherine Hardwicke'),
(4, 'Kristen Stewart'),
(5, 'Robert Pattinson'),
(6, 'Christopher Nolan'),
(7, 'Matthew McConaughey'),
(8, 'Galder Gaztelu-Urrutia'),
(9, 'Ivan Massague'),
(10,'Joseph Kosinski'),
(11, 'Tom Cruise'),
(12, 'Olga Kurilenko');
INSERT INTO persons2content VALUES 
(1, 5059, 'director'),
(2, 5059, 'actor'),
(3, 401177, 'director'),
(4, 401177, 'actor'),
(5, 401177, 'actor'),
(6, 258687, 'director'),
(7, 258687, 'actor'),
(8, 1134778, 'director'),
(9, 1134778, 'actor'), 
(10, 470185, 'director'),
(11, 470185, 'actor'),
(12, 470185, 'actor');
