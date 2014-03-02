define ["app", "./views"], (App, Views) ->
  appendSlider: ->
    sliderView = @getSliderView()
    App.slider.show sliderView

  getSliderView: ->
    new Views.SliderView