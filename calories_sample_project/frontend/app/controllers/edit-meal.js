import Ember from 'ember';

const { service } = Ember.inject;

export default Ember.Controller.extend({
  session: service('session'),
  admin: Ember.computed( function(role) {
    let currentUser = this.get('session').session.content.authenticated.user;
    return currentUser ? currentUser.role === role : false;
  }),
  users: Ember.computed( function() {
    return this.get('store').findAll('user');
  }),
  actions: {
    update: function(meal) {
      let self = this;
      this.set('errorMessage', null);
      let m = meal;
      m.save().catch((error) => {
        this.set('errorMessage', error.errors);
        this.transitionToRoute('edit-form');
        return null;
      }).then( function() { self.transitionToRoute('meals'); });
    },
  }
});