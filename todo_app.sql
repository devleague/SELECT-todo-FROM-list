DROP DATABASE IF EXISTS todo_app;
CREATE DATABASE todo_app;

\c todo_app;

DROP USER IF EXISTS michael;
CREATE USER michael
    WITH
        ENCRYPTED PASSWORD 'stonebreaker';

CREATE TABLE tasks (
  id          SERIAL PRIMARY KEY,
  title       varchar(255),
  description TEXT              NULL,
  created_at  TIMESTAMP         DEFAULT now(),
  updated_at  TIMESTAMP         NULL,
  completed   BOOLEAN           DEFAULT FALSE
);

INSERT INTO tasks (
  id,
  title,
  description,
  created_at,
  updated_at,
  completed
  )

  VALUES (
    DEFAULT,
    'Study SQL',
    'Complete this exercise',
    DEFAULT,
    NULL,
    NULL
  );

SELECT * FROM tasks;

ALTER TABLE tasks
  DROP COLUMN completed;

ALTER TABLE tasks
  ADD COLUMN completed_at TIMESTAMP DEFAULT NULL;

UPDATE tasks
  SET updated_at=now()
  WHERE updated_at IS NULL;

ALTER TABLE tasks
  ALTER COLUMN updated_at SET NOT NULL;

ALTER TABLE tasks
  ALTER COLUMN updated_at SET DEFAULT now();

SELECT * FROM tasks;

UPDATE tasks
  SET id = DEFAULT,
  title = 'Study SQL',
  description = 'Complete this exercise',
  created_at = now(),
  updated_at = now(),
  completed_at = NULL;

INSERT INTO tasks (title, description)
  VALUES ('Study PostgreSQL', 'Read all the documentation');

SELECT *
  FROM tasks;

SELECT title
  FROM tasks
  WHERE completed_at=NULL;

UPDATE tasks
  SET completed_at = now()
  WHERE title='Study SQL';

SELECT *
  FROM tasks;

INSERT INTO tasks (
  title,
  description
  )
  VALUES
    ('mistake 1',
      'a test entry'
    );

SELECT *
  FROM tasks;

INSERT INTO tasks (
  title,
  description
  )
  VALUES
    ('mistake 2',
      'another test entry'
    );

SELECT *
  FROM tasks;

INSERT INTO tasks (
  title,
  description
  )
  VALUES
    ('third mistake',
      'another test entry'
    );

SELECT *
  FROM tasks;

SELECT title
  FROM tasks
  WHERE title LIKE '%mistake%';

DELETE FROM tasks
  WHERE title LIKE '%mistake%';

SELECT *
  FROM tasks
  ORDER BY title ASC;


