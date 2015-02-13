#!/bin/bash

# Get JQuery Library
curl -o $repospath/$projectname/web/bundles/$(name)$(bundle)/css/jquery.mobile.css https://github.com/xmlinc/Symfony/raw/master/layout/jquery/css/jquery.mobile.css
curl -o $repospath/$projectname/web/bundles/$(name)$(bundle)/js/jquery.js https://raw.githubusercontent.com/xmlinc/Symfony/master/layout/jquery/js/jquery.js


#git clone https://github.com/jquery/jquery-mobile.git
#mv bootstrap/dist/* web/bundles/$(name)$(bundle)
#rm -rf bootstrap


# JQuery Mobile Layout Template
echo '<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="robots" content="noindex, nofollow">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>{% block title %}{% endblock %}</title>
	<link rel="shortcut icon" href="/favicon.ico">
	<link rel="stylesheet" href = "{{ asset("bundles/'$(name)$(bundle)'/css/jquery.mobile.css") }}" />	
	<link rel="stylesheet" href = "{{ asset("bundles/'$(name)$(bundle)'/css/main.css") }}" />
	
	<script src="{{ asset("bundles/'$(name)$(bundle)'/js/jquery.js") }}" type="text/javascript"></script>

	<script>
		$( document ).on( "pageshow", function(){
			$( "p.message" ).hide().delay( 1500 ).show( "fast" );
		});
	</script>
</head>
<body>
<div data-role="page" class="jqm-demos">

	<div data-role="content" class="jqm-content">

		<p class="message">Nothing to see here folks. <a href="/">View the demo center home page &rarr;</a></p>

	</div><!-- /content -->

</div><!-- /page -->
</body>
</html>' > $layoutView



