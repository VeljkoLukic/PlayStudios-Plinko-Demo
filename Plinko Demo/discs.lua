local discRadius = 10

local airResistance = 0.9811
local gravityFactor = 0.5121

local discTable = {}

function spawnDisc()
  local newDisc = {}
  
  newDisc.x = love.mouse.getX ()
  newDisc.y = 45
  
  newDisc.xVelocity = (math.random (-5, 5))
  newDisc.yVelocity = 0
  newDisc.ready = false
  newDisc.enabled = true
  
  table.insert (discTable, newDisc)
end

function drawDiscs()
  for i, disc in pairs(discTable) do
    if (disc.enabled) then
      love.graphics.setColor (1, 17/255, 85/255, 0.8)
      love.graphics.circle ("fill", disc.x, disc.y, discRadius)
    end
  end  
end

function handleDiscMovement()
  
  for i, disc in pairs(discTable) do
    if (disc.enabled) then      
      if (not disc.ready) then
        disc.x = love.mouse.getX ()
        if (onMouseClick) then
          disc.ready = true
          spawnDisc ()
          onMouseClick = false
        end
        return
      end
      
      disc.xVelocity = disc.xVelocity * airResistance
      disc.yVelocity = disc.yVelocity * airResistance
      disc.yVelocity = disc.yVelocity + gravityFactor
      
      local newDiscPosition = {}
      newDiscPosition.x = disc.x + disc.xVelocity
      newDiscPosition.y = disc.y + disc.yVelocity

      local collidedWithPeg = onPegCollision(newDiscPosition)
      local collidedWithBox = onBoxCollision(disc)

      --bounce off side walls
      if (newDiscPosition.x + discRadius >= SCREEN_WIDTH or newDiscPosition.x - discRadius <= 0) then
        disc.xVelocity = disc.xVelocity * -1
      end
      
      if (not collidedWithPeg) then
        disc.y = disc.y + disc.yVelocity
        disc.x = disc.x + disc.xVelocity
      else
        disc.xVelocity = disc.xVelocity * -1
        disc.yVelocity = disc.yVelocity * -1

        --adding a bit of randomness depending on disc x direction
        if (math.abs(disc.xVelocity) < 2.2) then
          if (disc.xVelocity > 0) then
            disc.xVelocity = disc.xVelocity + (math.random() + 3)
          else
            disc.xVelocity = disc.xVelocity - (math.random() + 3)
          end	
        end
      end
    end
  end
end

function onPegCollision(disc)
  --load the nearest pegs
  local pegRow = math.floor(disc.y / gridSegmentSize)
  local pegColumn = math.floor(disc.x / gridSegmentSize)
  local nearbyPegs = pegGrid[pegRow .. PEG_GRID_KEY_DELIMITER .. pegColumn]

  if (not nearbyPegs) then
    return
  end
  
  for i, peg in pairs(nearbyPegs) do
    local distance = getDistance(disc, peg)
    if (distance <= discRadius * 2) then      
      return true
    end
  end 
  return false
end

function onBoxCollision(disc)
  for i, box in pairs(boxTable) do
    local overlap = disc.y > box.y and disc.y < box.y + boxHeight and disc.x > box.x and disc.x < box.x + boxWidth
    if (overlap) then
      if (disc.enabled) then
        gameScore = gameScore + box.points
        disc.enabled = false
      end
    end
  end
end