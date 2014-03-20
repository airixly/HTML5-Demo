define ["app", "marionette", "text!./tpl/upload-tpl.html",
        "text!./tpl/upload-item-tpl.html",
        "text!./tpl/empty-item-tpl.html"], (App, Marionette, uploadTpl, uploadItemTpl, emptyItemTpl) ->
  UploadItemView: class UploadItemView extends Marionette.ItemView
    className: "row upload-item"
    template: _.template uploadItemTpl, null, variable: "data"
    ui:
      delBtn: ".file-del-btn"
    triggers:
      "click @ui.delBtn": "remove:item"

  EmptyItemView: class EmptyItemView extends Marionette.ItemView
    className: "drop-message"
    template: _.template emptyItemTpl

  FileUploadView: class FileUploadView extends Marionette.CompositeView
    template: _.template uploadTpl
    id: "file-upload-modal"
    className: "modal fade"
    itemView: UploadItemView
    itemViewContainer: ".file-content"
    emptyView: EmptyItemView
    attributes:
      tabindex: "-1"
      role: "dialog"
      "aria-labeledby": "imageSlider"
      "aria-hidden": "true"
    ui:
      selectBtn: "#file-upload"
      dropZone: ".file-drop-zone"
      uploadBtn: ".file-start"
    events:
      "hidden.bs.modal.upload": "hidden"
      "change @ui.selectBtn": "addFiles"
      "dragenter @ui.dropZone": "preventDefault"
      "dragover @ui.dropZone": "preventDefault"
      "drop @ui.dropZone": "addFiles"
      "click @ui.uploadBtn": "upload"
    itemEvents:
      "remove:item": (view, args)->
        @collection.remove args.model
        @resetFileInput()

    onBeforeItemAdded: (view) ->
      method = if @collection.indexOf(view.model) is -1 then "remove" else "add"
      @uploadHeadView.$el[method + "Class"] "active"

    onCompositeCollectionBeforeRender: ->
      @appendHtml @, @getUploadHeadView()

    resetFileInput: ->
      @ui.selectBtn.replaceWith @ui.selectBtn = @ui.selectBtn.clone true

    getUploadHeadView: ->
      @uploadHeadView = new UploadItemView
        model: new Backbone.Model
          name: "Name"
          size: "Size"
      .render()

    onClose: ->
      @uploadHeadView.close()

    addFiles: (e)->
      @preventDefault e
      files = if e.type is "drop" then e.originalEvent.dataTransfer.files else e.currentTarget.files
      @appendFiles files
      @resetFileInput()

    appendFiles: (files)->
      App.vent.trigger "append:files", files

    upload: ->
      App.commands.execute "start:upload"

    preventDefault: (e)->
      e.preventDefault()

    hidden: ->
      App.commands.execute "reset:home"