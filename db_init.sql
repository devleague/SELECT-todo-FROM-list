DROP DATABASE IF EXISTS todo_app;

drop user if exists michael;

create user michael with encrypted password 'stonebreaker';

CREATE DATABASE todo_app;