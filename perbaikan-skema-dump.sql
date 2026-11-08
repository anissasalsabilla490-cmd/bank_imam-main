SET @c := (SELECT COUNT(*) FROM information_schema.columns
           WHERE table_schema = DATABASE() AND table_name = 'transactions' AND column_name = 'price_per_kg');
SET @q := IF(@c = 0,
  'ALTER TABLE `transactions` ADD COLUMN `price_per_kg` int(11) NOT NULL DEFAULT 0 AFTER `total_weight`',
  'SELECT ''price_per_kg sudah ada''');
PREPARE s FROM @q; EXECUTE s; DEALLOCATE PREPARE s;

SET @c := (SELECT COUNT(*) FROM information_schema.columns
           WHERE table_schema = DATABASE() AND table_name = 'transactions' AND column_name = 'poin_per_kg');
SET @q := IF(@c = 0,
  'ALTER TABLE `transactions` ADD COLUMN `poin_per_kg` int(11) NOT NULL DEFAULT 0 AFTER `price_per_kg`',
  'SELECT ''poin_per_kg sudah ada''');
PREPARE s FROM @q; EXECUTE s; DEALLOCATE PREPARE s;

UPDATE `transactions` t
LEFT JOIN `sampah` s ON s.id = t.sampah_id
SET t.price_per_kg = IF(t.total_weight > 0, ROUND(t.total_income   / t.total_weight), COALESCE(s.price_per_kg, 0)),
    t.poin_per_kg  = IF(t.total_weight > 0, ROUND(t.point_received / t.total_weight), COALESCE(s.poin_per_kg, 0))
WHERE t.price_per_kg = 0 AND t.poin_per_kg = 0;

CREATE TABLE IF NOT EXISTS `cms_email_templates` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `subject` varchar(255) DEFAULT NULL,
  `content` longtext DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `from_name` varchar(255) DEFAULT NULL,
  `from_email` varchar(255) DEFAULT NULL,
  `cc_email` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `cms_email_templates` (`name`,`slug`,`subject`,`content`,`description`,`from_name`,`from_email`,`created_at`)
SELECT 'Email Template Forgot Password Backend','forgot_password_backend','Password Baru Anda',
 '<p>Hi,</p><p>Someone requested forgot password, here is your new password : </p><p>[password]</p><p><br></p><p>--</p><p>Regards,</p><p>Admin</p>',
 '[password]','System','system@crudbooster.com',NOW()
FROM (SELECT 1) AS x
WHERE NOT EXISTS (SELECT 1 FROM `cms_email_templates` WHERE `slug` = 'forgot_password_backend');