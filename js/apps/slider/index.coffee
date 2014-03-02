define ["app", "./controller", "bootstrap"], (App, Controller) ->
  App.module "Slider", (Slider, App, Backbone, Marionette, $, _)->
    API =
      appendSlider: ->
        Controller.appendSlider()

      showSlider: ->
        $("#slider-modal").modal "show"


    Slider.showSlider = API.showSlider

    Slider.on "start", ->
      API.appendSlider()

  App.Slider