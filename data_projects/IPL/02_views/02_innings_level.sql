CREATE VIEW ipl.innings_level AS
SELECT 
    i.match_id,
    i.innings_no,
    t.team_name AS team_played,
    SUM(s.runs_off_bat) + SUM(s.extras) AS total_runs,
    COUNT(s.wicket_type) AS total_wicket,
    -- COUNT(*) AS number_of_balls,
    -- COUNT(s.wides) AS number_of_wides,
    -- COUNT(s.noballs) AS number_of_noballs,
    -- COUNT(*) - COUNT(s.wides) - COUNT(s.noballs) AS number_of_valid_balls,
    -- (COUNT(*) - COUNT(s.wides) - COUNT(s.noballs)) / 6 AS number_of_overs,
    -- MOD((COUNT(*) - COUNT(s.wides) - COUNT(s.noballs)), 6) AS number_remaining_balls,
    CASE 
        WHEN MOD((COUNT(*) - COUNT(s.wides) - COUNT(s.noballs)), 6) = 0
        THEN CAST(
        (COUNT(*) - COUNT(s.wides) - COUNT(s.noballs)) / 6
        AS TEXT
        )
        ELSE
            CAST(
                ((COUNT(*) - COUNT(s.wides) - COUNT(s.noballs)) / 6)
                || '.'
                || MOD((COUNT(*) - COUNT(s.wides) - COUNT(s.noballs)), 6)
                AS TEXT
            )
    END AS total_over
FROM ipl.innings AS i
INNER JOIN ipl.team AS t
    ON i.batting_team_id = t.team_id
INNER JOIN ipl.score_by_ball AS s
    ON (i.match_id = s.match_id) AND (i.innings_no = s.innings_no)
GROUP BY 
    t.team_name,
    i.innings_no,
    i.match_id;