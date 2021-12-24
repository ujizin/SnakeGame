require('resources')
require('sound')
require('fruit')
require('player')
require('game/game')

GAMEMODE = game.mode.current
GAMESTATE = game.state.current

TIMER = 0
UPDATE_TIMER = 0.15
SCORE = 0
MAX_TURBO_TIMER = 25
MAX_TURBO_SPEED = 0.015

turbo = {}

function love.load()
    love.window.setTitle("Snake game")
    love.window.setMode(WINDOW.WIDTH, WINDOW.HEIGHT + 70)
    player:load()
    game:load()
    resetTimer()
    resetTurbo()
end

function resetTimer()
    TIMER = 0
    UPDATE_TIMER = 0.15
    SCORE = 0
end

function resetTurbo()
    turbo.speed = 0
    turbo.isEmpty = false
    turbo.timer = 0
end

function love.update(dt)
    GAMESTATE.update(dt)
end

function love.keypressed(key)
    if not turbo.isEmpty and key == "space" then
        turbo.isEmpty = true
        sound:playNitro()
        turbo.speed = MAX_TURBO_SPEED
        turbo.timer = MAX_TURBO_TIMER
    end

    game:keypressed(key)
end

function love.draw()
    love.graphics.setColor(unpack(CYAN))
    love.graphics.rectangle("fill", 0, 0, love.graphics.getWidth(), love.graphics.getHeight())
    
    love.graphics.setColor(unpack(BLACK))
    love.graphics.rectangle("fill", 0, 0, WINDOW.WIDTH, WINDOW.HEIGHT)
    
    fruit:draw()
    player:draw()
    GAMESTATE.draw()
end
