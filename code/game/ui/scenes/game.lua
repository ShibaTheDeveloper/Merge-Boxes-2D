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

local Module = {}
Module._elements = {}
Module._objects = {}
Module.name = "game"

local SharedData = require("code.data.ui.shared")
local SceneData = require("code.data.ui.game")

local spawnButtonHitbox = nil
local spawnButtonLabel = nil
local spawnButton = nil

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
    else
        BoxesObjectModule:clearBoxes()
    end

    ScreenFlashModule:stop()
end

local function setupBackground(self)
    local playAreaBackground = RenderModule:createElement(SceneData.playAreaBackground)
    table.insert(self._elements, playAreaBackground)
end

local function setupBackToMenuButton(self)
    backButtonClicked = false

    local backToMenuButtonHitbox = RenderModule:createElement(SharedData.backToMenuButtonHitbox)
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

local function setupsacrificeButton(scene)
    local sacrificeButtonHitbox = RenderModule:createElement(SceneData.sacrificeButtonHitbox)
    table.insert(scene._elements, sacrificeButtonHitbox)

    local sacrificeButton = UIButtonObjectModule:createButton({
        elements = {
            sacrificeButtonHitbox,
        },

        hitboxElement = sacrificeButtonHitbox,

        mouseButton = 1,
        onClick = function()
            if SaveFilesModule.loadedFile.stats.highestBoxTier < 20 then return end

            ScreenTransitionModule:transition({
                callback = function()
                    UISceneHandlerModule:switch("sacrifice")
                end
            })
        end
    })

    table.insert(scene._objects, sacrificeButton)
end

function Module:update()
    MusicHandlerModule:update()
    UISharedFunctions:update()

    if spawnButtonHitbox and spawnButtonLabel and spawnButton then
        spawnButton.cooldown = SaveFilesModule.loadedFile.stats.boxSpawnCooldown

        local time = (love.timer.getTime() - BoxFactoryModule.lastSpawned)
        local timeLeft = SaveFilesModule.loadedFile.stats.boxSpawnCooldown - time
        
        local onCooldown = time <= SaveFilesModule.loadedFile.stats.boxSpawnCooldown

        spawnButtonLabel.text =  (onCooldown and string.format("%.1f", timeLeft) .. "s" or SceneData.spawnButtonLabel.text)
    end
end

function Module:init(slot)
    --%note shitty preloading
    if not RenderModule.imageCache["assets/sprites/ui/buttonlocked74x74.png"] then
        local temp = RenderModule:createElement({
            type = "sprite",
            spritePath = "assets/sprites/ui/buttonlocked74x74.png"
        })

        temp:remove()
    end

    if slot then
        SaveFilesModule:loadFile(slot)

        SaveFilesModule.loadedFile.stats.playtimeAtSessionStart = SaveFilesModule.loadedFile.stats.playtime
    end

    BoxesObjectModule.renderBoxes = true

    MusicHandlerModule:stopTrack(MusicHandlerModule.playingTrack)

    UISharedFunctions:setupSidebarBackground(self)
    UISharedFunctions:setupSettingsButton(self)

    UISharedFunctions:setupSessionPlaytimeLabel(self)
    UISharedFunctions:setupCreditsLabel(self)

    setupUpgradeShopButton(self)
    setupBlackMarketButton(self)
    setupBackToMenuButton(self)
    setupsacrificeButton(self)
    setupSpawnButton(self)
    setupBackground(self)
end

return Module