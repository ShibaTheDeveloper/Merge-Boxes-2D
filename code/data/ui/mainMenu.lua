-- ~/code/data/ui/mainMenu.lua

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

    logo = {
        spritePath = "assets/sprites/ui/logo.png",

        type = "sprite",

        x = CONSTANTS.MIDDLE_X,
        y = CONSTANTS.MAIN_MENU_NEW_GAME_BUTTON_Y - CONSTANTS.MAIN_MENU_LOGO_PRIMARY_Y_OFFSET,

        scaleX = 0.5,
        scaleY = 0.5,

        zIndex = 2,
    },

    logo2 = {
        spritePath = "assets/sprites/ui/logo2.png",

        type = "sprite",

        x = CONSTANTS.MIDDLE_X,
        y = CONSTANTS.MAIN_MENU_NEW_GAME_BUTTON_Y - CONSTANTS.MAIN_MENU_LOGO_SECONDARY_Y_OFFSET,

        scaleX = 0.35,
        scaleY = 0.35,

        zIndex = 3,
    },

    playGameButtonHitbox = {
        spritePath = CONSTANTS.DEFAULT_BUTTON_PATH,

        type = "sprite",

        x = CONSTANTS.MIDDLE_X,
        y = CONSTANTS.MAIN_MENU_NEW_GAME_BUTTON_Y,

        color = RenderModule:createColor(151, 188, 98),

        zIndex = 1001,
    },

    playGameButtonLabel = {
        text = "Play Game",

        type = "text",

        x = CONSTANTS.MIDDLE_X,
        y = CONSTANTS.MAIN_MENU_NEW_GAME_BUTTON_Y,

        color = RenderModule:createColor(255, 255, 255),
        font = love.graphics.newFont(CONSTANTS.STANBERRY_FONT_PATH, 28),

        zIndex = 1002,
    },

    quitButtonHitbox = {
        spritePath = CONSTANTS.DEFAULT_BUTTON_PATH,

        type = "sprite",

        x = CONSTANTS.MIDDLE_X,
        y = CONSTANTS.MAIN_MENU_NEW_GAME_BUTTON_Y + CONSTANTS.BUTTON_Y_OFFSET,

        color = RenderModule:createColor(204, 49, 61),

        zIndex = 1001,
    },

    quitButtonLabel = {
        text = "Quit Game",

        type = "text",

        x = CONSTANTS.MIDDLE_X,
        y = CONSTANTS.MAIN_MENU_NEW_GAME_BUTTON_Y + CONSTANTS.BUTTON_Y_OFFSET,

        color = RenderModule:createColor(255, 255, 255),
        font = love.graphics.newFont(CONSTANTS.STANBERRY_FONT_PATH, 28),

        zIndex = 1002,
    },
}