# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$ ->
  $('.create-album').on "click", ->
    console.log "TEST"
    create_album()

create_album = () ->
  params = 'album':
    'title': $('#album-title').val()
    'private': $('.privacy-type').prop('checked')
  $.ajax
    url: "/albums.json"
    type: "POST"
    data: params
    beforeSend: ->
      # Loading
      $('.create-album').button('loading')
    complete: ->
      # Loading
      $('.create-album').button('reset')
    error: ->
      # Log Error
    success: (response) ->
      console.log response
      $('#new-album-modal').modal('toggle')
      location.reload()
