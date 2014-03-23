define ["app", "./views"], (App, Views) ->
  getFileUploadView: ->
    new Views.FileUploadView
      collection: new Backbone.Collection