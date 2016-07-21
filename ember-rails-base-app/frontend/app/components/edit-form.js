import Ember from 'ember';

const { service } = Ember.inject;

export default Ember.Component.extend({
  session: service('session'),
  actions: {
    selectRole: function(role) {
      this.get('user').role = role;
    },
    submit: function() {
      let user = this.get('user');
      this.attrs.triggerSave(user);
    }
 }
});