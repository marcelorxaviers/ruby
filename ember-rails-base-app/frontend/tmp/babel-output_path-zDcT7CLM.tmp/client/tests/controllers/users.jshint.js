define('client/tests/controllers/users.jshint', ['exports'], function (exports) {
  'use strict';

  QUnit.module('JSHint | controllers/users.js');
  QUnit.test('should pass jshint', function (assert) {
    assert.expect(1);
    assert.ok(true, 'controllers/users.js should pass jshint.');
  });
});