player = {}
player.color = { 29 / 255, 209 / 255, 161/ 255, 1}
player.turboColor = { 230 / 255, 126 / 255, 34 / 255, 1}
player.size = 30
player.body = {}
player.lastKeyboard = nil

local moveX = 0
local moveY = 0
local isKeyboardPressed = false

function player:load()
    player.x = CENTER_X + CENTER_X % player.size
    player.y = CENTER_Y + CENTER_Y % player.size
    player:growUp(2)
end

function player:update(dt)
    if not isKeyboardPressed then
        if love.keyboard.isDown('a') and moveX <= 0 then
            updateMove(-player.size, 0)
        elseif love.keyboard.isDown('d') and moveX >= 0 then
            updateMove(player.size, 0)
        elseif love.keyboard.isDown('w') and moveY <= 0 then
            updateMove(0, -player.size)
        elseif love.keyboard.isDown('s') and moveY >= 0 then
            updateMove(0, player.size)
        end
    end
end

function updateMove(x, y)
    isKeyboardPressed = true
    moveX = x
    moveY = y
end

function player:move()
    player:movePosition()

    table.insert(player.body, 1, generateBody(player))
    table.remove(player.body)
end

function player:movePosition()
    isKeyboardPressed = false
    player.x = updatePosition(player.x, moveX, WINDOW.WIDTH)
    player.y = updatePosition(player.y, moveY, WINDOW.HEIGHT)
end

function updatePosition(size, move, maxSize)
    local updateSize = size + move

    if updateSize >= maxSize then
        if checkPlayerMode() then return size end
        return 0
    elseif updateSize < 0 then
        if checkPlayerMode() then return size end
        return maxSize - player.size
    else 
        return updateSize
    end
end

function checkPlayerMode()
    if GAMEMODE.hasWall then
        GAMESTATE = game.state.gameover
    end

    return GAMEMODE.hasWall
end

function player:randomMove()
    local dx = math.random(-1, 1)
    moveX = dx > 0 and player.size or -player.size
    moveY = 0
end

function generateBody(shape) 
    return { x = shape.x, y = shape.y, size = shape.size }
end

function player:hasCollideFruit(fruit)
    for i, body in ipairs(player.body) do
        return distanceBetween(player.x, player.y, fruit.x, fruit.y) < player.size
    end

    return false
end

function player:hasCollideBody()
    local head = player.body[0] or player.body[1]
    for i, body in ipairs(player.body) do
        if i > 3 and head.x == body.x and head.y == body.y then
            return true
        end
    end

    return false
end

function player:growUp(length)
    for i = 1, length do
        local lastBody = player.body[#player.body - 1] or player
        table.insert(player.body, generateBody(lastBody))
    end
end

function player:getColor(isEmpty)
    if isEmpty then
        return player.turboColor
    else 
        return player.color
    end
end

function player:draw()
    for i, body in ipairs(player.body) do
        love.graphics.setColor(unpack(player:getColor(turbo.isEmpty)))
        love.graphics.rectangle("fill", body.x, body.y, body.size, body.size)
    end
end

function player:reset()
    player.body = {}
    player:load()
end