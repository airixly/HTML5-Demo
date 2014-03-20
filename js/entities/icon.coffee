define ["backbone", "app"], (Backbone, App)->
  class IconCollection extends Backbone.Collection

  App.reqres.setHandler "icon:entities", ->
    API.getIconEntities()

  API =
    getIconEntities: ->
      new IconCollection [
        name: ""
        iconName: "fa-envelope"
        url: "mailto:airixly@gmail.com?subject=Github-Airixly"
      ,
        name: ""
        iconName: "fa-cloud-upload"
        url: "#upload"
      ,
        name: ""
        iconName: "fa-comments"
        url: "#"
      ,
        name: "slider"
        iconName: "fa-picture-o"
        url: "#slider"
      ,
        name: "gallery"
        iconName: "fa-camera-retro"
        url: "#gallery"
      ]