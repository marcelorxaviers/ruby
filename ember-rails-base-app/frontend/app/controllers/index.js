import Ember from 'ember';
import AuthenticatedRouteMixin from 'ember-simple-auth/mixins/authenticated-route-mixin';

export default Ember.Controller.extend(AuthenticatedRouteMixin, {
  currentUser: Ember.computed( function() {
    if (this.get('session').session.isAuthenticated) {
      let uid = this.get('session').session.content.authenticated.user.id;
      return this.get('store').findRecord('user', uid);
    }
    return ;
  }),
});