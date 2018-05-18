DROP DATABASE IF EXISTS sublist;

CREATE DATABASE sublist;

\c sublist


CREATE TABLE teams(
    id SERIAL PRIMARY KEY,
    username VARCHAR(256),
    password_digest VARCHAR(256),
    team_name VARCHAR(256)

);

CREATE TABLE games(
    id SERIAL PRIMARY KEY,
    game_date VARCHAR(256),
    game_time VARCHAR(256),
    team1_id INT REFERENCES teams(id),
    team2_id INT REFERENCES teams(id)


    
);
CREATE TABLE players(
    id SERIAL PRIMARY KEY,
    username VARCHAR(256),
    password_digest VARCHAR(256),
    name VARCHAR(256),
    pos VARCHAR(3),
    email VARCHAR(256),
    phone VARCHAR(15)
    -- game_id INT REFERENCES games(id)

);


CREATE TABLE availabilities(
    id SERIAL PRIMARY KEY,
    player_id INT REFERENCES players(id),
    game_id INT REFERENCES games(id),
    available BOOLEAN
);