<cfscript>
component output="false" mixin="none" {

	public any function init() {
		this.version = "2.0";
		return this;
	}

	public string function pluginVersion() {
		return "0.1.0";
	}

	public any function migrate(required string dir) {
		var loc = {};
		loc.dir = arguments.dir;
		loc.backupDir = arguments.dir & ".backup";

		DirectoryCopy(loc.dir, loc.backupDir, true);

		loc.dirFiles = DirectoryList(loc.dir, true, "query");
		loop query="loc.dirFiles" {
			if (loc.dirFiles.type eq "File") {
				if (ListFindNoCase("cfm,cfc", ListLast(loc.dirFiles.name, "."))) {
					loc.fileContent = fileRead("#loc.dirFiles.directory#/#loc.dirFiles.name#");
					FileWrite("#loc.dirFiles.directory#/#loc.dirFiles.name#", replacement(loc.fileContent));
				}
			}
		}
	}

	public string function replacement(required string string) {
		var loc = {};
		loc.rv = arguments.string;
		loc.rv = REReplaceNoCase(loc.rv, 'assert\("(.+?)"\)', "assert(\1)", "all");
		loc.rv = REReplaceNoCase(loc.rv, 'raised\("(.+?)"\)', "raised(\1)", "all");
		loc.rv = REReplaceNoCase(loc.rv, 'fail\("(.+?)"\)', "fail(\1)", "all");
		loc.rv = REReplaceNoCase(loc.rv, 'debug\("(.+?)"\)', "debug(\1)", "all");
		return loc.rv;
	}
}
</cfscript>
