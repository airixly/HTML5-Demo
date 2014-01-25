define ["backbone", "marionette"], (Backbone, Marionette) ->
  app = new Marionette.Application()
  app.addRegions
    header: "#header"
    main: "#main"
    footer: "#footer"

  app.on "initialize:after", ->
    Backbone.history.start() if Backbone.history
  app