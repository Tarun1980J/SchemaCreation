-- Creating Schema/User.
CREATE USER librarydb IDENTIFIED BY librarydb;

-- Granting Privileges
GRANT ALL PRIVILEGES TO librarydb;
-- These above commands to be run by SYSADMIN.

-- Using Created User/Schema.
----constraints----
primary key -- it is a field which can uniquely identify each row in a table.
foreign key -- it is similar to primary key but in another table, prevents invalid data, prevents actions that would destroy links between tables.
check -- it validate the values of a column to meet a particular condition.
unique key -- this shows values in a row of a column that are must not be repeated.
not null -- column doesn't contain null values.

----create syntax----
create table table_name
(
column1 datatype Constraint1 Constraint2,
column2 datatype ....
....
columnN datatype constraint1
);

-- Find all Tables--
Select * from all_tables where OWNER = 'LIBRARYDB';

----create sequence----
CREATE SEQUENCE sequence_name
  START WITH start_value
  INCREMENT BY step_value
  [MAXVALUE max_value | NOMAXVALUE]
  [MINVALUE min_value | NOMINVALUE]
  [CYCLE | NOCYCLE]
  [CACHE cache_size | NOCACHE]
  [ORDER | NOORDER];

-- Find Sequences--
select * from user_sequences;










-- Step 1: Categories Table and Sequence
CREATE SEQUENCE seq_categories START WITH 1 INCREMENT BY 1;

CREATE TABLE categories (
    categoryid   NUMBER PRIMARY KEY,
    categoryname VARCHAR2(100) NOT NULL
);

-- Step 2: Authors Table and Sequence
CREATE SEQUENCE seq_authors START WITH 1 INCREMENT BY 1;

CREATE TABLE authors (
    authorid NUMBER PRIMARY KEY,
    name     VARCHAR2(100) NOT NULL
);

-- Step 3: Books Table and Sequence
CREATE SEQUENCE seq_books START WITH 1 INCREMENT BY 1;

CREATE TABLE books (
    bookid        NUMBER PRIMARY KEY,
    title         VARCHAR2(150) NOT NULL,
    categoryid    NUMBER,
    yearpublished NUMBER,
    FOREIGN KEY ( categoryid )
        REFERENCES categories ( categoryid )
);

-- Step 4: BookAuthors Table (no sequence needed, uses composite key)
CREATE TABLE bookauthors (
    bookid   NUMBER,
    authorid NUMBER,
    PRIMARY KEY ( bookid,
                  authorid ),
    FOREIGN KEY ( bookid )
        REFERENCES books ( bookid ),
    FOREIGN KEY ( authorid )
        REFERENCES authors ( authorid )
);

-- Step 5: Members Table and Sequence
CREATE SEQUENCE seq_members START WITH 1 INCREMENT BY 1;

CREATE TABLE members (
    memberid NUMBER PRIMARY KEY,
    fullname VARCHAR2(100) NOT NULL,
    email    VARCHAR2(100),
    joindate DATE DEFAULT sysdate
);

-- Step 6: Loans Table and Sequence
CREATE SEQUENCE seq_loans START WITH 1 INCREMENT BY 1;

CREATE TABLE loans (
    loanid     NUMBER PRIMARY KEY,
    bookid     NUMBER,
    memberid   NUMBER,
    loandate   DATE DEFAULT sysdate,
    returndate DATE,
    FOREIGN KEY ( bookid )
        REFERENCES books ( bookid ),
    FOREIGN KEY ( memberid )
        REFERENCES members ( memberid )
);




























