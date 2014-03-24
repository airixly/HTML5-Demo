define ["app", "marionette", "./controller", "entities/gallery"], (App, Marionette, Controller) ->
  API =
    getGalleryView: ->
      Controller.getGalleryView()