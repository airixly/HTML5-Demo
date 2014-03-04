define ["app", "./views", "ctrlVent", "entities/slider"], (App, Views, ctrlVent) ->
  images = ctrlVent.reqres.request "slider:entities"

  appendSlider: ->
    sliderView = @getSliderView()
    App.slider.show sliderView

  getSliderView: ->
    new Views.SliderView
      collection: images