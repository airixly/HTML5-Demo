define ["app", "marionette", "./views", "../gallery/index", "../slider/index", "../file-upload/index",
        "entities/icon"], (App, Marionette, Views, Gallery, Slider, FileUpload) ->
  class Router extends Marionette.AppRouter
    appRoutes:
      "home": "showHome"
      "gallery": "showGallery"
      "slider": "showSlider"
      "upload": "showFileUpload"

  controller =
    showHome: ->
      icons = App.reqres.request "icon:entities"

      @layout = @getMainLayoutView()

      @layout.on "show", =>
        @showIconsView icons
        @renderSliderView()
        @renderFileUploadView()

      App.main.show @layout

    showGallery: ->
      galleryView = @getGalleryView()
      @layout.homeRegion.show galleryView

    showIconsView: (icons)->
      iconsView = @getIconsView icons
      @layout.homeRegion.show iconsView

    showSlider: ->
      App.commands.execute "show:slider"

    showFileUpload: ->
      App.commands.execute "show:upload"

    renderSliderView: ->
      sliderView = @getSliderView()
      @layout.sliderRegion.show sliderView

    renderFileUploadView: ->
      fileUploadView = @getFileUploadView()
      @layout.uploadRegion.show fileUploadView

    getMainLayoutView: ->
      new Views.MainLayout

    getGalleryView: ->
      Gallery.getGalleryView()

    getIconsView: (icons)->
      new Views.IconsView
        collection: icons

    getSliderView: ->
      Slider.getSliderView()

    getFileUploadView: ->
      FileUpload.getFileUploadView()

  App.Router = new Router
    controller: controller

  App.commands.setHandler "reset:home",->
    App.Router.navigate "home"

  controller
