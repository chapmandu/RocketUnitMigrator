<cfoutput>

	<cfset migrator = application.wheels.plugins.RocketUnitMigrator.init()>

	<cfparam name="form.dir" default="#ExpandPath('tests')#">

	<cfif isPost()>
		#migrator.migrate(dir=form.dir)#
		#redirectTo(url=cgi.http_referer)#
	</cfif>

	<h1>RocketUnit Migrator V#migrator.pluginVersion()#</h1>
	<h3>Upgrade your tests from RocketUnit to RocketUnit 2</h3>

	<h2>Steps</h2>
	<ul>
		<li>Enter the directory path of your existing tests</li>
		<li>Click Migrate</li>
		<li>Enjoy</li>
	</ul>

	<form action="#cgi.script_name#?#cgi.query_string#" method="post">
		<h4>Tests directory</h4>
		#textFieldTag(name="dir", value=form.dir, style="width:300px;")#<br>
		<br>
		#submitTag(value="Migrate!")#
	</form>

	<h3>Usage</h3>
	<pre>
/*
 This plugin will make a backup your chosen directory (#dir#.backup), then recurses
 through your existing tests and upgrades the RocketUnit functions.
 */

// Replaces functions like this:
assert("loc.foo eq loc.bar");

// with this
assert(loc.foo eq loc.bar);
</pre>

	<h2>Note</h2>
	<p>
		This version only replaces simple assertions using the <code>assert("foo")</code> pattern and does not currently
		correctly replace such assertion patterns such as <code>assert('foo eq "bar"', "baz", "qux")</code>
	</p>

</cfoutput>
