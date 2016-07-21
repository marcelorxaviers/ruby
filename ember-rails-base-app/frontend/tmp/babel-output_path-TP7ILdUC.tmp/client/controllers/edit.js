define('client/controllers/edit', ['exports', 'ember'], function (exports, _ember) {
  var service = _ember['default'].inject.service;
  exports['default'] = _ember['default'].Controller.extend({
    session: service('session'),
    actions: {
      update: function update(user) {
        var _this = this;

        this.set('errorMessage', null);
        var newUser = user;
        newUser.save()['catch'](function (error) {
          _this.set('errorMessage', error.errors);
          _this.transitionToRoute('edit');
          return null;
        });
      }
    }
  });
});