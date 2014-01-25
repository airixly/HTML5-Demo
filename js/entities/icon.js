// Generated by CoffeeScript 1.6.3
(function() {
  var __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  define(["backbone", "ctrlVent"], function(Backbone, ctrlVent) {
    var API, IconCollection, _ref;
    IconCollection = (function(_super) {
      __extends(IconCollection, _super);

      function IconCollection() {
        _ref = IconCollection.__super__.constructor.apply(this, arguments);
        return _ref;
      }

      return IconCollection;

    })(Backbone.Collection);
    ctrlVent.reqres.setHandler("icon:entities", function() {
      return API.getIconEntities();
    });
    return API = {
      getIconEntities: function() {
        var icons;
        return icons = new IconCollection([
          {
            name: "",
            iconName: "fa-envelope",
            url: "#gallery"
          }, {
            name: "",
            iconName: "fa-cloud-upload",
            url: "#gallery"
          }, {
            name: "",
            iconName: "fa-comments",
            url: "#gallery"
          }, {
            name: "gallery",
            iconName: "fa-camera-retro",
            url: "#gallery"
          }
        ]);
      }
    };
  });

}).call(this);
