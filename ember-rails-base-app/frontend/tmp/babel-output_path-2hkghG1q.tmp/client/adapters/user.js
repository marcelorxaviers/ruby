define('client/adapters/user', ['exports', 'client/config/environment', 'ember-data/adapters/rest', 'ember-simple-auth/mixins/data-adapter-mixin'], function (exports, _clientConfigEnvironment, _emberDataAdaptersRest, _emberSimpleAuthMixinsDataAdapterMixin) {
  exports['default'] = _emberDataAdaptersRest['default'].extend(_emberSimpleAuthMixinsDataAdapterMixin['default'], {
    authorizer: 'authorizer:devise',
    namespace: 'api',
    host: _clientConfigEnvironment['default'].backend_host
  });
});