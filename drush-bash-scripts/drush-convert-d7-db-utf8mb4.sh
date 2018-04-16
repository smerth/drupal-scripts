#! /bin/bash

# This script should take in all drush aliases and loop through them
# It should reject drupal 8 sites
# It should reject @none
# For each Drupal 7 alias it should convert the database to utf8mb4

# set up an array of Drush site-aliases
arr=$(drush sa)

# use array expansion ${arr[@]} to loop through the array
for i in ${arr[@]}
do
	# cut the drupal version out of the drush site-status report
	drush site-set $i
	drushstatus=$(drush status)
	drupalversion=$(echo $drushstatus | grep "Drupal version" | cut -c 18)
	
	# set path variables according to drupal version
	if [[ $drupalversion == 7 ]]; then
		echo $i is a Drupal 7 Site!
		echo "Converting DB tables to utf8mb4..."
		drush sql-dump
		drush utf8mb4-convert-databases -y

	elif [[ $drupalversion == 8 ]]; then
		echo $i is a Drupal 8 Site - no action necessary!
	else
		echo "Well that's a shocker!"
	fi
done
