#! /bin/bash

# This script should find all the settings files for 
# drupal sites then and loop through them and open them in sublime text

# TODO - add a check for Drupal version 7 (see other scripts...)

# Set up an array of all site settings.php files in drupal instances folder
arr=$(find ~/Sites/PHP/drupal/instances/ -name "settings.php")

# use array expansion ${arr[@]} to loop through the array
for i in ${arr[@]}
do
	# cut the drupal version out of the drush site-status report
	sublime $i

done
