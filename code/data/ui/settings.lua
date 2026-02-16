-- ~/code/data/ui/settings.lua

local RenderModule = require("code.engine.render")

local CONSTANTS = require("code.game.ui.constants")

return {
    background = {
        spritePath = "assets/sprites/backgrounds/menubg.png",

        type = "sprite",

        anchorX = 0,
        anchorY = 0,

        zIndex = 1,
    },

    backButtonHitbox = {
        spritePath = CONSTANTS.DEFAULT_BUTTON_PATH,

        type = "sprite",

        x = CONSTANTS.MIDDLE_X,
        y = CONSTANTS.MAIN_MENU_NEW_GAME_BUTTON_Y + CONSTANTS.BUTTON_Y_OFFSET,

        color = RenderModule:createColor(204, 49, 61),

        zIndex = 1001,
    },

    backButtonLabel = {
        text = "Back",

        type = "text",

        x = CONSTANTS.MIDDLE_X,
        y = CONSTANTS.MAIN_MENU_NEW_GAME_BUTTON_Y + CONSTANTS.BUTTON_Y_OFFSET,

        color = RenderModule:createColor(255, 255, 255),
        font = love.graphics.newFont(CONSTANTS.STANBERRY_FONT_PATH, 28),

        zIndex = 1002,
    },
}