CREATE DATABASE IF NOT EXISTS `GestionApparment` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `GestionApparment`;

CREATE TABLE APARTMENT_BLOCK(
BLOCK_NO INTEGER PRIMARY KEY,
BLOCK_NAME VARCHAR(10),
LOCATION VARCHAR(20));

CREATE TABLE APARTMENT(
ROOM_NO INTEGER PRIMARY KEY,
BLOCK_NO INTEGER,
RENT_PER_MONTH INTEGER,
APT_STATUS VARCHAR(15),
FOREIGN KEY(BLOCK_NO) REFERENCES APARTMENT_BLOCK(BLOCK_NO) ON DELETE CASCADE);

CREATE TABLE APARTMENT_DETAILS (
ROOM_NO INTEGER PRIMARY KEY,
APT_TITLE VARCHAR(200) NOT NULL,
AREA INTEGER NOT NULL,
APARTMENT_DESC VARCHAR(1000) NOT NULL,
FOREIGN KEY(ROOM_NO) REFERENCES APARTMENT(ROOM_NO) ON DELETE CASCADE);

CREATE TABLE APARTMENT_PHOTOS(
ROOM_NO INTEGER PRIMARY KEY,
PATHNAME VARCHAR(100) NOT NULL,
PHOTO1 VARCHAR(50) NOT NULL,
PHOTO2 VARCHAR(50) NOT NULL,
PHOTO3 VARCHAR(50) NOT NULL,
PHOTO4 VARCHAR(50),
FOREIGN KEY(ROOM_NO) REFERENCES APARTMENT(ROOM_NO) ON DELETE CASCADE);

CREATE TABLE TENANT(
FNAME VARCHAR(25),
LNAME VARCHAR(15),
T_ID INTEGER AUTO_INCREMENT,
PH_NO VARCHAR(12),
EMAIL VARCHAR(30),
GENDER CHAR,
DOB DATE,
OCCUPATION VARCHAR(30),
ROOM_NO INTEGER,
PSWD VARCHAR(25),
PRIMARY KEY(T_ID),
FOREIGN KEY(ROOM_NO) REFERENCES APARTMENT(ROOM_NO) ON DELETE SET NULL);


CREATE TABLE CONTRACT(
CONTRACT_ID INTEGER AUTO_INCREMENT,
T_ID INTEGER,
ROOM_NO INTEGER,
START_DATE DATE,
END_DATE DATE,
DEPOSIT INTEGER,
TERMS VARCHAR(15),
PRIMARY KEY(CONTRACT_ID),
FOREIGN KEY(T_ID) REFERENCES TENANT(T_ID) ON DELETE CASCADE,
FOREIGN KEY(ROOM_NO) REFERENCES APARTMENT(ROOM_NO) ON DELETE SET NULL);


CREATE TABLE PAYMENT(
PAYMENT_ID VARCHAR(20) PRIMARY KEY,
ACC_NO VARCHAR(15),
T_ID INTEGER,
PAYMENT_DATE DATE,
AMOUNT INTEGER,
FOREIGN KEY(T_ID) REFERENCES TENANT(T_ID) ON DELETE SET NULL);

CREATE TABLE RENT(
RENT_ID INTEGER AUTO_INCREMENT ,
RENT_FEE INTEGER,
T_ID INTEGER,
DUE_DATE DATE,
LATE_FEE INTEGER,
PAYMENT_ID VARCHAR(20),
PRIMARY KEY(RENT_ID),
FOREIGN KEY(T_ID) REFERENCES TENANT(T_ID) ON DELETE SET NULL,
FOREIGN KEY(PAYMENT_ID) REFERENCES PAYMENT(PAYMENT_ID) ON DELETE SET NULL);

CREATE TABLE RENT_STATUS(
RENT_ID INTEGER,
R_STATUS VARCHAR(10),
FOREIGN KEY(RENT_ID) REFERENCES RENT(RENT_ID) ON DELETE CASCADE
);
