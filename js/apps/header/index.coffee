define ["app", "./controller", "entities/header", "../about/index"], (App, Controller) ->
  App.module "Header", (Header, App, Backbone, Marionette, $, _) ->
    API =
      showNavbar: ->
        Controller.showNavbar()

    Header.on "start", ->
      API.showNavbar()

  App.Header