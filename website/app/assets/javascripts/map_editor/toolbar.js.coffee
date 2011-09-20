//= require ./canvas.js

class window.Toolbar
  constructor: (canvas) ->
    @canvas = canvas
    @currentTool = new FreeHandTool(canvas)
    @canvas.bind("mouseDown", @currentTool.mouseDown)
    @canvas.bind("mouseUp", @currentTool.mouseUp)
