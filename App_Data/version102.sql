use wineman
ALTER TABLE `wineman`.`settings` 
ADD COLUMN `default_printerreports` VARCHAR(45) NULL DEFAULT NULL AFTER `default_printer`;

ALTER TABLE `wineman`.`settings` 
ADD COLUMN `transaction_starting_id` INT NULL DEFAULT 1 AFTER `default_printerreports`;

