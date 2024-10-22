#!/bin/bash

#Cleanup for safety
rm -rf number_guessing_game

echo -e "\n~~ Create a number_guessing_game folder in the project folder for your program"
set -x
mkdir number_guessing_game
{ set +x; } 2>/dev/null


PSQL="psql --username=freecodecamp --dbname=postgres -t --no-align -c"
echo -e "\n~~ Create a number_guess database to hold the information suggested in the user stories."
set -x
#Clean for safety
($PSQL "DROP DATABASE number_guess;")
($PSQL "CREATE DATABASE number_guess;")
{ set +x; } 2>/dev/null

PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"
echo -e "\n~~ Create table in number_guess database."
set -x
($PSQL "CREATE TABLE gamedata(game_id SERIAL PRIMARY KEY NOT NULL, username VARCHAR(22) NOT NULL, gameresult INTEGER NOT NULL)")
{ set +x; } 2>/dev/null

echo -e "\n~~ Turn the number_guessing_game folder into a git repository" }
set -x
cd number_guessing_game
git init -b main
{ set +x; } 2>/dev/null

echo -e "\n~~ Your git repository should have at least five commits" }

echo -e "\n~~ Create number_guess.sh in your number_guessing_game folder and give it executable permissions"
set -x
touch number_guess.sh
chmod +x number_guess.sh
git add number_guess.sh
git commit -m "Initial commit"
{ set +x; } 2>/dev/null

echo -e "\n~~ Your script should have a shebang at the top of the file that uses #!/bin/bash" }
echo '#!/bin/bash' >> number_guess.sh
git add number_guess.sh
set -x 
git commit -m "feat: Add shebang"
{ set +x; } 2>/dev/null

echo -e '\nPSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"' >> number_guess.sh
git add number_guess.sh
set -x
git commit  -m "feat: Add PSQL variable"
{ set +x; } 2>/dev/null

cp ../number_guess.sh number_guess.sh
git add number_guess.sh
set -x
git commit -m "refactor: Full solution"
{ set +x; } 2>/dev/null

echo '#Just run sol.sh make whole solution' >> number_guess.sh
git add number_guess.sh
set -x
git commit -m "refactor: Add main runner comment"
{ set +x; } 2>/dev/null

touch logger.log 
echo 'WIP' >> logger.log
git add logger.log
set -x
git commit -m "test: Log functionality"
{ set +x; } 2>/dev/null