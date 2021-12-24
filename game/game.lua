-- GAMEMODE -> Easy / Hard
game = {}

game.isMusicEnabled = true
game.isEffectEnabled = true

game.mode = {}
game.mode.easy = {
    fruitSpeed = 0.001,
    hasWall = false,
    grow = 2
}

game.mode.hard = {
    fruitSpeed = 0.005,
    hasWall = true,
    grow = 2
}

game.mode.current = game.mode.easy

game.state = {}
game.state.gameover = {
    draw = function() drawGameover() end,
    update = function(dt) end
}

game.state.pause = {
    draw = function() drawPause() end,
    update = function(dt) end,
}

game.state.resume = {
    draw = function() drawResume() end,
    update = function(dt) resume(dt) end,
    sound = sound.game
}
game.state.menu = {
    draw = function() drawMenu("Snake Game!") end,
    update = function(dt) end,
    sound = sound.menu
}

game.state.current = game.state.menu

function game:load()
    sound.game:setLooping(true)
    sound.game:setVolume(0.1)
    sound.game:play()
end

function game:keypressed(key)
    if key == 'escape' then
        if GAMESTATE == game.state.resume then
            pauseGame()        
        elseif GAMESTATE == game.state.pause then
            resumeGame()        
        end
    end
end

function pauseGame()
    GAMESTATE = game.state.pause
end

function resumeGame()
    GAMESTATE = game.state.resume
end

function menuGame()
    GAMESTATE = game.state.menu
end

function startGame()
    resetGame()
    GAMESTATE = game.state.resume
    player:randomMove()
end

function resetGame()
    resetTimer()
    resetTurbo()
    player:reset()
end

function toggleEffect()
    game.isEffectEnabled = not game.isEffectEnabled
end

require('game/game_hud')
require('game/game_menu')
require('game/game_over')
require('game/game_pause')
require('game/game_resume')