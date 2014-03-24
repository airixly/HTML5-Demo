define ["app", "./views"], (App, Views) ->
  showFooter: ->
    footers = App.reqres.request "footer:entities"
    footerView = @getFooter footers
    App.footer.show footerView

  getFooter: (footers)->
    new Views.FooterView
      collection: footers