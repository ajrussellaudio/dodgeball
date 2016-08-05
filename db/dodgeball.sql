DROP TABLE matches;
DROP TABLE teams;

CREATE TABLE teams (
  id SERIAL4 PRIMARY KEY,
  name VARCHAR(255),
  wins INT4,
  losses INT4,
  draws INT4
);

CREATE TABLE matches (
  id SERIAL4 PRIMARY KEY,
  home_team_id INT4 REFERENCES teams(id) ON DELETE CASCADE,
  away_team_id INT4 REFERENCES teams(id) ON DELETE CASCADE,
  home_team_score INT4,
  away_team_score INT4
);