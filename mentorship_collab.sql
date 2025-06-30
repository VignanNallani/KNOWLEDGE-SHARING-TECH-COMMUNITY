-- 🔹 1. Assign a mentorship (mentor_id mentors mentee_id)
INSERT INTO Mentorship (mentor_id, mentee_id, start_date)
VALUES (101, 102, '2025-07-01');

-- 🔹 2. Get all mentorship pairs
SELECT m.mentor_id, mu.username AS mentor_name,
       m.mentee_id, me.username AS mentee_name, m.start_date
FROM Mentorship m
JOIN Users mu ON m.mentor_id = mu.user_id
JOIN Users me ON m.mentee_id = me.user_id;

-- 🔹 3. Get mentees under a specific mentor
SELECT u.username AS mentee_name
FROM Mentorship m
JOIN Users u ON m.mentee_id = u.user_id
WHERE m.mentor_id = 101;

-- 🔹 4. Find mentors who are also mentees
SELECT mentor_id
FROM Mentorship
WHERE mentor_id IN (SELECT mentee_id FROM Mentorship);

-- 🔹 5. Count of mentees per mentor
SELECT mentor_id, COUNT(mentee_id) AS mentee_count
FROM Mentorship
GROUP BY mentor_id;

-- 🔹 6. Insert a new collaboration between two users
INSERT INTO Collaborations (collab_id, user1_id, user2_id, topic, started_on)
VALUES (1, 103, 104, 'AI-powered Chatbot', '2025-07-02');

-- 🔹 7. Get all collaborations
SELECT c.collab_id, u1.username AS User1, u2.username AS User2, c.topic, c.started_on
FROM Collaborations c
JOIN Users u1 ON c.user1_id = u1.user_id
JOIN Users u2 ON c.user2_id = u2.user_id;

-- 🔹 8. Get collaborations by topic keyword
SELECT * FROM Collaborations
WHERE topic LIKE '%AI%';

-- 🔹 9. Get users involved in more than 1 collaboration
SELECT user_id
FROM (
    SELECT user1_id AS user_id FROM Collaborations
    UNION ALL
    SELECT user2_id FROM Collaborations
) AS combined
GROUP BY user_id
HAVING COUNT(*) > 1;
