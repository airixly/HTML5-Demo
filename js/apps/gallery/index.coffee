define ["app", "marionette", "./controller", "ctrlVent", "entities/gallery"], (App, Marionette, Controller, ctrlVent) ->
  API =
    showGallery: ->
      gallery = ctrlVent.reqres.request "gallery:entities"
      Controller.showGallery gallery