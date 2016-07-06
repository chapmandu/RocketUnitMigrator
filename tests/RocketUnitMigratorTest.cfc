<cfscript>
	component extends="wheelsMapping.Test" {

		public any function setup() {
			loc.plugin = application.wheels.plugins.RocketUnitMigrator.init();
		}

		public any function teardown() {

		}

		public any function test_rocketunitmigrator_assert_replacement_returns_expected_value() {
			loc.actual = loc.plugin.replacement('assert("foo == bar");');
			loc.expected = 'assert(foo == bar);';
			assert(loc.actual eq loc.expected);
		}

		public any function test_rocketunitmigrator_assert_replacement_with_single_quotes() {
			loc.actual = loc.plugin.replacement("assert('foo == bar');");
			loc.expected = 'assert(foo == bar);';
			assert(loc.actual eq loc.expected);
		}

		// public any function test_rocketunitmigrator_assert_replacement_with_second_arg_returns_expected_value() {
		// 	loc.actual = loc.plugin.replacement('assert("foo == bar", "baz");');
		// 	loc.expected = 'assert(foo == bar, baz);';
		// 	assert(loc.actual eq loc.expected);
		// }

	}
</cfscript>
