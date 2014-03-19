define ["app", "marionette", "ctrlVent", "text!./tpl/upload-tpl.html"], (App, Marionette, ctrlVent, uploadTpl) ->
  FileUploadView: class FileUploadView extends Marionette.CompositeView
    template: _.template uploadTpl
    id: "file-upload-modal"
    className: "modal fade"
    attributes:
      tabindex: "-1"
      role: "dialog"
      "aria-labeledby": "imageSlider"
      "aria-hidden": "true"
    events:
      "hidden.bs.modal.upload": "hidden"

    hidden: ->
      App.Router.navigate "home"

    onShow: ->
      ctrlVent.commands.setHandler "show:upload", =>
        @$el.modal "show"

    onClose: ->
      ctrlVent.commands.removeHandler "show:upload"