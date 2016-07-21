define('client/routes/users', ['exports', 'ember', 'ember-simple-auth/mixins/authenticated-route-mixin'], function (exports, _ember, _emberSimpleAuthMixinsAuthenticatedRouteMixin) {
  exports['default'] = _ember['default'].Route.extend(_emberSimpleAuthMixinsAuthenticatedRouteMixin['default'], {
    currentUser: _ember['default'].computed(function () {
      return this.get('session').session.content.authenticated.user;
    }),
    regular: _ember['default'].computed(function (role) {
      var currentUser = this.get('currentUser');
      return currentUser ? currentUser.role === role : true;
    }),
    beforeModel: function beforeModel() {
      if (this.get('regular')) {
        this.transitionTo('login');
      }
    },
    model: function model() {
      return this.get('store').findAll('user');
    },
    actions: {
      deleteAfterConfirm: function deleteAfterConfirm(user) {
        var _this = this;

        if (confirm("Are you sure?")) {
          var uid = user.id.toString();
          var cuid = this.get('currentUser').id.toString();
          user.destroyRecord();
          if (uid === cuid) {
            this.get('session').invalidate().then(function () {
              _this.transitionTo('login');
            });
          }
        }
      }
    }
  });
});