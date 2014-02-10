require.config
  paths:
    jquery: "../bower_components/jquery/jquery"
    underscore: "../bower_components/underscore-amd/underscore"
    backbone: "../bower_components/backbone-amd/backbone"
    "backbone.wreqr": "../bower_components/backbone.wreqr/lib/amd/backbone.wreqr"
    "backbone.babysitter": "../bower_components/backbone.babysitter/lib/amd/backbone.babysitter"
    marionette: "../bower_components/marionette/lib/core/amd/backbone.marionette"
    text: "../bower_components/requirejs-text/text"
    bootstrap: "../bower_components/bootstrap/dist/js/bootstrap"
  shim:
    bootstrap:
      deps: ["jquery"]

require [
  "app"
,
  "apps/header/index"
,
  "apps/home/index"
,
  "apps/footer/index"
], (App) ->
  App.start()