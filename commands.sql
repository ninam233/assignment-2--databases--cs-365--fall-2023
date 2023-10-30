-- Create a new entry into the database
INSERT INTO websites (name, url) VALUES
    ('New Website', 'https://www.newwebsite.com');

-- Get the password associated with the URL of one of your 10 entries
SELECT AES_DECRYPT(password, 'h3@DvW#QrY6z9p$B') AS decrypted_password
FROM websites w
JOIN passwords p ON w.website_id = p.website_id
WHERE w.url = 'https://www.google.com';

-- Get all the password-related data, including the password, associated with URLs that have 'https' in two of your 10 entries
SELECT w.name, w.url, AES_DECRYPT(p.password, 'h3@DvW#QrY6z9p$B') AS decrypted_password
FROM websites w
JOIN passwords p ON w.website_id = p.website_id
WHERE w.url LIKE 'https%';

-- Change a URL associated with one of the passwords in your 10 entries
UPDATE websites
SET url = 'https://newurl.com'
WHERE name = 'Google';

-- Change any password
UPDATE passwords
SET password = AES_ENCRYPT('newpassword', 'h3@DvW#QrY6z9p$B')
WHERE comment = 'Login Password for Google';

-- Remove a URL and associated passwords
DELETE w, p
FROM websites w
LEFT JOIN passwords p ON w.website_id = p.website_id
WHERE w.name = 'Reddit';

-- Remove a password and its associated entry
DELETE FROM passwords
WHERE comment = 'Main Account Password for Facebook';
