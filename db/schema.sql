CREATE DATABASE project_db
    CHARACTER SET utf8mb4
    COLLATE utf8mb4_unicode_ci;

USE project_db;

GRANT ALL PRIVILEGES ON project_db.* TO 'analyst'@'localhost';
SHOW GRANTS FOR 'analyst'@'localhost';

DROP TABLE IF EXISTS region;
CREATE TABLE region (
    region_code   INT,
    sido          TEXT NOT NULL,
    sigungu       TEXT,
    PRIMARY KEY (region_code),
    KEY idx_sido_sigungu (sido, sigungu)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

DROP TABLE IF EXISTS parkinglot;
CREATE TABLE parkinglot (
    id             INT AUTO_INCREMENT PRIMARY KEY,
    region_code    INT,
    region_info    TEXT NOT NULL,
    parking_spaces INT NOT NULL,
    fee_type       DECIMAL(3,1) NOT NULL,  -- 1 = '유료', 0 = '무료', 0.5 = '혼합'
    KEY idx_region_code (region_code),
    CONSTRAINT fk_parking_region
        FOREIGN KEY (region_code) REFERENCES region_code(region_code)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

DROP TABLE IF EXISTS car_reg;
CREATE TABLE car_reg (
    id                  INT AUTO_INCREMENT PRIMARY KEY,
    region_code         INT,
    sido                TEXT NOT NULL,
    sigungu             TEXT NOT NULL,
    registration_count  INT NOT NULL,
    KEY idx_region_code (region_code),
    CONSTRAINT fk_vehicle_region
        FOREIGN KEY (region_code) REFERENCES region_code(region_code)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;