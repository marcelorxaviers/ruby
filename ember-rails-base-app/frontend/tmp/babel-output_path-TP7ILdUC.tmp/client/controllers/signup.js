define('client/controllers/signup', ['exports', 'ember'], function (exports, _ember) {
  var service = _ember['default'].inject.service;
  exports['default'] = _ember['default'].Controller.extend({
    session: service('session'),
    actions: {
      save: function save(user) {
        var _this = this;

        this.set('errorMessage', null);
        if (user.id) {
          this.set('errorMessage', 'This user already exists.');
          return;
        }
        var newUser = user;
        newUser.save()['catch'](function (error) {
          _this.set('errorMessage', error.errors);
          _this.transitionToRoute('signup');
          return null;
        }).then(function (user) {
          if (user) {
            _this.get('session').authenticate('authenticator:devise', user.email, user.password)['catch'](function (reason) {
              _this.set('errorMessage', reason.error || reason);
            });
            _this.transitionToRoute('index');
          }
        });
      }
    }
  });
});