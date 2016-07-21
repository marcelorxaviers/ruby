define('client/controllers/index', ['exports', 'ember', 'ember-simple-auth/mixins/authenticated-route-mixin'], function (exports, _ember, _emberSimpleAuthMixinsAuthenticatedRouteMixin) {
  exports['default'] = _ember['default'].Controller.extend(_emberSimpleAuthMixinsAuthenticatedRouteMixin['default'], {
    currentUser: _ember['default'].computed(function () {
      if (this.get('session').session.isAuthenticated) {
        var uid = this.get('session').session.content.authenticated.user.id;
        return this.get('store').findRecord('user', uid);
      }
      return;
    })
  });
});