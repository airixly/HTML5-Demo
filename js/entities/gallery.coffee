define ["backbone", "ctrlVent"], (Backbone, ctrlVent)->
  class GalleryCollection extends Backbone.Collection
    initialize: ->
      ctrlVent.events.on "search:gallery", =>
        @fetchPhotos()

    fetchPhotos: ->
      $.ajax
        url: "http://api.flickr.com/services/feeds/photos_public.gne",
        data:
          tags: "saber,extra"
          tagmode: "all"
          format: "json"
        dataType: "jsonp"
        jsonp: "jsoncallback"
        success: (res) =>
          if res.items
            @parse item for item in res.items
            @reset res.items

    parse: (item)->
      item.media.m = item.media.m.replace /_m.jpg$/, "_z.jpg"
      item.width = item.description.match(/width="(\d+)"/)?[1]
      item.height = item.description.match(/height="(\d+)"/)?[1]

  ctrlVent.reqres.setHandler "gallery:entities", ->
    API.getGalleryEntities()

  API =
    getGalleryEntities: ->
      gallery = new GalleryCollection()