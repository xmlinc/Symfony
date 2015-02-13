#!/bin/bash

# default views index page
#/Users/MacBookPro/Documents/Repositories/symfony/test/app/Resources/views/default/index.html.twig
#/Users/MacBookPro/Documents/Repositories/symfony/test/app/Resources/views/base.html.twig
curl -o $repospath/$projectname/src/AppBundle/Controller/DefaultController.php https://raw.githubusercontent.com/xmlinc/Symfony/master/controller/DefaultController.php

# Create a Route for IndexController
#echo "<?php
#
#namespace AppBundle\Controller;
#
#use Sensio\Bundle\FrameworkExtraBundle\Configuration\Route;
#use Symfony\Bundle\FrameworkBundle\Controller\Controller;
#
#class DefaultController extends Controller

# {
#	/**
#	 * @Route(\"/app/example\", name=\"homepage\")
#	 */
#	public function indexAction()
#	{
#		return $this->render('default/index.html.twig');
#	}
#}" > $repospath/$projectname/src/AppBundle/Controller/DefaultController.php
#~/Desktop/test.txt


# 2. Create base.html.twig
echo '<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8" />
		<title>{% block title %}Welcome!{% endblock %}</title>
		<link rel="icon" type="image/x-icon" href="{{ asset("favicon.ico") }}" />
		{% block stylesheets %}{% endblock %}
		{% block javascripts %}{% endblock %}
	</head>
	<body>
		{% block body %}{% endblock %}
	</body>
</html>' > $repospath/$projectname/app/Resources/views/base.html.twig


# 3. Create index.html.twig
echo "{% extends 'base.html.twig' %}
{% block body %}
	<p>Homepage.</p>
	<a href=\"/"$(bundle)"/\">$bundlename</a>
{% endblock %}" > $repospath/$projectname/app/Resources/views/default/index.html.twig
