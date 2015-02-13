#!/bin/bash

# Get Bootstrap
git clone https://github.com/twbs/bootstrap.git
mv bootstrap/dist/* web/bundles/$(name)$(bundle)
rm -rf bootstrap


# Bootstrap Layout Template
echo '<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset={{ _charset }}"/>
	<meta name="robots" content="noindex,nofollow" />
	<title>{% block title %}{% endblock %}</title>
	<link rel="stylesheet" href = "{{ asset("bundles/'$(name)$(bundle)'/css/bootstrap.min.css") }}" />
	<link rel="stylesheet" href = "{{ asset("bundles/'$(name)$(bundle)'/css/main.css") }}" />
	{% block head %}{% endblock %}
</head>

<body role="document">

<!-- Fixed navbar -->
<div class="navbar navbar-inverse navbar-fixed-top" role="navigation">
	<div class="container">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
			<span class="sr-only">Toggle navigation</span>
			<span class="icon-bar"></span>
			<span class="icon-bar"></span>
			<span class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="#">'$namespace $bundlename'</a>
		</div>
		<div class="navbar-collapse collapse">
			<ul class="nav navbar-nav">
			<li><a href="/">Home</a></li>
			<li><a href="#">Page 1</a></li>
			<li><a href="#">Page 2</a></li>
			<li><a href="#">Kontakt</a></li>
			</ul>
		</div><!--/.nav-collapse -->
	</div>
</div>

<div class="container theme-showcase" role="main">

	<div class="jumbotron">
	<h1>'$namespace' '$bundlename'!</h1>
	<p>Made with Symfony2 and Bootstrap Framework</p>
	</div>

	<div class="row">
		<div class="col-md-12">
			<!--Body content-->
			{% block body %}{% endblock %}
		</div>
	</div>

</div>

{% block javascripts %}
<script src="{{ asset("bundles/'$(name)$(bundle)'/js/jquery.min.js") }}" type="text/javascript"></script>
<script src="{{ asset("bundles/'$(name)$(bundle)'/js/bootstrap.min.js") }}" type="text/javascript"></script>
{% endblock %}

</body>
</html>' > $layoutView

#echo $namespace >> ~/Desktop/test.txt
#echo $(name) >> ~/Desktop/test.txt
#pwd >> ~/Desktop/test.txt
