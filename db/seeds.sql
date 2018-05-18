INSERT INTO players (name, pos, email, phone) VALUES ('Sam', 'Def', 'sam@gmail.com', '773-123-2456');
INSERT INTO players (name, pos, email, phone) VALUES ('Noemi', 'Mid', 'Noemi@gmail.com', '773-456-1231');
INSERT INTO players (name, pos, email, phone) VALUES ('Irwin', 'Fwd', 'Irwin@gmail.com', '773-145-1293');
INSERT INTO players (name, pos, email, phone) VALUES ('Samat', 'Mid', 'Samat@gmail.com', '312-232-2356');
INSERT INTO players (name, pos, email, phone) VALUES ('MJ', 'Fwd', 'MJ@gmail.com', '312-665-2312');

INSERT INTO teams (team_name ) VALUES ('A');
INSERT INTO teams (team_name ) VALUES ('B');
INSERT INTO teams (team_name ) VALUES ('C');
INSERT INTO teams (team_name ) VALUES ('D');


INSERT INTO games (game_time,  game_date, team1_id, team2_id) VALUES ('7', '6/4/18', 1, 2);
INSERT INTO games (game_time,  game_date, team1_id, team2_id) VALUES ('9', '6/4/18', 3, 4);
INSERT INTO games (game_time,  game_date, team1_id, team2_id) VALUES ('7', '6/11/18', 1, 3);
INSERT INTO games (game_time,  game_date, team1_id, team2_id) VALUES ('9', '6/11/18', 2, 4);
INSERT INTO games (game_time,  game_date, team1_id, team2_id) VALUES ('7', '6/18/18', 2, 3);
INSERT INTO games (game_time,  game_date, team1_id, team2_id) VALUES ('9', '6/18/18', 1, 4);
INSERT INTO games (game_time,  game_date, team1_id, team2_id) VALUES ('7', '6/25/18', 3, 4);
INSERT INTO games (game_time,  game_date, team1_id, team2_id) VALUES ('9', '6/25/18', 1, 2);

INSERT into availabilities (player_id, game_id, available)  VALUES (1, 2, TRUE);
INSERT into availabilities (player_id, game_id, available)  VALUES (2, 4, TRUE);
INSERT into availabilities (player_id, game_id, available)  VALUES (3, 1, FALSE);
INSERT into availabilities (player_id, game_id, available)  VALUES (4, 6, TRUE);
INSERT into availabilities (player_id, game_id, available)  VALUES (5, 2, TRUE);


