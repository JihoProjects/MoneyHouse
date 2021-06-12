-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema moneyhouse
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema moneyhouse
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `happyhouse` DEFAULT CHARACTER SET utf8;
USE `happyhouse`;

-- -----------------------------------------------------
-- Table `moneyhouse`.`user_account`
-- 회원관리 TABLE
-- -----------------------------------------------------
DROP TABLE IF EXISTS `happyhouse`.`user_account`;

CREATE TABLE IF NOT EXISTS `happyhouse`.`user_account` (
  `user_id`      VARCHAR(20) NOT NULL  COMMENT '[사용자 아이디]',
  `user_pw`      VARCHAR(30) NOT NULL  COMMENT '[사용자 비밀번호]',
  `user_name`    VARCHAR(30) NOT NULL  COMMENT '[사용자 이름] 댓글 기능 사용 시 닉네임으로 사용하기 때문에 UQ 설정',
  `user_email`   VARCHAR(30) NOT NULL  COMMENT '[사용자 이메일] 회원가입 및 비밀번호 찾기 기능 구현 시 인증할 이메일 등록',
  `user_phone`   VARCHAR(13)           COMMENT '[사용자 전화번호]',
  `user_address` VARCHAR(50)           COMMENT '[사용자 주소]',
  `user_point`   INT(11)     DEFAULT 0 COMMENT '[사용자 포인트] 추후 추가기능 구현 시 사용할 점수',
  `joindate`     TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '[가입일시]',
  `logindate`    TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '[최근 로그인 일시]',
  PRIMARY KEY (`user_id`),
  UNIQUE INDEX `user_name` (`user_name` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

-- -----------------------------------------------------
-- Table `moneyhouse`.`user_account`
-- Insert default data
-- -----------------------------------------------------
INSERT INTO `happyhouse`.`user_account` VALUES("admin", "ssafy", "관리자", "admin@moneyhouse.com", null, null, 1000000, null, null);
INSERT INTO `happyhouse`.`user_account` VALUES("ssafy", "ssafy", "테스터", "ssafy@moneyhouse.com", null, null, 1000000, null, null);

-- -----------------------------------------------------
-- Table happyhouse.comment
-- -----------------------------------------------------

CREATE TABLE IF NOT EXISTS `happyhouse`.`comment` (
  `cid` INT NOT NULL AUTO_INCREMENT,
  `qid` INT NULL DEFAULT NULL,
  `comment` VARCHAR(100) NULL DEFAULT NULL,
  `userid` VARCHAR(100) NULL DEFAULT NULL,
  PRIMARY KEY (`cid`),
  INDEX `qid_idx` (`qid` ASC),
  CONSTRAINT `qid`
    FOREIGN KEY (`qid`)
    REFERENCES `happyhouse`.`qnaboard` (`qid`)
    ON DELETE CASCADE)
ENGINE = InnoDB
AUTO_INCREMENT = 38
DEFAULT CHARACTER SET = utf8;

-- -----------------------------------------------------
-- Table happyhouse.subcomment
-- -----------------------------------------------------

CREATE TABLE IF NOT EXISTS `happyhouse`.`subcomment` (
  `sid` INT NOT NULL AUTO_INCREMENT,
  `qid` INT NULL DEFAULT NULL,
  `cid` INT NULL DEFAULT NULL,
  `comment` VARCHAR(100) NULL DEFAULT NULL,
  `userid` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`sid`),
  INDEX `qid_idx` (`qid` ASC),
  INDEX `cid_idx` (`cid` ASC),
  CONSTRAINT `cid`
    FOREIGN KEY (`cid`)
    REFERENCES `happyhouse`.`comment` (`cid`)
    ON DELETE CASCADE,
  CONSTRAINT `qid2`
    FOREIGN KEY (`qid`)
    REFERENCES happyhouse.qnaboard (`qid`)
    ON DELETE CASCADE)
ENGINE = InnoDB
AUTO_INCREMENT = 44
DEFAULT CHARACTER SET = utf8;

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

COMMIT;
SELECT * FROM `user_account`;
SELECT * FROM `comment`;
SELECT * FROM `subcomment`;
