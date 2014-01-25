define ["app" , "./views"], (App, Views) ->
  showGallery: (gallery)->
    galleryView = @getGalleryView gallery
    App.main.show galleryView

  getGalleryView: (gallery)->
    new Views.GalleryView
      collection: gallery