
## Data `<player-name>.csv`

Here's the description of the data variables:

- `game_date`: date of the game at which the shot was made
- `team_name`: team name (there are 32 teams).
- `season`: year when the shot was made
- `period`: an NBA game is divided in 4 periods of 12 mins each. For example, a value
for period = 1 refers to the first period (the first 12 mins of the game).
- `minutes_remaining` and `seconds_remaining`: the amount of time in
minutes and seconds, respectively, that remained to be played in a given period.
- `shot_made_flag`: indicates whether a shot was made (`y`) or missed (`n`).
- `action_type` :the basketball moves used by players, either to pass by
defenders to gain access to the basket, or to get a clean pass to a teammate to score a
two pointer or three pointer.
- `shot_type`: indicates whether a shot is a 2-point field goal, or a 3-point field goal.
- `shot_distance`: distance to the basket (measured in feet).
- `x` and `y` : the court coordinates (measured in inches) where a shot occurred