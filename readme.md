根据你的SQL语句整理的笔记如下，保持了原有格式和风格：


```sql
git add f readme.md
git commit -m "新增MySQL语法笔记：数据库操作、数据类型、表约束及增删改查示例"
git remote add origin git@github.com:cheraljun/mysql.git
git remote add origin https://github.com/cheraljun/mysql.git
git push origin master
```
# MySQL

```sql语法
数据库操作
创建数据库（名称用反引号包裹避免冲突）
CREATE DATABASE `name`;
删除数据库
DROP DATABASE `name`;
列出所有数据库
SHOW DATABASES;
选择使用数据库
USE `name`;

数据类型
整数类型
`INT`;
小数类型，m表示总位数，n表示小数位数（例：DECIMAL(3,2)存储9.99）
`DECIMAL(m,n)`;
可变长度字符串，n为最大字节数
`VARCHAR(n)`;
二进制数据类型（用于存储图片、视频等）
`BLOB`;
日期类型，格式为YYYY-MM-DD（例：2021-11-17）
`DATE`;
时间戳类型，格式为YYYY-MM-DD HH:MM:SS
`TIMESTAMP`;

单个表格操作
创建表（以学生表为例）
CREATE TABLE `student`(
`student_id` INT,          --学生编号（整数）
`name` VARCHAR(20),        --姓名（字符串，最大20字节）
`major` VARCHAR(20),       --专业（字符串，最大20字节）
PRIMARY KEY(`student_id`)  --主键约束
);
查看表字段结构
DESCRIBE `name`;
删除表（需指定TABLE关键字）
DROP TABLE `name`;
新增表属性（列）假设新增一个小数类型
ALTER TABLE `name` ADD `somefeature` DECIMAL(m,n);
删除表属性（列）
ALTER TABLE `name` DROP COLUMN `somefeature`;

约束条件
设置非空约束
`name` VARCHAR(20) NOT NULL; -- 不能为空
设置唯一约束
`major` VARCHAR(20) UNIQUE; -- 唯一
设置默认值
`major` VARCHAR(20) DEFAULT '历史'; -- 预设值
设置自增主键
`student_id` INT AUTO_INCREMENT; -- 自增主键

数据插入
插入全部字段值（按表结构顺序）
INSERT INTO `student` VALUES(1,'小白','历史');
插入部分字段值（需指定列名）
INSERT INTO `student`(`name`,`major`) VALUES('小白','英语');
插入时覆盖默认值
INSERT INTO `student`(`name`,`major`,`score`) VALUES('小明','数学',95);

数据更新
更新指定条件的记录
UPDATE `student` SET `major` = '英语文学' WHERE `major` = '英语';
更新多条记录
UPDATE `student` SET `major` = '历史' WHERE `student_id` = '3';
更新多列
UPDATE `student` SET `name` = '陈睿康',`major` = '哲学' WHERE `major` = '语文';
无条件更新（谨慎使用）
UPDATE `student` SET `name` = '陈欢',`major` = '英语';

数据删除
删除指定条件的记录
DELETE FROM `student` WHERE `student_id` = 4;
删除多条件匹配的记录
DELETE FROM `student` WHERE `name` = '陈欢' AND `major` = '英语';
删除满足范围条件的记录
DELETE FROM `student` WHERE `score` >= 80;
清空表（谨慎使用）
DELETE FROM `student`;
```