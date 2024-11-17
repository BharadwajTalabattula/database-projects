#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=periodic_table -t --no-align -c"


if [[ -z $1 ]]
then
echo "Please provide an element as an argument."
elif [[ $1 =~ ^[0-9][0]?$ ]]
then
#if argument is atomic number
elements=$($PSQL "SELECT elements.atomic_number, name, symbol, type, atomic_mass, melting_point_celsius, boiling_point_celsius FROM properties FULL JOIN elements ON properties.atomic_number = elements.atomic_number LEFT JOIN types ON properties.type_id=types.type_id WHERE elements.atomic_number=$1")
elif [[ $1 =~ ^[A-Z][a-z]?+ ]]
then
#if argument is string
elements=$($PSQL "SELECT elements.atomic_number, name, symbol, type, atomic_mass, melting_point_celsius, boiling_point_celsius FROM properties FULL JOIN elements ON properties.atomic_number = elements.atomic_number LEFT JOIN types ON properties.type_id=types.type_id WHERE name='$1' OR symbol='$1'")
else 
echo "I could not find that element in the database."
fi

#if element in db
if [[ ! -z $elements ]]
then
echo $elements | while IFS=" |" read an name symbol type mass mp bp
do
echo "The element with atomic number $an is $name ($symbol). It's a $type, with a mass of $mass amu. $name has a melting point of $mp celsius and a boiling point of $bp celsius."
done

fi