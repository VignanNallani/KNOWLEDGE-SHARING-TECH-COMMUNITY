# 📚 Knowledge Sharing Tech Community – DBMS Project

A relational database system designed to support a collaborative, knowledge-sharing platform where tech enthusiasts can connect, post content, gain mentorship, and participate in events.

![License: MIT](https://img.shields.io/badge/License-MIT-green.svg)
![Built With: SQL](https://img.shields.io/badge/Built%20With-SQL-blue)
![Status: Completed](https://img.shields.io/badge/Status-Completed-brightgreen)
![Project Type: DBMS](https://img.shields.io/badge/Type-Database%20Project-lightgrey)


## 📌 Project Description

This project is a **Database Management System** (DBMS) designed for a tech community that:
- Enables users to share technical knowledge via posts, comments, and likes
- Supports mentorship and collaboration features
- Organizes tech events and discussions
- Handles moderation via user reporting
- Tracks user skills and professional growth

## ⚙️ Technologies Used

- **Database:** MySQL / PostgreSQL (standard SQL)
- **Language:** SQL (DDL, DML, DCL)
- **Tools:** ER Diagramming (draw.io / dbdiagram.io)
- **Version Control:** Git & GitHub


## 🧱 Database Schema Overview

The database includes the following core entities:

- `Users` – Basic user info
- `Skills` – User-added tech skills
- `Posts` – Shared knowledge or queries
- `Comments` – Comments on posts
- `Likes` – Likes on posts
- `Tags` – Topics linked to posts
- `Events` – Tech events organized by users
- `Mentorship` – Users mentoring each other
- `Collaborations` – Team-based learning
- `Reports` – For content moderation

## 🗂️ Folder Structure
TechCommunityDBMS/
├── README.md # Project documentation

├── LICENSE # MIT License

├── schema.sql # CREATE TABLE and relationships

├── queries/ # SQL query files

│ ├── users_queries.sql

│ ├── posts_comments_likes.sql

│ ├── nested_queries.sql

├── reports/

│ └── dbms_project_report.pdf

├── images

│ └── ER_Diagram.png





## 🧠 Key Features

- 👥 User registration, skills, followers
- 📝 Posts with comments and likes
- 🧑‍🏫 Mentorship requests and offers
- 🧑‍💻 Event participation
- 📊 Nested and complex SQL queries
- 🚨 Report & moderation system

---

## 💡 Sample Query

```sql
-- Fetch top 5 most liked posts along with author info
SELECT p.post_id, p.title, u.username, COUNT(l.like_id) AS like_count
FROM Posts p
JOIN Users u ON p.user_id = u.user_id
LEFT JOIN Likes l ON p.post_id = l.post_id
GROUP BY p.post_id, u.username
ORDER BY like_count DESC
LIMIT 5;



📂 **GitHub Repository**: [View on GitHub](https://github.com/VignanNallani/KNOWLEDGE-SHARING-TECH-COMMUNITY)


