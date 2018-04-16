#! /bin/bash
# This script should take in all drush aliases and loop through them
# It should reject drupal 8 sites
# It should reject @none
# For each Drupal 7 alias it should set the file path variable for temporary files and private files

# set up an array of Drush site-aliases
arr=$(drush sa)

# set path variables
# A local file system path where temporary/private files will be stored. 
# This directory should not be accessible over the web.
private7="/Users/smerth/Sites/PHP/drupal/server_file_storage/drupal_7_private"
temporary7="/Users/smerth/Sites/PHP/drupal/server_file_storage/drupal_7_temporary"
temporary8="/Users/smerth/Sites/PHP/drupal/server_file_storage/drupal_8_temporary"


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
		echo "Setting temporary path..."
		drush vset file_temporary_path $temporary7 -y
		echo "Setting private path..."
		drush vset file_private_path $private7 -y

	elif [[ $drupalversion == 8 ]]; then
		echo $i is a Drupal 8 Site!

		# I DON'T UNDERSTAND THE CONFIG SYSTEM USED IN DRUPAL8

		#echo "Setting temporary path..."
		#drush vset file_temporary_path $temporary8 -y
		#drush -y config-set system.file  default_scheme public 
	else
		echo "Well that's a shocker!"
	fi
done
