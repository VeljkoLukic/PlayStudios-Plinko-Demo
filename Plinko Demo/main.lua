function love.load() 
  require("pegs")
  require("discs")
  require("boxes")
  require("score")
  require("mathHelper")

  SCREEN_WIDTH = 1280
  SCREEN_HEIGHT = 720

  quadTreeSegmentSize = 320

  mainMenuScene = require("mainMenuScene")
  level1Scene = require("level1Scene")
  level2Scene = require("level2Scene")

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
