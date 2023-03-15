#! /bin/bash

PSQL="psql --username=freecodecamp --dbname=periodic_table -t --no-align -c"

#if no input is provided
if [[ -z $1 ]]
then
  echo Please provide an element as an argument.
  exit
fi

#check if the arg provided is a number
if [[ $1 =~ ^[1-9]+$ ]]
then
  RESULT=$($PSQL "SELECT atomic_number,types.type,atomic_mass,melting_point_celsius,boiling_point_celsius,symbol,name FROM properties JOIN elements USING(atomic_number) JOIN types USING(type_id) WHERE atomic_number=$1")
#if not a number, could be a string
else
  RESULT=$($PSQL "SELECT atomic_number,types.type,atomic_mass,melting_point_celsius,boiling_point_celsius,symbol,name FROM properties JOIN elements USING(atomic_number) JOIN types USING(type_id) WHERE name='$1' OR symbol='$1'")
fi

#if element not found
if [[ -z $RESULT ]]
then
  echo -e "I could not find that element in the database."
  exit
fi

echo $RESULT | while IFS=" |" read ATNO TYPE MASS MLT BLT SYMB NAME
do
  echo -e "The element with atomic number $ATNO is $NAME ($SYMB). It's a $TYPE, with a mass of $MASS amu. $NAME has a melting point of $MLT celsius and a boiling point of $BLT celsius."
done
