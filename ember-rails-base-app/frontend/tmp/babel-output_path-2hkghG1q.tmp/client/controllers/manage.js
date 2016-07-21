define('client/controllers/manage', ['exports', 'ember'], function (exports, _ember) {
  var service = _ember['default'].inject.service;
  exports['default'] = _ember['default'].Controller.extend({
    session: service('session'),
    regular: _ember['default'].computed(function (role) {
      var currentUser = this.get('session').session.content.authenticated.user;
      return currentUser ? currentUser.role === role : true;
    }),
    actions: {
      update: function update(user) {
        var _this = this;

        var self = this;
        this.set('errorMessage', null);
        var newUser = user;
        newUser.save()['catch'](function (error) {
          _this.set('errorMessage', error.errors);
          _this.transitionToRoute('edit');
          return null;
        }).then(function () {
          self.transitionToRoute('users');
        });
      }
    }
  });
});