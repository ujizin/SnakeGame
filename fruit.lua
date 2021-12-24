fruit = {}
fruit.x = 0
fruit.y = 0
fruit.size = 30
fruit.destroyed = true

function fruit:update(dt)
end

function fruit:draw()
    if fruit.destroyed then
        fruit.destroyed = false
        
        local fruitX = math.random(fruit.size, WINDOW.WIDTH - fruit.size)
        local fruitY = math.random(fruit.size, WINDOW.HEIGHT - fruit.size)
        local dx = fruitX % fruit.size
        local dy = fruitY % fruit.size
        fruit.x = fruitX - dx
        fruit.y = fruitY - dy
        
        if player:hasCollideFruit(fruit) then
            fruit.destroyed = true
        end 
    end

    spawnFruit(fruit)
end

function spawnFruit(fruit)
    love.graphics.setColor(unpack(RED))
    love.graphics.rectangle("fill", fruit.x, fruit.y, fruit.size, fruit.size)
end