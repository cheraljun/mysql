SET SQL_SAFE_UPDATES = 0;

SHOW DATABASES;

DROP DATABASE `helloSQL`;
CREATE DATABASE `helloSQL`;

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

INSERT INTO `student` VALUES(1,'小白','历史');
INSERT INTO `student` VALUES(2,'小黑','生物');
INSERT INTO `student` VALUES(3,'小绿','英语');
INSERT INTO `student` VALUES(4,'小蓝',NULL);

INSERT INTO `student`(`name`,`major`,`student_id`) VALUES('小蓝','英语',5);
SELECT * FROM `student`;

-- constraints
DROP TABLE `student`;
CREATE TABLE `student`(
`student_id` INT,
`name` VARCHAR(20) NOT NULL, -- 不能为空
`major` VARCHAR(20) UNIQUE, -- 唯一
PRIMARY KEY(`student_id`)
);
INSERT INTO `student` VALUES(1,'小白','历史');
INSERT INTO `student` VALUES(2,'小黑','英语');
SELECT * FROM `student`;

DROP TABLE `student`;
CREATE TABLE `student`(
`student_id` INT,
`name` VARCHAR(20) NOT NULL,
`major` VARCHAR(20) DEFAULT '历史', -- 预设值
PRIMARY KEY(`student_id`)
);
INSERT INTO `student`(`name`,`student_id`) VALUES('小白',1);
SELECT * FROM `student`;

DROP TABLE `student`;
CREATE TABLE `student`(
`student_id` INT AUTO_INCREMENT,
`name` VARCHAR(20),
`major` VARCHAR(20),
PRIMARY KEY(`student_id`)
);
INSERT INTO `student`(`name`,`major`) VALUES('小白','英语');
INSERT INTO `student`(`name`,`major`) VALUES('小黑','英语');
INSERT INTO `student`(`name`,`major`) VALUES('小绿','英语');
SELECT * FROM `student`;

DROP TABLE `student`;
CREATE TABLE `student`(
`student_id` INT AUTO_INCREMENT,
`name` VARCHAR(20),
`major` VARCHAR(20) DEFAULT '英语',
`score` INT DEFAULT 80,
PRIMARY KEY(`student_id`)
);
INSERT INTO `student`(`name`,`major`) VALUES('小绿', '语文');
INSERT INTO `student`(`name`,`major`) VALUES('小白', '数学');
INSERT INTO `student`(`name`) VALUES('小黄');
INSERT INTO `student`(`name`,`score`) VALUES('小黑',30);
INSERT INTO `student`(`name`) VALUES('小红');
SELECT * FROM `student`;

UPDATE `student`
SET `major` = '英语文学'
WHERE `major` = '英语';
SELECT * FROM `student`;

UPDATE `student`
SET `major` = '历史'
WHERE `student_id` = '3';
SELECT * FROM `student`;

UPDATE `student`
SET `major` = '语文'
WHERE `major` = '历史' OR `major` = '英语文学';
SELECT * FROM `student`;

UPDATE `student`
SET `name` = '陈睿康',`major` = '哲学'
WHERE `major` = '语文';
SELECT * FROM `student`;

UPDATE `student`
SET `name` = '陈欢',`major` = '英语';
SELECT * FROM `student`;

DELETE FROM `student`
WHERE `student_id` = 4;
SELECT * FROM `student`;

DELETE FROM `student`
WHERE `name` = '陈睿康' AND `major` = '哲学';
SELECT * FROM `student`;

DELETE FROM `student`
WHERE `score` >= 80;
SELECT * FROM `student`;

DELETE FROM `student`;

INSERT INTO `student` VALUES(1,'陈睿康','哲学',100);
SELECT * FROM `student`;
