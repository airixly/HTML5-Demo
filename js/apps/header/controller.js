// Generated by CoffeeScript 1.6.3
(function() {
  var __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  define(["backbone", "marionette", "app", "./views"], function(Backbone, Marionette, App, Views) {
    var HeaderController, _ref;
    ({
      HeaderController: HeaderController = (function(_super) {
        __extends(HeaderController, _super);

        function HeaderController() {
          _ref = HeaderController.__super__.constructor.apply(this, arguments);
          return _ref;
        }

        HeaderController.prototype.showNavbar = function(headers, abouts) {
          var _this = this;
          this.layout = this.getNavLayout();
          this.layout.on("show", function() {
            _this.showHeader(headers);
            return _this.showAboutNav(abouts);
          });
          return App.header.show(this.layout);
        };

        HeaderController.prototype.getNavLayout = function() {
          return new Views.NavLayout;
        };

        HeaderController.prototype.showHeader = function(headers) {
          var headerView;
          headerView = this.getListView(headers);
          return this.layout.main.show(headerView);
        };

        HeaderController.prototype.showAboutNav = function(abouts) {
          var aboutView;
          aboutView = this.getListView(abouts);
          aboutView.on("render", function() {
            return this.$el.addClass("navbar-right");
          });
          return this.layout.profile.show(aboutView);
        };

        HeaderController.prototype.getListView = function(collection) {
          return new Views.HeaderView({
            collection: collection
          });
        };

        return HeaderController;

      })(Marionette.Controller)
    });
    return new HeaderController();
  });

}).call(this);
