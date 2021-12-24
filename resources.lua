WINDOW = {}
WINDOW.WIDTH = 1080
WINDOW.HEIGHT = 720

CENTER_X = WINDOW.WIDTH / 2
CENTER_Y = WINDOW.HEIGHT / 2    

GREEN = {46 / 255, 204 / 255, 113 / 255, 1}
RED = {234 / 255, 32 / 255, 39 / 255}
BROWN = {204 / 255, 142/ 255, 53/ 255}
CYAN = {52 / 255, 73 / 255, 94 / 255, 1} 
BLACK = {30 / 255, 39 / 255, 46 / 255, 1}

function distanceBetween(x1, y1, x2, y2)
    return math.sqrt((x2 - x1)^2 + (y2 - y1)^2)
end

function Button(
    text,
    bx, by,
    fn
)
    local bw = 256
    local bh = 64

    local obx = bx - (bw / 2)
    local oby = by - (bh / 2)

    local mx, my = love.mouse.getPosition()

    local colors = {0.8, 0.8, 0.9, 1.0}
    local isHover = mx > obx and mx < (obx + bw) and my > oby and my < (oby + bh)

    if isHover then
        colors = {1, 1, 1, 1}
    end

    if love.mouse.isDown(1) and isHover then
        fn()
        love.timer.sleep(0.25)
    end

    love.graphics.setColor(unpack(colors))
    love.graphics.rectangle("fill", obx, oby, bw, bh)

    local font = love.graphics.newFont(20)
    local fw = font:getWidth(text)
    local fh = font:getHeight(text)
    local tx = obx + (bw / 2) - fw * 0.5
    local ty = oby + (bh / 2) - fh * 0.5

    love.graphics.setFont(font)
    love.graphics.setColor(0, 0, 0, 1)
    love.graphics.print(text, tx, ty)
end

function Title(title)
    love.graphics.setColor(1, 1, 1, 1)

    local font = love.graphics.newFont(60)
    local fw = font:getWidth(title)

    love.graphics.setFont(font)
    love.graphics.print(title, CENTER_X - (fw * 0.5), CENTER_Y - 240)
end

function MenuBackground()
    love.graphics.setColor(0, 0, 0, 0.7)
    love.graphics.rectangle("fill", 0, 0, love.graphics.getWidth(), love.graphics.getHeight())
end