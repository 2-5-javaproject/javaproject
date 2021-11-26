CREATE SCHEMA `jdbc` ;
CREATE TABLE `jdbc`.`user` (
                               `id` INT NOT NULL,
                               `email` VARCHAR(45) NULL,
                               `password` VARCHAR(45) NULL,
                               `nickname` VARCHAR(45) NULL,
                               PRIMARY KEY (`id`));
CREATE TABLE `jdbc`.`chat` (
                               `id` INT NOT NULL,
                               `createdDate` DATE NULL,
                               `nickname` VARCHAR(45) NULL,
                               `chat` VARCHAR(45) NULL,
                               PRIMARY KEY (`id`));
ALTER TABLE `jdbc`.`user`
DROP COLUMN `id`,
CHANGE COLUMN `email` `email` VARCHAR(45) NOT NULL ,
DROP PRIMARY KEY,
ADD PRIMARY KEY (`email`);
;