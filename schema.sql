CREATE DATABASE IF NOT EXISTS photoshare;
USE photoshare;
DROP TABLE IF EXISTS photos CASCADE;
DROP TABLE IF EXISTS Users CASCADE;
DROP TABLE IF EXISTS friends_ADDS CASCADE;
DROP TABLE IF EXISTS visitors CASCADE;
DROP TABLE IF EXISTS albums CASCADE;
DROP TABLE IF EXISTS tag CASCADE;
DROP TABLE IF EXISTS comments CASCADE;
DROP TABLE IF EXISTS tagged CASCADE;
DROP TABLE IF EXISTS creates CASCADE;
DROP TABLE IF EXISTS contains CASCADE;
DROP TABLE IF EXISTS holds CASCADE;


CREATE TABLE visitors();


CREATE TABLE Users (
    user_id int4  AUTO_INCREMENT,
    email varchar(255) NOT NULL UNIQUE,
    password varchar(255),
    firstName CHAR(20) NOT NULL,
    lastName CHAR(20) NOT NULL,
    birthday DATE NOT NULL,
    town CHAR(20) NOT NULL,
    gender CHAR(1) NOT NULL,
  CONSTRAINT users_pk PRIMARY KEY (user_id)
);


CREATE TABLE albums(
    albumID int4  AUTO_INCREMENT,
    albumName CHAR(20) NOT NULL,
    albumOwnerID INT NOT NULL,
    albumDate DATE NOT NULL,
    FOREIGN KEY (albumOwnerID) REFERENCES users(userID);
    CONSTRAINT albums_pk PRIMARY KEY(albumID) ON DELETE CASCADE
);


CREATE TABLE tag(
    tag CHAR(30),
);




CREATE TABLE comments(
    commentID int4  AUTO_INCREMENT,
    comment CHAR(200),
    commentOwnerID INT,
    commentDate DATE NOT NULL,
    FOREIGN KEY(commentOwnerID) REFERENCES users(userID),
    CONSTRAINT comments_pk PRIMARY KEY(commentID)
);


CREATE TABLE photos
(
  photos_id int4  AUTO_INCREMENT,
  user_id int4 NOT NULL,
  imgdata longblob ,
  caption VARCHAR(255),
  INDEX upid_idx (user_id),
  CONSTRAINT photos_pk PRIMARY KEY (photos_id)
);


CREATE TABLE friends_ADDS(
    friend_Id int4,
    numFriends INT NOT NULL,
    user_id int4 NOT NULL,
    PRIMARY KEY (friend_ID, user_id),
    FOREIGN KEY (user_ID) REFERENCES Users ON DELETE CASCADE,
);


CREATE TABLE tagged(
    photos_id int4 NOT NULL,
    tag CHAR(30) NOT NULL,
    PRIMARY KEY (photos_id, tag),
    FOREIGN KEY(photos_id) REFERENCES photos(photos_id),
    FOREIGN KEY(tag) REFERENCES tag(tag),
);


CREATE TABLE creates(
    user_id int4 NOT NULL,
    albumID int4 NOT NULL,
    numAlbums INT NOT NULL,
    PRIMARY KEY(albumID),
    FOREIGN KEY(user_id) REFERENCES Users(user_id),
    FOREIGN KEY(albumID) REFERENCES albums(albumID)
);


CREATE TABLE contains(
    albumID int4 NOT NULL,
    photos_id int4 NOT NULL,
    numPhotos INT NOT NULL,
    PRIMARY KEY(photos_id),
    FOREIGN KEY(albumID) REFERENCES albums(albumID),
    FOREIGN KEY(photos_id) REFERENCES photos(photos_id)
);


CREATE TABLE holds(
    photos_id int4 NOT NULL,
    commentID int4 NOT NULL,
    numComments INT NOT NULL,
    PRIMARY KEY(commentID),
    FOREIGN KEY(photos_id) REFERENCES photos(photos_id),
    FOREIGN KEY(commentID) REFERENCES comments(commentID)
);






INSERT INTO Users (email, password) VALUES ('test@bu.edu', 'test');
INSERT INTO Users (email, password) VALUES ('test1@bu.edu', 'test');
