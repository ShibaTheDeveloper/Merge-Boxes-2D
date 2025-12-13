local RenderModule = require("modules.render")
RenderModule:createElement("sprite", {x = 10, y = 70, sX = 5, sY = 5, spritePath = "assets/debug_missing.png"})

function love.update(deltaTime)

end

function love.draw()
    RenderModule:drawAll()
end