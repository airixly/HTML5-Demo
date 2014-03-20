define ["backbone", "app"], (Backbone, App)->
  class HeaderCollection extends Backbone.Collection

  App.reqres.setHandler "header:entities", ->
    API.getHeaderEntities()

  App.reqres.setHandler "about:entities", ->
    API.getAboutEntities()

  API =
    getHeaderEntities: ->
      new HeaderCollection [
        name: "Home"
        url: "#home"
      ,
        name: "Blog"
        url: "http://airixly.github.io/"
      ]

    getAboutEntities: ->
      new HeaderCollection [
        name: "About",
        url: "#about"
      ]