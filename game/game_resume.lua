function resume(dt)
    TIMER = TIMER + dt

    if turbo.isEmpty then
        TIMER = TIMER + turbo.speed
    end

    player:update(dt)

    if TIMER > UPDATE_TIMER then
        if turbo.isEmpty then
            if turbo.speed > 0 then
                turbo.speed = turbo.speed - 0.001
            end

            if turbo.speed < 0 then
                turbo.speed = 0
            end

            turbo.timer = turbo.timer - TIMER            
            turbo.isEmpty = turbo.timer > 0
        end

        TIMER = 0

        player:move(dt)

        if player:hasCollideFruit(fruit) then
            SCORE = SCORE + 1
            UPDATE_TIMER = UPDATE_TIMER - GAMEMODE.fruitSpeed
            sound:playEat()
            fruit.destroyed = true
            player:growUp(GAMEMODE.grow)
        end

        if player:hasCollideBody() then
            GAMESTATE = game.state.gameover
        end
    end
end

function drawResume()
    drawHUD()
end
