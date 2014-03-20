define ["app" , "./views"], (App, Views) ->
  getGalleryView: (gallery)->
    new Views.GalleryView
      collection: gallery