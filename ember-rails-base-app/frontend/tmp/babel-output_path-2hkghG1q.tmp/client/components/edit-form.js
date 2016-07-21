define('client/components/edit-form', ['exports', 'ember'], function (exports, _ember) {
  var service = _ember['default'].inject.service;
  exports['default'] = _ember['default'].Component.extend({
    session: service('session'),
    actions: {
      selectRole: function selectRole(role) {
        this.get('user').role = role;
      },
      submit: function submit() {
        var user = this.get('user');
        this.attrs.triggerSave(user);
      }
    }
  });
});