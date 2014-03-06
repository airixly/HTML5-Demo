require.config
  paths:
    jquery: "../vendor/jquery/jquery"
    underscore: "../vendor/underscore-amd/underscore"
    backbone: "../vendor/backbone-amd/backbone"
    "backbone.wreqr": "../vendor/backbone.wreqr/lib/amd/backbone.wreqr"
    "backbone.babysitter": "../vendor/backbone.babysitter/lib/amd/backbone.babysitter"
    marionette: "../vendor/marionette/lib/core/amd/backbone.marionette"
    text: "../vendor/requirejs-text/text"
    bootstrap: "../vendor/bootstrap/dist/js/bootstrap"
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
,
  "apps/slider/index"
], (App) ->
  App.start()