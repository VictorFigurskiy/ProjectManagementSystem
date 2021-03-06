-- MySQL Script generated by MySQL Workbench
-- Tue May 30 22:18:07 2017
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema Developers_info_db
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `Developers_info_db` ;

-- -----------------------------------------------------
-- Schema Developers_info_db
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Developers_info_db` DEFAULT CHARACTER SET utf8 ;
USE `Developers_info_db` ;

-- -----------------------------------------------------
-- Table `Developers_info_db`.`Customers`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Developers_info_db`.`Customers` ;

CREATE TABLE IF NOT EXISTS `Developers_info_db`.`Customers` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `customer_name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Developers_info_db`.`Companies`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Developers_info_db`.`Companies` ;

CREATE TABLE IF NOT EXISTS `Developers_info_db`.`Companies` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `company_name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Developers_info_db`.`Projects`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Developers_info_db`.`Projects` ;

CREATE TABLE IF NOT EXISTS `Developers_info_db`.`Projects` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `project_name` VARCHAR(45) NOT NULL,
  `Customers_id` INT NOT NULL,
  `Companies_id` INT NOT NULL,
  INDEX `fk_Projects_Customers1_idx` (`Customers_id` ASC),
  INDEX `fk_Projects_Companies1_idx` (`Companies_id` ASC),
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_Projects_Customers1`
    FOREIGN KEY (`Customers_id`)
    REFERENCES `Developers_info_db`.`Customers` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Projects_Companies1`
    FOREIGN KEY (`Companies_id`)
    REFERENCES `Developers_info_db`.`Companies` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Developers_info_db`.`Developers`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Developers_info_db`.`Developers` ;

CREATE TABLE IF NOT EXISTS `Developers_info_db`.`Developers` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `surname` VARCHAR(45) NOT NULL,
  `Projects_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_Developers_Projects1_idx` (`Projects_id` ASC),
  CONSTRAINT `fk_Developers_Projects1`
    FOREIGN KEY (`Projects_id`)
    REFERENCES `Developers_info_db`.`Projects` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Developers_info_db`.`Skills`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Developers_info_db`.`Skills` ;

CREATE TABLE IF NOT EXISTS `Developers_info_db`.`Skills` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `skills` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Developers_info_db`.`Developers_has_Skills`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Developers_info_db`.`Developers_has_Skills` ;

CREATE TABLE IF NOT EXISTS `Developers_info_db`.`Developers_has_Skills` (
  `Developers_id` INT NOT NULL,
  `Skills_id` INT NOT NULL,
  PRIMARY KEY (`Developers_id`, `Skills_id`),
  INDEX `fk_Developers_has_Skills_Skills1_idx` (`Skills_id` ASC),
  INDEX `fk_Developers_has_Skills_Developers1_idx` (`Developers_id` ASC),
  CONSTRAINT `fk_Developers_has_Skills_Developers1`
    FOREIGN KEY (`Developers_id`)
    REFERENCES `Developers_info_db`.`Developers` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Developers_has_Skills_Skills1`
    FOREIGN KEY (`Skills_id`)
    REFERENCES `Developers_info_db`.`Skills` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
