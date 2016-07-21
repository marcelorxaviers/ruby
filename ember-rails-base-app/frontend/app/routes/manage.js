import Ember from 'ember';
import ENV from 'client/config/environment';
import ApplicationRouteMixin from 'ember-simple-auth/mixins/application-route-mixin';

export default Ember.Route.extend(ApplicationRouteMixin, {
  model: function(user) {
    return Ember.RSVP.hash({
      user: this.get('store').findRecord('user', user.user_id),
      roles: Ember.$.getJSON(ENV.backend_roles_url).then(function(data) {
        return data;
      }),
    });
  },
});