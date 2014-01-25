define ["app", "./controller", "ctrlVent", "entities/header", "../about/index"], (App, Controller, ctrlVent) ->
  App.module "Header", (Header, App, Backbone, Marionette, $, _) ->
    headers = ctrlVent.reqres.request "header:entities"
    abouts = ctrlVent.reqres.request "about:entities"

    API =
      showNavbar: ->
        Controller.showNavbar(headers, abouts)

    Header.on "start", ->
      API.showNavbar()

  App.Header