-- ~/code/data/ui/game.lua

local RenderModule = require("code.engine.render")

local CONSTANTS = require("code.game.ui.constants")

return {
    spawnButtonHitbox = {
        spritePath = CONSTANTS.DEFAULT_BUTTON_PATH,

        type = "sprite",

        x = CONSTANTS.SPAWN_BUTTON_X,
        y = CONSTANTS.SPAWN_BUTTON_Y,

        color = RenderModule:createColor(255, 200, 0),

        zIndex = 1001,
    },

    spawnButtonLabel = {
        text = "Spawn Box!",

        type = "text",

        x = CONSTANTS.SPAWN_BUTTON_X,
        y = CONSTANTS.SPAWN_BUTTON_Y,

        color = RenderModule:createColor(255, 255, 255),
        font = love.graphics.newFont(CONSTANTS.STANBERRY_FONT_PATH, 28),

        zIndex = 1002,
    },

    playAreaBackground = {
        spritePath = "assets/sprites/backgrounds/areabg.png",

        type = "sprite",

        anchorX = 0,
        anchorY = 0,

        zIndex = 1,
    },

    upgradeShopButtonHitbox = {
        spritePath = "assets/sprites/ui/buttoncart74x74.png",

        type = "sprite",

        x = CONSTANTS.SPAWN_BUTTON_X - CONSTANTS.BUTTON_ROW_OFFSET,
        y = CONSTANTS.SPAWN_BUTTON_Y + CONSTANTS.BUTTON_ROW_OFFSET,

        scaleX = 0.75,
        scaleY = 0.75,

        color = RenderModule:createColor(110, 153, 202),

        zIndex = 1004,
    },

    blackMarketButtonHitbox = {
        spritePath = "assets/sprites/ui/buttonbm74x74.png",

        type = "sprite",

        x = CONSTANTS.SPAWN_BUTTON_X,
        y = CONSTANTS.SPAWN_BUTTON_Y + CONSTANTS.BUTTON_ROW_OFFSET,

        scaleX = 0.75,
        scaleY = 0.75,

        color = RenderModule:createColor(248, 217, 109),

        zIndex = 1004,
    },

    sacrificeButtonHitbox = {
        spritePath = "assets/sprites/ui/buttonsac74x74.png",

        type = "sprite",

        x = CONSTANTS.SPAWN_BUTTON_X + CONSTANTS.BUTTON_ROW_OFFSET,
        y = CONSTANTS.SPAWN_BUTTON_Y + CONSTANTS.BUTTON_ROW_OFFSET,

        scaleX = 0.75,
        scaleY = 0.75,

        color = RenderModule:createColor(204, 49, 61),

        zIndex = 1004,
    },
}