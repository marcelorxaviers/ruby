import Ember from 'ember';

const { service } = Ember.inject;

export default Ember.Controller.extend({
  session: service('session'),
  actions: {
    update(user) {
      let self = this;
      this.set('errorMessage', null);
      let newUser = user;
      newUser.save().catch((error) => {
        this.set('errorMessage', error.errors);
        this.transitionToRoute('edit');
        return null;
      }).then( function() { self.transitionToRoute('users'); });
    }
  }
});