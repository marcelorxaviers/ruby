import Ember from 'ember';

const { service } = Ember.inject;

export default Ember.Controller.extend({
  session: service('session'),
  regular: Ember.computed( function(role) {
    let currentUser = this.get('session').session.content.authenticated.user;
    return currentUser ? currentUser.role === role : true;
  }),
  actions: {
    update: function(user) {
      let self = this;
      this.set('errorMessage', null);
      let newUser = user;
      newUser.save().catch((error) => {
        this.set('errorMessage', error.errors);
        this.transitionToRoute('edit');
        return null;
      }).then( function() { self.transitionToRoute('users'); });
    },
  }
});