// Generated by CoffeeScript 1.6.3
(function() {
  define(["app", "./views"], function(App, Views) {
    return {
      showFooter: function(footers) {
        var footerView;
        footerView = this.getFooter(footers);
        return App.footer.show(footerView);
      },
      getFooter: function(footers) {
        return new Views.FooterView({
          collection: footers
        });
      }
    };
  });

}).call(this);
