class window.FreeHandTool
  constructor: (canvas) ->
    @canvas = canvas

  mouseDown: (initialPoint) =>
    @pathPoints = [initialPoint]
    @canvas.bind("mouseMoved", @mouseMoved)
    @path = @canvas.drawPath(@pathPoints)

  mouseMoved: (currentPoint) =>
    @pathPoints.push(currentPoint)
    @canvas.redrawPath(@path, @pathPoints)

  mouseUp: =>
    @canvas.unbind("mouseMoved", @mouseMoved)


