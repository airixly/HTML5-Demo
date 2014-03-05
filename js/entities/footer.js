// Generated by CoffeeScript 1.6.3
(function() {
  var __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  define(["backbone", "ctrlVent"], function(Backbone, ctrlVent) {
    var API, FooterCollection, _ref;
    FooterCollection = (function(_super) {
      __extends(FooterCollection, _super);

      function FooterCollection() {
        _ref = FooterCollection.__super__.constructor.apply(this, arguments);
        return _ref;
      }

      return FooterCollection;

    })(Backbone.Collection);
    ctrlVent.reqres.setHandler("footer:entities", function() {
      return API.getFooterEntities();
    });
    return API = {
      getFooterEntities: function() {
        var footers;
        return footers = new FooterCollection([
          {
            name: "tw",
            desc: "Follow @airixly",
            url: "https://twitter.com/airixly",
            iconName: "fa-twitter"
          }, {
            name: "gh",
            desc: "Github",
            url: "https://github.com/airixly",
            iconName: "fa-github"
          }
        ]);
      }
    };
  });

}).call(this);
