-- Active: 1677751582920@@127.0.0.1@3306@cinema

CREATE DATABASE IF NOT EXISTS cinema;

CREATE TABLE cinema (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    adress VARCHAR(255) NOT NULL,
    postal_code VARCHAR(5) NOT NULL,
    phone VARCHAR(12) NOT NULL
) engine = INNODB;

CREATE TABLE movie (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    release_date DATE NOT NULL,
    duration INT NOT NULL,
    synopsis TEXT NOT NULL
) engine = INNODB;

CREATE TABLE room (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    seats INT NOT NULL
) engine = INNODB;

CREATE TABLE session (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    id_cinema INT NOT NULL,
    id_movie INT NOT NULL,
    id_room INT NOT NULL,
    start_time VARCHAR(5) NOT NULL,
    FOREIGN KEY (id_cinema) REFERENCES cinema(id),
    FOREIGN KEY (id_movie) REFERENCES movie(id),
    FOREIGN KEY (id_room) REFERENCES room(id)
) engine = INNODB;

CREATE TABLE role (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL
) engine = INNODB;

CREATE TABLE user (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    lastname VARCHAR(255) NOT NULL,
    firstname VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL,
    password VARCHAR(65) NOT NULL,
    phone VARCHAR(12) NOT NULL, 
    id_role INT NOT NULL,
    FOREIGN KEY (id_role) REFERENCES role(id)
) engine = INNODB;

CREATE TABLE price (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    description VARCHAR(100) NOT NULL,
    price FLOAT NOT NULL
) engine = INNODB;

CREATE TABLE payment (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) NOT NULL
) engine = INNODB;

CREATE TABLE reservation (
    id_user INT NOT NULL,
    id_session INT NOT NULL,
    id_price INT NOT NULL,
    id_payment INT NOT NULL,
    FOREIGN KEY (id_user) REFERENCES user(id),
    FOREIGN KEY (id_session) REFERENCES session(id),
    FOREIGN KEY (id_price) REFERENCES price(id),
    FOREIGN KEY (id_payment) REFERENCES payment(id)
) engine = INNODB;

-- All tables created -- 

-- Updates --

ALTER TABLE cinema MODIFY phone VARCHAR(10) NOT NULL;
ALTER TABLE user MODIFY phone VARCHAR(10) NOT NULL;
DELETE FROM cinema WHERE id < 11;
ALTER TABLE movie MODIFY release_date INT(4) NOT NULL;
ALTER TABLE reservation ADD reservation_number INT NOT NULL AUTO_INCREMENT PRIMARY KEY;
ALTER TABLE cinema ADD manager_id INT NULL;
ALTER TABLE cinema ADD FOREIGN KEY (manager_id) REFERENCES user(id);

-- Data insertion --

