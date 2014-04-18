request = require 'request'

class XBMC
  constructor: (options = {}) ->
    {@uri} = options

  submit: (method, params, callback) ->
    req = JSON.stringify { "jsonrpc": "2.0", "method": method, "params": params, "id": 1 }
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

module.exports = XBMC

