define ["app", "marionette", "./controller", "ctrlVent", "entities/gallery"], (App, Marionette, Controller, ctrlVent) ->
  gallery = ctrlVent.reqres.request "gallery:entities"

  API =
    showGallery: ->
      Controller.showGallery gallery
      ctrlVent.events.trigger "search:gallery"