define ["marionette", "ctrlVent", "text!./tpl/icon-item.html",
        "text!./tpl/empty.html"], (Marionette, ctrlVent, iconWrapperTpl, emptyTpl) ->
  IconItemView: class IconItemView extends Marionette.ItemView
    className: "icon-container"
    template: _.template iconWrapperTpl, null, variable: "data"

  EmptyView: class EmptyView extends Marionette.ItemView
    className: "empty-wrapper"
    template: _.template emptyTpl

  ContentView: class ContentView extends Marionette.CollectionView
    className: "air-icons"
    itemView: IconItemView
    emptyView: EmptyView