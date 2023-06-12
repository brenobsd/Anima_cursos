-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema lavie
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema lavie
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `lavie` DEFAULT CHARACTER SET utf8mb3 ;
USE `lavie` ;

-- -----------------------------------------------------
-- Table `lavie`.`psicologo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lavie`.`psicologo` (
  `id_psicologo` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `senha` VARCHAR(45) NOT NULL,
  `descricao` VARCHAR(45) NULL DEFAULT NULL,
  `createdAt` DATE NULL DEFAULT NULL,
  `updatedAt` DATE NULL DEFAULT NULL,
  PRIMARY KEY (`id_psicologo`),
  UNIQUE INDEX `email_UNIQUE` (`email` ASC) VISIBLE)
ENGINE = InnoDB
AUTO_INCREMENT = 12
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `lavie`.`paciente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lavie`.`paciente` (
  `id_paciente` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `idade` INT NOT NULL,
  `psicologo_id` INT NOT NULL,
  `createdAt` DATE NULL DEFAULT NULL,
  `updatedAt` DATE NULL DEFAULT NULL,
  PRIMARY KEY (`id_paciente`),
  UNIQUE INDEX `email_UNIQUE` (`email` ASC) VISIBLE,
  INDEX `fk_paciente_psicologo_idx` (`psicologo_id` ASC) VISIBLE,
  CONSTRAINT `fk_paciente_psicologo`
    FOREIGN KEY (`psicologo_id`)
    REFERENCES `lavie`.`psicologo` (`id_psicologo`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `lavie`.`atendimento`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lavie`.`atendimento` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `data` DATE NOT NULL,
  `horario` DATETIME NOT NULL,
  `psicologo_id` INT NOT NULL,
  `paciente_id_paciente` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_atendimento_psicologo1_idx` (`psicologo_id` ASC) VISIBLE,
  INDEX `fk_atendimento_paciente1_idx` (`paciente_id_paciente` ASC) VISIBLE,
  CONSTRAINT `fk_atendimento_paciente1`
    FOREIGN KEY (`paciente_id_paciente`)
    REFERENCES `lavie`.`paciente` (`id_paciente`),
  CONSTRAINT `fk_atendimento_psicologo1`
    FOREIGN KEY (`psicologo_id`)
    REFERENCES `lavie`.`psicologo` (`id_psicologo`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
