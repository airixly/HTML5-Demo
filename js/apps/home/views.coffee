define ["marionette", "ctrlVent", "text!./tpl/icon-item.html",
        "text!./tpl/empty.html"], (Marionette, ctrlVent, iconWrapperTpl, emptyTpl) ->
  IconItemView: class IconItemView extends Marionette.ItemView
    className: "icon-circle-wrapper"
    template: _.template iconWrapperTpl, null, variable: "data"
    events:
      "click": "select"

    select: ->
      ctrlVent.events.trigger "icon:clicked", @model.get "name"

  EmptyView: class EmptyView extends Marionette.ItemView
    className: "empty-wrapper"
    template: _.template emptyTpl

  ContentView: class ContentView extends Marionette.CollectionView
    className: "air-icons"
    itemView: IconItemView
    emptyView: EmptyView