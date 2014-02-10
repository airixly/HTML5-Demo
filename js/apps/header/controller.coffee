define ["backbone", "marionette", "app", "./views"], (Backbone, Marionette, App, Views)->
  HeaderController: class HeaderController extends Marionette.Controller
    showNavbar: (headers, abouts) ->
      @layout = @getNavLayout()
      @layout.on "show", =>
        @showHeader headers
        @showAboutNav abouts
      App.header.show @layout

    getNavLayout: ->
      new Views.NavLayout

    showHeader: (headers) ->
      headerView = @getListView headers
      @layout.main.show headerView

    showAboutNav: (abouts) ->
      aboutView = @getListView abouts
      aboutView.on "render", ->
        @$el.addClass "navbar-right"
      @layout.profile.show aboutView

    getListView: (collection) ->
      new Views.HeaderView
        collection: collection


  new HeaderController()