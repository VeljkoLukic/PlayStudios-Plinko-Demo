boxWidth = 250
boxHeight = 70

boxTable = {}

function spawnBoxes()
  spacing = (SCREEN_WIDTH / boxWidth + 60)

  for i = 0, 2, 1 do    
    local newBox = {}
    newBox.points = math.floor(math.random() * 20) * 50
    newBox.x = (spacing * 3) + i * (spacing + boxWidth)
    newBox.y = SCREEN_HEIGHT - boxHeight
    table.insert(boxTable, newBox)
  end
end

function drawBoxes()
  for i, box in pairs(boxTable) do
    love.graphics.setColor (17/255, 201/255, 1, 0.6)
    love.graphics.rectangle ("fill", box.x, box.y, boxWidth, boxHeight)  
    
    --points text
    love.graphics.setColor(1, 1, 1, 0.8)
    love.graphics.setFont(love.graphics.newFont (30));
    love.graphics.print(box.points, box.x + boxWidth / 2.7, box.y + boxHeight / 4)
  end 
end
