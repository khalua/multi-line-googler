window.app =
    search_items: null
    ready: ->
      $('.search_form').on('click','#googler', app.search_google)

    search_google: (e) ->
      e.preventDefault()
      app.search_items = $('.search_box').val().split('\n')
      console.log(app.search_items)
      _.each(app.search_items,app.open_google_tab)

    open_google_tab: (search) ->
      console.log(search)
      a = document.createElement("a")
      a.href = "http://www.google.com/search?q=#{search}"
      evt = document.createEvent("MouseEvents")
      evt.initMouseEvent("click", true, true, window, 0, 0, 0, 0, 0,
                                  true, false, false, true, 0, null)
      a.dispatchEvent(evt)

$(document).ready(app.ready)
