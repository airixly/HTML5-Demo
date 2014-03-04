define ["backbone", "ctrlVent"], (Backbone, ctrlVent)->
  class SliderCollection extends Backbone.Collection

  ctrlVent.reqres.setHandler "slider:entities", ->
    API.getSliderEntities()

  API =
    getSliderEntities: ->
      images = new SliderCollection [
        name: "Cat"
        url: "dist/img/img_1.jpg"
      ,
        name: "Sweet"
        url: "dist/img/img_2.jpg"
      ,
        name: "Sakura"
        url: "dist/img/img_3.jpg"
      ,
        name: "Strawberry Cake"
        url: "dist/img/img_4.jpg"
      ]