-- USERS TABLE
CREATE TABLE Users (
    user_id INT PRIMARY KEY,
    username VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    password VARCHAR(100),
    joined_date DATE DEFAULT CURRENT_DATE
);

-- SKILLS TABLE
CREATE TABLE Skills (
    skill_id INT PRIMARY KEY,
    skill_name VARCHAR(50) NOT NULL
);

-- USER_SKILLS (many-to-many)
CREATE TABLE UserSkills (
    user_id INT,
    skill_id INT,
    PRIMARY KEY (user_id, skill_id),
    FOREIGN KEY (user_id) REFERENCES Users(user_id),
    FOREIGN KEY (skill_id) REFERENCES Skills(skill_id)
);

-- POSTS TABLE
CREATE TABLE Posts (
    post_id INT PRIMARY KEY,
    user_id INT,
    title VARCHAR(100),
    content TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES Users(user_id)
);

-- COMMENTS TABLE
CREATE TABLE Comments (
    comment_id INT PRIMARY KEY,
    post_id INT,
    user_id INT,
    content TEXT,
    commented_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (post_id) REFERENCES Posts(post_id),
    FOREIGN KEY (user_id) REFERENCES Users(user_id)
);

-- LIKES TABLE
CREATE TABLE Likes (
    like_id INT PRIMARY KEY,
    post_id INT,
    user_id INT,
    liked_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (post_id) REFERENCES Posts(post_id),
    FOREIGN KEY (user_id) REFERENCES Users(user_id)
);

-- TAGS TABLE
CREATE TABLE Tags (
    tag_id INT PRIMARY KEY,
    tag_name VARCHAR(50) NOT NULL UNIQUE
);

-- POST_TAGS (many-to-many)
CREATE TABLE PostTags (
    post_id INT,
    tag_id INT,
    PRIMARY KEY (post_id, tag_id),
    FOREIGN KEY (post_id) REFERENCES Posts(post_id),
    FOREIGN KEY (tag_id) REFERENCES Tags(tag_id)
);

-- EVENTS TABLE
CREATE TABLE Events (
    event_id INT PRIMARY KEY,
    organizer_id INT,
    event_name VARCHAR(100),
    description TEXT,
    event_date DATE,
    FOREIGN KEY (organizer_id) REFERENCES Users(user_id)
);

-- MENTORSHIP TABLE
CREATE TABLE Mentorship (
    mentor_id INT,
    mentee_id INT,
    start_date DATE,
    PRIMARY KEY (mentor_id, mentee_id),
    FOREIGN KEY (mentor_id) REFERENCES Users(user_id),
    FOREIGN KEY (mentee_id) REFERENCES Users(user_id)
);

-- COLLABORATIONS TABLE
CREATE TABLE Collaborations (
    collab_id INT PRIMARY KEY,
    user1_id INT,
    user2_id INT,
    topic VARCHAR(100),
    started_on DATE,
    FOREIGN KEY (user1_id) REFERENCES Users(user_id),
    FOREIGN KEY (user2_id) REFERENCES Users(user_id)
);

-- REPORTS TABLE
CREATE TABLE Reports (
    report_id INT PRIMARY KEY,
    reporter_id INT,
    post_id INT,
    reason TEXT,
    reported_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (reporter_id) REFERENCES Users(user_id),
    FOREIGN KEY (post_id) REFERENCES Posts(post_id)
);

