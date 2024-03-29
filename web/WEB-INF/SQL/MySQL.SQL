CREATE SCHEMA `jdbc` ;
CREATE TABLE `jdbc`.`user` (
                               `id` INT NOT NULL,
                               `email` VARCHAR(45) NULL,
                               `password` VARCHAR(45) NULL,
                               `nickname` VARCHAR(45) NULL,
                               PRIMARY KEY (`id`));
-- CREATE TABLE `jdbc`.`friend` (
--                                `nickname` NULL,
--                                `friendname` NULL);
CREATE TABLE `jdbc`.`friend` (
                                 `friendname` VARCHAR(45) NOT NULL,
                                 `nickname` VARCHAR(45) NULL,
                                 PRIMARY KEY (`friendname`));


/* 위에 sql문 실행후 아래 sql문을 실행해 주세요*/
ALTER TABLE `jdbc`.`user`
DROP COLUMN `id`,
CHANGE COLUMN `email` `email` VARCHAR(45) NOT NULL ,
DROP PRIMARY KEY,
ADD PRIMARY KEY (`email`);
