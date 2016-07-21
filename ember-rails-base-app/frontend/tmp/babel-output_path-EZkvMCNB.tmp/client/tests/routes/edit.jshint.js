define('client/tests/routes/edit.jshint', ['exports'], function (exports) {
  'use strict';

  QUnit.module('JSHint | routes/edit.js');
  QUnit.test('should pass jshint', function (assert) {
    assert.expect(1);
    assert.ok(true, 'routes/edit.js should pass jshint.');
  });
});