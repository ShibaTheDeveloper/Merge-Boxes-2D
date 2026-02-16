-- ~/code/data/ui/saveFiles.lua

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

    backToMenuButtonHitbox = {
        spritePath = CONSTANTS.DEFAULT_BUTTON_PATH,

        type = "sprite",

        x = CONSTANTS.MIDDLE_X,
        y = CONSTANTS.MAIN_MENU_NEW_GAME_BUTTON_Y + CONSTANTS.BUTTON_Y_OFFSET,

        color = RenderModule:createColor(204, 49, 61),

        zIndex = 1001,
    },

    backToMenuButtonLabel = {
        text = "Back",

        type = "text",

        x = CONSTANTS.MIDDLE_X,
        y = CONSTANTS.MAIN_MENU_NEW_GAME_BUTTON_Y + CONSTANTS.BUTTON_Y_OFFSET,

        color = RenderModule:createColor(255, 255, 255),
        font = love.graphics.newFont(CONSTANTS.STANBERRY_FONT_PATH, 28),

        zIndex = 1002,
    },

    templateSaveFileBackground = {
        spritePath = CONSTANTS.DEFAULT_BUTTON_PATH,

        type = "sprite",

        x = CONSTANTS.MIDDLE_X,
        y = CONSTANTS.MAIN_MENU_NEW_GAME_BUTTON_Y / CONSTANTS.TEMPLATE_SAVE_FILE_Y_DIVIDER,

        rotation = CONSTANTS.TEMPLATE_ROTATION,
        scaleX = CONSTANTS.TEMPLATE_SCALE_X,
        scaleY = CONSTANTS.TEMPLATE_SCALE_Y,

        color = RenderModule:createColor(42, 42, 42, 0.8),

        zIndex = 1001,
    },

    templateSaveFileLabel = {
        text = "Slot ",

        type = "text",

        x = CONSTANTS.MIDDLE_X,
        y = CONSTANTS.MAIN_MENU_NEW_GAME_BUTTON_Y - CONSTANTS.TEMPLATE_SAVE_FILE_SLOT_OFFSET,

        color = RenderModule:createColor(255, 255, 255),
        font = love.graphics.newFont(CONSTANTS.STANBERRY_FONT_PATH, 28),

        zIndex = 1002,
    },

    templateSaveFileLoadButtonHitbox = {
        spritePath = CONSTANTS.DEFAULT_BUTTON_PATH,

        type = "sprite",

        x = CONSTANTS.MIDDLE_X,
        y = CONSTANTS.MAIN_MENU_NEW_GAME_BUTTON_Y - CONSTANTS.TEMPLATE_LOAD_BUTTON_OFFSET,

        scaleX = CONSTANTS.TEMPLATE_SMALL_SCALE,
        scaleY = CONSTANTS.TEMPLATE_SMALL_SCALE,

        color = RenderModule:createColor(151, 188, 98),

        zIndex = 1002,
    },

    templateSaveFileLoadButtonLabel = {
        text = "Load File",

        type = "text",

        x = CONSTANTS.MIDDLE_X,
        y = CONSTANTS.MAIN_MENU_NEW_GAME_BUTTON_Y - CONSTANTS.TEMPLATE_LOAD_BUTTON_OFFSET,

        scaleX = CONSTANTS.TEMPLATE_SMALL_SCALE,
        scaleY = CONSTANTS.TEMPLATE_SMALL_SCALE,

        color = RenderModule:createColor(255, 255, 255),
        font = love.graphics.newFont(CONSTANTS.STANBERRY_FONT_PATH, 28),

        zIndex = 1003,
    },

    templateSaveFileResetButtonHitbox = {
        spritePath = CONSTANTS.DEFAULT_BUTTON_PATH,

        type = "sprite",

        x = CONSTANTS.MIDDLE_X,
        y = CONSTANTS.MAIN_MENU_NEW_GAME_BUTTON_Y - CONSTANTS.TEMPLATE_RESET_BUTTON_OFFSET,

        scaleX = CONSTANTS.TEMPLATE_SMALL_SCALE,
        scaleY = CONSTANTS.TEMPLATE_SMALL_SCALE,

        color = RenderModule:createColor(204, 49, 61),

        zIndex = 1002,
    },

    templateSaveFileResetButtonLabel = {
        text = "Reset File",

        type = "text",

        x = CONSTANTS.MIDDLE_X,
        y = CONSTANTS.MAIN_MENU_NEW_GAME_BUTTON_Y - CONSTANTS.TEMPLATE_RESET_BUTTON_OFFSET,

        scaleX = CONSTANTS.TEMPLATE_SMALL_SCALE,
        scaleY = CONSTANTS.TEMPLATE_SMALL_SCALE,

        color = RenderModule:createColor(255, 255, 255),
        font = love.graphics.newFont(CONSTANTS.STANBERRY_FONT_PATH, 28),

        zIndex = 1003,
    },

    templateSaveFileBoxPreview = {
        type = "sprite",

        x = CONSTANTS.MIDDLE_X,
        y = CONSTANTS.MAIN_MENU_NEW_GAME_BUTTON_Y / CONSTANTS.TEMPLATE_SAVE_FILE_Y_DIVIDER - CONSTANTS.TEMPLATE_PREVIEW_OFFSET_Y,

        scaleX = 1,
        scaleY = 1,

        zIndex = 1004,
    },

    templateSaveFilePlusIcon = {
        spritePath = "assets/sprites/ui/buttonplus100x100.png",

        type = "sprite",

        x = CONSTANTS.MIDDLE_X,
        y = CONSTANTS.MAIN_MENU_NEW_GAME_BUTTON_Y / CONSTANTS.TEMPLATE_SAVE_FILE_Y_DIVIDER - CONSTANTS.TEMPLATE_PREVIEW_OFFSET_Y,

        scaleX = 1,
        scaleY = 1,

        zIndex = 1004,
    },

    templateSaveHighestTier = {
        text = "Highest Tier: 1",

        type = "text",

        x = CONSTANTS.MIDDLE_X,
        y = CONSTANTS.MAIN_MENU_NEW_GAME_BUTTON_Y - CONSTANTS.TEMPLATE_SAVE_FILE_SLOT_OFFSET + 40,

        color = RenderModule:createColor(255, 255, 255),
        font = love.graphics.newFont(CONSTANTS.STANBERRY_FONT_PATH, 20),

        zIndex = 1002,
    },

    templateSavePlaytime = {
        text = "0:00:00",

        type = "text",

        x = CONSTANTS.MIDDLE_X,
        y = CONSTANTS.MAIN_MENU_NEW_GAME_BUTTON_Y - CONSTANTS.TEMPLATE_SAVE_FILE_SLOT_OFFSET + 65,

        color = RenderModule:createColor(255, 255, 255),
        font = love.graphics.newFont(CONSTANTS.STANBERRY_FONT_PATH, 22),

        zIndex = 1002,
    },
}