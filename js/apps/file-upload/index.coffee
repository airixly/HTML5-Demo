define ["./controller", "bootstrap"], (Controller) ->
  API =
    getFileUploadView: ->
      Controller.getFileUploadView()