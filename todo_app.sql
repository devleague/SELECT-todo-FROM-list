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