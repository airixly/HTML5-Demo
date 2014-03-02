define ["backbone", "marionette"], (Backbone, Marionette) ->
  app = new Marionette.Application()
  app.addRegions
    header: "#header"
    main: "#main"
    slider:"#slider"
    footer: "#footer"

  app.on "initialize:after", ->
    Backbone.history.start() if Backbone.history
    console.log "%c Airixly@gmail.com","color:#222;text-shadow: 0px 1px 0px #999,0px 2px 0px #888,0px 3px 2px #001135;
      font:50px 'Helvetica Neue',sans-serif"
  app
