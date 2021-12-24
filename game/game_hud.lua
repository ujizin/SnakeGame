function drawHUD()
    love.graphics.setColor(1, 1, 1, 1)
    drawScore()
    drawTurbo()
end

function drawScore()
    local scoreText = "Score: " .. SCORE
    local font = love.graphics.newFont(24)
    local fh = font:getHeight()
    local height = love.graphics.getHeight() - fh - 20
    local width = love.graphics.getWidth() - 150

    love.graphics.setFont(font)
    love.graphics.print(scoreText, width, height)
end

function drawTurbo()
    local color = turbo.isEmpty and RED or GREEN
    local height = love.graphics.getHeight()

    -- love.graphics.setColor(unpack(color))

    local turboWidth = 300
    local turboHeight = 20
    local turboX = 25
    local turboY = height - 40

    love.graphics.setColor(unpack(BROWN))
    love.graphics.rectangle('line', turboX, turboY, turboWidth, turboHeight)
    
    love.graphics.setFont(love.graphics.newFont(12))
    love.graphics.print("Turbo (Space)", turboX, height - 60)

    local currentTurbo

    if turbo.speed > 0 then
        currentTurbo = (turboWidth / MAX_TURBO_SPEED) * turbo.speed
    elseif turbo.timer > 0 then
        currentTurbo = (turboWidth / MAX_TURBO_TIMER) * -(turbo.timer - MAX_TURBO_TIMER)
    else 
        currentTurbo = turboWidth
    end


    love.graphics.setColor(unpack(color))
    love.graphics.rectangle('fill', turboX + 1, turboY + 1, currentTurbo - 2, turboHeight - 2)
end
