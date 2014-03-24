define ["app", "./controller", "entities/footer"], (App, Controller) ->
  App.module "Footer", (Footer, App, Backbone, Marionette, $, _)->
    API =
      showFooter: ->
        Controller.showFooter()

    Footer.on "start", ->
      API.showFooter()

  App.Footer