INSERT INTO movie (title, release_date, duration, synopsis) VALUES
('Nick and Norah''s Infinite Playlist', 1994, 125, 'Lorem ipsum dolor sit amet. Eos repellat doloribus est aperiam fugit sit internos inventore id rerum internos nam labore animi. Qui libero facere eum facilis officiis ut vitae rerum vel iure pariatur eos praesentium dolor a molestias officia qui necessitatibus accusantium.'),
('Sacrificio: Who Betrayed Che Guevara', 1985, 140, 'Lorem ipsum dolor sit amet. Eos repellat doloribus est aperiam fugit sit internos inventore id rerum internos nam labore animi. Qui libero facere eum facilis officiis ut vitae rerum vel iure pariatur eos praesentium dolor a molestias officia qui necessitatibus accusantium.'),
('Read It and Weep', 2007, 110,"eu neque pellentesque massa lobortis ultrices. Vivamus rhoncus. Donec est. Nunc ullamcorper, velit in aliquet lobortis, nisi nibh lacinia orci, consectetuer euismod est arcu ac orci. Ut semper pretium neque. Morbi quis urna. Nunc quis arcu vel quam dignissim pharetra. Nam ac nulla. In tincidunt congue turpis. In condimentum. Donec at arcu. Vestibulum ante ipsum primis in faucibus orci luctus et"),
('Honeysuckle Rose (a.k.a. On the Road Again)', 2006, 127,"nibh vulputate mauris sagittis placerat. Cras dictum ultricies ligula. Nullam enim. Sed nulla ante, iaculis nec, eleifend non, dapibus rutrum, justo. Praesent luctus. Curabitur egestas nunc sed libero. Proin sed turpis nec mauris blandit mattis. Cras eget nisi dictum augue malesuada malesuada. Integer id magna et ipsum cursus vestibulum. Mauris magna. Duis dignissim tempor arcu. Vestibulum ut eros non enim commodo hendrerit. Donec porttitor tellus non magna. Nam ligula elit, pretium et, rutrum non, hendrerit"),
('The Fat Albert Halloween Special', 2013, 115,"quam, elementum at, egestas a, scelerisque sed, sapien. Nunc pulvinar arcu et pede. Nunc sed orci lobortis augue scelerisque mollis. Phasellus libero mauris, aliquam eu, accumsan sed, facilisis vitae, orci."),
('Ronin', 2009, 135,"at pede. Cras vulputate velit eu sem. Pellentesque ut ipsum ac mi eleifend egestas. Sed pharetra, felis eget varius ultrices, mauris ipsum porta elit, a feugiat tellus lorem eu metus. In lorem. Donec"),
('Dungeons & Dragons', 2000, 127,"vitae velit egestas lacinia. Sed congue, elit sed consequat auctor, nunc nulla vulputate dui, nec tempus mauris erat eget ipsum. Suspendisse sagittis. Nullam vitae diam. Proin dolor. Nulla semper tellus id nunc interdum feugiat. Sed nec metus facilisis lorem tristique aliquet. Phasellus fermentum convallis ligula. Donec luctus aliquet odio. Etiam ligula tortor, dictum eu, placerat eget, venenatis a, magna. Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Etiam laoreet, libero et tristique pellentesque, tellus sem mollis dui, in sodales elit erat vitae risus. Duis a mi"),
('Pearls of the Deep', 2005, 156,"non, dapibus rutrum, justo. Praesent luctus. Curabitur egestas nunc sed libero. Proin sed turpis nec mauris blandit mattis. Cras eget nisi dictum augue malesuada malesuada. Integer id magna et ipsum cursus vestibulum. Mauris magna. Duis dignissim tempor arcu. Vestibulum ut eros non enim commodo hendrerit. Donec porttitor tellus non magna. Nam ligula elit, pretium et, rutrum non, hendrerit"),
('Drowning Pool, The', 2009, 138,"amet ante. Vivamus non lorem vitae odio sagittis semper. Nam tempor diam dictum sapien. Aenean massa. Integer vitae nibh. Donec est mauris, rhoncus id, mollis nec, cursus a, enim. Suspendisse aliquet, sem ut cursus luctus, ipsum leo elementum sem, vitae aliquam eros turpis non enim. Mauris quis turpis vitae purus gravida sagittis. Duis gravida. Praesent eu nulla at sem molestie sodales. Mauris blandit enim consequat purus. Maecenas libero est, congue"),
('Le crocodile du Botswanga', 1999, 122,"lorem eu metus. In lorem. Donec elementum, lorem ut");

INSERT INTO payment (name) VALUES ('Paiement sur place'), ('Paiement en ligne');

INSERT INTO price (description, price) VALUES
('Plein tarif', 9.20),
('Tarif étudiant', 7.60),
('Tarif jeune (moins de 14 ans)', 5.90);

INSERT INTO role (name) VALUES 
('Administrateur'),
('Manager'),
('Client');

INSERT INTO room (seats) VALUES 
(200),
(150),
(100),
(50),
(75),
(180),
(120),
(80),
(60),
(90);

