define ["app", "./controller", "entities/slider", "bootstrap"], (App, Controller) ->
  API =
    getSliderView: ->
      images = App.reqres.request "slider:entities"
      Controller.getSliderView images