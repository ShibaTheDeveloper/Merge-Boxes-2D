-- ~/code/game/vfx/screenFlash.lua

local RenderModule = require("code.engine.render")

local CONSTANTS = require("code.game.vfx.constants")

local Module = {}
Module._screenFlashElement = nil
Module._fadeDuration = 2

function Module:flash(color, fadeDuration)

    self._screenFlashElement.color = color or RenderModule:createColor(
        CONSTANTS.BASE_SCREEN_FLASH_COLOR.r * 255,
        CONSTANTS.BASE_SCREEN_FLASH_COLOR.g * 255,
        CONSTANTS.BASE_SCREEN_FLASH_COLOR.b * 255,
        1
    )

    self._fadeDuration = fadeDuration or 2
end

function Module:update(deltaTime)
    local element = self._screenFlashElement
    if not element then return end

    local alpha = element.color.alpha
    if alpha > 0 then
        local alphaPerSecond = 1 / self._fadeDuration
        alpha = alpha - alphaPerSecond * deltaTime

        if alpha < 0 then alpha = 0 end
        element.color.alpha = alpha
    end
end

function Module.init()
    Module._screenFlashElement = RenderModule:createElement({
        spritePath = "assets/sprites/vfx/whitesquare.png",
        type = "sprite",

        scaleX = 10,
        scaleY = 10,

        color = CONSTANTS.BASE_SCREEN_FLASH_COLOR,
        zIndex = 999
    })
end

return Module