-- ~/code/game/ui/scenes/game.lua

local ScreenTransitionModule = require("code.game.vfx.screenTransition")
local ScreenFlashModule = require("code.game.vfx.screenFlash")

local MusicHandlerModule = require("code.game.musicHandler")

local UIButtonObjectModule = require("code.game.ui.objects.button")
local UISceneHandlerModule = require("code.game.ui.sceneHandler")
local UISharedFunctions = require("code.game.ui.shared")

local BoxesObjectModule = require("code.game.box.object")
local BoxFactoryModule = require("code.game.box.factory")

local SaveFilesModule = require("code.engine.saves.files")
local RenderModule = require("code.engine.render")
local extra = require("code.engine.extra")

local UIData = require("code.data.ui")

local Module = {}
Module._elements = {}
Module._objects = {}
Module.name = "game"

local SceneData = UIData[Module.name]

local spawnButtonHitbox = nil
local spawnButtonLabel = nil
local spawnButton = nil

local sessionPlaytimeLabel = nil
local creditsLabel = nil

local keepSessionPlaytime = false
local backButtonClicked = false

function Module:clean()
    for _, element in pairs(self._elements) do
        element:remove()
    end

    for _, button in pairs(self._objects) do
        button:remove()
    end

    self._elements = {}
    self._objects = {}

    if not backButtonClicked then
        SaveFilesModule:saveFile(SaveFilesModule.loadedFile)
    end

    BoxesObjectModule:clearBoxes()
    ScreenFlashModule:stop()
end

local function setupBackground(self)
    local playAreaBackground = RenderModule:createElement(SceneData.playAreaBackground)
    table.insert(self._elements, playAreaBackground)
end

local function setupCreditsLabel(self)
    creditsLabel = RenderModule:createElement(SceneData.creditsLabel)
    table.insert(self._elements, creditsLabel)
end

local function setupSessionPlaytimeLabel(self)
    if not keepSessionPlaytime then
        SaveFilesModule.loadedFile.stats.playtimeAtSessionStart = SaveFilesModule.loadedFile.stats.playtime
    end

    sessionPlaytimeLabel = RenderModule:createElement(SceneData.sessionPlaytimeLabel)
    table.insert(self._elements, sessionPlaytimeLabel)
end

local function setupBackToMenuButton(self)
    backButtonClicked = false

    local backToMenuButtonHitbox = RenderModule:createElement(SceneData.backToMenuButtonHitbox)
    table.insert(self._elements, backToMenuButtonHitbox)

    local backToMenuButton = UIButtonObjectModule:createButton({
        elements = {
            backToMenuButtonHitbox,
        },

        hitboxElement = backToMenuButtonHitbox,

        mouseButton = 1,
        onClick = function()
            backButtonClicked = true

            ScreenTransitionModule:transition({
                callback = function()
                    SaveFilesModule:unloadFile(SaveFilesModule.loadedFile)
                    UISceneHandlerModule:switch("saveFiles")
                end
            })
        end
    })

    table.insert(self._objects, backToMenuButton)
end

local function setupSpawnButton(self)
    spawnButtonHitbox = RenderModule:createElement(SceneData.spawnButtonHitbox)
    spawnButtonLabel = RenderModule:createElement(SceneData.spawnButtonLabel)

    table.insert(self._elements, spawnButtonHitbox)
    table.insert(self._elements, spawnButtonLabel)

    spawnButton = UIButtonObjectModule:createButton({
        elements = {
            spawnButtonHitbox,
            spawnButtonLabel
        },

        hitboxElement = spawnButtonHitbox,

        mouseButton = 1,
        onClick = function()
            BoxFactoryModule:spawn()
        end
    })

    table.insert(self._objects, spawnButton)
end

local function setupUpgradeShopButton(scene)
    local upgradeShopButtonHitbox = RenderModule:createElement(SceneData.upgradeShopButtonHitbox)
    table.insert(scene._elements, upgradeShopButtonHitbox)

    local upgradeShopButton = UIButtonObjectModule:createButton({
        elements = {
            upgradeShopButtonHitbox,
        },

        hitboxElement = upgradeShopButtonHitbox,

        mouseButton = 1,
        onClick = function()
            if SaveFilesModule.loadedFile.stats.highestBoxTier < 5 then return end

            ScreenTransitionModule:transition({
                callback = function()
                    UISceneHandlerModule:switch("upgradeShop")
                end
            })
        end
    })

    table.insert(scene._objects, upgradeShopButton)
end

local function setupBlackMarketButton(scene)
    local blackMarketButtonHitbox = RenderModule:createElement(SceneData.blackMarketButtonHitbox)
    table.insert(scene._elements, blackMarketButtonHitbox)

    local blackMarketButton = UIButtonObjectModule:createButton({
        elements = {
            blackMarketButtonHitbox,
        },

        hitboxElement = blackMarketButtonHitbox,

        mouseButton = 1,
        onClick = function()
            if SaveFilesModule.loadedFile.stats.highestBoxTier < 10 then return end

            ScreenTransitionModule:transition({
                callback = function()
                    UISceneHandlerModule:switch("blackMarket")
                end
            })
        end
    })

    table.insert(scene._objects, blackMarketButton)
end

local function setupSacraficeButton(scene)
    local sacraficeButtonHitbox = RenderModule:createElement(SceneData.sacraficeButtonHitbox)
    table.insert(scene._elements, sacraficeButtonHitbox)

    local sacraficeButton = UIButtonObjectModule:createButton({
        elements = {
            sacraficeButtonHitbox,
        },

        hitboxElement = sacraficeButtonHitbox,

        mouseButton = 1,
        onClick = function()
            if SaveFilesModule.loadedFile.stats.highestBoxTier < 20 then return end

            ScreenTransitionModule:transition({
                callback = function()
                    UISceneHandlerModule:switch("sacrafice")
                end
            })
        end
    })

    table.insert(scene._objects, sacraficeButton)
end

function Module:update()
    MusicHandlerModule:update()

    if sessionPlaytimeLabel then
        sessionPlaytimeLabel.text = "Session Time: " .. extra.formatTime(SaveFilesModule.loadedFile.stats.playtime - SaveFilesModule.loadedFile.stats.playtimeAtSessionStart)
    end

    if creditsLabel then
        creditsLabel.text = SaveFilesModule.loadedFile.currencies.credits .. " C$"
    end

    if spawnButtonHitbox and spawnButtonLabel and spawnButton then
        spawnButton.cooldown = SaveFilesModule.loadedFile.stats.boxSpawnCooldown

        local time = (love.timer.getTime() - BoxFactoryModule.lastSpawned)
        local timeLeft = SaveFilesModule.loadedFile.stats.boxSpawnCooldown - time
        
        local onCooldown = time <= SaveFilesModule.loadedFile.stats.boxSpawnCooldown

        spawnButtonLabel.text =  (onCooldown and string.format("%.1f", timeLeft) .. "s" or SceneData.spawnButtonLabel.text)
    end
end

function Module:init(slot, keepSessionPlaytimeValue)
    SaveFilesModule:loadFile(slot)

    MusicHandlerModule:stopTrack(MusicHandlerModule.playingTrack)

    keepSessionPlaytime = keepSessionPlaytimeValue

    UISharedFunctions:setupSidebarBackground(self)
    UISharedFunctions:setupSettingsButton(self)
    
    setupSessionPlaytimeLabel(self)
    setupUpgradeShopButton(self)
    setupBlackMarketButton(self)
    setupBackToMenuButton(self)
    setupSacraficeButton(self)
    setupCreditsLabel(self)
    setupSpawnButton(self)
    setupBackground(self)
end

return Module