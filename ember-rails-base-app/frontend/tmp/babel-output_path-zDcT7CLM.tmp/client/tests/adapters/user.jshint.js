define('client/tests/adapters/user.jshint', ['exports'], function (exports) {
  'use strict';

  QUnit.module('JSHint | adapters/user.js');
  QUnit.test('should pass jshint', function (assert) {
    assert.expect(1);
    assert.ok(true, 'adapters/user.js should pass jshint.');
  });
});