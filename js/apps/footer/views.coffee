define ["app", "marionette", "text!./tpl/footer.html",
        "text!./tpl/footer-item.html"], (App, Marionette, footerTpl, footerItemTpl) ->
  FooterItemView: class FooterItemView extends Marionette.ItemView
    template: _.template footerItemTpl, null, variable: "data"
    tagName: "li"

  FooterView: class FooterView extends Marionette.CompositeView
    template: _.template footerTpl
    className: "container"
    itemView: FooterItemView
    itemViewContainer: ".footer-list"