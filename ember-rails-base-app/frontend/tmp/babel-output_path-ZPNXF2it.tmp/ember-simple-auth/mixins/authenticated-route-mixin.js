define('ember-simple-auth/mixins/authenticated-route-mixin', ['exports', 'ember', 'ember-simple-auth/configuration'], function (exports, _ember, _emberSimpleAuthConfiguration) {
  'use strict';

  var service = _ember['default'].inject.service;

  /**
    __This mixin is used to make routes accessible only if the session is
    authenticated.__ It defines a `beforeModel` method that aborts the current
    transition and instead transitions to the
    {{#crossLink "Configuration/authenticationRoute:property"}}{{/crossLink}} if
    the session is not authenticated.
  
    ```js
    // app/routes/protected.js
    import AuthenticatedRouteMixin from 'ember-simple-auth/mixins/authenticated-route-mixin';
  
    export default Ember.Route.extend(AuthenticatedRouteMixin);
    ```
  
    @class AuthenticatedRouteMixin
    @module ember-simple-auth/mixins/authenticated-route-mixin
    @extends Ember.Mixin
    @public
  */
  exports['default'] = _ember['default'].Mixin.create({
    /**
      The session service.
       @property session
      @readOnly
      @type SessionService
      @public
    */
    session: service('session'),

    /**
      Checks whether the session is authenticated and if it is not aborts the
      current transition and instead transitions to the
      {{#crossLink "Configuration/authenticationRoute:property"}}{{/crossLink}}.
      If the current transition is aborted, this method will save it in the
      session service's
      {{#crossLink "SessionService/attemptedTransition:property"}}{{/crossLink}}
      property so that  it can be retried after the session was authenticated
      (see
      {{#crossLink "ApplicationRouteMixin/sessionAuthenticated:method"}}{{/crossLink}}.
       __If `beforeModel` is overridden in a route that uses this mixin, the route's
     implementation must call `this._super(...arguments)`__ so that the mixin's
     `beforeModel` method is actually executed.
       @method beforeModel
      @param {Transition} transition The transition that lead to this route
      @public
    */
    beforeModel: function beforeModel(transition) {
      if (!this.get('session.isAuthenticated')) {
        _ember['default'].assert('The route configured as Configuration.authenticationRoute cannot implement the AuthenticatedRouteMixin mixin as that leads to an infinite transitioning loop!', this.get('routeName') !== _emberSimpleAuthConfiguration['default'].authenticationRoute);

        transition.abort();
        this.set('session.attemptedTransition', transition);
        this.transitionTo(_emberSimpleAuthConfiguration['default'].authenticationRoute);
      } else {
        return this._super.apply(this, arguments);
      }
    }
  });
});