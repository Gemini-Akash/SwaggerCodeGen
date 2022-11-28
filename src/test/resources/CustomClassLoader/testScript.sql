CREATE TABLE demo.language (

  id              NUMBER(7)     NOT NULL AUTO_INCREMENT,

  cd              CHAR(2)       NOT NULL UNIQUE KEY,

  description     VARCHAR2(50),

  PRIMARY KEY(id)

);

