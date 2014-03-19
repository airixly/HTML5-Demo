define ["app", "marionette", "./views", "ctrlVent", "../gallery/index", "../slider/index", "../file-upload/index",
        "entities/icon"], (App, Marionette, Views, ctrlVent, Gallery, Slider, FileUpload) ->
  class Router extends Marionette.AppRouter
    appRoutes:
      "home": "showHome"
      "gallery": "showGallery"
      "slider": "showSlider"
      "upload": "showFileUpload"

  controller =
    showHome: ->
      icons = ctrlVent.reqres.request "icon:entities"

      @layout = @getMainLayoutView()

      @layout.on "show", =>
        @showIconsView icons
        @renderSliderView()
        @renderFileUploadView()

      App.main.show @layout

    showIconsView: (icons)->
      iconsView = @getIconsView icons
      @layout.homeRegion.show iconsView

    showGallery: ->
      Gallery.showGallery()

    showSlider: ->
      ctrlVent.commands.execute "show:slider"

    showFileUpload: ->
      ctrlVent.commands.execute "show:upload"

    renderSliderView: ->
      sliderView = @getSliderView()
      @layout.sliderRegion.show sliderView

    renderFileUploadView: ->
      fileUploadView = @getFileUploadView()
      @layout.uploadRegion.show fileUploadView

    getMainLayoutView: ->
      new Views.MainLayout

    getIconsView: (icons)->
      new Views.IconsView
        collection: icons

    getSliderView: ->
      Slider.getSliderView()

    getFileUploadView: ->
      FileUpload.getFileUploadView()

  App.Router = new Router
    controller: controller

  controller
