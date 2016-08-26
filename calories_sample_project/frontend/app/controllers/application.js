import Ember from 'ember';
import ENV from 'client/config/environment';

const { service } = Ember.inject;

export default Ember.Controller.extend({
  session: service('session'),
  showModal: false,
  user: Ember.computed( function() {
    let user = this.get('store').createRecord('user');
    user.set('role', this.get('session').session.content.authenticated.user.role);
    return user;
  }),
  roles: Ember.computed( function() {
    let self = this;
    Ember.$.getJSON(ENV.backend_roles_url).then(function(data) { self.set('roles', data); });
  }),
  regular: Ember.computed( function(role) {
    let currentUser = this.get('session').session.content.authenticated.user;
    return currentUser ? currentUser.role === role : true;
  }),
  actions: {
    invalidateSession: function() {
      this.get('session').invalidate();
      this.transitionToRoute('login');
    },
    openModal: function() {
      this.set('errorMessage', null);
      this.set('showModal', true);
    },
    save: function(user) {
      this.set('errorMessage', null);
      if (user.id) {
        this.set('errorMessage', 'This user already exists.');
        return ;
      }
      let newUser = user;
      newUser.save().catch((error) => {
        this.set('errorMessage', error.errors);
        return ;
      }).then(()=>{
        if (!this.get('errorMessage')) {
          this.set('user', this.get('store').createRecord('user'));
          this.set('showModal', false);
        }
      });
    },
    deleteAfterConfirm: function() {
      if (confirm("Are you sure?")) {
        let self = this;
        let uid = this.get('session').session.content.authenticated.user.id;
        this.get('store').findRecord('user', uid).then(function(user) {
          user.destroyRecord();
        }).then(function() { self.send("invalidateSession"); });
      }
    },
  }
});
