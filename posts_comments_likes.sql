-- 🔹 1. Insert a post
INSERT INTO Posts (post_id, user_id, title, content)
VALUES (1, 101, 'What is SQL normalization?', 'Explain all forms with examples.');

-- 🔹 2. Insert a comment
INSERT INTO Comments (comment_id, post_id, user_id, content)
VALUES (1, 1, 102, 'Great question! 1NF removes repeating groups.');

-- 🔹 3. Insert a like
INSERT INTO Likes (like_id, post_id, user_id)
VALUES (1, 1, 103);

-- 🔹 4. Get all posts with their comment count
SELECT p.post_id, p.title, COUNT(c.comment_id) AS comment_count
FROM Posts p
LEFT JOIN Comments c ON p.post_id = c.post_id
GROUP BY p.post_id, p.title;

-- 🔹 5. Get all posts with like count
SELECT p.post_id, p.title, COUNT(l.like_id) AS like_count
FROM Posts p
LEFT JOIN Likes l ON p.post_id = l.post_id
GROUP BY p.post_id, p.title;

-- 🔹 6. Fetch comments for a specific post
SELECT c.comment_id, u.username, c.content, c.commented_at
FROM Comments c
JOIN Users u ON c.user_id = u.user_id
WHERE c.post_id = 1;

-- 🔹 7. Get top 3 most liked posts
SELECT p.title, COUNT(l.like_id) AS likes
FROM Posts p
LEFT JOIN Likes l ON p.post_id = l.post_id
GROUP BY p.post_id, p.title
ORDER BY likes DESC
LIMIT 3;

-- 🔹 8. Get posts with no likes
SELECT post_id, title
FROM Posts
WHERE post_id NOT IN (SELECT post_id FROM Likes);

-- 🔹 9. Get users and number of comments they made
SELECT u.username, COUNT(c.comment_id) AS total_comments
FROM Users u
JOIN Comments c ON u.user_id = c.user_id
GROUP BY u.username;

