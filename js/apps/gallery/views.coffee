define ["underscore", "marionette", "ctrlVent",
        "text!./tpl/gallery-item-tpl.html"], (_, Marionette, ctrlVent, galleryItemTpl) ->
  IMG_HEIGHT = 200

  GalleryItemView: class GalleryItemView extends Marionette.ItemView
    template: _.template galleryItemTpl, null, variable: "data"
    className: "gallery-wrapper"
    modelEvents:
      "change": "resize"
    resize: ->
      @$(".img-thumbnail")
      .css
          width: @model.get "width"
          height: @model.get "height"
    onRender: ->
      @$("img")
      .error ->
          $(this)
          .hide()
          .siblings(".img-holder")
          .show()

  GalleryView: class GalleryView extends Marionette.CollectionView
    className: "gallery container"
    itemView: GalleryItemView

    onRender: ->
      $gallery = $ ".gallery"
      len = $gallery.length
      if @collection.length isnt 0 and len isnt 0
        $wrapper = $gallery.find ".gallery-wrapper"
        border = (parseInt $wrapper.css("border-left-width"), 10) + parseInt $wrapper.css("border-right-width"), 10
        #-webkit-scrollbar width:10px
        @resize $gallery.width() - 10, border
        $(window)
        .off("resize")
        .on "resize", =>
            $gallery = $ ".gallery"
            @resize $gallery.width() - 10, border

    onShow: ->
      ctrlVent.events.trigger "search:gallery"

    resize: (containerWidth, border)->
      row = 0
      start = 0
      totalWidth = 0
      photoArray = @resetPhotoWidth()
      arrayLen = photoArray.length
      while start < arrayLen
        #Calculate total width of the photos in current row
        while totalWidth * 1.1 < containerWidth
          totalWidth += photoArray[start++] + border
          break if start is arrayLen

        r = containerWidth / totalWidth
        totalWidth = 0
        i = row
        photos = []
        #Don't resize last row if total width is much less than container's width
        if r < 2
          while i < start
            #Calculate new width
            photoWidth = Math.floor photoArray[i] * r
            totalWidth += photoWidth + border
            photos.push photoWidth
            i++

          #Number of photos in current row
          i = i - row

          #Adjust width to fill container
          j = 0
          while totalWidth < containerWidth
            j = (j + 1) % i
            photos[j]++
            totalWidth++

          while totalWidth > containerWidth
            j = (j + 1) % i
            photos[j]--
            totalWidth--

        @changPhotoSize row + k, photo for photo,k in photos
        #Reset total width for next row
        totalWidth = 0
        #First photo of next row
        row = start

    changPhotoSize: (i, w)->
      @collection.at(i).set
        width: w
        height: IMG_HEIGHT

    resetPhotoWidth: ->
      if not _.isArray @photoArray
        @photoArray = []
        @collection.each (model) =>
          width = model.get "width"
          height = model.get "height"
          if width and height
            height = parseInt height, 10
            width = Math.floor (parseInt width, 10) * IMG_HEIGHT / height
            @photoArray.push width
      @photoArray
