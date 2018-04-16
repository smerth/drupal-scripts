#! /bin/bash
# This script should take in all drush aliases and loop through them
# It should reject @none
# For each alias it should:
# 
# Note the path to the saved db dump file is defined in drush config files

# set up an array of Drush site-aliases
arr=$(drush sa)

# use array expansion ${arr[@]} to loop through the array
for i in ${arr[@]}
do
	# cut the drupal version out of the drush site-status report
	drush site-set $i
	drushstatus=$(drush status)
	drupalversion=$(echo $drushstatus | grep "Drupal version" | cut -c 18)
	
	# run update according to drupal version
	if [[ $drupalversion == 7 ]]; then
		echo $i is a Drupal 7 Site!
		echo "BEGINNING UPDATE..."
		drush pm-update -y
		sleep 5s
		echo
		echo "######################################################"
		echo "######################################################"
		echo "######################################################"
		echo "UPDATE COMPLETE."
		echo
		echo
	elif [[ $drupalversion == 8 ]]; then
		echo $i is a Drupal 8 Site!
		# echo "BEGINNING UPDATE..."
		# drush pm-update -y
		# echo
		# echo "######################################################"
		# echo "######################################################"
		# echo "######################################################"
		# echo "UPDATE COMPLETE."
		# echo
		# echo
	else
		echo
		echo echo $i is not a Drupal 7 or Drupal8 Site!
		echo "Well that's a shocker!"
				echo
		echo "######################################################"
		echo "######################################################"
		echo "######################################################"
		echo
		echo
		echo
	fi
done
