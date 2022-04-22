CREATE DATABASE IF NOT EXISTS social_media_application;
USE social_media_application;

DROP TABLE IF EXISTS comments;
DROP TABLE IF EXISTS posts;
DROP TABLE IF EXISTS users;

CREATE TABLE users(
	user_id INT NOT NULL AUTO_INCREMENT,
    user_name VARCHAR (30) NOT NULL,
    user_email VARCHAR (50) NOT NULL,
    user_password VARCHAR(12) NOT NULL,
    PRIMARY KEY(user_id)
);

CREATE TABLE posts(
	post_id INT NOT NULL AUTO_INCREMENT,
	user_id INT NOT NULL,
    post_content VARCHAR (1000),
    post_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
    PRIMARY KEY (post_id),
    FOREIGN KEY (user_id) REFERENCES users(user_id)
);

CREATE TABLE comments(
	comment_id INT NOT NULL AUTO_INCREMENT,
    user_id INT NOT NULL,
    post_id INT NOT NULL,
    comment_content VARCHAR (1000),
    comment_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
    PRIMARY KEY (comment_id),
    FOREIGN KEY (user_id) REFERENCES users(user_id),
    FOREIGN KEY (post_id) REFERENCES posts(post_id)
);