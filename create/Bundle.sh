#!/bin/bash

#. ~/Develop/Symfony/config.sh
source ./config.sh


# Bundle installer Layout files
filespath=~/Develop/Symfony/layout
#  Demo Pages files path
pagespath=~/Develop/Symfony/pages
# ViewLayout Resources app path
layoutView=$repospath/$projectname/src/$namespace/"$bundlename"Bundle/Resources/views/layout.html.twig
############################################################

# Convert a name to lowercase string
name() {
	echo $namespace | awk '{print tolower($0)}'
}
# Convert a bundle to lowercase string
bundle() {
	echo $bundlename | awk '{print tolower($0)}'
}
#echo $(name)$(bundle)
#csspath = $namespace$bundlename | tr '[:upper:]' '[:lower:]'
#echo $namespace$bundlename | awk '{print tolower($0)}'


# Clear the Trash
rm -rf ~/.Trash/*

# 1. Check if Symfony Project exists
if [ ! -d $repospath/$projectname ]; then
	echo 'Ein Symfony Project mit dem Namen "'$projectname'" existiert nicht,'
	echo 'sollen wir diesen zuerst neu anlegen und Symfony installieren?'
	echo "y/n: "
#	echo -n "y/n: "
	read pa
	if [ $pa == y ]; then
		cd $repospath
		
		# get Composer if not installed
		if [ ! -e composer.phar ]; then
			echo "Composer installieren."
			curl -sS https://getcomposer.org/installer | php
		fi
		
		# Install a Standard Symfony Template
		php composer.phar create-project symfony/framework-standard-edition $projectname
		newProject=true

		# if not ACMEdemo installed, create a index homepage
		if [ ! -d $projectname/src/Acme ]; then
			# create index.html
			. $pagespath/homepage.sh
			newIndex=true
		fi
				
#		chown -R root $repospath/$projectname/app/cache
#		chown -R root $repospath/$projectname/app/logs
#		chown -R root $repospath/$projectname/app/config/parameters.yml
		
#		chmod -R 775 $repospath/$projectname/app/cache
#		chmod -R 775 $repospath/$projectname/app/logs
#		chmod -R 775 $repospath/$projectname/app/config/parameters.yml


		
#		cd $projectname
#		php app/console server:stop -v
#		php app/console server:run -v
#		open /Applications/Safari.app http://localhost:8000
#		exit
	elif [ $pa == n ]; then
		echo "Script wurde abgebrochen!"
		exit
	else
		echo "Du musst zuerst ein Symfony Projekt anlegen!"
		exit
	fi
fi


# 2. Go into your Project for working with the console
cd $repospath/$projectname


# 3. Create new Bundle if not exists
if [ ! -d $repospath/$projectname/src/$namespace/"$bundlename"Bundle ]; then
	php app/console generate:bundle --namespace="$namespace"/"$bundlename"Bundle --format=annotation
else
	echo $namespace/$bundlename"Bundle existiert bereits!"
	echo "Wähle einen anderen Namen für Dein Bundle."
	exit
fi


# 4. Select your Template Layout
echo "Wähle Dein Layout aus: "
echo "1. Bootstrap"
echo "2. Jquery Mobile"
echo "3. HTML5"
echo "4. Symfony"

echo -n "Deine Eingabe: "
read a
if [ $a == 1 ]; then
	layout="bootstrap"
elif [ $a == 2 ]; then
	layout="jquery"
elif [ $a == 3 ]; then
	layout="html5"
elif [ $a == 4 ]; then
	layout="symfony"
fi
echo $layout " - Layout wird installiert..."


# 5. Create Bundle public files paths
if [ ! -d web/bundles/$(name)$(bundle) ]; then
	mkdir web/bundles/$(name)$(bundle)
	mkdir web/bundles/$(name)$(bundle)/css
	mkdir web/bundles/$(name)$(bundle)/img
	mkdir web/bundles/$(name)$(bundle)/js
	chmod -R 777 web/bundles/$(name)$(bundle)/*
fi


# 6. Create default Twig Layout
. $filespath/$layout/$layout.sh


# 7. Create main.css file
echo '/* file: web/bundles/'$(name)$(bundle)'/css/main.css */
body {
	padding-top: 70px;
	padding-bottom: 30px;
}' > web/bundles/$(name)$(bundle)/css/main.css


# 8. Create default index View
echo "{# file: src/"$namespace"/"$bundlename"Bundle/Resources/views/Default/index.html.twig #}
{% extends '"$namespace$bundlename"Bundle::layout.html.twig' %}
{% block title '"$namespace" "$bundlename"' %}
{% block body %}
{% endblock %}" > src/"$namespace"/"$bundlename"Bundle/Resources/views/Default/index.html.twig
#ls -Gl


# 9. Create a Route in Controller
#echo "Es muss nur noch eine Route eingerichtet werden, damit dieses Bundle über eine url im Browser erreichbar ist."
#echo "Bei Bedarf sollte die Datei src/"$namespace"/"$bundlename"Bundle/Controller/DefaultController.php für bessere url's angepasst werden:"
echo '<?php

namespace '$namespace'\'$bundlename'Bundle\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Route;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Template;

/**
 * @Route("/'$(bundle)'")
 */

class DefaultController extends Controller
{
	/**
	 * @Route("/")
	 * @Template()
	 */
	public function indexAction()
	{
		return array();
	}
}' > src/"$namespace"/"$bundlename"Bundle/Controller/DefaultController.php


# 10. Create Demo Pages Content
echo "Möchtest Du auch gleich Demo Seiten anlegen?"
echo -n "y/n: "
read pages
if [ $pages == y ] || [ $pages == yes ] || [ $pages == Y ] || [ $pages == YES ]; then
	. $pagespath/$layout.sh
#elif [ $pages == n ]; then
#	exit
fi


if [ $newProject ]; then
	echo 'Ein neues Symfony Project "'$projectname'" wurde neu installiert.'	
fi
if [ $newIndex ]; then
	echo "Du hast kein ACMEdemo Paket installiert, eine Startseite wurde angelegt."
fi

# Clear Cache
#php app/console cache:clear --no-warmup
#php app/console cache:clear –env=dev


echo "Ein neues Bundle im "$layout" Format wurde erstellt:"		
echo $namespace$bundlename"Bundle::layout.html.twig"
echo "Route: /"$(bundle)"/"
#echo $newProject
#echo $newIndex
#open /Applications/Utilities/Terminal.app ; ls -lisa
#xterm -e "echo hello; echo This is the second command"
