import Model from 'ember-data/model';
import attr from 'ember-data/attr';

export default Model.extend({
  name: attr('string'),
  email: attr('string'),
  password: attr('string'),
  password_confirmation: attr('string'),
  role: attr('string'),
});
