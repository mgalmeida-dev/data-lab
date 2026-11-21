-- Creating the table
CREATE TABLE ipl.result (
    match_id INTEGER NOT NULL PRIMARY KEY,
    winning_team_id INTEGER NOT NULL,
    player_of_the_match_id INTEGER NOT NULL,
    FOREIGN KEY (match_id) REFERENCES ipl.match(match_id),
    FOREIGN KEY (winning_team_id) REFERENCES ipl.team(team_id),
    FOREIGN KEY (player_of_the_match_id) REFERENCES ipl.player(player_id)
);

-- Inserting data
INSERT INTO ipl.result 
    (match_id, winning_team_id, player_of_the_match_id)
VALUES 
    (1,2,24);