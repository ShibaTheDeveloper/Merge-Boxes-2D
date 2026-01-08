-- ~/code/game/ui/buttons.lua

local CONSTANTS = require("code.game.ui.constants")

local Module = {}
Module.buttons = {}

function Module:update(deltaTime)
    for _, button in pairs(self.buttons) do
        if not button.hitbox then goto continue end

        for _, element in pairs(button.elements) do
            if element.scaleX < button.defaultScaleX then
                local scalePerSecond = 1 / CONSTANTS.BASE_BUTTON_CLICK_SCALE_SPEED
                local scale = element.scaleX + scalePerSecond * deltaTime

                element.scaleX, element.scaleY = scale, scale
            else
                element.scaleX, element.scaleY = button.defaultScaleX, button.defaultScaleY
            end
        end

        :: continue ::
    end
end

local function buttonClick(button)
    for _, element in pairs(button.elements) do
        element.scaleX, element.scaleY = button.defaultScaleX - CONSTANTS.BUTTON_CLICK_SCALE_SUBTRACTION, button.defaultScaleY - CONSTANTS.BUTTON_CLICK_SCALE_SUBTRACTION
    end

    if button.callback then
        button.callback()
    end
end

function Module:mousePressed(x, y, button)
    if button ~= 1 then return end

    for _, button in pairs(self.buttons) do
        if button.hitbox:isPointInside(x, y) then
            buttonClick(button)
        end
    end
end

return Module