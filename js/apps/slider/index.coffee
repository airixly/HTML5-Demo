define ["./controller", "entities/slider", "bootstrap"], (Controller) ->
  API =
    getSliderView: ->
      Controller.getSliderView()