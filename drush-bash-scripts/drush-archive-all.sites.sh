#! /bin/bash

# This script will run 'drush ard' on each drupal 7 site for which a site alias is defined.

# TODO - Add an if statement to check for @none 
# TODO - Does ARD work for d8 sites

# set up an array
arr=$(drush sa)
# use array expansion ${arr[@]} to loop through the array
for i in ${arr[@]}
do
	drush site-set $i
	drush ard $i
done