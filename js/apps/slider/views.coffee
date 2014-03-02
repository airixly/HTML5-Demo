define ["app", "marionette", "text!./tpl/slider-tpl.html"], (App, Marionette, sliderTpl) ->
  SliderView: class SliderView extends Marionette.ItemView
    template: _.template sliderTpl
    id: "slider-modal"
    className: "modal fade"
    attributes:
      tabindex: "-1"
      role: "dialog"
      "aria-labeledby": "imageSlider"
      "aria-hidden": "true"
    ui:
      "dot": ".dot-commands li"
    events:
      "click @ui.dot": "select"
      "hidden.bs.modal": "hidden"
    timeout: 0

    hidden: ->
      App.Router.navigate "home"

    select: (e)->
      $target = $ e.currentTarget
      order = $target.index()
      $progress = $ ".slider-progress"
      $dots = $(".dot-commands").find ".dot-cmd"
      $dotCmd = $dots.eq 0
      $dot = $dots.eq order
      $slider = $ "#slider .slider-list"
      sliderX = "#{-order * 100}%"
      $dotCmd.removeClass "dot-animation"
      $slider.removeClass("slider-animation").css "left", sliderX
      $progress.removeClass "progress-animation"
      $dots.removeAttr "style"
      $dot.css "background-color", "#bd9b83"
      clearTimeout @timeout if @timeout
      @timeout = setTimeout ->
        $slider.animate
          left: 0
        , 1000, ->
          $slider.add($dots).removeAttr "style"
          $dotCmd.addClass "dot-animation"
          $slider.addClass "slider-animation"
          $progress.addClass "progress-animation"
      , 3000


