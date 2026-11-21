CREATE VIEW ipl.match_summary AS
SELECT 
    m.match_id,
    m.match_date,
    v.venue_name,
    t.team_name AS winning_team_name
FROM ipl.match AS m 
INNER JOIN ipl.venue AS v 
    ON m.venue_id = v.venue_id
INNER JOIN ipl.result AS r
    ON m.match_id = r.match_id
INNER JOIN ipl.team AS t
    ON r.winning_team_id = t.team_id;