define('client/tests/routes/manage.jshint', ['exports'], function (exports) {
  'use strict';

  QUnit.module('JSHint | routes/manage.js');
  QUnit.test('should pass jshint', function (assert) {
    assert.expect(1);
    assert.ok(true, 'routes/manage.js should pass jshint.');
  });
});