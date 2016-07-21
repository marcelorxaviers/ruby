define('client/routes/signup', ['exports', 'ember'], function (exports, _ember) {
  exports['default'] = _ember['default'].Route.extend({
    model: function model() {
      var user = this.get('store').createRecord('user');
      user.name = '';
      user.email = '';
      user.password = '';
      user.password_confirmation = '';
      user.role = '';
      return user;
    }
  });
});