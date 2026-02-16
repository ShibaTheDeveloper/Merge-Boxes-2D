-- ~/code/data/ui/shared.lua

local RenderModule = require("code.engine.render")

local BOX_CONSTANTS = require("code.game.box.constants")
local CONSTANTS = require("code.game.ui.constants")

return {
    settingsButtonHitbox = {
        spritePath = "assets/sprites/ui/buttoncog74x74.png",

        type = "sprite",

        x = CONSTANTS.SETTINGS_BUTTON_X,
        y = CONSTANTS.SETTINGS_BUTTON_Y,

        scaleX = 0.6,
        scaleY = 0.6,

        color = RenderModule:createColor(117, 124, 136),

        zIndex = 1004,
    },

    sidebarBackground = {
        spritePath = "assets/sprites/ui/sidebar.png",

        type = "sprite",

        anchorX = 0,
        anchorY = 0,

        x = BOX_CONSTANTS.AREA_WIDTH,

        color = RenderModule:createColor(42, 42, 42),

        zIndex = 1000,
    },

    shopBackButtonHitbox = {
        spritePath = CONSTANTS.DEFAULT_BUTTON_PATH,

        type = "sprite",

        x = CONSTANTS.SPAWN_BUTTON_X,
        y = CONSTANTS.SPAWN_BUTTON_Y + 65,

        color = RenderModule:createColor(204, 49, 61),

        zIndex = 1001,
    },

    shopBackButtonLabel = {
        text = "Back",

        type = "text",

        x = CONSTANTS.SPAWN_BUTTON_X,
        y = CONSTANTS.SPAWN_BUTTON_Y + 65,

        color = RenderModule:createColor(255, 255, 255),
        font = love.graphics.newFont(CONSTANTS.STANBERRY_FONT_PATH, 28),

        zIndex = 1002,
    },

    creditsLabel = {
        text = "Credits:",

        type = "text",

        font = love.graphics.newFont(CONSTANTS.STANBERRY_FONT_PATH, 20),

        anchorX = 0,
        anchorY = 0,

        x = 5,
        y = 25,

        color = RenderModule:createColor(255, 200, 0),

        zIndex = 1003,
    },

    sessionPlaytimeLabel = {
        text = "Session Time: ",

        type = "text",

        font = love.graphics.newFont(CONSTANTS.STANBERRY_FONT_PATH, 20),

        anchorX = 0,
        anchorY = 0,

        x = 5,
        y = 5,

        zIndex = 1003,
    },

    backToMenuButtonHitbox = {
        spritePath = "assets/sprites/ui/buttonmenu74x74.png",

        type = "sprite",

        x = CONSTANTS.SETTINGS_BUTTON_X - CONSTANTS.BACK_BUTTON_X_OFFSET,
        y = CONSTANTS.SETTINGS_BUTTON_Y,

        scaleX = 0.6,
        scaleY = 0.6,

        color = RenderModule:createColor(117, 124, 136),

        zIndex = 1004,
    },
}