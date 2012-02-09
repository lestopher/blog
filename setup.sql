insert into users (fname, lname, username, create_date) values ('Christopher', 'Nguyen', 'christ0pher', date('now'));
insert into users (fname, lname, username, create_date) values ('Joseph', 'Chrin', 'mrjoechin', date('now'));
insert into users (fname, lname, username, create_date) values ('Thu', 'Tran', 'miss2tran', date('now'));
insert into users (fname, lname, username, create_date) values ('Eric', 'Nguyen', 'eh2dawic', date('now'));
insert into users (fname, lname, username, create_date) values ('Salvador', 'Yu', 'nintek', date('now'));
insert into users (fname, lname, username, create_date) values ('Mimi', 'Bui', 'meemsbui', date('now'));
insert into users (fname, lname, username, create_date) values ('Ryan', 'Rhie', 'rhiefer', date('now'));
insert into users (fname, lname, username, create_date) values ('Victor', 'Wu', 'victortwu', date('now'));
insert into users (fname, lname, username, create_date) values ('Bobby', 'Hill', 'KingOfTheHill', date('now'));

create table users
(
id INTEGER PRIMARY KEY ASC,
fname varchar2(20),
lname varchar2(20),
username varchar2(16) NOT NULL,
create_date DATE
);

CREATE TABLE posts (
id INTEGER PRIMARY KEY ASC,
post BLOB,
create_date DATE,
user_id INTEGER,
FOREIGN KEY (user_id) REFERENCES user(id)
);

