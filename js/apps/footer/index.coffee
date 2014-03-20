define ["app", "./controller", "entities/footer"], (App, Controller) ->
  App.module "Footer", (Footer, App, Backbone, Marionette, $, _)->
    footers = App.reqres.request "footer:entities"

    API =
      showFooter: ->
        Controller.showFooter(footers)

    Footer.on "start", ->
      API.showFooter()

  App.Footer