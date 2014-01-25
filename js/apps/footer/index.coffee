define ["app", "./controller", "ctrlVent", "entities/footer"], (App, Controller, ctrlVent) ->
  App.module "Footer", (Footer, App, Backbone, Marionette, $, _)->
    footers = ctrlVent.reqres.request "footer:entities"

    API =
      showFooter: ->
        Controller.showFooter(footers)

    Footer.on "start", ->
      API.showFooter()

  App.Footer