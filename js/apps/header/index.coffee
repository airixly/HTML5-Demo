define ["app", "./controller", "entities/header", "../about/index"], (App, Controller) ->
  App.module "Header", (Header, App, Backbone, Marionette, $, _) ->
    headers = App.reqres.request "header:entities"
    abouts = App.reqres.request "about:entities"

    API =
      showNavbar: ->
        Controller.showNavbar(headers, abouts)

    Header.on "start", ->
      API.showNavbar()

  App.Header