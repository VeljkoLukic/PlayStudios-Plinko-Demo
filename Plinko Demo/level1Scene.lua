local scene = {}

function scene:load() 
  gameScore = 0
  
  spawnPegs(6, 12)
  spawnDisc()
  spawnBoxes()
end

function scene:update()
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