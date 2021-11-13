local scene = {}

local buttonsYPosition = (SCREEN_HEIGHT / 2)

function scene:load() end

function scene:update(deltaTime) end

function scene:draw()

  love.graphics.setColor (1, 1, 1, 0.8)
  love.graphics.setFont(love.graphics.newFont(30))
  love.graphics.print("Press 1 to play level 1", (SCREEN_WIDTH / 3), buttonsYPosition - 60)
  love.graphics.print("Press 2 to play level 2", (SCREEN_WIDTH / 3), buttonsYPosition)

  if (love.keyboard.isDown("1")) then
    playGame(level1Scene)
  elseif (love.keyboard.isDown("2")) then
    playGame(level2Scene)
  end

end

function playGame(sceneToLoad)
  currentScene = sceneToLoad
  currentScene.load()
  onMouseClick = false
end

return scene