-- 🔹 1. Get users who have never posted anything
SELECT user_id, username
FROM Users
WHERE user_id NOT IN (
    SELECT DISTINCT user_id FROM Posts
);

-- 🔹 2. Get posts with more than 3 likes
SELECT p.post_id, p.title, COUNT(l.like_id) AS total_likes
FROM Posts p
LEFT JOIN Likes l ON p.post_id = l.post_id
GROUP BY p.post_id, p.title
HAVING total_likes > 3;

-- 🔹 3. Get the top 3 most liked posts
SELECT p.post_id, p.title, u.username, COUNT(l.like_id) AS like_count
FROM Posts p
JOIN Users u ON p.user_id = u.user_id
LEFT JOIN Likes l ON p.post_id = l.post_id
GROUP BY p.post_id, u.username
ORDER BY like_count DESC
LIMIT 3;

-- 🔹 4. List events with zero participants
SELECT event_id, event_name
FROM Events
WHERE event_id NOT IN (
    SELECT DISTINCT event_id FROM EventParticipants
);

-- 🔹 5. Get mentors who are also mentees (self-learning or community mentors)
SELECT mentor_id AS user_id
FROM Mentorship
WHERE mentor_id IN (
    SELECT mentee_id FROM Mentorship
);

-- 🔹 6. Get users with the highest number of skills
SELECT u.user_id, u.username, COUNT(us.skill_id) AS skill_count
FROM Users u
JOIN UserSkills us ON u.user_id = us.user_id
GROUP BY u.user_id
ORDER BY skill_count DESC
LIMIT 1;

-- 🔹 7. Correlated Subquery: Users who posted more than the average number of posts
SELECT user_id, username
FROM Users u
WHERE (
    SELECT COUNT(*) FROM Posts p WHERE p.user_id = u.user_id
) > (
    SELECT AVG(post_count) FROM (
        SELECT COUNT(*) AS post_count FROM Posts GROUP BY user_id
    ) AS avg_posts
);
