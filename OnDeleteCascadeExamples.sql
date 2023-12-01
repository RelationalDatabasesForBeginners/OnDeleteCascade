-- YouTube Channel "Relational Databases and SQL for Beginners": https://www.youtube.com/@DatabasesAndSQLForBeginners
-- Script for YouTube Video How to Use "On Delete Cascade": https://youtu.be/mS04PRqns2E
-- Developed for use with PostgreSQL

-- Delete Student table row
delete from "Student"
where "Identity" = 708;

-- Delete Course table row
delete from "Course"
where "Code" = 2032;

-- Delete Enrollment table row
delete from "Enrollment"
where "Id" = 6;