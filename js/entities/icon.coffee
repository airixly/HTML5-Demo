define ["backbone", "ctrlVent"], (Backbone, ctrlVent)->
  class IconCollection extends Backbone.Collection

  ctrlVent.reqres.setHandler "icon:entities", ->
    API.getIconEntities()

  API =
    getIconEntities: ->
      icons = new IconCollection [
        name: ""
        iconName: "fa-envelope"
        url: "mailto:airixly@gmail.com?subject=Github-Airixly"
      ,
        name: ""
        iconName: "fa-cloud-upload"
        url: "#"
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