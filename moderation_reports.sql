-- 🔹 1. Report a post
INSERT INTO Reports (report_id, reporter_id, post_id, reason)
VALUES (1, 105, 1, 'Inappropriate language used');

-- 🔹 2. View all reports with reporter and post info
SELECT r.report_id, u.username AS reporter, p.title AS reported_post, r.reason, r.reported_at
FROM Reports r
JOIN Users u ON r.reporter_id = u.user_id
JOIN Posts p ON r.post_id = p.post_id;

-- 🔹 3. Count total reports for each post
SELECT p.post_id, p.title, COUNT(r.report_id) AS report_count
FROM Reports r
JOIN Posts p ON r.post_id = p.post_id
GROUP BY p.post_id, p.title
ORDER BY report_count DESC;

-- 🔹 4. Get top 5 most reported posts
SELECT p.title, COUNT(r.report_id) AS reports
FROM Reports r
JOIN Posts p ON r.post_id = p.post_id
GROUP BY p.title
ORDER BY reports DESC
LIMIT 5;

-- 🔹 5. Get all users who reported something
SELECT DISTINCT u.user_id, u.username
FROM Reports r
JOIN Users u ON r.reporter_id = u.user_id;

-- 🔹 6. Get posts that were reported more than once
SELECT post_id, COUNT(*) AS total_reports
FROM Reports
GROUP BY post_id
HAVING COUNT(*) > 1;

-- 🔹 7. Delete a specific report
DELETE FROM Reports
WHERE report_id = 1;
