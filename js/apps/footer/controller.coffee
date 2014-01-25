define ["app", "./views"], (App, Views) ->
  showFooter: (footers)->
    footerView = @getFooter footers
    App.footer.show footerView

  getFooter: (footers)->
    new Views.FooterView
      collection: footers