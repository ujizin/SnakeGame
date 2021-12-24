sound = {}
sound.game = love.audio.newSource("assets/audio/menu.wav", "static")
sound.nitro = love.audio.newSource("assets/audio/nitro.mp3", "static")
sound.eat = love.audio.newSource("assets/audio/eat.mp3", "static")

function sound:playEat()
    if game.isEffectEnabled then
        sound.eat:play()
    end
end

function sound:playNitro()
    if game.isEffectEnabled then
        sound.nitro:setVolume(0.1)
        sound.nitro:play()
    end
end

function toggleMusic()
    game.isMusicEnabled = not game.isMusicEnabled
    if game.isMusicEnabled then
        sound.game:play()
    else
        sound.game:pause()
    end
end