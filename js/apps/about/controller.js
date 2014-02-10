// Generated by CoffeeScript 1.6.3
(function() {
  define(["app", "./views"], function(App, Views) {
    return {
      showAbout: function() {
        var aboutView;
        aboutView = this.getAboutView();
        return App.main.show(aboutView);
      },
      getAboutView: function() {
        return new Views.AboutView;
      }
    };
  });

}).call(this);