INSERT INTO user (lastname, firstname, email, password, phone, id_role) VALUES
('Sykora', 'Ives', 'isykora0@google.es', '$2y$10$bG23bgVgn/UG3ryuh2XQf.XVfJW4GqAPQXGAV9wmeKzUirh8.sJlC', '0106622736', 1),
('Diggens', 'Carson', 'cdiggens1@ox.ac.uk', '$2y$10$v9GdjFCRm5g9J3wIQ/A.CeQ8A7po7NsadhtajIgmeS/sidh2qF6OC', '0382743462', 2),
('Bolles', 'Marybeth', 'mbolles2@jugem.jp', '$2y$10$cRidfWXd7ZJMuFz91..RI.MkYgrL5oH3iclWvsk.hBkKSdiuCXaZ2', '0466982281', 3),
('Snibson', 'Timothy', 'tsnibson3@yale.edu', '$2y$10$SfS4zgIUqlBY5tQVu9mdPOOdtptdUiEy7CGilbEjL0hIsX7YTu7QO', '0775116319', 3),
('Pountain', 'Bealle', 'bpountain4@intel.com', '$2y$10$l8paOZi957SKjxuzAE9Oduj2a9ZmUpXZJr6MkR2g.qePO0w1eNHHC', '0891327381', 3),
('Jewell', 'Lyndy', 'ljewell5@cnet.com', '$2y$10$tkPJBMkiNnUlzpnhOASjGugpsQXv0XoUlj1IHFRXnsk5la.wJr6I2', '0357190784', 2),
('Bawle', 'Brice', 'bbawle6@altervista.org', '$2y$10$a4EgZsjQQhRPVQSOnRCPTeNgEZ/rnM91YKbJoxwHPDfpcuQSwRjWe', '0729388841', 2),
('Wordsley', 'Helge', 'hwordsley7@simplemachines.org', '$2y$10$iluv9RLa0MnbA06iJHyC1eN2cPfU6D073cM.Wb1dEiu87HjSdVt.y', '0642593961', 3),
('Luker', 'Keefer', 'kluker8@sakura.ne.jp', '$2y$10$C20DxjL3c5bOXN8qdf1HGOeb7eKzEYirfs4Ig1ClvMVbHSIEDq4ym', '0418451356', 2),
('Rossin', 'Cristen', 'crossin9@reference.com', '$2y$10$9v0Het5J4GDaYReSEEr6duEjIFhq81hmf7U.VXRz5PP/YoUAuc0jC', '0137301689', 3),
('Wrankmore', 'Rosita', 'rwrankmore0@lulu.com', '$2y$10$EZnRI5eH/KA7qcp.QsIrY.eVm1kw0Jwe7439aftAqFzicOOVdb65e', '0769753128', 3),
('Gilliat', 'Wendi', 'wgilliat1@miibeian.gov.cn', '$2y$10$WG/2bs977SStct2tkj5dleYE.n2y1a9cduPmbqmH0Iiai739/BDhm', '0815134471', 3),
('Aherne', 'Wandis', 'waherne2@economist.com', '$2y$10$84pQkMGnzfBK.1CEM4f2uuJP.fuK1lBl.aU12SKYNd42z6DoFI9RC', '0755105811', 3),
('Monget', 'Ferdinanda', 'fmonget3@jigsy.com', 'DgNRs$2y$10$er3gUezqzkxaCpCGw5Tr5OCM1ny4yEZ1RANLw1e/LzL8lj5S7lf5i2iz', '0192037610', 2),
('Stuck', 'Blondelle', 'bstuck4@ibm.com', '$2y$10$fI2CS.WZ2qrWxPXUDV0c8.JzUIKreoTRf4Ritjyo/ADNUBUieSmOG', '0641152642', 3),
('Gallamore', 'Gerri', 'ggallamore5@webeden.co.uk', '$2y$10$S4bVcNBiA6M/CkMKYtv4ZeNdAO7DAreWwXPTqtjk3ZwQpXU.JZpjS', '0188605566', 2),
('Merrell', 'Wenona', 'wmerrell6@bluehost.com', '$2y$10$UCtkC2/1prc.J4ci411RYu32bL8sMqdXGUDYdhVNJsmC5m9LHgk6e', '0754223316', 3),
('Sambals', 'Earl', 'esambals7@networksolutions.com', '$2y$10$mdJypo8hWqTIQf8ySx01l../u8h9PG2BT8w33l7yzLgEhHNsDmrY6', '0217539754', 3),
('Itter', 'Carolus', 'citter8@wix.com', '$2y$10$yDbSYfbLZQ3K0Ux1MMOEa.Tymmt5lFTlCAV9DFqr92MzFMw1LMd8a', '0349087137', 3),
('Tibols', 'Ozzie', 'otibols9@fda.gov', '$2y$10$hzlxPeOuKOSKRx3TOzhvYuRdxBsrmA1cSbcb66HRSDktBm.ma8EBO', '0729267005', 2);


