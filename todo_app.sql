drop table if exists tasks;
CREATE table tasks
(
  id serial primary key,
  title varchar(255) NOT NULL,
  description text NULL,
  created_at timestamp without time zone NOT null default now(),
  updated_at timestamp without time zone NULL,
  completed boolean NOT NULL DEFAULT false
);

ALTER TABLE tasks 
DROP column if exists completed;

ALTER TABLE tasks
ADD COLUMN completed_at timestamp DEFAULT NULL;
ALTER TABLE tasks
ALTER COLUMN update_at NOT NULL DEFAULT now();
INSERT INTO tasks (title, description, updated_at) values('Study SQL', 'Complete this exercise', now());
INSERT INTO tasks (title, description, updated_at) values('Study PostgreSQL', 'Read all the documentation', now());

SELECT * from tasks WHERE completed_at is NULL;

UPDATE tasks
SET completed_at = now()
where title = 'Study SQL';

SELECT title,description
FROM tasks
where completed_at = NULL;

SELECT *
FROM tasks
ORDER BY created_at DESC;

INSERT INTO tasks (title, description, updated_at) values('mistake 1', 'a test entry', now());
INSERT INTO tasks (title, description, updated_at) values('mistake 2', 'another test entry', now());
INSERT INTO tasks (title, description, updated_at) values('third mistake', 'another test entry', now());

SELECT title
FROM tasks
where title LIKE '%mistake%';

DELETE
FROM tasks
where title = 'mistake 1';

SELECT title,description
FROM tasks
where title LIKE '%mistake%';

DELETE 
FROM tasks
where title LIKE '%mistake%';

SELECT *
FROM tasks
ORDER BY title ASC;