// Generated by CoffeeScript 1.6.3
(function() {
  define(["app", "./views"], function(App, Views) {
    return {
      showGallery: function(gallery) {
        var galleryView;
        galleryView = this.getGalleryView(gallery);
        return App.main.show(galleryView);
      },
      getGalleryView: function(gallery) {
        return new Views.GalleryView({
          collection: gallery
        });
      }
    };
  });

}).call(this);
