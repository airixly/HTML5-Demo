// Generated by CoffeeScript 1.6.3
(function() {
  var __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  define(["underscore", "marionette", "text!./tpl/gallery-item-tpl.html"], function(_, Marionette, galleryItemTpl) {
    var GalleryItemView, GalleryView, IMG_HEIGHT, _ref, _ref1;
    IMG_HEIGHT = 200;
    return {
      GalleryItemView: GalleryItemView = (function(_super) {
        __extends(GalleryItemView, _super);

        function GalleryItemView() {
          _ref = GalleryItemView.__super__.constructor.apply(this, arguments);
          return _ref;
        }

        GalleryItemView.prototype.template = _.template(galleryItemTpl, null, {
          variable: "data"
        });

        GalleryItemView.prototype.className = "gallery-wrapper";

        GalleryItemView.prototype.modelEvents = {
          "change": "resize"
        };

        GalleryItemView.prototype.resize = function() {
          return this.$(".img-thumbnail").css({
            width: this.model.get("width"),
            height: this.model.get("height")
          });
        };

        GalleryItemView.prototype.onRender = function() {
          return this.$("img").error(function() {
            return $(this).hide().siblings(".img-holder").show();
          });
        };

        return GalleryItemView;

      })(Marionette.ItemView),
      GalleryView: GalleryView = (function(_super) {
        __extends(GalleryView, _super);

        function GalleryView() {
          _ref1 = GalleryView.__super__.constructor.apply(this, arguments);
          return _ref1;
        }

        GalleryView.prototype.className = "gallery container";

        GalleryView.prototype.itemView = GalleryItemView;

        GalleryView.prototype.onRender = function() {
          var $gallery, $wrapper, border, len,
            _this = this;
          $gallery = $(".gallery");
          len = $gallery.length;
          if (this.collection.length !== 0 && len !== 0) {
            $wrapper = $gallery.find(".gallery-wrapper");
            border = (parseInt($wrapper.css("border-left-width"), 10)) + parseInt($wrapper.css("border-right-width"), 10);
            this.resize($gallery.width(), border);
            return $(window).off("resize").on("resize", function() {
              $gallery = $(".gallery");
              return _this.resize($gallery.width(), border);
            });
          }
        };

        GalleryView.prototype.resize = function(containerWidth, border) {
          var arrayLen, i, j, k, photo, photoArray, photoWidth, photos, r, row, start, totalWidth, _i, _len, _results;
          row = 0;
          start = 0;
          totalWidth = 0;
          photoArray = this.resetPhotoWidth();
          arrayLen = photoArray.length;
          _results = [];
          while (start < arrayLen) {
            while (totalWidth * 1.1 < containerWidth) {
              totalWidth += photoArray[start++] + border;
              if (start === arrayLen) {
                break;
              }
            }
            r = containerWidth / totalWidth;
            totalWidth = 0;
            i = row;
            photos = [];
            if (r < 2) {
              while (i < start) {
                photoWidth = Math.floor(photoArray[i] * r);
                totalWidth += photoWidth + border;
                photos.push(photoWidth);
                i++;
              }
              i = i - row;
              j = 0;
              while (totalWidth < containerWidth) {
                j = (j + 1) % i;
                photos[j]++;
                totalWidth++;
              }
              while (totalWidth > containerWidth) {
                j = (j + 1) % i;
                photos[j]--;
                totalWidth--;
              }
            }
            for (k = _i = 0, _len = photos.length; _i < _len; k = ++_i) {
              photo = photos[k];
              this.changPhotoSize(row + k, photo);
            }
            totalWidth = 0;
            _results.push(row = start);
          }
          return _results;
        };

        GalleryView.prototype.changPhotoSize = function(i, w) {
          return this.collection.at(i).set({
            width: w,
            height: IMG_HEIGHT
          });
        };

        GalleryView.prototype.resetPhotoWidth = function() {
          var _this = this;
          if (!_.isArray(this.photoArray)) {
            this.photoArray = [];
            this.collection.each(function(model) {
              var height, width;
              width = model.get("width");
              height = model.get("height");
              if (width && height) {
                height = parseInt(height, 10);
                width = Math.floor((parseInt(width, 10)) * IMG_HEIGHT / height);
                return _this.photoArray.push(width);
              }
            });
          }
          return this.photoArray;
        };

        return GalleryView;

      })(Marionette.CollectionView)
    };
  });

}).call(this);