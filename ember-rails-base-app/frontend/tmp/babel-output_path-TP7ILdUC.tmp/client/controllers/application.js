define('client/controllers/application', ['exports', 'ember'], function (exports, _ember) {
  var service = _ember['default'].inject.service;
  exports['default'] = _ember['default'].Controller.extend({
    session: service('session'),
    showModal: false,
    user: _ember['default'].computed(function () {
      return this.get('store').createRecord('user');
    }),
    regular: _ember['default'].computed(function (role) {
      var currentUser = this.get('session').session.content.authenticated.user;
      return currentUser ? currentUser.role === role : true;
    }),
    actions: {
      invalidateSession: function invalidateSession() {
        this.get('session').invalidate();
      },
      openModal: function openModal() {
        this.set('showModal', true);
      },
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
          return;
        }).then(function () {
          if (!_this.get('errorMessage')) {
            _this.set('user', _this.get('store').createRecord('user'));
            _this.set('showModal', false);
          }
        });
      },
      deleteAfterConfirm: function deleteAfterConfirm() {
        var _this2 = this;

        if (confirm("Are you sure?")) {
          (function () {
            var self = _this2;
            var uid = _this2.get('session').session.content.authenticated.user.id;
            _this2.get('store').findRecord('user', uid).then(function (user) {
              user.destroyRecord();
            }).then(function () {
              self.send("invalidateSession");
            });
          })();
        }
      }
    }
  });
});