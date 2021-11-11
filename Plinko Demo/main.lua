function love.load() 
  require("pegs")
  require("discs")
  require("boxes")
  require("score")
  require("mathHelper")

  SCREEN_WIDTH = 1000
  SCREEN_HEIGHT = 720

  mainMenuScene = require("mainMenuScene")
  gameplayScene = require("gameplayScene")

  love.window.setMode(SCREEN_WIDTH, SCREEN_HEIGHT)
  
  love.graphics.setBackgroundColor(20/255, 30/255, 40/255)

  onMouseClick = false

  currentScene = mainMenuScene
  
  if (currentScene.load) then
    currentScene.load()
  end
end

function love.update()
  if (currentScene.update) then
    currentScene.update()
  end
end

function love.draw()
  if (currentScene.draw) then
    currentScene.draw()
  end
end
