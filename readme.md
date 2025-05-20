```
git add readme.md
git commit -m "mysql"
git remote add origin git@github.com:cheraljun/mysql.git
git remote add origin https://github.com/cheraljun/mysql.git
git push origin master
```
# MySQL基础语法

```sql语法
--数据库操作
--创建数据库（名称用反引号包裹避免冲突）
CREATE DATABASE `name`;
--删除数据库
DROP DATABASE `name`;
--列出所有数据库
SHOW DATABASES;
--选择使用数据库
USE `name`;

--数据类型
-- 整数类型
`INT`;
-- 小数类型，m表示总位数，n表示小数位数（例：DECIMAL(3,2)存储9.99）
`DECIMAL(m,n)`;
-- 可变长度字符串，n为最大字节数
`VARCHAR(n)`;
-- 二进制数据类型（用于存储图片、视频等）
`BLOB`;
-- 日期类型，格式为YYYY-MM-DD（例：2021-11-17）
`DATE`;
-- 时间戳类型，格式为YYYY-MM-DD HH:MM:SS
`TIMESTAMP`;

--表格操作
--创建表
CREATE TABLE `student`(
`student_id` INT,          --学生编号（整数）
`name` VARCHAR(20),        --姓名（字符串，最大20字节）
`major` VARCHAR(20),       --专业（字符串，最大20字节）
PRIMARY KEY(`student_id`)  --主键约束
);
--查看表字段结构
DESCRIBE `student`;
--删除表（需指定TABLE关键字）
DROP TABLE `name`;
--新增表属性（列）
ALTER TABLE `name` ADD `somefeature` DECIMAL(3,2);
--删除表属性（列）
ALTER TABLE `name` DROP COLUMN `somefeature`;
```