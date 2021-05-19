PRAGMA foreign_keys = ON;

DROP TABLE IF EXISTS question_likes;
DROP TABLE IF EXISTS replies;
DROP TABLE IF EXISTS question_follows;
DROP TABLE IF EXISTS questions;
DROP TABLE IF EXISTS users;

CREATE TABLE users (
    id INTEGER PRIMARY KEY, 
    fname VARCHAR(255) NOT NULL,
    lname VARCHAR(255) NOT NULL
);

CREATE TABLE questions (
    id INTEGER PRIMARY KEY, 
    title VARCHAR(255) NOT NULL,
    body VARCHAR(255) NOT NULL,
    author_id INTEGER NOT NULL, 

    FOREIGN KEY (author_id) REFERENCES users(id)
);

CREATE TABLE question_follows (
    id INTEGER PRIMARY KEY,
    user_id INTEGER NOT NULL,
    question_id INTEGER NOT NULL,

    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (question_id) REFERENCES questions(id)
);

CREATE TABLE replies (
    id INTEGER PRIMARY KEY,
    question_id INTEGER NOT NULL,
    parent_question_id INTEGER,
    user_id INTEGER NOT NULL,

    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (question_id) REFERENCES questions(id),
    FOREIGN KEY (parent_question_id) REFERENCES replies(id)
); 

CREATE TABLE question_likes (
    like_question INTEGER,
    user_id INTEGER NOT NULL,
    question_id INTEGER NOT NULL,

    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (question_id) REFERENCES questions(id)
);



INSERT INTO 
    users (fname, lname)
VALUES
    ('Paul', 'Kim'),
    ('Priyesh', 'Shah'),
    ('David', 'Suh');

INSERT INTO 
    questions (title, body, author_id)
VALUES
    ('Paul Question', 'PAUL PAUL PAUL', 1),
    ('Priyesh Question', 'PRIYESH PRIYESH PRIYESH', 2);

INSERT INTO 
    question_follows (user_id, question_id)
VALUES
    (1, 1),
    (2, 2);

INSERT INTO 
    replies (question_id, parent_question_id, user_id)
VALUES 
    (1, 1, 1),
    (2, NULL, 2);

INSERT INTO
    question_likes (like_question, user_id, question_id)
VALUES
    (0, 1, 1);