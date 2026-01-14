-- ~/code/game/ui/handler.lua

local UITextBoxObjectModule = require("code.game.ui.objects.textBox")
local UIButtonObjectModule = require("code.game.ui.objects.button")

local UISceneHandlerModule = require("code.game.ui.sceneHandler")

local Module = {}

function Module:mousePressed(x, y, button)
    UITextBoxObjectModule:mousePressed(x, y, button)
    UIButtonObjectModule:mousePressed(x, y, button)
end

function Module:textInput(input)
    UITextBoxObjectModule:textInput(input)
end

function Module:update(deltaTime)
    UITextBoxObjectModule:updateAll(deltaTime)
    UIButtonObjectModule:updateAll(deltaTime)

    UISceneHandlerModule:update(deltaTime)
end

function Module.init()
    UISceneHandlerModule:switch("mainMenu")
end

return Module