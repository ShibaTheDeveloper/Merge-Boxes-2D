-- ~/code/engine/saves/constants.lua

return {
    MAX_SAVE_SLOTS = 3,
    
    DEFAULT_DATA = {
        slot = 1,

        currencies = {
            credits = 50,
        },

        stats = {
            highestBoxTier = 0,

            boxSpawnCooldown = 1.2,
            boxSpawnTier = 1,

            playtimeAtSessionStart = 0,
            playtime = 0
        },

        boxes = {}
    }
}