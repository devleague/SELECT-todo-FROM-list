DROP DATABASE IF EXISTS todo_app;

DROP USER IF EXISTS michael;

CREATE USER michael WITH ENCRYPTED PASSWORD 'stonebreaker';

CREATE DATABASE todo_app;
--Connect to the newly created database/will connect via command

CREATE TABLE tasks(
    id SERIAL PRIMARY KEY NOT NULL,
    title VARCHAR(255) NOT NULL,
    description text NULL,
    created_at TIMESTAMP  WITHOUT time zone NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP  WITHOUT time zone NULL,
    completed boolean NOT NULL DEFAULT false
);

ALTER TABLE tasks DROP COLUMN IF EXISTS completed;
--add a column to tasks named completed_at:TIMESTAMP , that may be NULL, and has a default value of NULL.
ALTER TABLE tasks ADD COLUMN completed_at TIMESTAMP WITHOUT time zone NULL DEFAULT NULL;
--change the updated_at column to not allow NULL values, and have a default value of now()
ALTER TABLE tasks ALTER COLUMN updated_at SET DEFAULT CURRENT_TIMESTAMP;
--create a new task, by only setting values
INSERT INTO tasks(title, description, created_at, updated_at, completed_at)
VALUES('Study SQL', 'Complete this exercise', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, NULL);

INSERT INTO tasks(title, description)
VALUES('Study PostgreSQL','Real All the Documentation');
--select all the titles of tasks that are not yet completed
SELECT tasks.title
FROM tasks
WHERE IS NULL;
--update the task with a title of 'Study SQL' to be completed as of now
UPDATE tasks
SET completed_at = CURRENT_TIMESTAMP WHERE title = 'Study SQL';
--select all titles and descriptions of tasks that are not yet completed
SELECT tasks.title, description
FROM tasks
WHERE completed_at IS NULL;

SELECT * FROM tasks ORDER BY created_at DESC;

INSERT INTO tasks(title, description)VALUES('mistake 1','another test entery');

INSERT INTO tasks(title, description)VALUES('mistake 2','another test entry');

INSERT INTO tasks(title, description)VALUES('third mistake','another test entry');

SELECT * FROM tasks WHERE title LIKE '%mistake%';

DELETE FROM tasks WHERE title = 'mistake 1';
SELECT title, description FROM tasks WHERE title LIKE '%mistake%';

DELETE FROM tasks WHERE title LIKE '%mistake%';

SELECT * FROM tasks ORDER BY title ASC;