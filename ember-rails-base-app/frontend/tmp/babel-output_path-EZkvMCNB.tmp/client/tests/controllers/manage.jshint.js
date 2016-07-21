define('client/tests/controllers/manage.jshint', ['exports'], function (exports) {
  'use strict';

  QUnit.module('JSHint | controllers/manage.js');
  QUnit.test('should pass jshint', function (assert) {
    assert.expect(1);
    assert.ok(true, 'controllers/manage.js should pass jshint.');
  });
});