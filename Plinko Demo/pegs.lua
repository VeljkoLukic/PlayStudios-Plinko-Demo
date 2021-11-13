local pegRadius = 10
local pegTable = {}
pegQuadTree = {}

PEG_GRID_KEY_DELIMITER = "|"

function spawnPegs(rows, columns)
  local spacing = 70
  local spawnX = (SCREEN_WIDTH - ((spacing + pegRadius / 4) * columns)) / 2
	local spawnY = SCREEN_HEIGHT / 6
  
  for rows = 0, rows, 1 do
    for columns = 0, columns, 1 do
      local newPeg = {}
      newPeg.x = spawnX + (spacing * columns)
      newPeg.y = spawnY + (spacing * rows)
      
      if (rows % 2 == 0) then
        newPeg.x = newPeg.x + spacing / 2
      end
      
      table.insert(pegTable, newPeg)
      
      --add peg to its dedicated quad-tree-like segment to be pulled as needed
      local pegRow = math.floor(newPeg.y / quadTreeSegmentSize)
      local pegColumn = math.floor(newPeg.x / quadTreeSegmentSize)
      
      if (not pegQuadTree[pegRow .. PEG_GRID_KEY_DELIMITER .. pegColumn]) then
        pegQuadTree[pegRow .. PEG_GRID_KEY_DELIMITER .. pegColumn] = {}
      end
  
      table.insert (pegQuadTree[pegRow .. PEG_GRID_KEY_DELIMITER .. pegColumn], newPeg)
    end
  end  
end

function drawPegs() 
  for i, peg in pairs(pegTable) do  
    love.graphics.setColor (17/255, 1, 170/255, 0.7)
    love.graphics.circle ("fill", peg.x, peg.y, pegRadius)
  end  
end
