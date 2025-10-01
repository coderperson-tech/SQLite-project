CREATE TABLE scores (
 id INTEGER PRIMARY KEY AUTOINCREMENT,
 name TEXT,
 subject TEXT,
 score INTEGER
);

INSERT INTO scores (name, subject, score) VALUES
('Alice', 'Math', 85),
('Bob', 'Math', 90),
('Charlie', 'Math', 95),
('Alice', 'Science', 80),
('Bob', 'Science', 70),
('Charlie', 'Science', 88);

SELECT * FROM scores WHERE score >80;

SELECT * FROM scores ORDER BY score DESC;

SELECT subject, AVG(score) AS avg_score FROM scores GROUP BY subject;