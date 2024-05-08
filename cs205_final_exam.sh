# TODO: Modify this file to create a shell script that is able to use awk to go through a file formatted like best_pokemon.dat and provides a printed report in the following format (where your script correctly calculates the values that go into the [VALUE] placeholders):
# ===== SUMMARY OF DATA FILE =====
#    File name: [VALUE]
#    Total Pokemon: [VALUE]
#    Avg. HP: [VALUE]
#    Avg. Attack: [VALUE]
# ===== END SUMMARY =====

# The "Avg." values should be calculated as mean values for the corresponding columns.
# The spacing and header formatting should match the above formatting description exactly.
# There should be a comment explaining the purpose of each line in your shell script. 
# The data file will be passed in to the script as a positional parameter and will not necessarily be called best_pokemon.dat. However, you can assume that any file passed to this script will be formatted exactly the way best_pokemon.dat is formatted.

#!/bin/bash

#saves the 1st arg as the filepath
file="$1"

#gets the amount of pokemon given the number of lines excluding the first (NR>1).
pokemon=$(awk 'NR>1{line++} END{print line}' "$file")

#caluclates the average HP
#given the 5th column (hp) in the data file, it sums the values and divides by line count -1 to exclude 1st line
avg_hp=$(awk 'NR>1{sum+=$5} END{print sum/(NR -1)}' "$file")

#caluclates the average attack
#given the 6th column (attack) in the data file, it sums the values and divides by line count -1 to exclude 1st line
avg_attk=$(awk 'NR>1{sum+=$6} END{print sum/(NR -1)}' "$file")

echo "===== SUMMARY OF DATA FILE ====="
echo "File name: $file"
echo "Total Pokemon: $pokemon"
echo "Avg. HP: $avg_hp"
echo "Avg. Attack: $avg_attk"
echo "===== END SUMMARY ====="

