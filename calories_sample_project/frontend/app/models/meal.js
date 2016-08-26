import Ember from 'ember';
import Model from 'ember-data/model';
import attr from 'ember-data/attr';

export default Model.extend({
  day: attr('string'),
  time: attr('string'),
  note: attr('string'),
  user: attr('string'),
  user_id: attr('number'),
  calories: attr('number'),
  total_calories: attr('number'),
  expected_calories: attr('number'),

  dayString: Ember.computed('day', function() {
    let date = this.get('day');
    if (date.toString().match(/\d{4}-\d{2}-\d{2}/g)) {
      return date;
    }
    let mm = date.getMonth() + 1;
    let dd = date.getDate();
    return [date.getFullYear(), (mm > 9 ? mm : ('0' + mm)), (dd > 9 ? dd : ('0' + dd))].join('-');
  }),
});
