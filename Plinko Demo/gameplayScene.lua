local scene = {}

function scene:load()
  gridSegmentSize = 70
  
  gameScore = 0
  
  spawnPegs()
  spawnDisc()
  spawnBoxes()
end

function scene:update(deltaTime)
  handleDiscMovement()
end

function scene:draw()
  drawPegs()  
  drawDiscs()
  drawBoxes()
  drawScore()
end

function love.mousepressed (x, y, button)
  if ((button == 1) and (onMouseClick == false)) then
    onMouseClick = true
  end
end

return scene