import Ember from 'ember';

const { service } = Ember.inject;

export default Ember.Component.extend({
  session: service('session'),
  actions: {
    selectUser: function(user) {
      let data = user.split(';');
      this.get('meal').set('user_id', data[0]);
      this.get('meal').set('user', data[1]);
    },
    submit: function() {
      let meal = this.get('meal');
      this.attrs.triggerSave(meal);
    },
 }
});