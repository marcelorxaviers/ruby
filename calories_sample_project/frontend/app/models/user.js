import Model from 'ember-data/model';
import attr from 'ember-data/attr';

export default Model.extend({
  email: attr('string'),
  password: attr('string'),
  password_confirmation: attr('string'),
  expected_calories: attr('number'),
  role: attr('string'),
});
