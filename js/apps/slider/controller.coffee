define ["./views"], (Views) ->
  getSliderView: (images) ->
    new Views.SliderView
      collection: images