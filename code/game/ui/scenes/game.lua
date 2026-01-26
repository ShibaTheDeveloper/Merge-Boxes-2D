-- ~/code/game/ui/scenes/game.lua

local ScreenTransitionModule = require("code.game.vfx.screenTransition")
local ScreenFlashModule = require("code.game.vfx.screenFlash")

local MusicHandlerModule = require("code.game.musicHandler")

local UIButtonObjectModule = require("code.game.ui.objects.button")
local UISceneHandlerModule = require("code.game.ui.sceneHandler")
local UISharedFunctions = require("code.game.ui.shared")

local BoxesObjectModule = require("code.game.box.object")
local BoxFactoryModule = require("code.game.box.factory")

local SaveFilesModule = require("code.engine.saveFiles")
local RenderModule = require("code.engine.render")
local extra = require("code.engine.extra")

local UIData = require("code.data.ui")

local Module = {}
Module._elements = {}
Module._objects = {}
Module.name = "game"

local SceneData = UIData[Module.name]

local playtimeAtSessionStart = 0

local spawnButtonHitbox = nil
local spawnButtonLabel = nil
local spawnButton = nil

local sessionPlaytimeLabel = nil
local creditsLabel = nil

function Module:clean()
    for _, element in pairs(self._elements) do
        element:remove()
    end

    for _, button in pairs(self._objects) do
        button:remove()
    end

    self._elements = {}
    self._objects = {}

    SaveFilesModule.saveFile(SaveFilesModule.loadedFile.slot)

    BoxesObjectModule:clearBoxes()
    ScreenFlashModule:stop()
end

local function setupBackgrounds(self)
    local playAreaBackground = RenderModule:createElement(SceneData.playAreaBackground)
    local sidebarBackground = RenderModule:createElement(SceneData.sidebarBackground)

    table.insert(self._elements, playAreaBackground)
    table.insert(self._elements, sidebarBackground)
end

local function setupCreditsLabel(self)
    creditsLabel = RenderModule:createElement(SceneData.creditsLabel)
    table.insert(self._elements, creditsLabel)
end

local function setupSessionPlaytimeLabel(self)
    playtimeAtSessionStart = SaveFilesModule.loadedFile.playtime

    sessionPlaytimeLabel = RenderModule:createElement(SceneData.sessionPlaytimeLabel)
    table.insert(self._elements, sessionPlaytimeLabel)
end

local function setupBackToMenuButton(self)
    local backToMenuButtonHitbox = RenderModule:createElement(SceneData.backToMenuButtonHitbox)
    table.insert(self._elements, backToMenuButtonHitbox)

    local backToMenuButton = UIButtonObjectModule:createButton({
        elements = {
            backToMenuButtonHitbox,
        },

        hitboxElement = backToMenuButtonHitbox,

        mouseButton = 1,
        onClick = function()
            ScreenTransitionModule:transition({
                callback = function()
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

function Module:update()
    MusicHandlerModule:update()

    if sessionPlaytimeLabel then
        sessionPlaytimeLabel.text = "Session Time: " .. extra.formatTime(SaveFilesModule.loadedFile.playtime - playtimeAtSessionStart)
    end

    if creditsLabel then
        creditsLabel.text = SaveFilesModule.loadedFile.credits .. " C$"
    end

    if spawnButtonHitbox and spawnButtonLabel and spawnButton then
        spawnButton.cooldown = SaveFilesModule.loadedFile.spawnCooldown

        local time = (os.clock() - BoxFactoryModule.lastSpawned)
        local timeLeft = SaveFilesModule.loadedFile.spawnCooldown - time

        local onCooldown = time <= SaveFilesModule.loadedFile.spawnCooldown

        spawnButtonLabel.text =  (onCooldown and string.format("%.1f", timeLeft) .. "s" or SceneData.spawnButtonLabel.text)
    end
end

function Module:init()
    MusicHandlerModule:stopTrack(MusicHandlerModule.playingTrack)
    UISharedFunctions:setupSettingsButton(self)

    setupSessionPlaytimeLabel(self)
    setupBackToMenuButton(self)
    setupCreditsLabel(self)
    setupBackgrounds(self)
    setupSpawnButton(self)
end

return Module