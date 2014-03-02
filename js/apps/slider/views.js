// Generated by CoffeeScript 1.6.3
(function() {
  var __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  define(["app", "marionette", "text!./tpl/slider-tpl.html"], function(App, Marionette, sliderTpl) {
    var SliderView, _ref;
    return {
      SliderView: SliderView = (function(_super) {
        __extends(SliderView, _super);

        function SliderView() {
          _ref = SliderView.__super__.constructor.apply(this, arguments);
          return _ref;
        }

        SliderView.prototype.template = _.template(sliderTpl);

        SliderView.prototype.id = "slider-modal";

        SliderView.prototype.className = "modal fade";

        SliderView.prototype.attributes = {
          tabindex: "-1",
          role: "dialog",
          "aria-labeledby": "imageSlider",
          "aria-hidden": "true"
        };

        SliderView.prototype.ui = {
          "dot": ".dot-commands li"
        };

        SliderView.prototype.events = {
          "click @ui.dot": "select",
          "hidden.bs.modal": "hidden"
        };

        SliderView.prototype.timeout = 0;

        SliderView.prototype.hidden = function() {
          return App.Router.navigate("home");
        };

        SliderView.prototype.select = function(e) {
          var $dot, $dotCmd, $dots, $progress, $slider, $target, order, sliderX;
          $target = $(e.currentTarget);
          order = $target.index();
          $progress = $(".slider-progress");
          $dots = $(".dot-commands").find(".dot-cmd");
          $dotCmd = $dots.eq(0);
          $dot = $dots.eq(order);
          $slider = $("#slider .slider-list");
          sliderX = "" + (-order * 100) + "%";
          $dotCmd.removeClass("dot-animation");
          $slider.removeClass("slider-animation").css("left", sliderX);
          $progress.removeClass("progress-animation");
          $dots.removeAttr("style");
          $dot.css("background-color", "#bd9b83");
          if (this.timeout) {
            clearTimeout(this.timeout);
          }
          return this.timeout = setTimeout(function() {
            return $slider.animate({
              left: 0
            }, 1000, function() {
              $slider.add($dots).removeAttr("style");
              $dotCmd.addClass("dot-animation");
              $slider.addClass("slider-animation");
              return $progress.addClass("progress-animation");
            });
          }, 3000);
        };

        return SliderView;

      })(Marionette.ItemView)
    };
  });

}).call(this);
