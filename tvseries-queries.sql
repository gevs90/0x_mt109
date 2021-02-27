/* Create DB */

DROP TABLE IF EXISTS `actor_episodes`;

CREATE TABLE `actor_episodes` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `actor_id` bigint(20) unsigned NOT NULL,
  `episode_id` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `actor_episodes_actor_id_foreign` (`actor_id`),
  KEY `actor_episodes_episode_id_foreign` (`episode_id`),
  CONSTRAINT `actor_episodes_actor_id_foreign` FOREIGN KEY (`actor_id`) REFERENCES `employees` (`id`) ON DELETE CASCADE,
  CONSTRAINT `actor_episodes_episode_id_foreign` FOREIGN KEY (`episode_id`) REFERENCES `episodes` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `actor_episodes` (`id`, `actor_id`, `episode_id`, `created_at`, `updated_at`)
VALUES
	(1,1,1,'2021-02-27 22:18:34','2021-02-27 22:18:34'),
	(2,1,2,'2021-02-27 22:18:34','2021-02-27 22:18:34'),
	(3,1,3,'2021-02-27 22:18:34','2021-02-27 22:18:34'),
	(4,2,4,'2021-02-27 22:18:34','2021-02-27 22:18:34'),
	(5,2,5,'2021-02-27 22:18:34','2021-02-27 22:18:34'),
	(6,2,6,'2021-02-27 22:18:34','2021-02-27 22:18:34'),
	(7,3,3,'2021-02-27 22:18:34','2021-02-27 22:18:34'),
	(8,3,7,'2021-02-27 22:18:34','2021-02-27 22:18:34'),
	(9,3,8,'2021-02-27 22:18:34','2021-02-27 22:18:34'),
	(10,3,9,'2021-02-27 22:18:34','2021-02-27 22:18:34'),
	(11,3,10,'2021-02-27 22:18:34','2021-02-27 22:18:34'),
	(12,3,11,'2021-02-27 22:18:34','2021-02-27 22:18:34'),
	(13,2,12,'2021-02-27 22:18:34','2021-02-27 22:18:34');

DROP TABLE IF EXISTS `broadcasts`;

CREATE TABLE `broadcasts` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `episode_id` bigint(20) unsigned NOT NULL,
  `broadcast_date` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `broadcasts_episode_id_foreign` (`episode_id`),
  CONSTRAINT `broadcasts_episode_id_foreign` FOREIGN KEY (`episode_id`) REFERENCES `episodes` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `director_series`;

CREATE TABLE `director_series` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `director_id` bigint(20) unsigned NOT NULL,
  `serial_id` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `director_series_director_id_foreign` (`director_id`),
  KEY `director_series_serial_id_foreign` (`serial_id`),
  CONSTRAINT `director_series_director_id_foreign` FOREIGN KEY (`director_id`) REFERENCES `employees` (`id`) ON DELETE CASCADE,
  CONSTRAINT `director_series_serial_id_foreign` FOREIGN KEY (`serial_id`) REFERENCES `series` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


INSERT INTO `director_series` (`id`, `director_id`, `serial_id`, `created_at`, `updated_at`)
VALUES
	(1,4,1,'2021-02-27 22:18:34','2021-02-27 22:18:34'),
	(2,4,2,'2021-02-27 22:18:34','2021-02-27 22:18:34'),
	(3,5,1,'2021-02-27 22:18:34','2021-02-27 22:18:34'),
	(4,5,3,'2021-02-27 22:18:34','2021-02-27 22:18:34'),
	(5,6,1,'2021-02-27 22:18:34','2021-02-27 22:18:34'),
	(6,6,2,'2021-02-27 22:18:34','2021-02-27 22:18:34'),
	(7,6,3,'2021-02-27 22:18:34','2021-02-27 22:18:34');

DROP TABLE IF EXISTS `employees`;

