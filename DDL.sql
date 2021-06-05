/** DDL SCRIPT FOR DEVELOPMENT DATABASE **/

CREATE DATABASE IF NOT EXISTS fitness_dev;

USE fitness_dev;

/** TABLES **/

DROP TABLE IF EXISTS logs;

CREATE TABLE IF NOT EXISTS logs ( 
		log_id BINARY(16) NOT NULL ,
		log_timestamp_creation DATETIME ,
		log_timestamp_update DATETIME ,
		user_id TINYINT ,
		routine_exercise_id BINARY(16) ,
		log_total_exercise_series MEDIUMINT ,
		log_total_exercise_repetitions TINYINT ,
		log_exercise_duration VARCHAR(255) ,
		log_exercise_weight VARCHAR(255) ,
		log_comments TEXT ,
		PRIMARY KEY (log_id)
	);

-- TODO: this table might not be needed
DROP TABLE IF EXISTS users;

CREATE TABLE IF NOT EXISTS users (
	user_id VARCHAR(255) NOT NULL ,
	user_name VARCHAR(255) NOT NULL ,
	user_image LONGBLOB ,
	user_sex CHAR(1) , -- M for Male, F for Female, O for Other
	user_birth_date DATE ,	
	PRIMARY KEY (user_id)
);


DROP TABLE IF EXISTS exercises;

CREATE TABLE IF NOT EXISTS exercises (
	exer_id BINARY(16) NOT NULL ,
	exer_timestamp_creation DATETIME ,
	exer_timestamp_update DATETIME ,
	exer_name VARCHAR(255) ,
	exer_url TEXT ,
	exer_image LONGBLOB ,
	exer_description TEXT ,
	exer_video_url TEXT ,
	bodypart_id BINARY(16) ,
	equipment_id BINARY(16) ,
	user_id VARCHAR(255) ,
	PRIMARY KEY (exer_id)
);


/*** TRIGGERS ***/

CREATE TRIGGER before_insert_logs
  BEFORE INSERT ON logs
  FOR EACH ROW
  SET new.log_id = uuid();
 
 CREATE TRIGGER before_insert_exercise
  BEFORE INSERT ON exercises
  FOR EACH ROW
  SET new.exer_id = uuid();

 
/**** FOREIGN KEYS ***/
 