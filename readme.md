```sql
git add f readme.md
git commit -m "重写readme笔记，现在readme是sql语句的注释"
git remote add origin git@github.com:cheraljun/mysql.git
git remote add origin https://github.com/cheraljun/mysql.git
git push origin master
```
# helloSQL

```helloSQL
-- 关闭安全更新模式，允许执行没有WHERE子句的UPDATE和DELETE语句
SET SQL_SAFE_UPDATES = 0;

-- 显示所有数据库
SHOW DATABASES;

-- 删除名为helloSQL的数据库（如果存在）
DROP DATABASE IF EXISTS `helloSQL`;
-- 创建新的helloSQL数据库
CREATE DATABASE `helloSQL`;

-- 使用helloSQL数据库
USE `helloSQL`;
-- 创建student表，包含学生ID、姓名和专业字段
CREATE TABLE `student`(
`student_id` INT,
`name` VARCHAR(20),
`major` VARCHAR(20),
PRIMARY KEY(`student_id`)  -- 将student_id设为主键
);
-- 查看student表的结构
DESCRIBE `student`;
-- 向student表添加gpa字段，类型为DECIMAL(3,2)
ALTER TABLE `student` ADD `gpa` DECIMAL(3,2);
-- 再次查看表结构，确认gpa字段已添加
DESCRIBE `student`;
-- 删除刚添加的gpa字段
ALTER TABLE `student` DROP COLUMN `gpa`; 
-- 确认gpa字段已删除
DESCRIBE `student`;

-- 插入学生记录，注意顺序要与表结构一致
INSERT INTO `student` VALUES(1,'小白','历史');
INSERT INTO `student` VALUES(2,'小黑','生物');
INSERT INTO `student` VALUES(3,'小绿','英语');
INSERT INTO `student` VALUES(4,'小蓝',NULL);  -- 专业为NULL

-- 插入时指定字段顺序，此时值的顺序要与指定字段一致
INSERT INTO `student`(`name`,`major`,`student_id`) VALUES('小蓝','英语',5);
-- 查看student表的所有记录
SELECT * FROM `student`;

-- 约束示例：创建带有约束的新student表
DROP TABLE IF EXISTS `student`;
CREATE TABLE `student`(
`student_id` INT,
`name` VARCHAR(20) NOT NULL,  -- 姓名不能为空
`major` VARCHAR(20) UNIQUE,    -- 专业必须唯一
PRIMARY KEY(`student_id`)
);
-- 插入符合约束的记录
INSERT INTO `student` VALUES(1,'小白','历史');
INSERT INTO `student` VALUES(2,'小黑','英语');
-- 查看插入结果
SELECT * FROM `student`;

-- 创建带有默认值的student表
DROP TABLE IF EXISTS `student`;
CREATE TABLE `student`(
`student_id` INT,
`name` VARCHAR(20) NOT NULL,
`major` VARCHAR(20) DEFAULT '历史',  -- 专业默认值为'历史'
PRIMARY KEY(`student_id`)
);
-- 插入记录时不指定专业，将使用默认值
INSERT INTO `student`(`name`,`student_id`) VALUES('小白',1);
-- 查看插入结果，确认专业使用了默认值
SELECT * FROM `student`;

-- 创建带有自增主键的student表
DROP TABLE IF EXISTS `student`;
CREATE TABLE `student`(
`student_id` INT AUTO_INCREMENT,  -- 自增主键
`name` VARCHAR(20),
`major` VARCHAR(20),
PRIMARY KEY(`student_id`)
);
-- 插入记录时无需指定student_id，会自动生成
INSERT INTO `student`(`name`,`major`) VALUES('小白','英语');
INSERT INTO `student`(`name`,`major`) VALUES('小黑','英语');
INSERT INTO `student`(`name`,`major`) VALUES('小绿','英语');
-- 查看插入结果，确认ID自动递增
SELECT * FROM `student`;

-- 创建带有多个默认值的student表
DROP TABLE IF EXISTS `student`;
CREATE TABLE `student`(
`student_id` INT AUTO_INCREMENT,
`name` VARCHAR(20),
`major` VARCHAR(20) DEFAULT '英语',  -- 专业默认值
`score` INT DEFAULT 80,              -- 分数默认值
PRIMARY KEY(`student_id`)
);
-- 插入不同情况的记录
INSERT INTO `student`(`name`,`major`) VALUES('小绿', '语文');
INSERT INTO `student`(`name`,`major`) VALUES('小白', '数学');
INSERT INTO `student`(`name`,`major`) VALUES('小黄','卫生与健康');
INSERT INTO `student`(`name`,`score`) VALUES('小黑',30);  -- 使用默认专业
INSERT INTO `student`(`name`) VALUES('小红');  -- 使用默认专业和分数
-- 查看所有记录
SELECT * FROM `student`;

-- 更新所有专业为'英语'的记录，将专业修改为更长的名称
UPDATE `student`
SET `major` = '英语文学英语艺术英语单词'
WHERE `major` = '英语';
-- 查看更新结果
SELECT * FROM `student`;

-- 根据学生ID更新专业
UPDATE `student`
SET `major` = '历史'
WHERE `student_id` = '1';
-- 查看更新结果
SELECT * FROM `student`;

-- 更新多个条件的记录
UPDATE `student`
SET `major` = '计算机信息技术'
WHERE `major` = '数学' OR `major` = '历史';
-- 查看更新结果
SELECT * FROM `student`;

-- 同时更新多个字段
UPDATE `student`
SET `name` = '陈睿康',`major` = '哲学'
WHERE `major` = '英语文学英语艺术英语单词';
-- 查看更新结果
SELECT * FROM `student`;

-- 根据ID删除记录
DELETE FROM `student`
WHERE `student_id` = 5;
-- 查看删除结果
SELECT * FROM `student`;

-- 根据复合条件删除记录
DELETE FROM `student`
WHERE `name` = '小白' AND `major` = '计算机信息技术';
-- 查看删除结果
SELECT * FROM `student`;

-- 删除分数大于等于80的记录
DELETE FROM `student`
WHERE `score` >= 80;
-- 查看删除结果
SELECT * FROM `student`;

-- 注意：这里没有WHERE子句，会更新所有记录！
UPDATE `student`
SET `name` = '陈欢',`major` = '英语',`score` = 100;
-- 查看更新结果
SELECT * FROM `student`;

-- 尝试插入一条ID已存在的记录（会失败，因为ID是主键）
INSERT INTO `student` VALUES(1,'陈睿康','哲学',100);
-- 查看表内容
SELECT * FROM `student`;
-- 以下语句被注释掉：删除所有记录
-- DELETE FROM `student`;
-- 查看表内容
-- SELECT * FROM `student`;
-- 以下语句被注释掉：删除数据库
-- DROP DATABASE `helloSQL`;alter

-- 只查询姓名和专业字段
SELECT `name`,`major` FROM `student`;

-- 更新特定学生的分数
UPDATE `student`
SET `score` = 80
WHERE `name` = '陈睿康';
-- 按分数升序排列结果
SELECT * FROM `student` ORDER BY `score`;
-- 按分数降序排列结果
SELECT * FROM `student` ORDER BY `score` DESC;
-- 只返回一条记录（分数最高的）
SELECT * FROM `student` LIMIT 1;

-- 重新创建student表，恢复初始结构
DROP TABLE IF EXISTS `student`;
CREATE TABLE `student`(
`student_id` INT AUTO_INCREMENT,
`name` VARCHAR(20),
`major` VARCHAR(20) DEFAULT '英语',
`score` INT DEFAULT 80,
PRIMARY KEY(`student_id`)
);
-- 插入测试数据
INSERT INTO `student`(`name`,`major`) VALUES('小绿', '语文');
INSERT INTO `student`(`name`,`major`) VALUES('小白', '数学');
INSERT INTO `student`(`name`,`major`) VALUES('小黄','卫生与健康');
INSERT INTO `student`(`name`,`score`) VALUES('小黑',30);
INSERT INTO `student`(`name`) VALUES('小红');
-- 查看所有记录
SELECT * FROM `student`;
-- 查询专业是'英语'或'卫生与健康'的学生（使用OR）
SELECT * FROM `student` WHERE `major` = '英语' or `major` = '卫生与健康'; 
-- 查询分数不等于80的学生
SELECT * FROM `student` WHERE `score` <> 80;
-- 查询分数大于等于30的前两条记录
SELECT * FROM `student` WHERE `score` >= 30 LIMIT 2;
-- 查询专业在指定列表中的学生（使用IN，等效于OR）
SELECT * FROM `student` WHERE `major` IN('英语', '卫生与健康');
```
# 示例表格 多个
### `employee` 
| employee_id | name  | birth_date | sex | salary | branch_id | sup_id |
|-------------|-------|------------|-----|--------|-----------|--------|
| 206         | 小黄  | 1998-10-08 | F   | 50000  | 1         | NULL   |
| 207         | 小绿  | 1985-09-16 | M   | 29000  | 2         | 206    |
| 208         | 小黑  | 2000-12-19 | M   | 35000  | 3         | 206    |
| 209         | 小白  | 1997-01-22 | F   | 39000  | 3         | 207    |
| 210         | 小蓝  | 1925-11-10 | F   | 84000  | 1         | 207    |

