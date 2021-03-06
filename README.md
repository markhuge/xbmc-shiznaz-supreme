xbmc-shiznaz-supreme
====================
> A utility module for talking to my XBMC

I wanted a lightweight wrapper to help some of my stuff talk to some of my other stuff. This isn't a fully featured XBMC API wrapper. I'm just adding things as I need them.

## Methods

### submit( *method, params, callback* )

A generic wrapper for API calls that send data to XBMC

- method   - Any of the methods outlined in the v6 spec [found hurrr](http://wiki.xbmc.org/index.php?title=JSON-RPC_API/v6)
- params   - An object containing whichever parameters the method is expecting
- callback - returns 3 params: [err, httpIncomingMsg, response] (straight out of [request](https://github.com/mikeal/request))

example:

```Coffeescript
XBMC = require 'xbmc-shiznaz-supreme'
xbmc = new XBMC
  uri: 'http://my-xbmc.local:8080'

xbmc.submit "GUI.ShowNotification",
  title  : "Msg from shiznaz supreme"
  message: "such notification"
  , (err,msg,response) ->
    console.log response
```

### notify( *title, msg image* )

Send a popup notification to your XBMC

- title - Notification title
- msg - Notification msg
- image - optional image url

example:

```Coffeescript
XBMC = require 'xbmc-shiznaz-supreme'
xbmc = new XBMC
  uri: 'http://my-xbmc.local:8080'

xbmc.notify "TERROR ALERT", "such notification", "http://assets.markhuge.com/images/doge.jpeg"
```

![notification](http://assets.markhuge.com/images/projects/xbmc-shiznaz-supreme/notification.png)

### stop( *playerid* )

Stop XBMC from playing

- playerid - optional player ID

example:

```Coffeescript
XBMC = require 'xbmc-shiznaz-supreme'
xbmc = new XBMC
  uri: 'http://my-xbmc.local:8080'

xbmc.stop()
```

### pause( *playerid* )

Pause/Resume the current player

- playerid - optional player ID

example:

```Coffeescript
XBMC = require 'xbmc-shiznaz-supreme'
xbmc = new XBMC
  uri: 'http://my-xbmc.local:8080'

xbmc.pause()
```

### getMovies( *callback* )

Get a list of movies in your library

- callback - accepts 2 arguments: 
  - err - error msg 
  - movies - a list of movie objects containing a `label` and `movieid`

example:

```Coffeescript
XBMC = require 'xbmc-shiznaz-supreme'
xbmc = new XBMC
  uri: 'http://my-xbmc.local:8080'

xbmc.getMovies (err,movies) ->
  console.log "My movies: ", movies
```


### getTVShows( *callback* )

Get a list of tv shows in your library

- callback - accepts 2 arguments: 
  - err - error msg 
  - shows - a list of tv show objects containing a `label` and `tvshowid`

example:

```Coffeescript
XBMC = require 'xbmc-shiznaz-supreme'
xbmc = new XBMC
  uri: 'http://my-xbmc.local:8080'

xbmc.getTVShows (err,shows) ->
  console.log "My tv shows: ", shows
```

### searchMovies( *query, callback* )

Search for movies in your library.

- query - a search string matching movie titles
- callback accepts 2 arguments:
  - err - error msg
  - movies - a list of matching movies

example:

```Coffeescript
XBMC = require 'xbmc-shiznaz-supreme'
xbmc = new XBMC
  uri: 'http://my-xbmc.local:8080'

xbmc.searchMovies "Indiana Jones", (err, movies) ->
  console.log "Movies matching Indiana Jones: ", movies
```

### searchTVShows( *query, callback* )

Search for movies in your library.

- query - a search string matching show titles
- callback accepts 2 arguments:
  - err - error msg
  - shows - a list of matching shows

example:

```Coffeescript
XBMC = require 'xbmc-shiznaz-supreme'
xbmc = new XBMC
  uri: 'http://my-xbmc.local:8080'

xbmc.searchTVShows "Warehouse 13", (err, shows) ->
  console.log "Shows matching Warehouse 13: ", shows
```