-- ~/code/game/ui/scenes/upgradeShop.lua

local ScreenTransitionModule = require("code.game.vfx.screenTransition")
local MusicHandlerModule = require("code.game.musicHandler")

local UISharedFunctions = require("code.game.ui.shared")

local RenderModule = require("code.engine.render")
local UIData = require("code.data.ui")

local Module = {}
Module._elements = {}
Module._objects = {}
Module.name = "upgradeShop"

local SceneData = UIData[Module.name]

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

local function setupBackground(self)
    local background = RenderModule:createElement(SceneData.background)
    table.insert(self._elements, background)
end

function Module:update(deltaTime)
end

function Module:init()
    UISharedFunctions:setupSettingsButton(self)
    MusicHandlerModule:playTrack("upgradeShop")

    setupBackground(self)
end

return Module