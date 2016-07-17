DROP DATABASE IF EXISTS todo_app;
-- Drop the database before you create the database.
CREATE DATABASE todo_app;
-- Write a query to delete a user named michael if it exists.
DROP USER IF EXISTS michael;
CREATE USER michael 
  WITH 
    ENCRYPTED PASSWORD 'stonebreaker'
    LOGIN;
-- Connect to the new database.
\c todo_app;
CREATE TABLE tasks (
  id SERIAL PRIMARY KEY,
  title VARCHAR(255),
  description TEXT,
  created_at TIMESTAMP WITHOUT TIME ZONE NOT NULL DEFAULT now(),
  updated_at TIMESTAMP WITHOUT TIME ZONE NULL,
  completed BOOLEAN NOT NULL DEFAULT FALSE
);

ALTER TABLE tasks 
  DROP COLUMN 
  IF EXISTS completed;

ALTER TABLE tasks
  ADD COLUMN completed_at
  TIMESTAMP NULL
  DEFAULT NULL;

ALTER TABLE tasks
  ALTER COLUMN
  updated_at
  SET NOT NULL;

ALTER TABLE tasks
  ALTER COLUMN
  updated_at
  SET DEFAULT now();

INSERT INTO tasks VALUES (
  DEFAULT,
  'Study SQL',
  'Complete this exercise',
  now(),
  now(),
  NULL
);

INSERT INTO tasks (
  title,
  description
)

VALUES (
'Study PostgreSQL',
'Read all the documentation'
);

SELECT title 
  FROM tasks 
  WHERE completed_at IS NULL;

UPDATE tasks
  SET completed_at = now()
  WHERE title = 'Study SQL';

SELECT title, description
  FROM tasks
  WHERE completed_at IS NULL;

SELECT *
  FROM tasks
  ORDER BY created_at
  DESC;

INSERT INTO tasks (
  title,
  description
)

VALUES (
  'mistake 2',
  'another test entry'
);

INSERT INTO tasks (
  title,
  description
)

VALUES (
  'third mistake',
  'another test entry'
);

SELECT title
  FROM tasks
  WHERE title LIKE '%mistake%';

DELETE
  FROM tasks
  WHERE title = 'mistake 1';

SELECT title, description
  FROM tasks
  WHERE title LIKE '%mistake%';

DELETE
  FROM tasks
  WHERE title LIKE '%mistake%';

SELECT *
  FROM tasks
  ORDER BY title
  ASC;