CREATE TABLE `employees` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `first_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` enum('actor','director') COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `employees` (`id`, `first_name`, `last_name`, `type`, `created_at`, `updated_at`)
VALUES
	(1,'Pedro Ramirez','Pedro Ramirez','actor','2021-02-27 22:18:34','2021-02-27 22:18:34'),
	(2,'Jose Perez','Jose Perez','actor','2021-02-27 22:18:34','2021-02-27 22:18:34'),
	(3,'Mayra del Carmen','Mayra del Carmen','actor','2021-02-27 22:18:34','2021-02-27 22:18:34'),
	(4,'Eduardo Gastelum','Eduardo Gastelum','director','2021-02-27 22:18:34','2021-02-27 22:18:34'),
	(5,'Raul Diaz','Raul Diaz','director','2021-02-27 22:18:34','2021-02-27 22:18:34'),
	(6,'Daniel Ruiz','Daniel Ruiz','director','2021-02-27 22:18:34','2021-02-27 22:18:34');


DROP TABLE IF EXISTS `episodes`;

CREATE TABLE `episodes` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `serial_id` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `episodes_serial_id_foreign` (`serial_id`),
  CONSTRAINT `episodes_serial_id_foreign` FOREIGN KEY (`serial_id`) REFERENCES `series` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `episodes` (`id`, `name`, `serial_id`, `created_at`, `updated_at`)
VALUES
	(1,'Episode 1',1,'2021-02-27 22:18:34','2021-02-27 22:18:34'),
	(2,'Episode 2',1,'2021-02-27 22:18:34','2021-02-27 22:18:34'),
	(3,'Episode 3',1,'2021-02-27 22:18:34','2021-02-27 22:18:34'),
	(4,'Episode 1',2,'2021-02-27 22:18:34','2021-02-27 22:18:34'),
	(5,'Episode 2',2,'2021-02-27 22:18:34','2021-02-27 22:18:34'),
	(6,'Episode 3',2,'2021-02-27 22:18:34','2021-02-27 22:18:34'),
	(7,'Episode 1',3,'2021-02-27 22:18:34','2021-02-27 22:18:34'),
	(8,'Episode 2',3,'2021-02-27 22:18:34','2021-02-27 22:18:34'),
	(9,'Episode 3',3,'2021-02-27 22:18:34','2021-02-27 22:18:34'),
	(10,'Episode 4',3,'2021-02-27 22:18:34','2021-02-27 22:18:34'),
	(11,'Episode 5',3,'2021-02-27 22:18:34','2021-02-27 22:18:34'),
	(12,'Episode 6',3,'2021-02-27 22:18:34','2021-02-27 22:18:34');

DROP TABLE IF EXISTS `migrations`;

CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `migrations` (`id`, `migration`, `batch`)
VALUES
	(1,'2021_02_27_205020_create_series_table',1),
	(2,'2021_02_27_205240_create_episodes_table',1),
	(3,'2021_02_27_205456_create_employees_table',1),
	(4,'2021_02_27_205956_create_broadcasts_table',1),
	(5,'2021_02_27_210216_create_actor_episodes_table',1),
	(6,'2021_02_27_210510_create_director_series_table',1);

DROP TABLE IF EXISTS `series`;

CREATE TABLE `series` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `series` (`id`, `name`, `created_at`, `updated_at`)
VALUES
	(1,'Big Sister','2021-02-27 22:18:34','2021-02-27 22:18:34'),
	(2,'Live fly','2021-02-27 22:18:34','2021-02-27 22:18:34'),
	(3,'My Heart','2021-02-27 22:18:34','2021-02-27 22:18:34');

/*
    QUERY SECTION
*/

/* a. Which actors play in the series Big Sister? */
select distinct e.*
from employees e
left join actor_episodes ae on ae.actor_id = e.id
left join episodes ep on ae.episode_id = ep.id
left join series s on s.id = ep.serial_id
where e.type = 'actor'
and s.name = 'Big Sister';

/* b. Which director has directed the greatest number of episodes? */

select distinct em.first_name, s.name, count(*)
from episodes e
left join series s on s.id = e.serial_id
left join director_series ds on ds.serial_id = s.id
left join employees em on ds.director_id = em.id
where em.type = 'director'
group by ds.id
order by count(*) desc limit 1;