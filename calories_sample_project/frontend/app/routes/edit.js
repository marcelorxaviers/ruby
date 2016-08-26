import Ember from 'ember';
import AuthenticatedRouteMixin from 'ember-simple-auth/mixins/authenticated-route-mixin';

const { service } = Ember.inject;

export default Ember.Route.extend(AuthenticatedRouteMixin, {
  session: service('session'),
  model() {
    let uid = this.get('session').session.content.authenticated.user.id;
    let user = this.get('store').findRecord('user', uid);
    return user;
  },
});