INSERT INTO cinema (name, adress, postal_code, phone, manager_id) 
VALUES ('Cinéma Le Grand Rex', '1, rue du Grand Rex', '75002', '0142363636', 2),
('Cinéma Le Grand Rex', '22, avenue Leon Blum', '33300', '0865075652', 6),
('Cinéma Le Grand', '34 rue David Johnson', '95000', '0624629958', 7),
('Cinéma Le Petit Parc', '2 avenue Charles de Gaulle', '69002', '0496720171', 9),
('Cinéma Frida Kahlo', '13 avenue Jean Jaurés', '33200', '0824481325', 14),
('Cinéma Jean Monnet', '44 rue Pasteur', '33700', '0142363636', 16),
('Cinéma Feyre Archeron', '76 rue Georges Bonnac', '97400', '0282117523', 20),
('Cinéma Bryce Quinlan', '65 rue Mac Carthy', '04200', '0207401379', 20),
('Cinéma Aelin Galathynius', '89 rue Stéhétin', '74100', '0773863253', 14),
('Cinéma Dorian Havilliard', '82 avenue Victor Hugo', '47800', '0735550736', 6); 

INSERT INTO session (id_cinema, id_movie, id_room, start_time) VALUES 
(6,9,2,"15:30"),
(10,7,4,"16:00"),
(6,2,4,"13:15"),
(1,1,2,"15:15"),
(10,1,7,"15:50"),
(9,7,2,"11:20"),
(2,2,10,"17:30"),
(4,10,8,"22:00"),
(5,2,6,"09:45"),
(8,3,6,"20:45"),
(10,9,10,"08:15"),
(5,10,7,"20:00"),
(6,10,9,"17:30"),
(9,9,2,"13:20"),
(3,3,5,"13:20");

INSERT INTO reservation (id_user, id_session, id_price, id_payment) VALUES 
(3,5,1,2),
(9,8,3,1),
(12,2,2,2),
(15,4,1,2),
(13,2,3,1),
(1,7,2,1),
(9,3,2,1),
(10,8,2,1),
(17,10,3,1),
(16,9,1,1),
(11,10,1,1),
(17,8,2,1),
(6,7,1,2);

-- Tests -- 

-- Find a reservation by the client's name --
SELECT * FROM reservation WHERE id_user IN (SELECT id FROM user WHERE lastname = 'Gallamore');

-- Find in which cinema a movie is shown -- 
SELECT name, adress FROM cinema JOIN session ON cinema.id = session.id_cinema WHERE session.id_movie = 10;

-- Find all the manager's names--
SELECT user.id AS manager_id, firstname, lastname, email, user.phone as manager_phone FROM user JOIN cinema ON user.id = cinema.manager_id WHERE id_role = 2;

-- Find the manager in charge of a specific cinema --
SELECT user.firstname, user.lastname, user.email, user.phone FROM user JOIN cinema ON user.id = cinema.manager_id WHERE cinema.id = 6;

-- Find all the cinemas managed by a specific manager --
SELECT cinema.name, cinema.adress, user.firstname, user.lastname FROM cinema JOIN user ON user.id = cinema.manager_id WHERE cinema.manager_id = 20;


-- Change a client's name --
SELECT firstname FROM user WHERE id = 1;
UPDATE user SET firstname = 'Samantha' WHERE id = 1;

-- Change a session's start time --
UPDATE session SET start_time = '12:00' WHERE id = 8;

-- Delete a reservation by a name--
SELECT reservation_number FROM reservation WHERE id_user IN (SELECT id FROM user WHERE lastname = 'Rossin');
DELETE FROM reservation WHERE reservation_number = 8;