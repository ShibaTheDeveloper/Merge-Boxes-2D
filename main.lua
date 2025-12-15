local RenderModule = require("modules.internal.render")

function love.draw()
    RenderModule:drawAll()
end

function love.quit()
    love.window.setFullscreen(false)
end