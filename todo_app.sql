-- Write a query to drop a database named todo_app if it exists
DROP DATABASE IF EXISTS todo_app;
-- Write a query to create a database named todo_app
CREATE DATABASE todo_app;
-- Write a query to delete a user named michael if it exists
DROP USER IF EXISTS michael;
-- Write a query to create a user named michael with an encrypted password stonebreaker
CREATE USER michael
  WITH
    ENCRYPTED PASSWORD 'stonebreaker';
-- Connect to the newly created database
\c todo_app;
-- Create a table named tasks
CREATE TABLE tasks (
  id SERIAL NOT NULL PRIMARY KEY,
  title VARCHAR(255) NOT NULL,
  description TEXT,
  created_at TIMESTAMP WITHOUT TIME ZONE DEFAULT now() NOT NULL,
  updated_at TIMESTAMP WITHOUT TIME ZONE,
  completed BOOLEAN DEFAULT false
  );
-- remove the column named completed
ALTER TABLE tasks DROP COLUMN completed;
-- add a column to tasks named completed_at
ALTER TABLE tasks ADD completed_at TIMESTAMP WITHOUT TIME ZONE DEFAULT null;
-- change the updated_at column
ALTER TABLE tasks ALTER COLUMN updated_at SET DEFAULT now();
ALTER TABLE tasks ALTER COLUMN updated_at SET NOT NULL;
-- create a new task (Study SQL)
INSERT INTO tasks
VALUES (DEFAULT, 'Study SQL', 'Complete this exercise', now(), now(), NULL);
-- create a new task (Study PostgreSQL)
INSERT INTO tasks (title, description)
VALUES ('Study PostgreSQL', 'Read all the documentation');
-- select all the titles of tasks that are not yet completed
SELECT title FROM tasks WHERE completed_at IS NULL;
-- update the task with a title of 'Study SQL' to be completed as of now
UPDATE tasks SET completed_at = now() WHERE title = 'Study SQL';
-- select all titles and descriptions of tasks that are not yet completed
SELECT title, description FROM tasks WHERE completed_at IS NULL;
-- select all fields of every task sorted by creation date in descending order
SELECT * FROM tasks ORDER BY created_at DESC;
-- create a new task (mistake 1)
INSERT INTO tasks (title, description)
VALUES ('mistake 1', 'a test entry');
-- create a new task (mistake 2)
INSERT INTO tasks (title, description)
VALUES ('mistake 2', 'another test entry');
-- create a new task (mistake 3)
INSERT INTO tasks (title, description)
VALUES ('mistake 3', 'another test entry');
-- select title fields of all tasks with a title that includes the word 'mistake'
SELECT title FROM tasks WHERE title LIKE 'mistake%';
-- delete the task that has a title of mistake 1
DELETE FROM tasks WHERE title = 'mistake 1';
-- select title and description fields of all tasks with a title that includes the word 'mistake'
SELECT title, description FROM tasks WHERE title LIKE 'mistake%';