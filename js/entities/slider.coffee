define ["backbone", "app"], (Backbone, App)->
  class SliderCollection extends Backbone.Collection

  App.reqres.setHandler "slider:entities", ->
    API.getSliderEntities()

  API =
    getSliderEntities: ->
      new SliderCollection [
        name: "Cat"
        url: "css/img/img_1.jpg"
      ,
        name: "Sweet"
        url: "css/img/img_2.jpg"
      ,
        name: "Sakura"
        url: "css/img/img_3.jpg"
      ,
        name: "Strawberry Cake"
        url: "css/img/img_4.jpg"
      ]