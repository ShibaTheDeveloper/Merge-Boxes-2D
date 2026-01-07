local BoxesObjectModule = require("modules.game.box.object")
local CONSTANTS = require("modules.game.box.constants")

local Module = {}

function Module:update()
    for _, box in pairs(BoxesObjectModule.boxes) do
        if box.dragging then
            local maxTilt = (box.dragging and math.huge or CONSTANTS.DRAGGING_MAX_TILT)
            local targetRotation = box.velocityX * CONSTANTS.DRAG_ROTATION_MULTIPLIER
            targetRotation = math.max(-maxTilt, math.min(maxTilt, targetRotation))

            box.element:setRotation(box.element.rotation + (targetRotation - box.element.rotation) * CONSTANTS.BASE_DRAGGING_TILT_SPEED)
        else
            local velocity = (box.velocityX + box.velocityY) / 2
            box.element:setRotation(math.deg(box.element.rotation) + velocity / CONSTANTS.FREE_ROTATION_VELOCITY_DIVISOR)
        end
    end
end

return Module