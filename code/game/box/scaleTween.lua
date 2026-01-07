local BoxesObjectModule = require("code.game.box.object")
local extra = require("code.engine.extra")

local EasingData = require("code.data.easing")

local Module = {}

function Module:update(deltaTime)
    for _, box in pairs(BoxesObjectModule.boxes) do
        local tween = box._scaleTween
        if tween then
            tween.timeSinceStart = tween.timeSinceStart + deltaTime

            local timerLocalized = math.min(tween.timeSinceStart / tween.duration, 1)
            local lerpFactor = EasingData.easeOutQuad(timerLocalized)

            box.element.scaleX = extra.lerp(tween.startX, tween.targetX, lerpFactor)
            box.element.scaleY = extra.lerp(tween.startY, tween.targetY, lerpFactor)

            if timerLocalized >= 1 then
                box._scaleTween = nil
            end
        end
    end
end

return Module