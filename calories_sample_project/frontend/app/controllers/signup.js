import Ember from 'ember';

const { service } = Ember.inject;

export default Ember.Controller.extend({
  session: service('session'),
  actions: {
    save: function(user) {
      this.set('errorMessage', null);
      if (user.id) {
        this.set('errorMessage', 'This user already exists.');
        return ;
      }
      let newUser = user;
      newUser.save().catch((error) => {
        this.set('errorMessage', error.errors);
        this.transitionToRoute('signup');
        return null;
      })
      .then((user)=>{
        if (user) {
          this.get('session').authenticate('authenticator:devise', user.email, user.password).catch((reason) => {
            this.set('errorMessage', reason.error ||reason);
          });
          this.transitionToRoute('index');
        }
      });
    }
  }
});