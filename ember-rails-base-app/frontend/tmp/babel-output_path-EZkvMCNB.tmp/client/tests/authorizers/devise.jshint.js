define('client/tests/authorizers/devise.jshint', ['exports'], function (exports) {
  'use strict';

  QUnit.module('JSHint | authorizers/devise.js');
  QUnit.test('should pass jshint', function (assert) {
    assert.expect(1);
    assert.ok(true, 'authorizers/devise.js should pass jshint.');
  });
});