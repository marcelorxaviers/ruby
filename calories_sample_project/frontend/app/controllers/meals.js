import Ember from 'ember';

const { service } = Ember.inject;

export default Ember.Controller.extend({
  session: service('session'),
  fromDay: null,
  toDay: null,
  admin: Ember.computed( function(role) {
    let currentUser = this.get('session').session.content.authenticated.user;
    return currentUser ? currentUser.role === role : false;
  }),
  users: Ember.computed( function() {
    return this.get('store').findAll('user');
  }),
  showModal: false,
  actions: {
    openModal: function() {
      this.set('errorMessage', null);
      this.set('showModal', true);
    },
    save: function(meal) {
      this.set('errorMessage', null);
      if (meal.id) {
        this.set('errorMessage', 'This meal is already registered.');
        return ;
      }
      let currentMeal = meal;
      currentMeal.save().catch((error) => {
        this.set('errorMessage', error.errors);
        return ;
      }).then(()=>{
        if (!this.get('errorMessage')) {
          this.set('showModal', false);
          this.get('target.router').refresh();
        }
      });
    },
  }
});
