-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema c_15
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema c_15
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `c_15` DEFAULT CHARACTER SET utf8 ;
USE `c_15` ;

-- -----------------------------------------------------
-- Table `c_15`.`categories`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `c_15`.`categories` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `c_15`.`articles`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `c_15`.`articles` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NOT NULL,
  `price` INT NOT NULL,
  `description` TEXT NOT NULL,
  `stock` INT NOT NULL,
  `professional` TINYINT NOT NULL,
  `category_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_articles_categories_idx` (`category_id` ASC),
  CONSTRAINT `fk_articles_categories`
    FOREIGN KEY (`category_id`)
    REFERENCES `c_15`.`categories` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `c_15`.`rols`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `c_15`.`rols` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `c_15`.`employees`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `c_15`.`employees` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `first_name` VARCHAR(45) NOT NULL,
  `last_name` VARCHAR(45) NOT NULL,
  `dni` INT NOT NULL,
  `salary` INT NULL,
  `rol_id` INT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_employees_rols_idx` (`rol_id` ASC),
  UNIQUE INDEX `dni_UNIQUE` (`dni` ASC),
  CONSTRAINT `fk_employees_rols`
    FOREIGN KEY (`rol_id`)
    REFERENCES `c_15`.`rols` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `c_15`.`payments`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `c_15`.`payments` (
  `id` INT NOT NULL,
  `method` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `c_15`.`sales`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `c_15`.`sales` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `date` DATETIME NOT NULL,
  `article_id` VARCHAR(45) NOT NULL,
  `payment_id` INT NOT NULL,
  `employees_id` INT NOT NULL,
  `total` VARCHAR(45) NOT NULL,
  `commission` INT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_sales_employees_idx` (`employees_id` ASC),
  INDEX `fk_sales_payments_idx` (`payment_id` ASC),
  CONSTRAINT `fk_sales_employees`
    FOREIGN KEY (`employees_id`)
    REFERENCES `c_15`.`employees` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_sales_payments`
    FOREIGN KEY (`payment_id`)
    REFERENCES `c_15`.`payments` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `c_15`.`carts`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `c_15`.`carts` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `article_id` INT NOT NULL,
  `sale_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_articles_sales_idx` (`sale_id` ASC),
  CONSTRAINT `fk_sales_articles`
    FOREIGN KEY ()
    REFERENCES `c_15`.`articles` ()
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_articles_sales`
    FOREIGN KEY (`sale_id`)
    REFERENCES `c_15`.`sales` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
