define ["app", "marionette", "text!./tpl/slider-tpl.html",
        "text!./tpl/img-tpl.html",
        "text!./tpl/dot-cmd-tpl.html"], (App, Marionette, sliderTpl, imgTpl, dotCmdTpl) ->
  ImageView: class ImageView extends Marionette.ItemView
    tagName: "li"
    template: _.template imgTpl, null, variable: "data"

  SliderView: class SliderView extends Marionette.CompositeView
    template: _.template sliderTpl
    id: "slider-modal"
    className: "hidden"
    itemView: ImageView
    itemViewContainer: ".slider-list"
    ui:
      "dot": ".dot-commands li"
      "slider": ".slider-list"
    events:
      "click @ui.dot": "select"
    timeout: 0
    dotCmdTpl: _.template dotCmdTpl, null, variable: "data"
    isItemAdded: false

    onShow: ->
      @listenTo App.vent, "show:slider", ->
        @$el.removeClass "hidden"

    onAfterItemAdded: ->
      className = ""
      unless @isItemAdded
        @isItemAdded = true
        className = "dot-animation"
      @$(".dot-commands").append @dotCmdTpl
        className: className

    select: (e)->
      $target = $ e.currentTarget
      order = $target.index()
      @controlAnimation @ui.slider, order, no

      clearTimeout @timeout if @timeout

      @timeout = setTimeout =>
        @ui.slider.animate
          left: 0
        , 1000, =>
          @controlAnimation @ui.slider, order, yes
      , 3000

    controlAnimation: ($slider, order, start)->
      $progress = $ ".slider-progress"
      $dots = $(".dot-commands").find ".dot-cmd"
      $dotCmd = $dots.eq 0
      $dot = $dots.eq order
      $dots.removeClass "active"
      if start
        op = "addClass"
      else
        op = "removeClass"
        $slider.css "left", "#{-order * 100}%"
        $dot.addClass "active"
      $slider[op] "slider-animation"
      $progress[op] "progress-animation"
      $dotCmd[op] "dot-animation"