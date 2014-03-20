define ["app", "backbone", "./views"], (App, Backbone, Views) ->
  getFileUploadView: ->
    @fileUploadView = new Views.FileUploadView
      collection: new Backbone.Collection

    @fileUploadView.on "show", =>
      @files = new FormData()
      @bindUploadEvents()

    @fileUploadView.on "close", ->
      App.commands.removeHandler "show:upload"

  bindUploadEvents: ->
    App.commands.setHandlers
      "show:upload": =>
        @fileUploadView.$el.modal "show"
      "start:upload": =>
        @fileUploadView.collection.each (model)=>
          unless model.get "isUploaded" is yes
            model.set "isUploaded", yes
            @files.append @uid(), model.get "file"
        $.ajax
          url: "/upload"
          type: "post"
          contentType: false
          processData: false
          data: @files
          success: =>
            @files = new FormData()
            console.log "done"
          error: =>
            console.log "error"

    App.vent.on "append:files", (files)=>
      @fileUploadView.collection.add @createFileModel file for file in files

  createFileModel: (file)->
    new Backbone.Model
      file: file
      name: file.name
      size: file.size
      isUploaded: no

  s4: ->
    ((1 + Math.random()) * 0x10000 | 0).toString().substring(1)

  uid: ->
    res = ""
    len = 4
    res += @s4() while len-- > 0
    res