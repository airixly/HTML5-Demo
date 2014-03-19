define ["marionette", "ctrlVent", "text!./tpl/icon-item.html",
        "text!./tpl/empty.html",
        "text!./tpl/main-layout-tpl.html"], (Marionette, ctrlVent, iconWrapperTpl, emptyTpl, mainLayoutTpl) ->
  IconItemView: class IconItemView extends Marionette.ItemView
    className: "icon-container"
    template: _.template iconWrapperTpl, null, variable: "data"

  EmptyView: class EmptyView extends Marionette.ItemView
    className: "empty-wrapper"
    template: _.template emptyTpl

  IconsView: class IconsView extends Marionette.CollectionView
    className: "air-icons"
    itemView: IconItemView
    emptyView: EmptyView

  MainLayout: class MainLayout extends Marionette.Layout
    template: _.template mainLayoutTpl
    className: "main-content"
    regions:
      homeRegion: "#home-region"
      sliderRegion: "#slider-region"
      uploadRegion: "#upload-region"
