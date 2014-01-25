define ["app", "marionette", "./controller"], (App, Marionette, Controller) ->
  class Router extends Marionette.AppRouter
    appRoutes:
      "about": "showAbout"

  API =
    showAbout: ->
      Controller.showAbout()

  new Router
    controller: API