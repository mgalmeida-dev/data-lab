-- Creating table
CREATE TABLE ipl.innings
(
    match_id INTEGER NOT NULL,
    innings_no INTEGER NOT NULL,
    batting_team_id INTEGER NOT NULL,
    bowling_team_id INTEGER NOT NULL,
    PRIMARY KEY (match_id, innings_no),
    FOREIGN KEY (match_id) REFERENCES ipl.match(match_id),
    FOREIGN KEY (batting_team_id) REFERENCES ipl.team(team_id),
    FOREIGN KEY (bowling_team_id) REFERENCES ipl.team(team_id)
);

-- Inserting data
INSERT INTO ipl.innings 
    (match_id, innings_no, batting_team_id, bowling_team_id)
VALUES 
    (1,1,1,2),
    (1,2,2,1);