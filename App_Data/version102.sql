use wineman
ALTER TABLE `wineman`.`settings` 
ADD COLUMN `default_printerreports` VARCHAR(45) NULL DEFAULT NULL AFTER `default_printer`;


