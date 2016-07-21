define('client/routes/manage', ['exports', 'ember', 'client/config/environment', 'ember-simple-auth/mixins/application-route-mixin'], function (exports, _ember, _clientConfigEnvironment, _emberSimpleAuthMixinsApplicationRouteMixin) {
  exports['default'] = _ember['default'].Route.extend(_emberSimpleAuthMixinsApplicationRouteMixin['default'], {
    model: function model(user) {
      return _ember['default'].RSVP.hash({
        user: this.get('store').findRecord('user', user.user_id),
        roles: _ember['default'].$.getJSON(_clientConfigEnvironment['default'].backend_roles_url).then(function (data) {
          return data;
        })
      });
    }
  });
});