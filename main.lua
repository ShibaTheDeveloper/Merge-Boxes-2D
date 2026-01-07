-- ~/main.lua

local BoxUpdateHandlerModule = require("code.game.box.updateHandler")
local VFXUpdateHandlerModule = require("code.game.vfx.updateHandler")

local RenderModule = require("code.engine.render")

VFXUpdateHandlerModule.init()

function love.update(deltaTime)
    BoxUpdateHandlerModule:update(deltaTime)
    VFXUpdateHandlerModule:update(deltaTime)
end

function love.draw()
    RenderModule:drawAll()
end

function love.quit()
    love.window.setFullscreen(false)
end