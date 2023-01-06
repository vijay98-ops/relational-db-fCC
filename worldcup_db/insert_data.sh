
#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.
cat games.csv | while IFS=',' read YR ROUND WINR OPPON WG OG
do
  if [[ $WINR != 'winner' ]]
  then
    #get team_id
    win_id=$($PSQL "SELECT team_id FROM teams WHERE name='$WINR'")

    #if team_id not found, insert the team    
    if [[ -z $win_id ]]
    then
      #insert team into teams
      INSERT_TEAM=$($PSQL "INSERT INTO teams(name) VALUES('$WINR')")
    fi
  fi

  if [[ $OPPON != 'opponent' ]]
  then
    #get team_id
    opp_id=$($PSQL "SELECT team_id FROM teams WHERE name='$OPPON'")
    if [[ -z $opp_id ]]
    then
      INSERT_TEAM=$($PSQL "INSERT INTO teams(name) VALUES('$OPPON')")
    fi
  fi
done

cat games.csv | while IFS=',' read YR ROUND WINR OPPON WG OG
do
  if [[ $WINR != 'winner' ]]
  then
    #get winner_id and opponent_id
    winner_id=$($PSQL "SELECT team_id FROM teams WHERE name='$WINR'")
    opponent_id=$($PSQL "SELECT team_id FROM teams WHERE name='$OPPON'")
    #insert the game record into games table
    INSERT_GAME=$($PSQL "INSERT INTO games(year,round,winner_id,opponent_id,winner_goals,opponent_goals) VALUES($YR,'$ROUND',$winner_id,$opponent_id,$WG,$OG)")
  fi
done
