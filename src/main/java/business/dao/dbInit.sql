CREATE DATABASE  IF NOT EXISTS bmi;
USE bmi;

DROP TABLE IF EXISTS link_bmi_info;
DROP TABLE IF EXISTS info;
DROP TABLE IF EXISTS bmi_entry;
DROP TABLE IF EXISTS users;
DROP TABLE IF EXISTS sport;

CREATE TABLE sport (
                       id int NOT NULL AUTO_INCREMENT,
                       name varchar(50) NOT NULL,
                       PRIMARY KEY (id)
);


CREATE TABLE info (
                      id int NOT NULL AUTO_INCREMENT,
                      name varchar(50) NOT NULL,
                      PRIMARY KEY (id)
);

CREATE TABLE users (
                       id int NOT NULL AUTO_INCREMENT,
                       email varchar(90) NOT NULL UNIQUE,
                       password varchar(45) NOT NULL,
                       role enum ('user','admin') DEFAULT 'user',
                       PRIMARY KEY (id)
) DEFAULT CHARSET=latin1;


CREATE TABLE bmi_entry (
                           id int NOT NULL AUTO_INCREMENT,
                           height double,
                           weight double,
    -- bmi double,
                           gender varchar(10),
    -- category varchar(50) NOT NULL,
                           sport_id int,
                           user_id int,
                           created TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
                           FOREIGN KEY (sport_id) REFERENCES sport(id),
                           FOREIGN KEY (user_id) REFERENCES users(id),
                           PRIMARY KEY (id)
);


CREATE TABLE link_bmi_info (
                               info_id int,
                               bmi_id int,
                               PRIMARY KEY (info_id,bmi_id),
                               FOREIGN KEY (info_id) REFERENCES info(id),
                               FOREIGN KEY (bmi_id) REFERENCES bmi_entry(id)
);



INSERT INTO users (email,password) VALUES
('a@b.dk','secret'),
('ken@somewhere.com','secret');

-- NEVER EVER EVER USE THIS IN PRODUCTION
INSERT INTO users (email,password,role) VALUES
('admin@admin.dk','secret','admin');




INSERT INTO sport (name)
VALUES ('None'),('Socker'),('Swimming'),('Running'),('Sailing');


INSERT INTO info (name)
VALUES ('I eat healty food'),('I know how to relax'),('Bla. bla. bla');