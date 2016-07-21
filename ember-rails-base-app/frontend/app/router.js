import Ember from 'ember';
import config from './config/environment';

const Router = Ember.Router.extend({
  location: config.locationType
});

Router.map(function() {
  this.route('login');
  this.route('users');
  this.route('signup');
  this.route('edit', { path: 'users/edit' });
  this.route('manage', { path: 'users/edit/:user_id' });
});

export default Router;
