# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
#= require dropzone
$ ->
  # Click Event
  $('.create-album').on "click", ->
    create_album()
  # Modal Hide event
  $('#new-pictures-modal').on "hidden.bs.modal", ->
    location.reload()

# Create a new album
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
      $('#new-album-modal').modal('toggle')
      reload_site()


# Relaod Site
reload_site = () ->
  location.reload()

