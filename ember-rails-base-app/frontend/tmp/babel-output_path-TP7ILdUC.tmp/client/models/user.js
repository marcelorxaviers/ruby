define('client/models/user', ['exports', 'ember-data/model', 'ember-data/attr'], function (exports, _emberDataModel, _emberDataAttr) {
  exports['default'] = _emberDataModel['default'].extend({
    name: (0, _emberDataAttr['default'])('string'),
    email: (0, _emberDataAttr['default'])('string'),
    password: (0, _emberDataAttr['default'])('string'),
    password_confirmation: (0, _emberDataAttr['default'])('string'),
    role: (0, _emberDataAttr['default'])('string')
  });
});