import Ember from 'ember';
import AuthenticatedRouteMixin from 'ember-simple-auth/mixins/authenticated-route-mixin';

export default Ember.Route.extend(AuthenticatedRouteMixin, {
  queryParams: {
    fromDay: { refreshModel: true },
    toDay: { refreshModel: true },
    fromHour: { refreshModel: true },
    toHour: { refreshModel: true },
  },
  currentUser: Ember.computed( function() {
    return this.get('session').session.content.authenticated.user;
  }),
  model: function(params) {
    let self = this;
    return Ember.RSVP.hash({
      meals: this.get('store').query('meal', params),
      newMeal: Ember.computed( function() {
        let currentUser = self.get('session').session.content.authenticated.user;
        let meal = self.get('store').createRecord('meal');
        meal.user = currentUser.email;
        meal.user_id = currentUser.id;
        meal.day = '';
        return meal;
      }),
    });
  },
  actions: {
    deleteAfterConfirm: function(meal) {
      if (!meal.id) {
        meal.destroyRecord();
        return ;
      }
      if (confirm("Are you sure?")) {
        meal.destroyRecord().then(() => this.refresh());
      }
    },
  }
});