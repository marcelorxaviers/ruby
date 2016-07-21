define('client/tests/routes/aplication.jshint', ['exports'], function (exports) {
  'use strict';

  QUnit.module('JSHint | routes/aplication.js');
  QUnit.test('should pass jshint', function (assert) {
    assert.expect(1);
    assert.ok(true, 'routes/aplication.js should pass jshint.');
  });
});