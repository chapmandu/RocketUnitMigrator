## RocketUnitMigrator
A CFWheels plugin to upgrade your tests from RocketUnit to RocketUnit 2

```
/*
 This plugin will make a backup your chosen directory (#dir#.backup), then recurses
 through your existing tests and upgrades the RocketUnit functions.
 */

// Replaces functions like this:
assert("loc.foo eq loc.bar");

// with this
assert(loc.foo eq loc.bar);
```

<h2>Note</h2>
<p>
  This version only replaces simple assertions using the <code>assert("foo")</code> pattern and does not currently
  correctly replace such assertion patterns such as <code>assert('foo eq "bar"', "baz", "qux")</code>
</p>
