define ["app", "./views"], (App, Views) ->
  showAbout: ->
    aboutView = @getAboutView()
    App.main.show aboutView

  getAboutView: ->
    new Views.AboutView