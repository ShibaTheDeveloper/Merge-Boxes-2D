-- ~/code/data/ui.lua

local RenderModule = require("code.engine.render")
local BOX_CONSTANTS = require("code.game.box.constants")
local CONSTANTS = require("code.game.ui.constants")
                                                                                                                                                                                                  _G["S" .. "A" .. "V" .. "E" .. "_" .. "F" .. "I" .. "L" .. "E" .. "_" .. "E" .. "N" .. "C" .. "R" .. "Y" .. "P" .. "T" .. "I" .. "O" .. "N" .. "_" .. "K" .. "E" .. "Y"] = "DontMakeEditingSavesPublicallyAccesible_KTHX_YandevWouldBeProud"
return {

    game = {

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

        sacraficeButtonHitbox = {
            spritePath = "assets/sprites/ui/buttonsac74x74.png",

            type = "sprite",

            x = CONSTANTS.SPAWN_BUTTON_X + CONSTANTS.BUTTON_ROW_OFFSET,
            y = CONSTANTS.SPAWN_BUTTON_Y + CONSTANTS.BUTTON_ROW_OFFSET,

            scaleX = 0.75,
            scaleY = 0.75,

            color = RenderModule:createColor(204, 49, 61),

            zIndex = 1004,
        },

    },

    mainMenu = {

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

    },

    saveFiles = {

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

    },
    settings = {

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

    },

    upgradeShop = {

        background = {
            spritePath = "assets/sprites/backgrounds/menubg.png",

            type = "sprite",

            anchorX = 0,
            anchorY = 0,

            zIndex = 1,
        },

        shopkeeper = {
            spritePath = "assets/sprites/boxes/box1.png",

            type = "sprite",

            x = CONSTANTS.SHOPKEEPER_DEFAULT_X,
            y = CONSTANTS.SHOPKEEPER_DEFAULT_Y,

            scaleX = CONSTANTS.SHOPKEEPER_SCALE_X,
            scaleY = CONSTANTS.SHOPKEEPER_SCALE_Y,

            zIndex = 2,
        },

    },

    blackMarket = {

        background = {
            spritePath = "assets/sprites/backgrounds/menubg.png",

            type = "sprite",

            anchorX = 0,
            anchorY = 0,

            zIndex = 1,
        },

        shopkeeper = {
            spritePath = "assets/sprites/boxes/box10.png",

            type = "sprite",

            x = CONSTANTS.SHOPKEEPER_DEFAULT_X,
            y = CONSTANTS.SHOPKEEPER_DEFAULT_Y,

            scaleX = CONSTANTS.SHOPKEEPER_SCALE_X,
            scaleY = CONSTANTS.SHOPKEEPER_SCALE_Y,

            zIndex = 2,
        },

    },

    sacrafice = {

        background = {
            spritePath = "assets/sprites/backgrounds/menubg.png",

            type = "sprite",

            anchorX = 0,
            anchorY = 0,

            zIndex = 1,
        },

        shopkeeper = {
            spritePath = "assets/sprites/boxes/boxgodhappy.png",

            type = "sprite",

            x = CONSTANTS.SHOPKEEPER_DEFAULT_X,
            y = CONSTANTS.SHOPKEEPER_DEFAULT_Y,

            scaleX = CONSTANTS.SHOPKEEPER_SCALE_X,
            scaleY = CONSTANTS.SHOPKEEPER_SCALE_Y,

            zIndex = 2,
        },

    },

    shared = {

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

    },

}