#! /bin/bash

# Check the first argument for the database environment
if [[ $1 == "test" ]]; then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Truncate the teams and games tables
echo $($PSQL "TRUNCATE TABLE teams, games CASCADE")

# Reset the sequences for both tables if necessary
echo $($PSQL "ALTER SEQUENCE teams_team_id_seq RESTART WITH 1")
echo $($PSQL "ALTER SEQUENCE games_game_id_seq RESTART WITH 1")

# Initialize an array to keep track of inserted values
INSERTED_VALUES=()

# Read the games.csv file line by line
cat games.csv | while IFS="," read -r YEAR ROUND WINNER OPPONENT W_GOALS O_GOALS; do
  # Skip the header row
  if [[ $YEAR != 'year' ]]; then
    # Check if the WINNER has already been inserted
    if [[ " ${INSERTED_VALUES[*]} " =~ " $WINNER "  ]]; 
    then
     echo
    else
      # Insert the WINNER into the database
     INSERT_TEAMS_RESTULTS=$($PSQL "INSERT INTO teams(name) VALUES('$WINNER')")
     if [[ $INSERT_TEAMS_RESTULTS == "INSERT 0 1" ]]
     then
     echo "INSERTED $WINNER "
     fi
      # Add the WINNER to the INSERTED_VALUES array
      INSERTED_VALUES+=("$WINNER")
    
    fi
    if [[ " ${INSERTED_VALUES[*]} " =~ " $OPPONENT "  ]]; 
    then
    echo
    else
      # Insert the WINNER into the database
     INSERT_TEAMS_RESTULTS=$($PSQL "INSERT INTO teams(name) VALUES('$OPPONENT')")
     if [[ $INSERT_TEAMS_RESTULTS == "INSERT 0 1" ]]
     then
     echo "INSERTED $OPPONENT "
     fi
      # Add the WINNER to the INSERTED_VALUES array
      INSERTED_VALUES+=("$OPPONENT")
    fi
    # find ID from  teams
  fi
done

cat games.csv | while IFS="," read -r YEAR ROUND WINNER OPPONENT W_GOALS O_GOALS; do
  # Skip the header row
  if [[ $YEAR != 'year' ]]; then
    # Check if the WINNER has already been inserted
    WINNER_TEAM_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$WINNER'")
    OPPONENT_TEAM_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$OPPONENT'")
   INSERT_GAMES_RESTULTS=$($PSQL "INSERT INTO games(year, round, winner_id, opponent_id, winner_goals, opponent_goals) VALUES($YEAR, '$ROUND', $WINNER_TEAM_ID, $OPPONENT_TEAM_ID, $W_GOALS, $O_GOALS)")
    if [[ $INSERT_GAMES_RESTULTS == "INSERT 0 1" ]]
    then
    echo "INSERTED $YEAR, $ROUND, $WINNER_TEAM_ID, $OPPONENT_TEAM_ID, $W_GOALS, $O_GOALS "
    fi
  fi
done

# Do not change code above this line. Use the PSQL variable above to query your database.
