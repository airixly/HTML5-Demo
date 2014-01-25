define ["app", "./controller"], (App, Controller) ->
  App.module "Home", (Home, App, Backbone, Marionette, $, _) ->
    API =
      showHome: ->
        Controller.showHome()

    Home.on "start", ->
      API.showHome()

  App.Home



