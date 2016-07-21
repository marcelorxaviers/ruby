import ENV from 'client/config/environment';
import Devise from 'ember-simple-auth/authenticators/devise';

export default Devise.extend({  
  serverTokenEndpoint: (ENV.backend_host + '/api/auth/sign_in')
});