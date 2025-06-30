-- 🔹 Insert a new user
INSERT INTO Users (user_id, username, email, password)
VALUES (1, 'vignan', 'vignanchowdarytilt@gmail.com', 'securepassword123');

-- 🔹 Get all users
SELECT * FROM Users;

-- 🔹 Get user by ID
SELECT * FROM Users WHERE user_id = 1;

-- 🔹 Update username and email
UPDATE Users
SET username = 'vignan_updated', email = 'vignanchowdarytilt@gmail.com'
WHERE user_id = 1;

-- 🔹 Delete a user
DELETE FROM Users WHERE user_id = 1;

-- 🔹 Get all users with their skills
SELECT u.user_id, u.username, s.skill_name
FROM Users u
JOIN UserSkills us ON u.user_id = us.user_id
JOIN Skills s ON us.skill_id = s.skill_id;

-- 🔹 Get all users who have posted something
SELECT DISTINCT u.user_id, u.username
FROM Users u
JOIN Posts p ON u.user_id = p.user_id;

-- 🔹 Count number of posts per user
SELECT u.username, COUNT(p.post_id) AS total_posts
FROM Users u
LEFT JOIN Posts p ON u.user_id = p.user_id
GROUP BY u.username;


