define('client/components/login-form', ['exports', 'ember'], function (exports, _ember) {
  var service = _ember['default'].inject.service;
  exports['default'] = _ember['default'].Component.extend({
    session: service('session'),
    actions: {
      authenticate: function authenticate() {
        var _this = this;

        this.set('errors', null);

        var _getProperties = this.getProperties('identification', 'password');

        var identification = _getProperties.identification;
        var password = _getProperties.password;

        this.get('session').authenticate('authenticator:devise', identification, password)['catch'](function (reason) {
          _this.set('errors', (reason.error || reason).errors);
        });
      }
    }
  });
});