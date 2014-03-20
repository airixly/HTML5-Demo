define ["app", "marionette", "./controller", "entities/gallery"], (App, Marionette, Controller) ->
  API =
    getGalleryView: (gallery)->
      gallery = App.reqres.request "gallery:entities"
      Controller.getGalleryView gallery