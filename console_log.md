creindle@Christies-MacBook-Air:~/Desktop/DevLeague/sql-purchases-demo|
⇒  psql
psql (9.5.2)
Type "help" for help.

creindle=# \q
creindle@Christies-MacBook-Air:~/Desktop/DevLeague/sql-purchases-demo|
⇒  touch demo.sql
creindle@Christies-MacBook-Air:~/Desktop/DevLeague/sql-purchases-demo|
⇒  vi demo.sql
creindle@Christies-MacBook-Air:~/Desktop/DevLeague/sql-purchases-demo|
⇒  subl .
creindle@Christies-MacBook-Air:~/Desktop/DevLeague/sql-purchases-demo|
⇒  psql -f demo.sql
psql:demo.sql:1: NOTICE:  database "purchases_demo" does not exist, skipping
DROP DATABASE
CREATE DATABASE
You are now connected to database "purchases_demo" as user "creindle".
CREATE TABLE
CREATE TABLE
INSERT 0 3
INSERT 0 3
creindle@Christies-MacBook-Air:~/Desktop/DevLeague/sql-purchases-demo|
⇒  psql -f demo.sql
DROP DATABASE
CREATE DATABASE
You are now connected to database "purchases_demo" as user "creindle".
CREATE TABLE
CREATE TABLE
INSERT 0 3
INSERT 0 3
creindle@Christies-MacBook-Air:~/Desktop/DevLeague/sql-purchases-demo|
⇒  psql purchases_demo
psql (9.5.2)
Type "help" for help.

purchases_demo=# select * users;
ERROR:  syntax error at or near "users"
LINE 1: select * users;
                 ^
purchases_demo=# select * FROM users;
 id |  name  |       email
----+--------+-------------------
  1 | Jaywon | jaywon@dark.net
  2 | Burger | burger@net.com
  3 | Vegan  | pastel@hawaii.com
(3 rows)

purchases_demo=# SELECT * FROM purchases;
 id | price  | user_id
----+--------+---------
  1 | 200.00 |       1
  2 |   5.00 |       2
  3 |  20.00 |       2
(3 rows)

purchases_demo=# SELECT * FROM users
purchases_demo-# INNER JOIN ON purchases
purchases_demo-# ^C
purchases_demo=# SELECT * FROM users
purchases_demo-# INNER JOIN purchases
purchases_demo-# ON users.id = purchases user_id;
ERROR:  syntax error at or near "user_id"
LINE 3: ON users.id = purchases user_id;
                                ^
purchases_demo=# SELECT * FROM users
INNER JOIN purchases
ON users.id = purchases users_id;
ERROR:  syntax error at or near "users_id"
LINE 3: ON users.id = purchases users_id;
                                ^
purchases_demo=# SELECT * FROM users
INNER JOIN purchases
ON users.id = purchases.user_id;
 id |  name  |      email      | id | price  | user_id
----+--------+-----------------+----+--------+---------
  1 | Jaywon | jaywon@dark.net |  1 | 200.00 |       1
  2 | Burger | burger@net.com  |  2 |   5.00 |       2
  2 | Burger | burger@net.com  |  3 |  20.00 |       2
(3 rows)

purchases_demo=#