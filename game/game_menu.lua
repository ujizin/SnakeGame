function drawMenu(title)
    local mode = GAMEMODE == game.mode.hard and "Hard" or "Easy"

    MenuBackground()
    Title(title)
    Button("Play", CENTER_X, CENTER_Y - 120, startGame)
    Button("Mode: " .. mode, CENTER_X, CENTER_Y - 40, toggleMode)
    Button("Music: " .. (game.isMusicEnabled and "On" or "Off"), CENTER_X, CENTER_Y + 40, toggleMusic)
    Button("Sound Effect: " .. (game.isEffectEnabled and "On" or "Off"), CENTER_X, CENTER_Y + 120, toggleEffect)
    Button("Exit" , CENTER_X, CENTER_Y + 200, function() love.event.quit() end)
end

function toggleMode()
    if GAMEMODE == game.mode.hard then
        GAMEMODE = game.mode.easy 
    else 
        GAMEMODE = game.mode.hard
    end
end
