DROP DATABASE IF EXISTS soccer_league;

CREATE DATABASE soccer_league;

\c soccer_league

CREATE TABLE Teams (
    id SERIAL PRIMARY KEY,
    name VARCHAR(20) NOT NULL,
    city TEXT
);

CREATE TABLE Referees (
    id SERIAL PRIMARY KEY,
    name TEXT
);  

CREATE TABLE Players (
    id SERIAL PRIMARY KEY,
    name TEXT,
    birthday DATE,
    height INT,
    current_team_id INT REFERENCES teams
);

CREATE TABLE Season (
    id SERIAL PRIMARY KEY,
    start_date DATE,
    end_date DATE
);

CREATE TABLE Matches (
    id SERIAL PRIMARY KEY,
    home_team_id INT REFERENCES teams,
    away_team_id INT,
    location TEXT,
    date DATE,
    start_time TIME,
    season_id INT REFERENCES season,
    head_referee_id INT REFERENCES referees,
    assistant_referee_1_id INT,
    assistant_referee_2_id INT
);

CREATE TABLE Results (
    id SERIAL PRIMARY KEY,
    team_id INT REFERENCES players REFERENCES teams,
    match_id INT REFERENCES matches,
    result BOOLEAN
);

CREATE TABLE Goals (
    id SERIAL PRIMARY KEY,
    player_id INT REFERENCES players,
    match_id INT REFERENCES matches
);

CREATE TABLE Lineups (
    id SERIAL PRIMARY KEY,
    player_id INT REFERENCES players,
    match_id INT REFERENCES matches,    
    team_id INT REFERENCES teams
);




