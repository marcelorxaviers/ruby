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
        this.transitionTo('index');
      }
    },
    model: function model() {
      return this.get('store').findAll('user');
    },
    actions: {
      deleteAfterConfirm: function deleteAfterConfirm(user) {
        var _this = this;

        if (!user.id) {
          user.destroyRecord();
          return;
        }
        if (confirm("Are you sure?")) {
          var uid = user.id;
          var cuid = this.get('currentUser').id;
          user.destroyRecord();
          if (uid && cuid && uid.toString() === cuid.toString()) {
            this.get('session').invalidate().then(function () {
              _this.transitionTo('login');
            });
          }
        }
      }
    }
  });
});