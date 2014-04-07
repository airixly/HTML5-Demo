define ["marionette", "app", "text!./tpl/header-bar.html",
        "text!./tpl/header-item.html"], (Marionette, App, headerBarTpl, headerItemTpl) ->
  HeaderItemView: class HeaderItemView extends Marionette.ItemView
    template: _.template headerItemTpl, null, variable: "data"
    tagName: "li"

  HeaderView: class HeaderView extends Marionette.CollectionView
    tagName: "ul"
    className: "nav navbar-nav"
    itemView: HeaderItemView

    initialize: (options)->
      @isRight = options.isRight

    onRender: ->
      @$el.addClass "navbar-right" if @isRight
      @$el.addClass "touch" if @supportTouch()

    supportTouch: ->
      return 'ontouchstart' of document

  NavLayout: class NavLayout extends Marionette.Layout
    className: "navbar navbar-fixed-top"
    template: _.template headerBarTpl
    regions:
      main: "#main-nav"
      profile: "#profile-nav"

    initialize: ->
      @listenTo App.vent, "header:select", (isRight)->
        @$("li.selected").removeClass "selected"
        region = if isRight then @profile else @main
        region.$el.find("li").eq(0).addClass "selected"