import Ember from 'ember';
import config from './config/environment';

const Router = Ember.Router.extend({
  location: config.locationType,
  rootURL: config.rootURL
});

Router.map(function() {
  this.route('login');
  this.route('users');
  this.route('meals');
  this.route('signup');
  this.route('edit', { path: 'users/edit' });
  this.route('manage', { path: 'users/edit/:user_id' });
  this.route('edit-meal', { path: 'meals/edit/:meal_id' });
});

export default Router;
