$(document).ready ->
  paper = Raphael(document.getElementById("paper"), 300, 200)
  circle = paper.circle(100, 50, 40)
  circle.attr('fill', 'red');
  
  $('paper').mousedown ->
    
