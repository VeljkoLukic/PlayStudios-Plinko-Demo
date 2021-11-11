function drawScore()
	love.graphics.setColor (1, 1, 1, 0.8)
	love.graphics.setFont(love.graphics.newFont(30))
	love.graphics.print(gameScore, 30, 30)
end