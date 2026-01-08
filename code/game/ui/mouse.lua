-- ~/code/game/ui/mouse.lua

local RenderModule = require("code.engine.render")
local SoundModule = require("code.engine.sound")

local extra = require("code.engine.extra")

local Module = {}
Module._cursorElement = nil

function Module:mousePressed()
    local clickSound = SoundModule:createSound({soundPath = "assets/sounds/ui/click.wav"})

    if clickSound then
        clickSound:play(true)
        clickSound:remove()
    end
end

function Module:update()

    local mouseX, mouseY = extra.getScaledMousePos()
    self._cursorElement.x, self._cursorElement.y = extra.lerp(self._cursorElement.x, mouseX, .025), extra.lerp(self._cursorElement.y, mouseY, .025)
end

function Module.init()
    love.mouse.setVisible(false)

    Module._cursorElement = RenderModule:createElement({
        anchorX = 0,
        anchorY = 0,

        zIndex = math.huge
    })
end

return Module