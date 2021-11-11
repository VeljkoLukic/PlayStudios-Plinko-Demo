local scene = {}

local playButtonWidth = 280
local playButtonHeight = 90

local playButtonXPosition = (SCREEN_WIDTH / 2) - (playButtonWidth / 2)
local playButtonYPosition = (SCREEN_HEIGHT / 2)  - (playButtonHeight / 2)

local normalColor = { 1, 1, 1, 0.7 }
local highlightedColor = { 1, 1, 1, 0.9 }
local currentColor = normalColor

function scene:load() end

function scene:update(deltaTime) end

function scene:draw()

  local mouseX, mouseY = love.mouse.getPosition()

  local mouseOver = mouseX > playButtonXPosition and mouseX < playButtonXPosition + playButtonWidth
  and mouseY > playButtonYPosition and mouseY < playButtonYPosition + playButtonHeight

  if (mouseOver) then
  	currentColor = highlightedColor
    if (love.mouse.isDown(1)) then
      playGame()
      onMouseClick = false 
    end
  else
  	currentColor = normalColor
  end

  drawButton()

end

function drawButton()
  love.graphics.setColor (unpack(currentColor))
  love.graphics.rectangle ("fill", playButtonXPosition, playButtonYPosition, playButtonWidth, playButtonHeight)

  --button text
  love.graphics.setColor (0, 0, 0, 0.8)
  love.graphics.setFont(love.graphics.newFont(30))
  love.graphics.print("PLAY GAME", playButtonXPosition + 50, playButtonYPosition + 25)
end

function playGame()
  currentScene = gameplayScene
  currentScene.load()
end

return scene