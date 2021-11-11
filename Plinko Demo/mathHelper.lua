function getDistance(pointA, pointB)
  deltaX = pointA.x - pointB.x
  deltaY = pointA.y - pointB.y
  
  distance = math.sqrt((deltaX * deltaX) + (deltaY * deltaY))  
  
  return distance
end