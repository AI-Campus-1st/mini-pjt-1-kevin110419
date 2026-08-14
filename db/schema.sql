CREATE DATABASE project_db
    CHARACTER SET utf8mb4
    COLLATE utf8mb4_unicode_ci;

USE project_db;

GRANT ALL PRIVILEGES ON project_db.* TO 'analyst'@'localhost';
SHOW GRANTS FOR 'analyst'@'localhost';

DROP TABLE IF EXISTS parking_lot;
CREATE TABLE parking_lot (
    id             INT AUTO_INCREMENT PRIMARY KEY,
    sido           VARCHAR(40) NOT NULL, -- TEXT로 넣었더니 max key length에 걸려 VARCHAR로 길이 제한
    sigungu        VARCHAR(80) NOT NULL,
    parking_spaces INT NOT NULL,
    fee_type       DECIMAL(3,1) NOT NULL, -- 1='유료',0='무료',0.5='혼합'
    KEY idx_sido_sigungu (sido, sigungu)
) ENGINE=InnoDB;
 
DROP TABLE IF EXISTS car;
CREATE TABLE car (
    id                  INT AUTO_INCREMENT PRIMARY KEY,
    sido                VARCHAR(40) NOT NULL,
    sigungu             VARCHAR(80) NOT NULL,
    registration_count  INT NOT NULL,
    KEY idx_sido_sigungu (sido, sigungu)
) ENGINE=InnoDB;