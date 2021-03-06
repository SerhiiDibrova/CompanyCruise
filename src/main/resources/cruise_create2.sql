-- MySQL Script generated by MySQL Workbench
-- Tue Sep  4 17:30:10 2018
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema cruise
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema cruise
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `cruise` DEFAULT CHARACTER SET utf8 ;
USE `cruise` ;

-- -----------------------------------------------------
-- Table `cruise`.`ship`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cruise`.`ship` (
  `ship_id` INT NOT NULL AUTO_INCREMENT,
  `ship_name` VARCHAR(45) NULL,
  `ship_capacity` INT NULL,
  PRIMARY KEY (`ship_id`),
  UNIQUE INDEX `ship_name_UNIQUE` (`ship_name` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cruise`.`country`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cruise`.`country` (
  `country_id` INT NOT NULL AUTO_INCREMENT,
  `country_name` VARCHAR(45) NOT NULL,
  `country_city` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`country_id`),
  UNIQUE INDEX `country_city_UNIQUE` (`country_city` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cruise`.`cruise`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cruise`.`cruise` (
  `cruise_id` INT NOT NULL AUTO_INCREMENT,
  `cruise_name` VARCHAR(45) NOT NULL,
  `ship_id` INT NOT NULL,
  `cruise_city_from` INT NOT NULL,
  `cruise_city_to` INT NOT NULL,
  `cruise_departure` TIMESTAMP NOT NULL,
  `cruise_arrival` TIMESTAMP NOT NULL,
  `cruise_category` ENUM('ECONOM', 'BUSSINES', 'VIP') NOT NULL,
  `cruise_count_port` INT NOT NULL,
  `cruise_price` BIGINT NOT NULL,
  PRIMARY KEY (`cruise_id`),
  INDEX `country_from_idx` (`cruise_city_from` ASC),
  INDEX `country_to_idx` (`cruise_city_to` ASC),
  INDEX `ship_id_idx` (`ship_id` ASC),
  UNIQUE INDEX `cruise_name_UNIQUE` (`cruise_name` ASC),
  CONSTRAINT `country_from`
    FOREIGN KEY (`cruise_city_from`)
    REFERENCES `cruise`.`country` (`country_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `country_to`
    FOREIGN KEY (`cruise_city_to`)
    REFERENCES `cruise`.`country` (`country_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `ship_id`
    FOREIGN KEY (`ship_id`)
    REFERENCES `cruise`.`ship` (`ship_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cruise`.`user`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cruise`.`user` (
  `user_id` INT NOT NULL AUTO_INCREMENT,
  `user_login` VARCHAR(45) NOT NULL,
  `user_password` VARCHAR(100) NOT NULL,
  `user_first_name` VARCHAR(45) NOT NULL,
  `user_last_name` VARCHAR(45) NOT NULL,
  `user_email` VARCHAR(45) NOT NULL,
  `user_role` ENUM('GUEST', 'USER', 'ADMIN') NOT NULL,
  `user_created` TIMESTAMP NOT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE INDEX `user_login_UNIQUE` (`user_login` ASC),
  UNIQUE INDEX `user_email_UNIQUE` (`user_email` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cruise`.`excursion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cruise`.`excursion` (
  `excursion_id` INT NOT NULL AUTO_INCREMENT,
  `country_id` INT NOT NULL,
  `excursion_name` VARCHAR(255) NOT NULL,
  `excursion_description` VARCHAR(255) NOT NULL,
  `excursion_price` BIGINT NULL,
  PRIMARY KEY (`excursion_id`),
  INDEX `country_id_idx` (`country_id` ASC),
  UNIQUE INDEX `excursion_name_UNIQUE` (`excursion_name` ASC),
  CONSTRAINT `country_id`
    FOREIGN KEY (`country_id`)
    REFERENCES `cruise`.`cruise` (`cruise_city_to`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cruise`.`cart`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cruise`.`cart` (
  `cart_id` INT NOT NULL AUTO_INCREMENT,
  `user_id` INT NOT NULL,
  `cruise_id` INT NOT NULL,
  PRIMARY KEY (`cart_id`),
  INDEX `user_id_idx` (`user_id` ASC),
  INDEX `cruise_id_idx` (`cruise_id` ASC),
  CONSTRAINT `user_id`
    FOREIGN KEY (`user_id`)
    REFERENCES `cruise`.`user` (`user_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `cruise_id`
    FOREIGN KEY (`cruise_id`)
    REFERENCES `cruise`.`cruise` (`cruise_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cruise`.`shipimage`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cruise`.`shipimage` (
  `shipimage_id` INT NOT NULL AUTO_INCREMENT,
  `shipimage_uri` VARCHAR(255) NULL,
  `ship_id` INT NULL,
  PRIMARY KEY (`shipimage_id`),
  INDEX `ship_idx` (`ship_id` ASC),
  CONSTRAINT `ship`
    FOREIGN KEY (`ship_id`)
    REFERENCES `cruise`.`ship` (`ship_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cruise`.`excursionimage`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cruise`.`excursionimage` (
  `excursionimage_id` INT NOT NULL AUTO_INCREMENT,
  `excursionimage_uri` VARCHAR(45) NULL,
  `excursion_id` INT NOT NULL,
  PRIMARY KEY (`excursionimage_id`),
  INDEX `excursion_id_idx` (`excursion_id` ASC),
  CONSTRAINT `excursion_id`
    FOREIGN KEY (`excursion_id`)
    REFERENCES `cruise`.`excursion` (`excursion_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cruise`.`order`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cruise`.`order` (
  `order_id` INT NOT NULL AUTO_INCREMENT,
  `user_id` INT NOT NULL,
  `cruise_id` INT NOT NULL,
  `excursion_id` INT NULL,
  `price_total` BIGINT NOT NULL,
  PRIMARY KEY (`order_id`),
  INDEX `user_idx` (`user_id` ASC),
  INDEX `cruise_idx` (`cruise_id` ASC),
  INDEX `excursion_idx` (`excursion_id` ASC),
  CONSTRAINT `user`
    FOREIGN KEY (`user_id`)
    REFERENCES `cruise`.`user` (`user_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `cruise`
    FOREIGN KEY (`cruise_id`)
    REFERENCES `cruise`.`cruise` (`cruise_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `excursion`
    FOREIGN KEY (`excursion_id`)
    REFERENCES `cruise`.`excursion` (`excursion_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
