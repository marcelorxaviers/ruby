export default Ember.HTMLBars.template((function() {
  var child0 = (function() {
    return {
      meta: {
        "fragmentReason": false,
        "revision": "Ember@2.6.1",
        "loc": {
          "source": null,
          "start": {
            "line": 7,
            "column": 4
          },
          "end": {
            "line": 12,
            "column": 4
          }
        },
        "moduleName": "client/templates/components/edit-form.hbs"
      },
      isEmpty: false,
      arity: 0,
      cachedFragment: null,
      hasRendered: false,
      buildFragment: function buildFragment(dom) {
        var el0 = dom.createDocumentFragment();
        var el1 = dom.createTextNode("      ");
        dom.appendChild(el0, el1);
        var el1 = dom.createElement("label");
        dom.setAttribute(el1,"for","password");
        var el2 = dom.createTextNode("New Password");
        dom.appendChild(el1, el2);
        dom.appendChild(el0, el1);
        var el1 = dom.createTextNode("\n      ");
        dom.appendChild(el0, el1);
        var el1 = dom.createComment("");
        dom.appendChild(el0, el1);
        var el1 = dom.createTextNode("\n      ");
        dom.appendChild(el0, el1);
        var el1 = dom.createElement("label");
        dom.setAttribute(el1,"for","passwordConfirmation");
        var el2 = dom.createTextNode("Password Confirmation");
        dom.appendChild(el1, el2);
        dom.appendChild(el0, el1);
        var el1 = dom.createTextNode("\n      ");
        dom.appendChild(el0, el1);
        var el1 = dom.createComment("");
        dom.appendChild(el0, el1);
        var el1 = dom.createTextNode("\n");
        dom.appendChild(el0, el1);
        return el0;
      },
      buildRenderNodes: function buildRenderNodes(dom, fragment, contextualElement) {
        var morphs = new Array(2);
        morphs[0] = dom.createMorphAt(fragment,3,3,contextualElement);
        morphs[1] = dom.createMorphAt(fragment,7,7,contextualElement);
        return morphs;
      },
      statements: [
        ["inline","input",[],["value",["subexpr","@mut",[["get","user.password",["loc",[null,[9,20],[9,33]]]]],[],[]],"type","password","placeholder","enter password","class","form-control"],["loc",[null,[9,6],[9,102]]]],
        ["inline","input",[],["value",["subexpr","@mut",[["get","user.password_confirmation",["loc",[null,[11,20],[11,46]]]]],[],[]],"type","password","placeholder","enter password again","class","form-control"],["loc",[null,[11,6],[11,120]]]]
      ],
      locals: [],
      templates: []
    };
  }());
  var child1 = (function() {
    var child0 = (function() {
      return {
        meta: {
          "fragmentReason": false,
          "revision": "Ember@2.6.1",
          "loc": {
            "source": null,
            "start": {
              "line": 16,
              "column": 8
            },
            "end": {
              "line": 18,
              "column": 8
            }
          },
          "moduleName": "client/templates/components/edit-form.hbs"
        },
        isEmpty: false,
        arity: 1,
        cachedFragment: null,
        hasRendered: false,
        buildFragment: function buildFragment(dom) {
          var el0 = dom.createDocumentFragment();
          var el1 = dom.createTextNode("          ");
          dom.appendChild(el0, el1);
          var el1 = dom.createElement("option");
          var el2 = dom.createComment("");
          dom.appendChild(el1, el2);
          dom.appendChild(el0, el1);
          var el1 = dom.createTextNode("\n");
          dom.appendChild(el0, el1);
          return el0;
        },
        buildRenderNodes: function buildRenderNodes(dom, fragment, contextualElement) {
          var element0 = dom.childAt(fragment, [1]);
          var morphs = new Array(3);
          morphs[0] = dom.createAttrMorph(element0, 'value');
          morphs[1] = dom.createAttrMorph(element0, 'selected');
          morphs[2] = dom.createMorphAt(element0,0,0);
          return morphs;
        },
        statements: [
          ["attribute","value",["get","roleChoice",["loc",[null,[17,26],[17,36]]]]],
          ["attribute","selected",["subexpr","eq",[["get","user.role",["loc",[null,[17,53],[17,62]]]],["get","roleChoice",["loc",[null,[17,63],[17,73]]]]],[],["loc",[null,[17,48],[17,75]]]]],
          ["content","roleChoice",["loc",[null,[17,76],[17,90]]]]
        ],
        locals: ["roleChoice"],
        templates: []
      };
    }());
    return {
      meta: {
        "fragmentReason": false,
        "revision": "Ember@2.6.1",
        "loc": {
          "source": null,
          "start": {
            "line": 13,
            "column": 4
          },
          "end": {
            "line": 20,
            "column": 4
          }
        },
        "moduleName": "client/templates/components/edit-form.hbs"
      },
      isEmpty: false,
      arity: 0,
      cachedFragment: null,
      hasRendered: false,
      buildFragment: function buildFragment(dom) {
        var el0 = dom.createDocumentFragment();
        var el1 = dom.createTextNode("      ");
        dom.appendChild(el0, el1);
        var el1 = dom.createElement("label");
        dom.setAttribute(el1,"for","role");
        var el2 = dom.createTextNode("Role");
        dom.appendChild(el1, el2);
        dom.appendChild(el0, el1);
        var el1 = dom.createTextNode("\n      ");
        dom.appendChild(el0, el1);
        var el1 = dom.createElement("select");
        dom.setAttribute(el1,"class","form-control");
        var el2 = dom.createTextNode("\n");
        dom.appendChild(el1, el2);
        var el2 = dom.createComment("");
        dom.appendChild(el1, el2);
        var el2 = dom.createTextNode("      ");
        dom.appendChild(el1, el2);
        dom.appendChild(el0, el1);
        var el1 = dom.createTextNode("\n");
        dom.appendChild(el0, el1);
        return el0;
      },
      buildRenderNodes: function buildRenderNodes(dom, fragment, contextualElement) {
        var element1 = dom.childAt(fragment, [3]);
        var morphs = new Array(2);
        morphs[0] = dom.createAttrMorph(element1, 'onchange');
        morphs[1] = dom.createMorphAt(element1,1,1);
        return morphs;
      },
      statements: [
        ["attribute","onchange",["subexpr","action",["selectRole"],["value","target.value"],["loc",[null,[15,44],[15,88]]]]],
        ["block","each",[["get","roles",["loc",[null,[16,16],[16,21]]]]],[],0,null,["loc",[null,[16,8],[18,17]]]]
      ],
      locals: [],
      templates: [child0]
    };
  }());
  var child2 = (function() {
    return {
      meta: {
        "fragmentReason": false,
        "revision": "Ember@2.6.1",
        "loc": {
          "source": null,
          "start": {
            "line": 26,
            "column": 2
          },
          "end": {
            "line": 28,
            "column": 2
          }
        },
        "moduleName": "client/templates/components/edit-form.hbs"
      },
      isEmpty: false,
      arity: 0,
      cachedFragment: null,
      hasRendered: false,
      buildFragment: function buildFragment(dom) {
        var el0 = dom.createDocumentFragment();
        var el1 = dom.createTextNode("    ");
        dom.appendChild(el0, el1);
        var el1 = dom.createComment("");
        dom.appendChild(el0, el1);
        var el1 = dom.createTextNode("\n");
        dom.appendChild(el0, el1);
        return el0;
      },
      buildRenderNodes: function buildRenderNodes(dom, fragment, contextualElement) {
        var morphs = new Array(1);
        morphs[0] = dom.createMorphAt(fragment,1,1,contextualElement);
        return morphs;
      },
      statements: [
        ["content","errorMessage",["loc",[null,[27,4],[27,20]]]]
      ],
      locals: [],
      templates: []
    };
  }());
  return {
    meta: {
      "fragmentReason": {
        "name": "triple-curlies"
      },
      "revision": "Ember@2.6.1",
      "loc": {
        "source": null,
        "start": {
          "line": 1,
          "column": 0
        },
        "end": {
          "line": 29,
          "column": 6
        }
      },
      "moduleName": "client/templates/components/edit-form.hbs"
    },
    isEmpty: false,
    arity: 0,
    cachedFragment: null,
    hasRendered: false,
    buildFragment: function buildFragment(dom) {
      var el0 = dom.createDocumentFragment();
      var el1 = dom.createElement("div");
      var el2 = dom.createTextNode("\n  ");
      dom.appendChild(el1, el2);
      var el2 = dom.createElement("form");
      var el3 = dom.createTextNode("\n    ");
      dom.appendChild(el2, el3);
      var el3 = dom.createElement("label");
      dom.setAttribute(el3,"for","name");
      var el4 = dom.createTextNode("Name");
      dom.appendChild(el3, el4);
      dom.appendChild(el2, el3);
      var el3 = dom.createTextNode("\n    ");
      dom.appendChild(el2, el3);
      var el3 = dom.createComment("");
      dom.appendChild(el2, el3);
      var el3 = dom.createTextNode("\n    ");
      dom.appendChild(el2, el3);
      var el3 = dom.createElement("label");
      dom.setAttribute(el3,"for","email");
      var el4 = dom.createTextNode("Email");
      dom.appendChild(el3, el4);
      dom.appendChild(el2, el3);
      var el3 = dom.createTextNode("\n    ");
      dom.appendChild(el2, el3);
      var el3 = dom.createComment("");
      dom.appendChild(el2, el3);
      var el3 = dom.createTextNode("\n");
      dom.appendChild(el2, el3);
      var el3 = dom.createComment("");
      dom.appendChild(el2, el3);
      var el3 = dom.createComment("");
      dom.appendChild(el2, el3);
      var el3 = dom.createTextNode("      ");
      dom.appendChild(el2, el3);
      var el3 = dom.createComment("");
      dom.appendChild(el2, el3);
      var el3 = dom.createTextNode("\n    ");
      dom.appendChild(el2, el3);
      var el3 = dom.createElement("br");
      dom.appendChild(el2, el3);
      var el3 = dom.createTextNode("\n    ");
      dom.appendChild(el2, el3);
      var el3 = dom.createElement("button");
      dom.setAttribute(el3,"type","submit");
      dom.setAttribute(el3,"class","btn btn-primary");
      var el4 = dom.createTextNode("Update");
      dom.appendChild(el3, el4);
      dom.appendChild(el2, el3);
      var el3 = dom.createTextNode("\n    ");
      dom.appendChild(el2, el3);
      var el3 = dom.createElement("a");
      dom.setAttribute(el3,"class","btn btn-default");
      var el4 = dom.createTextNode("Back");
      dom.appendChild(el3, el4);
      dom.appendChild(el2, el3);
      var el3 = dom.createTextNode("\n  ");
      dom.appendChild(el2, el3);
      dom.appendChild(el1, el2);
      var el2 = dom.createTextNode("\n");
      dom.appendChild(el1, el2);
      var el2 = dom.createComment("");
      dom.appendChild(el1, el2);
      dom.appendChild(el0, el1);
      return el0;
    },
    buildRenderNodes: function buildRenderNodes(dom, fragment, contextualElement) {
      var element2 = dom.childAt(fragment, [0]);
      var element3 = dom.childAt(element2, [1]);
      var element4 = dom.childAt(element3, [18]);
      var morphs = new Array(9);
      morphs[0] = dom.createAttrMorph(element2, 'class');
      morphs[1] = dom.createElementMorph(element3);
      morphs[2] = dom.createMorphAt(element3,3,3);
      morphs[3] = dom.createMorphAt(element3,7,7);
      morphs[4] = dom.createMorphAt(element3,9,9);
      morphs[5] = dom.createMorphAt(element3,10,10);
      morphs[6] = dom.createMorphAt(element3,12,12);
      morphs[7] = dom.createAttrMorph(element4, 'href');
      morphs[8] = dom.createMorphAt(element2,3,3);
      return morphs;
    },
    statements: [
      ["attribute","class",["concat",["col-xs-2",["subexpr","if",[["get","errorMessage",["loc",[null,[1,25],[1,37]]]]," bg-danger",""],[],["loc",[null,[1,20],[1,55]]]]]]],
      ["element","action",["submit"],["on","submit"],["loc",[null,[2,8],[2,39]]]],
      ["inline","input",[],["value",["subexpr","@mut",[["get","user.name",["loc",[null,[4,18],[4,27]]]]],[],[]],"placeholder","enter name","class","form-control"],["loc",[null,[4,4],[4,76]]]],
      ["inline","input",[],["value",["subexpr","@mut",[["get","user.email",["loc",[null,[6,18],[6,28]]]]],[],[]],"placeholder","enter email","class","form-control"],["loc",[null,[6,4],[6,78]]]],
      ["block","if",[["get","showPassword",["loc",[null,[7,10],[7,22]]]]],[],0,null,["loc",[null,[7,4],[12,11]]]],
      ["block","if",[["get","showRole",["loc",[null,[13,10],[13,18]]]]],[],1,null,["loc",[null,[13,4],[20,11]]]],
      ["inline","input",[],["type","hidden","value","user.id","class","form-control"],["loc",[null,[21,6],[21,66]]]],
      ["attribute","href","users"],
      ["block","if",[["get","errorMessage",["loc",[null,[26,8],[26,20]]]]],[],2,null,["loc",[null,[26,2],[28,9]]]]
    ],
    locals: [],
    templates: [child0, child1, child2]
  };
}()));