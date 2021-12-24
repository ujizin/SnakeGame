function drawPause()
    drawHUD()
    MenuBackground()
    Title("Paused")
    Button("Resume", CENTER_X, CENTER_Y - 120, resumeGame)
    Button("Restart", CENTER_X, CENTER_Y - 40, startGame)
    Button("Music: " .. (game.isMusicEnabled and "On" or "Off"), CENTER_X, CENTER_Y + 40, toggleMusic)
    Button("Sound Effect: " .. (game.isEffectEnabled and "On" or "Off"), CENTER_X, CENTER_Y + 120, toggleEffect)
    Button("Back to menu", CENTER_X, CENTER_Y + 200, menuGame)
    
end