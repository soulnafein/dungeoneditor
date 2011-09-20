class window.Canvas extends Backbone.View
  el: $('#canvas')

  events:
    'mousedown' : "raiseMouseDown"

  initialize: ->
    @paper = Raphael(document.getElementById('canvas'), 500, 500)
    $(window).bind('mousemove', @raiseMouseMoved)
    $(window).bind('mouseup', @raiseMouseUp)

  raiseMouseDown: (event) =>
    relativeCoords = @calculateRelativeCoords(event.pageX, event.pageY)
    @trigger("mouseDown", relativeCoords)

  raiseMouseMoved: (event) =>
    relativeCoords = @calculateRelativeCoords(event.pageX, event.pageY)
    @trigger("mouseMoved", relativeCoords)

  raiseMouseUp: =>
    @trigger("mouseUp")

  drawStroke: (coords) ->
    circle = @paper.circle(coords.x, coords.y, 10)
    circle.attr("fill", "#f00")

  drawPath: (pathPoints) ->
    firstPoint = _.first(pathPoints)
    otherPoints = _.rest(pathPoints)
    svgPathString = "M#{firstPoint.x} #{firstPoint.y}"
    _(otherPoints).map (point) -> "L#{point.x} #{point.y}"
    @paper.path(svgPathString).attr("stroke", "#f00")

  redrawPath: (path, pathPoints) ->
    firstPoint = _.first(pathPoints)
    otherPoints = _.rest(pathPoints)
    svgPathString = "M#{firstPoint.x} #{firstPoint.y}"
    _(otherPoints).each (point) -> 
      svgPathString += "L#{point.x} #{point.y}"
    path.attr({path: svgPathString, stroke: "#f00"})


  calculateRelativeCoords: (absoluteX, absoluteY) ->
    offset = $(@el).offset();
    relativeX = absoluteX - offset.left;
    relativeY = absoluteY - offset.top;
    return {x: relativeX, y: relativeY}



