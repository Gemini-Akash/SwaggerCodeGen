CREATE TABLE demo.language (

  id              NUMBER(7)     NOT NULL AUTO_INCREMENT,

  cd              CHAR(2)       NOT NULL UNIQUE KEY,

  description     VARCHAR2(50),

  PRIMARY KEY(id)

);




CREATE TABLE demo.author (

  id              NUMBER(7)     NOT NULL AUTO_INCREMENT ,

  first_name      VARCHAR2(50),

  last_name       VARCHAR2(50)  NOT NULL,

  date_of_birth   DATE,

  year_of_birth   NUMBER(7),

  distinguished   NUMBER(1),

   PRIMARY KEY(id)

);



CREATE TABLE demo.book (

  id              NUMBER(7)     NOT NULL AUTO_INCREMENT,

  author_id       NUMBER(7)     NOT NULL,

  title           VARCHAR2(400) NOT NULL,

  published_in    NUMBER(7)     NOT NULL,

  language_id     NUMBER(7)     NOT NULL,

  PRIMARY KEY(id),



  CONSTRAINT fk_book_author     FOREIGN KEY (author_id)   REFERENCES author(id),

  CONSTRAINT fk_book_language   FOREIGN KEY (language_id) REFERENCES language(id)

);