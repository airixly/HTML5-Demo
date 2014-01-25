define ["backbone", "ctrlVent"], (Backbone, ctrlVent)->
  class FooterCollection extends Backbone.Collection

  ctrlVent.reqres.setHandler "footer:entities", ->
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