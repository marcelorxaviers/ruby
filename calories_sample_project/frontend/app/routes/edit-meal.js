import Ember from 'ember';
import AuthenticatedRouteMixin from 'ember-simple-auth/mixins/authenticated-route-mixin';

export default Ember.Route.extend(AuthenticatedRouteMixin, {
  currentUser: Ember.computed( function() {
    return this.get('session').session.content.authenticated.user;
  }),
  model: function(meal) {
    return this.get('store').findRecord('meal', meal.meal_id);
  },
});