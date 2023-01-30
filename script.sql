-- CREATE TABLE users (
--     user_id int primary key generated by default as identity,
--     email character(50) NOT NULL unique ,
--     first_name varchar(50) NOT NULL,
--     last_name varchar(50) NOT NULL,
--     password varchar(255) NOT NULL,
--     enabled boolean not null
--     );

CREATE TABLE roles (
    role_id int primary key generated by default as identity,
    name varchar(50) NOT NULL unique
    );

CREATE TABLE users_roles (
    user_id int NOT NULL,
    role_id int NOT NULL,
    primary key (user_id, role_id),
    foreign key (user_id) references users(user_id) on delete set null,
    foreign key (role_id) references roles(role_id) on delete set null
    );



-- create table category
-- (
--     id int primary key generated by default as identity,
--     name  varchar(50) not null unique,
--     price int not null
-- );

-- create table booking(
--                         id int primary key generated by default as identity,
--                         date_in date not null,
--                         date_out date not null,
--                         category_id int references category(id) on delete set null,
--                         user_id int references users(user_id) on delete set null
-- );


-- insert into category(name, price) VALUES
--             ('STANDARD', 100), ('SUITE', 200), ('VIP', 500);
--
-- insert into booking(date_in, date_out, category_id, user_id)
-- values ('2023-02-02', '2023-02-10', 1, 1),
--        ('2023-02-01', '2023-02-03', 2, 2);

-- INSERT into users(email, first_name, last_name, password) values
-- ('admin@ru', 'Stas', 'Nov', '1313'),
-- ('stasya@ru', 'Marina', 'Maru', '1313');

-- Insert Into roles(name) values
-- ('ADMIN'), ('USER');
--
-- insert into users_roles(user_id, role_id) values
-- (1,1), (2,2);

