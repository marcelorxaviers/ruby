define('client/controllers/users', ['exports', 'ember'], function (exports, _ember) {
  var service = _ember['default'].inject.service;
  exports['default'] = _ember['default'].Controller.extend({
    session: service('session'),
    regular: _ember['default'].computed(function (role) {
      var currentUser = this.get('session').session.content.authenticated.user;
      return currentUser ? currentUser.role === role : true;
    })
  });
});