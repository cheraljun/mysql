CREATE DATABASE `helloSQL`;
SHOW DATABASES;
USE `helloSQL`;
CREATE TABLE `student`(
`student_id` INT,
`name` VARCHAR(20),
`major` VARCHAR(20),
PRIMARY KEY(`student_id`)
);
DESCRIBE `student`;
ALTER TABLE `student` ADD `gpa` DECIMAL(3,2);
DESCRIBE `student`;
ALTER TABLE `student` DROP COLUMN `gpa`; 
DESCRIBE `student`;