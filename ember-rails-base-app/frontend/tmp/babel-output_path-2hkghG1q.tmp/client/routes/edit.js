define('client/routes/edit', ['exports', 'ember', 'ember-simple-auth/mixins/authenticated-route-mixin'], function (exports, _ember, _emberSimpleAuthMixinsAuthenticatedRouteMixin) {
  var service = _ember['default'].inject.service;
  exports['default'] = _ember['default'].Route.extend(_emberSimpleAuthMixinsAuthenticatedRouteMixin['default'], {
    session: service('session'),
    model: function model() {
      var uid = this.get('session').session.content.authenticated.user.id;
      var user = this.get('store').findRecord('user', uid);
      return user;
    }
  });
});