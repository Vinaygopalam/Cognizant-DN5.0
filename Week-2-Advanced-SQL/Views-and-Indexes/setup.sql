CREATE TABLE Students (
    StudentId INT PRIMARY KEY,
    Name VARCHAR(100),
    Course VARCHAR(50)
);

INSERT INTO Students VALUES (1, 'John Doe', 'Computer Science');
INSERT INTO Students VALUES (2, 'Jane Smith', 'Information Technology');

CREATE VIEW ActiveStudentsView AS
SELECT StudentId, Name, Course 
FROM Students;

SELECT * FROM ActiveStudentsView;

CREATE INDEX IX_Students_Course ON Students(Course);