### `branch`
| branch_id | branch_name | manager_id |
|-----------|-------------|------------|
| 1         | 研发        | 206        |
| 2         | 行政        | 207        |
| 3         | 咨询        | 208        |

### `client`
| client_id | client_name | phone      |
|-----------|-------------|------------|
| 400       | 阿狗        | 254354335  |
| 401       | 阿猫        | 25633899   |
| 402       | 旺财        | 45354345   |
| 403       | 露西        | 54354365   |
| 404       | 艾瑞克      | 18783783   |

### `works_with`

| employee_id | client_id | total_sales |
| ----------- | --------- | ----------- |
| 206         | 400       | 70000       |
| 207         | 401       | 24000       |
| 208         | 402       | 9800        |
| 208         | 403       | 24000       |
| 210         | 404       | 87940       |
# hiSQL
```hiSQL
-- 显示所有数据库
SHOW DATABASES;

-- 删除名为hiSQL的数据库（如果存在）
DROP DATABASE IF EXISTS `hiSQL`;

-- 创建新的hiSQL数据库
CREATE DATABASE `hiSQL`;

-- 使用hiSQL数据库
USE `hiSQL`;

-- 创建员工表，包含员工基本信息
CREATE TABLE `employee`(
`employee_id` INT,                -- 员工ID
`name` VARCHAR(20),               -- 员工姓名
`birth_date` DATE,                -- 出生日期
`sex` VARCHAR(20),                -- 性别
`salary` INT,                     -- 工资
`branch_id` INT,                  -- 所属部门ID
`sup_id` INT,                     -- 上级ID
PRIMARY KEY(`employee_id`)        -- 将employee_id设为主键
);

-- 查看employee表的结构
DESCRIBE `employee`;

-- 创建部门表，包含部门信息和部门经理
CREATE TABLE `branch`(
`branch_id` INT,                  -- 部门ID
`branch_name` VARCHAR(20),        -- 部门名称
`manager_id` INT,                 -- 部门经理ID
PRIMARY KEY(`branch_id`),         -- 将branch_id设为主键
-- 外键约束：引用employee表的employee_id，当关联员工被删除时设为NULL
FOREIGN KEY (`manager_id`) REFERENCES `employee`(`employee_id`) ON DELETE SET NULL
);

-- 为employee表添加外键约束，关联到branch表的branch_id
ALTER TABLE `employee`
ADD FOREIGN KEY(`branch_id`)
REFERENCES `branch`(`branch_id`)
ON DELETE SET NULL;               -- 当关联部门被删除时，员工的部门ID设为NULL

-- 为employee表添加自引用外键约束，关联到自身的employee_id（上级关系）
ALTER TABLE `employee`
ADD FOREIGN KEY(sup_id)
REFERENCES `employee`(`employee_id`)
ON DELETE SET NULL;               -- 当关联上级被删除时，员工的上级ID设为NULL

-- 创建客户表，包含客户基本信息
CREATE TABLE `client`(
`client_id` INT,                  -- 客户ID
`client_name` VARCHAR(20),        -- 客户名称
`phone` VARCHAR(20),              -- 客户电话
PRIMARY KEY(`client_id`)          -- 将client_id设为主键
);

-- 创建员工与客户的关联表，记录销售业绩
CREATE TABLE `works_with`(
`employee_id` INT,                -- 员工ID
`client_id` INT,                  -- 客户ID
`total_sales` INT,                -- 总销售额
PRIMARY KEY(`employee_id`,`client_id`), -- 复合主键，确保组合唯一
-- 外键约束：引用employee表的employee_id，当员工被删除时级联删除
FOREIGN KEY (`employee_id`) REFERENCES `employee`(`employee_id`) ON DELETE CASCADE,
-- 外键约束：引用client表的client_id，当客户被删除时级联删除
FOREIGN KEY (`client_id`) REFERENCES `client`(`client_id`) ON DELETE CASCADE
);

-- 插入部门资料，初始时经理ID为NULL
INSERT INTO `branch` VALUES(1,'研发',NULL);
INSERT INTO `branch` VALUES(2,'行政',NULL);
INSERT INTO `branch` VALUES(3,'咨询',NULL);

-- 插入员工资料，包含员工基本信息和所属部门
INSERT INTO `employee` VALUES(206,'小黄','1998-10-08','F',50000,1,NULL);
INSERT INTO `employee` VALUES(207,'小绿','1985-09-16','M',29000,2,206);
INSERT INTO `employee` VALUES(208,'小黑','2000-12-19','M',35000,3,206);
INSERT INTO `employee` VALUES(209,'小白','1997-01-22','F',39000,3,207);
INSERT INTO `employee` VALUES(210,'小蓝','1925-11-10','F',84000,1,207);

-- 更新部门表，设置各部门的经理
UPDATE `branch`
SET `manager_id` = 206
WHERE `branch_id` = 1;

UPDATE `branch`
SET `manager_id` = 207
WHERE `branch_id` = 2;

UPDATE `branch`
SET `manager_id` = 208
WHERE `branch_id` = 3;

-- 插入客户资料
INSERT INTO `client` VALUES(400,'阿狗','254354335');
INSERT INTO `client` VALUES(401,'阿猫','25633899');
INSERT INTO `client` VALUES(402,'旺财','45354345');
INSERT INTO `client` VALUES(403,'露西','54354365');
INSERT INTO `client` VALUES(404,'艾瑞克','18783783');

-- 插入员工与客户的销售业绩记录
INSERT INTO `works_with` VALUES(206,400,'70000');
INSERT INTO `works_with` VALUES(207,401,'24000');
INSERT INTO `works_with` VALUES(208,402,'9800');
INSERT INTO `works_with` VALUES(208,403,'24000');
INSERT INTO `works_with` VALUES(210,404,'87940');
```