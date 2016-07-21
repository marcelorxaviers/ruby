export default Ember.HTMLBars.template((function() {
  var child0 = (function() {
    return {
      meta: {
        "fragmentReason": false,
        "revision": "Ember@2.6.1",
        "loc": {
          "source": null,
          "start": {
            "line": 12,
            "column": 2
          },
          "end": {
            "line": 14,
            "column": 2
          }
        },
        "moduleName": "client/templates/components/login-form.hbs"
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
        ["content","errors",["loc",[null,[13,4],[13,14]]]]
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
          "line": 15,
          "column": 6
        }
      },
      "moduleName": "client/templates/components/login-form.hbs"
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
      dom.setAttribute(el3,"for","identification");
      var el4 = dom.createTextNode("Login");
      dom.appendChild(el3, el4);
      dom.appendChild(el2, el3);
      var el3 = dom.createTextNode("\n    ");
      dom.appendChild(el2, el3);
      var el3 = dom.createComment("");
      dom.appendChild(el2, el3);
      var el3 = dom.createTextNode("\n\n    ");
      dom.appendChild(el2, el3);
      var el3 = dom.createElement("label");
      dom.setAttribute(el3,"for","password");
      var el4 = dom.createTextNode("Password");
      dom.appendChild(el3, el4);
      dom.appendChild(el2, el3);
      var el3 = dom.createTextNode("\n    ");
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
      var el4 = dom.createTextNode("Login");
      dom.appendChild(el3, el4);
      dom.appendChild(el2, el3);
      var el3 = dom.createTextNode("\n  ");
      dom.appendChild(el2, el3);
      dom.appendChild(el1, el2);
      var el2 = dom.createTextNode("\n\n");
      dom.appendChild(el1, el2);
      var el2 = dom.createComment("");
      dom.appendChild(el1, el2);
      dom.appendChild(el0, el1);
      return el0;
    },
    buildRenderNodes: function buildRenderNodes(dom, fragment, contextualElement) {
      var element0 = dom.childAt(fragment, [0]);
      var element1 = dom.childAt(element0, [1]);
      var morphs = new Array(5);
      morphs[0] = dom.createAttrMorph(element0, 'class');
      morphs[1] = dom.createElementMorph(element1);
      morphs[2] = dom.createMorphAt(element1,3,3);
      morphs[3] = dom.createMorphAt(element1,7,7);
      morphs[4] = dom.createMorphAt(element0,3,3);
      return morphs;
    },
    statements: [
      ["attribute","class",["concat",["col-xs-2",["subexpr","if",[["get","errors",["loc",[null,[1,25],[1,31]]]]," bg-danger",""],[],["loc",[null,[1,20],[1,49]]]]]]],
      ["element","action",["authenticate"],["on","submit"],["loc",[null,[2,8],[2,45]]]],
      ["inline","input",[],["value",["subexpr","@mut",[["get","identification",["loc",[null,[4,18],[4,32]]]]],[],[]],"placeholder","your@email","class","form-control"],["loc",[null,[4,4],[4,80]]]],
      ["inline","input",[],["value",["subexpr","@mut",[["get","password",["loc",[null,[7,18],[7,26]]]]],[],[]],"type","password","placeholder","your password","class","form-control"],["loc",[null,[7,4],[7,93]]]],
      ["block","if",[["get","errors",["loc",[null,[12,8],[12,14]]]]],[],0,null,["loc",[null,[12,2],[14,9]]]]
    ],
    locals: [],
    templates: [child0]
  };
}()));