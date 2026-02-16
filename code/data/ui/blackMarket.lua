-- ~/code/data/ui.lua

local CONSTANTS = require("code.game.ui.constants")

return {
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
}