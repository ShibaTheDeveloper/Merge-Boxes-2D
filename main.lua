local RenderModule = require("modules.engine.render")
local AudioModule = require("modules.engine.audio")

function love.update(deltaTime)
    AudioModule:updateAll(deltaTime)
end

function love.draw()
    RenderModule:drawAll()
end

function love.quit()
    love.window.setFullscreen(false)
end