CREATE DATABASE IF NOT EXISTS mydatabase;

USE mydatabase;

CREATE TABLE IF NOT EXISTS Lines (
    ID CHAR(36) PRIMARY KEY,
    ObjectPath VARCHAR(255) NOT NULL,
    Date VARCHAR(50) NOT NULL,
    AmountOfLines INT NOT NULL
);



CREATE TABLE IF NOT EXISTS Words(
    ObjectPath VARCHAR(255) NOT NULL,
    Date VARCHAR(50) NOT NULL,
    AmountOfWords INT NOT NULL,
    PRIMARY KEY (ObjectPath,Date)
);