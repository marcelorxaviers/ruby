export default Ember.HTMLBars.template((function() {
  return {
    meta: {
      "fragmentReason": {
        "name": "missing-wrapper",
        "problems": [
          "multiple-nodes",
          "wrong-type"
        ]
      },
      "revision": "Ember@2.6.1",
      "loc": {
        "source": null,
        "start": {
          "line": 1,
          "column": 0
        },
        "end": {
          "line": 3,
          "column": 111
        }
      },
      "moduleName": "client/templates/signup.hbs"
    },
    isEmpty: false,
    arity: 0,
    cachedFragment: null,
    hasRendered: false,
    buildFragment: function buildFragment(dom) {
      var el0 = dom.createDocumentFragment();
      var el1 = dom.createElement("h2");
      dom.setAttribute(el1,"id","title");
      var el2 = dom.createTextNode("Sign up");
      dom.appendChild(el1, el2);
      dom.appendChild(el0, el1);
      var el1 = dom.createTextNode("\n\n");
      dom.appendChild(el0, el1);
      var el1 = dom.createComment("");
      dom.appendChild(el0, el1);
      return el0;
    },
    buildRenderNodes: function buildRenderNodes(dom, fragment, contextualElement) {
      var morphs = new Array(1);
      morphs[0] = dom.createMorphAt(fragment,2,2,contextualElement);
      dom.insertBoundary(fragment, null);
      return morphs;
    },
    statements: [
      ["inline","signup-form",[],["user",["subexpr","@mut",[["get","model",["loc",[null,[3,19],[3,24]]]]],[],[]],"show",false,"buttonText","Signup","triggerSave",["subexpr","action",["save"],[],["loc",[null,[3,68],[3,83]]]],"errorMessage",["subexpr","@mut",[["get","errorMessage",["loc",[null,[3,97],[3,109]]]]],[],[]]],["loc",[null,[3,0],[3,111]]]]
    ],
    locals: [],
    templates: []
  };
}()));