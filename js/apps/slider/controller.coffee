define ["app", "./views"], (App, Views) ->
  getSliderView: ->
    images = App.reqres.request "slider:entities"
    new Views.SliderView
      collection: images