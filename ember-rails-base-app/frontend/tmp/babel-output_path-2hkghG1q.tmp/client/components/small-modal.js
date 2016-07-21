define('client/components/small-modal', ['exports', 'ember'], function (exports, _ember) {
  exports['default'] = _ember['default'].Component.extend({
    actions: {
      toggleModal: function toggleModal() {
        this.toggleProperty('enabled');
      }
    }
  });
});