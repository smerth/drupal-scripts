#! /bin/bash

# This script should take in all drush aliases and loop through them
# For each Drupal 7 alias it should set the file path variable for temporary files and private files

# TODO - It should reject @none

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
		echo "Clearing Cache..."
		drush cc all
		echo
		echo "######################################"
		echo "######################################"
		echo

	elif [[ $drupalversion == 8 ]]; then
		echo $i is a Drupal 7 Site!
		echo "Clearing Cache..."
		drush cr
		echo
		echo "######################################"
		echo "######################################"
		echo
	else
		echo "Well that's a shocker!"
	fi
done
