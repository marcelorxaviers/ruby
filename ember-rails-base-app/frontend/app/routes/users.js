import Ember from 'ember';
import AuthenticatedRouteMixin from 'ember-simple-auth/mixins/authenticated-route-mixin';

export default Ember.Route.extend(AuthenticatedRouteMixin, {
  currentUser: Ember.computed( function() {
    return this.get('session').session.content.authenticated.user;
  }),
  regular: Ember.computed( function(role) {
    let currentUser = this.get('currentUser');
    return currentUser ? currentUser.role === role : true;
  }),
  beforeModel: function() {
    if (this.get('regular')) {
      this.transitionTo('index');
    }
  },
  model() {
    return this.get('store').findAll('user');
  },
  actions: {
    deleteAfterConfirm: function(user) {
      if (!user.id) {
        user.destroyRecord();
        return ;
      }
      if (confirm("Are you sure?")) {
        let uid = user.id;
        let cuid = this.get('currentUser').id;
        user.destroyRecord();
        if (uid && cuid && uid.toString() === cuid.toString()) {
          this.get('session').invalidate().then(()=>{ this.transitionTo('login'); });
        }
      }
    },
  }
});