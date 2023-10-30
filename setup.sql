CREATE DATABASE passwords DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

CREATE TABLE websites (
    website_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255),
    url VARCHAR(255) NOT NULL
);

CREATE TABLE users (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(255) NOT NULL,
    last_name VARCHAR(255) NOT NULL,
    username VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL
);

CREATE TABLE passwords (
    password_id INT AUTO_INCREMENT PRIMARY KEY,
    password VARBINARY(255),
    comment TEXT,
    timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    website_id INT,
    FOREIGN KEY (website_id) REFERENCES websites(website_id) ON DELETE CASCADE
);

INSERT INTO websites (name, url) VALUES
    ('Google', 'https://www.google.com'),
    ('Facebook', 'https://www.facebook.com'),
    ('Twitter', 'https://www.twitter.com'),
    ('LinkedIn', 'https://www.linkedin.com'),
    ('GitHub', 'https://github.com'),
    ('Reddit', 'https://www.reddit.com'),
    ('Wikipedia', 'https://en.wikipedia.org'),
    ('Amazon', 'https://www.amazon.com'),
    ('YouTube', 'https://www.youtube.com'),
    ('Netflix', 'https://www.netflix.com');

INSERT INTO users (first_name, last_name, username, email) VALUES
    ('John', 'Doe', 'johndoe', 'john@example.com'),
    ('Jane', 'Smith', 'janesmith', 'jane@example.com'),
    ('Alice', 'Johnson', 'alicej', 'alice@example.com'),
    ('Bob', 'Wilson', 'bobw', 'bob@example.com'),
    ('Eve', 'Brown', 'eveb', 'eve@example.com'),
    ('Charlie', 'Lee', 'charliel', 'charlie@example.com'),
    ('Grace', 'Davis', 'graced', 'grace@example.com'),
    ('David', 'Martin', 'davidm', 'david@example.com'),
    ('Olivia', 'Clark', 'oliviac', 'olivia@example.com'),
    ('William', 'Harris', 'williamh', 'william@example.com');

INSERT INTO passwords (password, comment, website_id) VALUES
    (AES_ENCRYPT('password123', 'h3@DvW#QrY6z9p$B'), 'Login Password for Google', 1),
    (AES_ENCRYPT('securepass', 'h3@DvW#QrY6z9p$B'), 'Main Account Password for Facebook', 2),
    (AES_ENCRYPT('passw0rd', 'h3@DvW#QrY6z9p$B'), 'Social Media Password for Twitter', 3),
    (AES_ENCRYPT('P@ssw0rd', 'h3@DvW#QrY6z9p$B'), 'Professional Password for LinkedIn', 4),
    (AES_ENCRYPT('githubpass', 'h3@DvW#QrY6z9p$B'), 'Development Password for GitHub', 5),
    (AES_ENCRYPT('redditsafe', 'h3@DvW#QrY6z9p$B'), 'Forums Password for Reddit', 6),
    (AES_ENCRYPT('wikisecret', 'h3@DvW#QrY6z9p$B'), 'Research Password for Wikipedia', 7),
    (AES_ENCRYPT('shopper123', 'h3@DvW#QrY6z9p$B'), 'Shopping Password for Amazon', 8),
    (AES_ENCRYPT('tubewatch', 'h3@DvW#QrY6z9p$B'), 'Video Streaming Password for YouTube', 9),
    (AES_ENCRYPT('netflixpass', 'h3@DvW#QrY6z9p$B'), 'Entertainment Password for Netflix', 10);
