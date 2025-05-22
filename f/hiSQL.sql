SHOW DATABASES;
DROP DATABASE `hiSQL`;
CREATE DATABASE `hiSQL`;
USE `hiSQL`;

CREATE TABLE `employee`(
`employee_id` INT,
`name` VARCHAR(20),
`birth_date` DATE,
`sex` VARCHAR(20),
`salary` INT,
`branch_id` INT,
`sup_id` int,
PRIMARY KEY(`employee_id`)
);
DESCRIBE `employee`;

CREATE TABLE `branch`(
`branch_id` INT,
`branch_name` VARCHAR(20),
`manager_id` INT,
PRIMARY KEY(`branch_id`),
FOREIGN KEY (`manager_id`) REFERENCES `employee`(`employee_id`) ON DELETE SET NULL
);

ALTER TABLE `employee`
ADD FOREIGN KEY(`branch_id`)
REFERENCES `branch`(`branch_id`)
ON DELETE SET NULL;

ALTER TABLE `employee`
ADD FOREIGN KEY(sup_id)
REFERENCES `employee`(`employee_id`)
ON DELETE SET NULL;

CREATE TABLE `client`(
`client_id` INT,
`client_name` VARCHAR(20),
`phone` VARCHAR(20),
PRIMARY KEY(`client_id`)
);

CREATE TABLE `works_with`(
`employee_id` INT,
`client_id` INT,
`total_sales` INT,
PRIMARY KEY(`employee_id`,`client_id`),
FOREIGN KEY (`employee_id`) REFERENCES `employee`(`employee_id`) ON DELETE CASCADE,
FOREIGN KEY (`client_id`) REFERENCES `client`(`client_id`) ON DELETE CASCADE
);
-- 部门资料
INSERT INTO `branch` VALUES(1,'研发',NULL);
INSERT INTO `branch` VALUES(2,'行政',NULL);
INSERT INTO `branch` VALUES(3,'咨询',NULL);

-- 员工资料
INSERT INTO `employee` VALUES(206,'小黄','1998-10-08','F',50000,1,NULL);
INSERT INTO `employee` VALUES(207,'小绿','1985-09-16','M',29000,2,206);
INSERT INTO `employee` VALUES(208,'小黑','2000-12-19','M',35000,3,206);
INSERT INTO `employee` VALUES(209,'小白','1997-01-22','F',39000,3,207);
INSERT INTO `employee` VALUES(210,'小蓝','1925-11-10','F',84000,1,207);

UPDATE `branch`
SET `manager_id` = 206
WHERE `branch_id` = 1;

UPDATE `branch`
SET `manager_id` = 207
WHERE `branch_id` = 2;

UPDATE `branch`
SET `manager_id` = 208
WHERE `branch_id` = 3;

INSERT INTO `client` VALUES(400,'阿狗','254354335');
INSERT INTO `client` VALUES(401,'阿猫','25633899');
INSERT INTO `client` VALUES(402,'旺财','45354345');
INSERT INTO `client` VALUES(403,'露西','54354365');
INSERT INTO `client` VALUES(404,'艾瑞克','18783783');

INSERT INTO `works_with` VALUES(206,400,'70000');
INSERT INTO `works_with` VALUES(207,401,'24000');
INSERT INTO `works_with` VALUES(208,402,'9800');
INSERT INTO `works_with` VALUES(208,403,'24000');
INSERT INTO `works_with` VALUES(210,404,'87940');

-- 取得所有员工资料
SELECT * FROM `employee`;
-- 取得所有客户资料
SELECT * FROM `client`;
-- 按照薪水低到高取得员工资料
SELECT * FROM `employee`
ORDER BY `salary`;
-- 取得薪水前3高的员工资料
SELECT * FROM `employee`
ORDER BY `salary` DESC
LIMIT 3;
-- 取得所有员工的名字
SELECT `name` FROM `employee`;
-- 取得员工的非重复性别
SELECT `sex` FROM `employee`; -- 有重复的
SELECT DISTINCT `sex` FROM `employee`; -- 去重

-- 聚合函数 aggregate function
-- 取得员工人数
SELECT COUNT(*) FROM `employee`;
-- 取得出生于1970-01-01之后的女性员工人数alter
SELECT COUNt(*) FROM `employee`
WHERE `birth_date` > '1970-01-01' AND `sex` = 'F';
-- 取得平均薪水
SELECT AVG(`salary`) FROM `employee`;
-- 取得薪水总和
SELECT SUM(`salary`) FROM `employee`;
-- 取得薪水最高的员工
SELECT MAX(`salary`) FROM `employee`;
-- 取得薪水最低的员工
SELECT MIN(`salary`) FROM `employee`;