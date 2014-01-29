define ["backbone", "ctrlVent"], (Backbone, ctrlVent)->
  class HeaderCollection extends Backbone.Collection

  ctrlVent.reqres.setHandler "header:entities", ->
    API.getHeaderEntities()

  ctrlVent.reqres.setHandler "about:entities", ->
    API.getAboutEntities()

  API =
    getHeaderEntities: ->
      headers = new HeaderCollection [
        name: "Home"
        url: "#home"
      ,
        name: "Blog"
        url: "http://airixly.github.io/"
      ]

    getAboutEntities: ->
      abouts = new HeaderCollection [
        name: "About",
        url:"#about"
      ]