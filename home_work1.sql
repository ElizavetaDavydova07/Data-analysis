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
