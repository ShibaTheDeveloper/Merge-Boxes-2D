-- ~/main.lua

local BoxUpdateHandler = require("code.game.box.updateHandler")
local RenderModule = require("code.engine.render")

function love.update(deltaTime)
    BoxUpdateHandler:update(deltaTime)
end

function love.draw()
    RenderModule:drawAll()
end

function love.quit()
    love.window.setFullscreen(false)
end