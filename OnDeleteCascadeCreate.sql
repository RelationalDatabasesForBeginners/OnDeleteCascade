-- YouTube Channel "Relational Databases and SQL for Beginners": https://www.youtube.com/@DatabasesAndSQLForBeginners
-- Table Create Script for YouTube Video "How to Use On Delete Cascade": https://youtu.be/mS04PRqns2E
-- Developed for use with PostgreSQL

-- Remove all tables
DROP TABLE IF EXISTS public."Enrollment";
DROP TABLE IF EXISTS public."Course";
DROP TABLE IF EXISTS public."Student";

-- Create Student Table
CREATE TABLE IF NOT EXISTS public."Student"
(
    "Id" serial,
    "Identity" integer,
    "FirstName" varchar(256),
    "LastName" varchar(256),
    "Address" varchar(256),
    "City" varchar(256),
    "State" varchar(256),
    "PostalCode" varchar(256),
    "Country" varchar(256),
    "GPA" double precision,
    PRIMARY KEY ("Id"))

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public."Student"
    OWNER to postgres;

-- Create Course Table
CREATE TABLE IF NOT EXISTS public."Course"
(
    "Id" serial,
    "Code" integer,
    "Name" varchar(256),
    "Instructor" varchar(256),
    PRIMARY KEY ("Id"))

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public."Course"
    OWNER to postgres;
    
-- Create Enrollment Table
CREATE TABLE IF NOT EXISTS public."Enrollment"
(
    "Id" serial,
    "StudentId" integer,
    "CourseId" integer,
    "EnrollDate" timestamp,
    "Grade" varchar(2),
    foreign key("StudentId") references "Student"("Id") on delete cascade,
    foreign key("CourseId") references "Course"("Id") on delete cascade,
    PRIMARY KEY ("Id"))

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public."Enrollment"
    OWNER to postgres;


-- Insert Data --

-- Populate Student table
INSERT INTO public."Student"(
	"Identity",
	"FirstName",
	"LastName",
	"Address",
	"City",
	"State",
	"PostalCode",
	"Country",
	"GPA")
	VALUES 
	(419,'Albert','Einstein','112 Mercer St','Princeton','New Jersey','08540','United States',4.00),
	(683,'Ada','Lovelace','12 St James''s Square','London','','SW1Y 4LE','United Kingdom',3.95),
	(708,'Nikola','Tesla','8 West 40th Street','New York','New York','10018','United States',3.98),
	(683,'Alan','Turing','96 Euston Rd','London','','NW1 2DB','United Kingdom',3.97);

-- Populate Course table
INSERT INTO public."Course"(
	"Code",
	"Name",
	"Instructor")
	VALUES 
	(101,'Introduction To Physics','Howard'),
	(2024,'Software Development','Taylor'),
	(528,'General Electricity','Anderson'),
	(2032,'Software Design','Cooper');

-- Populate Enrollment table
INSERT INTO public."Enrollment"(
	"StudentId",
	"CourseId",
	"EnrollDate",
	"Grade")
	VALUES 
	(1,1,'2021-06-19','A'),
	(1,3,'2021-06-19','B+'),
	(1,4,'2021-06-19','B'),
	(3,2,'2023-01-17',''),
	(3,3,'2023-01-17',''),
	(4,1,'2018-09-16','B'),
	(4,4,'2018-09-16','A');
