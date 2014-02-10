define ["app", "marionette", "./views", "ctrlVent", "../gallery/index",
        "entities/icon"], (App, Marionette, Views, ctrlVent, Gallery) ->
  icons = ctrlVent.reqres.request "icon:entities"

  class Router extends Marionette.AppRouter
    appRoutes:
      "home": "showHome"
      "gallery": "showGallery"

  controller =
    showGallery: ->
      Gallery.showGallery()

    showHome: ->
      contentView = new Views.ContentView
        collection: icons
      App.main.show contentView

  new Router
    controller: controller

  controller