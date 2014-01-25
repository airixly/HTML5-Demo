define ["backbone", "ctrlVent"], (Backbone, ctrlVent)->
  class IconCollection extends Backbone.Collection

  ctrlVent.reqres.setHandler "icon:entities", ->
    API.getIconEntities()

  API =
    getIconEntities: ->
      icons = new IconCollection [
        name:""
        iconName: "fa-envelope"
        url:"#gallery"
      ,
        name:""
        iconName: "fa-cloud-upload"
        url:"#gallery"
      ,
        name:""
        iconName: "fa-comments"
        url:"#gallery"
      ,
        name:"gallery"
        iconName: "fa-camera-retro"
        url:"#gallery"
      ]