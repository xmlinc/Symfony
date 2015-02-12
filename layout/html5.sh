#!/bin/bash



# HTML5 Layout Template
echo '<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="robots" content="noindex, nofollow" />
	<title>{% block title %}{% endblock %}</title>
	<meta name="description" content="Beschreibung_des_Inhalts_(_ca_160_Zeichen)" />
	<meta name="keywords" content="Suchbegriffe_fuer_Suchmaschinen_(_ca_70_Zeichen)" />
<!--	<link href="{{ asset("bundles/'$(name)$(bundle)'/css/reset.css" type="text/css" rel="stylesheet" /> -->
	<link href="{{ asset("bundles/'$(name)$(bundle)'/css/main.css" type="text/css" rel="stylesheet" />
</head>
<body>
	<div id="wrapper">
		<div id="header">
			<h1>Ueberschrift</h1>
		</div>
		<div id="main"></div>
		<div id="footer"></div>
	</div>
</body>
</html>' > $layoutView
