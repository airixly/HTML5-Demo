define ["backbone", "app"], (Backbone, App)->
  class FooterCollection extends Backbone.Collection

  App.reqres.setHandler "footer:entities", ->
    API.getFooterEntities()

  API =
    getFooterEntities: ->
      footers = new FooterCollection [
        name: "tw"
        desc: "Follow @airixly"
        url: "https://twitter.com/airixly"
        iconName: "fa-twitter"
      ,
        name: "gh"
        desc: "Github"
        url: "https://github.com/airixly"
        iconName: "fa-github"
      ]