local pegRadius = 10
local pegTable = {}
pegGrid = {}

PEG_GRID_KEY_DELIMITER = "|"

function spawnPegs()
  local spacing = 70
  local spawnX = spacing - 10
	local spawnY = SCREEN_HEIGHT / 6
  
  for rows = 0, 6, 1 do
    for columns = 0, 12, 1 do
      local newPeg = {}
      newPeg.x = spawnX + (spacing * columns)
      newPeg.y = spawnY + (spacing * rows)
      
      if (rows % 2 == 0) then
        newPeg.x = newPeg.x + spacing / 2
      end
      
      table.insert(pegTable, newPeg)
      
      --add peg to its dedicated grid segment to be pulled as needed
      local pegRow = math.floor(newPeg.y / gridSegmentSize)
      local pegColumn = math.floor(newPeg.x / gridSegmentSize)
      
      if (not pegGrid[pegRow .. PEG_GRID_KEY_DELIMITER .. pegColumn]) then
        pegGrid[pegRow .. PEG_GRID_KEY_DELIMITER .. pegColumn] = {}
      end
  
      table.insert (pegGrid[pegRow .. PEG_GRID_KEY_DELIMITER .. pegColumn], newPeg)
    end
  end  
end

function drawPegs() 
  for i, peg in pairs(pegTable) do  
    love.graphics.setColor (17/255, 1, 170/255, 0.7)
    love.graphics.circle ("fill", peg.x, peg.y, pegRadius)
  end  
end
