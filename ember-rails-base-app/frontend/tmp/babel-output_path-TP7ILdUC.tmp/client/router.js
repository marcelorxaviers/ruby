define('client/router', ['exports', 'ember', 'client/config/environment'], function (exports, _ember, _clientConfigEnvironment) {

  var Router = _ember['default'].Router.extend({
    location: _clientConfigEnvironment['default'].locationType
  });

  Router.map(function () {
    this.route('login');
    this.route('users');
    this.route('signup');
    this.route('edit', { path: 'users/edit' });
    this.route('manage', { path: 'users/edit/:user_id' });
  });

  exports['default'] = Router;
});