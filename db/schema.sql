CREATE DATABASE project_db
    CHARACTER SET utf8mb4
    COLLATE utf8mb4_unicode_ci;

USE project_db;

GRANT ALL PRIVILEGES ON project_db.* TO 'analyst'@'localhost';
SHOW GRANTS FOR 'analyst'@'localhost';

DROP TABLE IF EXISTS parking_lot;
CREATE TABLE parking_lot (
    id             INT AUTO_INCREMENT PRIMARY KEY,
    sido           TEXT NOT NULL,
    sigungu        TEXT NOT NULL,
    parking_spaces INT NOT NULL,
    fee_type       DECIMAL(3,1) NOT NULL,  -- 1 = paid, 0 = free, 0.5 = mixed
    KEY idx_sido_sigungu (sido, sigungu)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
 
-- Vehicle registration table. Source file is pre-sorted by sigungu and
-- requires no transformation before loading, aside from standardizing
-- the sido name (see load_to_db.py SIDO_NAME_MAP).
DROP TABLE IF EXISTS car;
CREATE TABLE car (
    id                  INT AUTO_INCREMENT PRIMARY KEY,
    sido                TEXT NOT NULL,
    sigungu             TEXT NOT NULL,
    registration_count  INT NOT NULL,
    KEY idx_sido_sigungu (sido, sigungu)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;