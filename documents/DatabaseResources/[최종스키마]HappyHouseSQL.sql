-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema happyhouse
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema happyhouse
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `happyhouse` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `happyhouse` ;

-- -----------------------------------------------------
-- Table `happyhouse`.`baseaddress`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `happyhouse`.`baseaddress` (
  `no` INT NOT NULL AUTO_INCREMENT,
  `city` VARCHAR(30) NOT NULL,
  `code` VARCHAR(30) NULL DEFAULT NULL,
  `dongcode` VARCHAR(30) NULL DEFAULT NULL,
  `gugun` VARCHAR(30) NULL DEFAULT NULL,
  `dong` VARCHAR(30) NOT NULL,
  `lat` VARCHAR(20) NULL DEFAULT NULL,
  `lng` VARCHAR(20) NULL DEFAULT NULL,
  PRIMARY KEY (`no`))
ENGINE = InnoDB
AUTO_INCREMENT = 3626
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `happyhouse`.`qnaboard`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `happyhouse`.`qnaboard` (
  `qid` INT NOT NULL AUTO_INCREMENT,
  `qdate` TIMESTAMP NULL DEFAULT NULL,
  `qans` VARCHAR(45) NULL DEFAULT NULL,
  `qque` VARCHAR(45) NULL DEFAULT NULL,
  `quserid` VARCHAR(10) NULL DEFAULT NULL,
  `qarea` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`qid`))
ENGINE = InnoDB
AUTO_INCREMENT = 48
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `happyhouse`.`comment`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `happyhouse`.`comment` (
  `cid` INT NOT NULL AUTO_INCREMENT,
  `qid` INT NULL DEFAULT NULL,
  `comment` VARCHAR(100) NULL DEFAULT NULL,
  `userid` VARCHAR(100) NULL DEFAULT NULL,
  PRIMARY KEY (`cid`),
  INDEX `qid_idx` (`qid` ASC) VISIBLE,
  CONSTRAINT `qid`
    FOREIGN KEY (`qid`)
    REFERENCES `happyhouse`.`qnaboard` (`qid`)
    ON DELETE CASCADE)
