define ["app", "marionette", "text!./tpl/slider-tpl.html",
        "text!./tpl/img-tpl.html",
        "text!./tpl/dot-cmd-tpl.html"], (App, Marionette, sliderTpl, imgTpl, dotCmdTpl) ->
  ImageView: class ImageView extends Marionette.ItemView
    tagName: "li"
    template: _.template imgTpl, null, variable: "data"

  SliderView: class SliderView extends Marionette.CompositeView
    template: _.template sliderTpl
    id: "slider-modal"
    className: "modal fade"
    itemView: ImageView
    itemViewContainer: ".slider-list"
    attributes:
      tabindex: "-1"
      role: "dialog"
      "aria-labeledby": "imageSlider"
      "aria-hidden": "true"
    ui:
      "dot": ".dot-commands li"
    events:
      "click @ui.dot": "select"
      "hidden.bs.modal.slider": "hidden"
    timeout: 0
    dotCmdTpl: _.template dotCmdTpl, null, variable: "data"
    isItemAdded: false

    onShow: ->
      App.commands.setHandler "show:slider", =>
        @$el.modal "show"

    onClose: ->
      App.commands.removeHandler "show:slider"

    onAfterItemAdded: ->
      className = ""
      unless @isItemAdded
        @isItemAdded = true
        className = "dot-animation"
      @$(".dot-commands").append @dotCmdTpl
        className: className

    hidden: ->
      App.Router.navigate "home"

    select: (e)->
      $target = $ e.currentTarget
      order = $target.index()
      $slider = $ "#slider .slider-list"
      @controlAnimation $slider, order, no

      clearTimeout @timeout if @timeout
      @timeout = setTimeout =>
        $slider.animate
          left: 0
        , 1000, =>
          @controlAnimation $slider, order, yes
      , 3000

    controlAnimation: ($slider, order, start)->
      $progress = $ ".slider-progress"
      $dots = $(".dot-commands").find ".dot-cmd"
      $dotCmd = $dots.eq 0
      $dot = $dots.eq order
      dotColor = "#bd9b83"
      $dots.removeAttr "style"
      if start
        op = "addClass"
      else
        op = "removeClass"
        $slider.css "left", "#{-order * 100}%"
        $dot.css "background-color", dotColor
      $slider[op] "slider-animation"
      $progress[op] "progress-animation"
      $dotCmd[op] "dot-animation"