define ["marionette", "app", "text!./tpl/about-tpl.html"], (Marionette, App, aboutTpl) ->
  AboutView: class AboutView extends Marionette.ItemView
    template: _.template(aboutTpl)
    className: "container about-content"

    onShow: ->
      App.vent.trigger "header:select", yes