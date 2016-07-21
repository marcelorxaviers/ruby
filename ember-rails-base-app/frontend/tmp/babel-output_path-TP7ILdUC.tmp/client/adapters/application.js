define('client/adapters/application', ['exports', 'ember-data/adapters/rest', 'ember-simple-auth/mixins/data-adapter-mixin'], function (exports, _emberDataAdaptersRest, _emberSimpleAuthMixinsDataAdapterMixin) {
  exports['default'] = _emberDataAdaptersRest['default'].extend(_emberSimpleAuthMixinsDataAdapterMixin['default'], {
    authorizer: 'authorizer:devise',
    namespace: 'api',
    host: 'http://localhost:3000'
  });
});