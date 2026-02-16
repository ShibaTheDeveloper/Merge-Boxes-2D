-- ~/code/game/ui/scenes/upgradeShop.lua

local ScreenTransitionModule = require("code.game.vfx.screenTransition")
local MusicHandlerModule = require("code.game.musicHandler")

local UIButtonObjectModule = require("code.game.ui.objects.button")
local UISceneHandlerModule = require("code.game.ui.sceneHandler")
local UISharedFunctions = require("code.game.ui.shared")

local BoxesObjectModule = require("code.game.box.object")

local RenderModule = require("code.engine.render")

local Module = {}
Module._elements = {}
Module._objects = {}
Module.name = "upgradeShop"

local SceneData = require("code.data.ui.upgradeShop")

function Module:clean()
    for _, element in pairs(self._elements) do
        element:remove()
    end

    for _, button in pairs(self._objects) do
        button:remove()
    end

    self._elements = {}
    self._objects = {}
end

local function setupBackground(self)
    local background = RenderModule:createElement(SceneData.background)
    table.insert(self._elements, background)
end

local function setupShopkeeper(self)
    local shopkeeper = RenderModule:createElement(SceneData.shopkeeper)
    table.insert(self._elements, shopkeeper)
end

function Module:update(deltaTime)
    UISharedFunctions:update()
end

function Module:init()    
    MusicHandlerModule:playTrack("upgradeShop")

    BoxesObjectModule.renderBoxes = false

    UISharedFunctions:setupSidebarBackground(self)
    UISharedFunctions:setupSettingsButton(self)
    UISharedFunctions:setupShopBackButton(self)

    UISharedFunctions:setupSessionPlaytimeLabel(self)
    UISharedFunctions:setupCreditsLabel(self)

    UISharedFunctions:setupBackToMenuButton(self)

    setupBackground(self)
    setupShopkeeper(self)
end

return Module