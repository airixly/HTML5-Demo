define ["app" , "./views"], (App, Views) ->
  getGalleryView: ->
    gallery = App.reqres.request "gallery:entities"
    new Views.GalleryView
      collection: gallery