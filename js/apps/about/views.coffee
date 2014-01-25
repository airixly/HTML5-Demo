define ["marionette", "text!./tpl/about-tpl.html"], (Marionette, aboutTpl) ->
  AboutView: class AboutView extends Marionette.ItemView
    template: _.template(aboutTpl)
    className: "container about-content"
