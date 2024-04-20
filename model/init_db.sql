DROP TABLE IF EXISTS plays;
DROP TABLE IF EXISTS users;


CREATE TABLE users(
    `id` MEDIUMINT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `firstname` VARCHAR(30) NOT NULL,
    `lastname` VARCHAR(30) NOT NULL,
    `username` VARCHAR(30) NOT NULL,
    `email` VARCHAR(30) NOT NULL,
    `password` VARCHAR(255) NOT NULL
)ENGINE=INNODB AUTO_INCREMENT = 10011;


CREATE TABLE plays(
    `id` MEDIUMINT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `date_played` DATETIME NOT NULL,
    `user_id` MEDIUMINT NOT NULL,
    `game_number` TINYINT(1) NOT NULL,
    `total_score_game` SMALLINT NOT NULL,
    `yahtzee_score_count` TINYINT(1) NOT NULL DEFAULT '0',
    `total_upper_wo_bonus` SMALLINT NOT NULL,
    `total_lower_wo_bonus` SMALLINT NOT NULL,
    `rounds_played` TINYINT(1) NOT NULL DEFAULT '13',
    `full_game` TINYINT(1) NOT NULL DEFAULT '1'

)ENGINE=INNODB AUTO_INCREMENT = 20022;

INSERT INTO users(firstname, lastname, username, email, password)
VALUES
    ("Julie", "Andrews", "julezzz", "julezzz@email.com", "$2b$12$S2Ue31h4S9.EGZQaG2tQue3kpQsAZmTk67HyRLF3k4tSXcJs30CvG"),
    ("Peter", "Piper", "pp100", "pp100@email.com", "$2b$12$upMHfgUFpVuiqK2RLtBICOjIsmoQGA7eU19qHDUJ/ZhUKVilj5UW6"),
    ("Patrick", "Fitz", "fitzy100", "fitzy100@email.com", "$2b$12$L96.BCu9XTy4f/8nkxsmnOg04v8QNwHDuCX9EFSKuo8UG1mz84qs6"),
    ("Sophie", "Shore", "shorezy11", "shorezy11@email.com", "$2b$12$FuQTuzNlzsBcZYtSGbhvU.dlwz7nPi3H9mw1fJINjYF2t8SDVMVBq");


INSERT INTO plays(date_played, user_id, game_number, total_score_game, yahtzee_score_count, total_upper_wo_bonus, total_lower_wo_bonus, rounds_played, full_game)
VALUES
    ('2024-03-18 15:38:16', 10011, 1, 147, 1, 19, 128, 7, 0),
    ('2024-03-19 11:47:31', 10011, 1, 227, 1, 48, 179, 13, 1),
    ('2024-03-19 11:59:31', 10011, 2, 112, 0, 16, 96, 9, 0),
    ('2024-03-21 12:57:31', 10011, 1, 169, 1, 44, 125, 13, 1),
    ("2024-03-21 13:04:01", 10011, 2, 303, 1, 69, 199, 13, 1),
    ("2024-03-21 15:14:30", 10011, 3, 240, 1, 44, 196, 13, 1),
    ("2024-03-21 15:14:30", 10011, 1, 262, 1, 56, 206, 13, 1);


ALTER TABLE
    `plays` ADD CONSTRAINT `plays_user_id_foreign` FOREIGN KEY(`user_id`) REFERENCES `users`(`id`);
