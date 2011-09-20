//= require ./toolbar.js
//= require ./canvas.js

class MapEditor
  constructor: ->
    @canvas = new Canvas
    @toolbar = new Toolbar(@canvas)

$(document).ready ->
  window.mapEditor = new MapEditor