ENGINE = InnoDB
AUTO_INCREMENT = 44
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `happyhouse`.`dongcode`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `happyhouse`.`dongcode` (
  `dongcode` VARCHAR(10) NOT NULL,
  `city` TEXT NULL DEFAULT NULL,
  `gugun` TEXT NULL DEFAULT NULL,
  `dong` TEXT NULL DEFAULT NULL,
  PRIMARY KEY (`dongcode`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `happyhouse`.`guguncode`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `happyhouse`.`guguncode` (
  `gugun_code` VARCHAR(10) NOT NULL,
  `gugun_name` VARCHAR(30) NULL DEFAULT NULL,
  PRIMARY KEY (`gugun_code`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `happyhouse`.`sidocode`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `happyhouse`.`sidocode` (
  `sido_code` VARCHAR(10) NOT NULL,
  `sido_name` VARCHAR(30) NULL DEFAULT NULL,
  PRIMARY KEY (`sido_code`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `happyhouse`.`useraccount`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `happyhouse`.`useraccount` (
  `id` VARCHAR(10) NOT NULL,
  `password` VARCHAR(30) NOT NULL,
  `name` VARCHAR(10) NOT NULL,
  `address` VARCHAR(30) NOT NULL,
  `phone` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `happyhouse`.`farea`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `happyhouse`.`farea` (
  `fid` INT NOT NULL,
  `userid` VARCHAR(10) NOT NULL,
  `sido_code` VARCHAR(10) NULL DEFAULT NULL,
  `gugun_code` VARCHAR(10) NULL DEFAULT NULL,
  `dongcode` VARCHAR(10) NULL DEFAULT NULL,
  PRIMARY KEY (`fid`),
  INDEX `userid_idx` (`userid` ASC) VISIBLE,
  INDEX `sido_code_idx` (`sido_code` ASC) VISIBLE,
  INDEX `gugun_code_idx` (`gugun_code` ASC) VISIBLE,
  INDEX `dongcode_idx` (`dongcode` ASC) VISIBLE,
  CONSTRAINT `dongcode`
    FOREIGN KEY (`dongcode`)
    REFERENCES `happyhouse`.`dongcode` (`dongcode`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `gugun_code`
    FOREIGN KEY (`gugun_code`)
    REFERENCES `happyhouse`.`guguncode` (`gugun_code`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `sido_code`
    FOREIGN KEY (`sido_code`)
    REFERENCES `happyhouse`.`sidocode` (`sido_code`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `userid`
    FOREIGN KEY (`userid`)
    REFERENCES `happyhouse`.`useraccount` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `happyhouse`.`housedeal`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `happyhouse`.`housedeal` (
  `no` INT NOT NULL AUTO_INCREMENT,
  `dong` VARCHAR(30) NOT NULL,
  `AptName` VARCHAR(50) NOT NULL,
  `code` VARCHAR(30) NOT NULL,
  `dealAmount` VARCHAR(50) NOT NULL,
  `buildYear` VARCHAR(30) NULL DEFAULT NULL,
  `dealYear` VARCHAR(30) NULL DEFAULT NULL,
  `dealMonth` VARCHAR(30) NULL DEFAULT NULL,
  `dealDay` VARCHAR(30) NULL DEFAULT NULL,
  `area` VARCHAR(30) NULL DEFAULT NULL,
  `floor` VARCHAR(30) NULL DEFAULT NULL,
  `jibun` VARCHAR(30) NULL DEFAULT NULL,
  `type` VARCHAR(30) NULL DEFAULT NULL,
  `rentMoney` VARCHAR(30) NULL DEFAULT NULL,
  PRIMARY KEY (`no`))
ENGINE = InnoDB
AUTO_INCREMENT = 68865
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `happyhouse`.`houseinfo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `happyhouse`.`houseinfo` (
  `no` INT NOT NULL AUTO_INCREMENT,
  `dong` VARCHAR(30) NOT NULL,
  `AptName` VARCHAR(50) NOT NULL,
  `code` VARCHAR(30) NOT NULL,
  `buildYear` VARCHAR(30) NULL DEFAULT NULL,
  `jibun` VARCHAR(30) NULL DEFAULT NULL,
  `lat` VARCHAR(30) NULL DEFAULT NULL,
  `lng` VARCHAR(30) NULL DEFAULT NULL,
  `img` VARCHAR(50) NULL DEFAULT NULL,
  PRIMARY KEY (`no`))
ENGINE = InnoDB
AUTO_INCREMENT = 5990
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `happyhouse`.`subcomment`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `happyhouse`.`subcomment` (
  `sid` INT NOT NULL AUTO_INCREMENT,
  `qid` INT NULL DEFAULT NULL,
  `cid` INT NULL DEFAULT NULL,
  `comment` VARCHAR(100) NULL DEFAULT NULL,
  `userid` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`sid`),
  INDEX `qid_idx` (`qid` ASC) VISIBLE,
  INDEX `cid_idx` (`cid` ASC) VISIBLE,
  CONSTRAINT `cid`
    FOREIGN KEY (`cid`)
    REFERENCES `happyhouse`.`comment` (`cid`)
    ON DELETE CASCADE,
  CONSTRAINT `qid2`
    FOREIGN KEY (`qid`)
    REFERENCES `happyhouse`.`qnaboard` (`qid`)
    ON DELETE CASCADE)
ENGINE = InnoDB
AUTO_INCREMENT = 49
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `happyhouse`.`user_account`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `happyhouse`.`user_account` (
  `user_id` VARCHAR(20) NOT NULL COMMENT '[사용자 아이디]',
  `user_pw` VARCHAR(30) NOT NULL COMMENT '[사용자 비밀번호]',
  `user_name` VARCHAR(30) NOT NULL COMMENT '[사용자 이름] 댓글 기능 사용 시 닉네임으로 사용하기 때문에 UQ 설정',
  `user_email` VARCHAR(30) NOT NULL COMMENT '[사용자 이메일] 회원가입 및 비밀번호 찾기 기능 구현 시 인증할 이메일 등록',
  `user_phone` VARCHAR(13) NULL DEFAULT NULL COMMENT '[사용자 전화번호]',
  `user_address` VARCHAR(50) NULL DEFAULT NULL COMMENT '[사용자 주소]',
  `user_point` INT NULL DEFAULT '0' COMMENT '[사용자 포인트] 추후 추가기능 구현 시 사용할 점수',
  `joindate` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '[가입일시]',
  `logindate` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '[최근 로그인 일시]',
  PRIMARY KEY (`user_id`),
  UNIQUE INDEX `user_name` (`user_name` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
