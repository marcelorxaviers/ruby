export { bsContains };
import Ember from 'ember';

var isArray = Ember.isArray;
var A = Ember.A;

function bsContains(params /*, hash*/) {
  return isArray(params[0]) ? A(params[0]).contains(params[1]) : false;
}

export default Ember.Helper.helper(bsContains);