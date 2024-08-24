CREATE TABLE Lines (
    ID CHAR(36) PRIMARY KEY,
    ObjectPath VARCHAR(255) NOT NULL,
    Date VARCHAR(50) NOT NULL,
    AmountOfLines INT NOT NULL
);



CREATE TABLE Words(
    ObjectPath VARCHAR(255) NOT NULL,
    Date VARCHAR(50) NOT NULL,
    AmountOfWords INT NOT NULL,
    PRIMARY KEY (ObjectPath,Date)
);