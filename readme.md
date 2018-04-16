# Drupal Scripts

## Useful links

* [Drupal](https://www.drupal.org/home)
* [Drush on GitHub](https://github.com/drush-ops/drush)
* [Drush Documentation](http://www.drush.org/en/master/)
* [Screencast](https://drupal.psu.edu/blog/post/delicious-drush-desserts)
* [Drush Recipe Madlib](https://drupal.psu.edu/blog/post/creating-drush-recipe-madlib)

## Drush scripts

Backup, convert, update, etc, multiple sites using Drush.

## Drush make files

Quick builds using Drush make files.

## Drush Recipes

Build out Drupal sites using Drush Recipes.

### [better_admin.drecipe](drush-recipes/better_admin.drecipe)

Disable undesirable modules in Drupal standard install, download and enable modules and libraries for a better backend admin experience. Dowload, install and set the Adminimal theme to be used as the admin theme. Install navbar as the admin menu.

### [standard_upgrade.drecipe](drush-recipes/standard_upgrade.drecipe)

Cook `better_admin`, `essential_modules` and `panels_everywhere` on a freshly installed site. N.B. those recipes need to be accessible to Drush

### [bootstrap_3.drecipe](drush-recipes/bootstrap_3.drecipe)

Download, install and set the Bootstrap3 theme to default. Download and enable related Bootstrap modules. Set relevant variables.

### [omega_4.drecipe](drush-recipes/omega_4.drecipe)

Download install and set the Omega 4 theme to default, create a subtheme using Drush owiz.

### [panels_everywhere.drecipe](drush-recipes/panels_everywhere.drecipe)

Set up Panels Everywhere on an existing Drupal site.

### [podcast_feature_modules.drecipe](drush-recipes/podcast_feature_modules.drecipe)

Download and install the modules used in my Podcast Feature.
