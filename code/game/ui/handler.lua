-- ~/code/game/ui/handler.lua

local UIButtonObjectModule = require("code.game.ui.objects.button")

local Module = {}

function Module:mousePressed(x, y, button)
    UIButtonObjectModule:mousePressed(x, y, button)
end

function Module:update(deltaTime)
    UIButtonObjectModule:updateAll(deltaTime)
end

return Module