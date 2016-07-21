import Ember from 'ember';

export default Ember.Route.extend({
  model() {
    let user = this.get('store').createRecord('user');
    user.name = '';
    user.email = '';
    user.password ='';
    user.password_confirmation ='';
    user.role = '';
    return user;
  },
});