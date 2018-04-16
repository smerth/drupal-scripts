#! /bin/bash

# This script should take in all drush aliases and loop through them
# For each alias it should dump the db file
# Note:  the path to the saved db dump file is defined in the drush config files

# My Setup: db are currently saved to Google Drive

# TODO - add an if statement to check @none and check validity of alias definition...

# set up an array of Drush site-aliases
arr=$(drush sa)

# use array expansion ${arr[@]} to loop through the array
for i in ${arr[@]}
do
	drush site-set $i
	drush sql-dump
done
