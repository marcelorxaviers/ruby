import ENV from 'client/config/environment';
import Devise from 'ember-simple-auth/authorizers/devise';

export default Devise.extend({
	serverTokenEndpoint: (ENV.backend_host + '/ember/auth')
});