define ["ctrlVent", "./controller", "entities/slider", "bootstrap"], (ctrlVent, Controller) ->
  API =
    getSliderView: ->
      images = ctrlVent.reqres.request "slider:entities"
      Controller.getSliderView images