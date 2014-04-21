request = require 'request'

class XBMC
  constructor: (options = {}) ->
    {@uri} = options

  submit: (method, params, callback) ->
    if params
      req = JSON.stringify { "jsonrpc": "2.0", "method": method, "params": params, "id": 1 }
    else
      req = JSON.stringify { "jsonrpc": "2.0", "method": method, "id": 1 }
    request
      method: 'post'
      uri: @uri + '/jsonrpc'
      json: true
      body: req
      , callback


  notify: (title, msg, image) ->
    @submit "GUI.ShowNotification",
      title: title
      message: msg
      image: image

  stop: (playerID) ->
    id = playerID || 0
    @submit "Player.Stop", playerid: id

  pause: (playerID) ->
    id = playerID || 0
    @submit "Player.PlayPause", playerid: id

  getMovies: (callback) ->
    @submit "VideoLibrary.GetMovies", null, (err,httpIncomingMsg,res) =>
      if err then return callback err
      if res?.result?.movies
        {@movies} = res.result
        callback null, @movies


module.exports = XBMC

