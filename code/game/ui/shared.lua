-- ~/code/game/ui/shared.lua

local ScreenTransitionModule = require("code.game.vfx.screenTransition")
local UIButtonObjectModule = require("code.game.ui.objects.button")
local UISceneHandlerModule = require("code.game.ui.sceneHandler")

local BoxesObjectModule = require("code.game.box.object")

local SaveFilesModule = require("code.engine.saves.files")
local RenderModule = require("code.engine.render")
local extra = require("code.engine.extra")

local UIData = require("code.data.ui")
local SharedData = UIData.shared

local Module = {}
Module._updateFunctions = {}

function Module:setupSettingsButton(scene)
    if not scene then return end

    local settingsButtonHitbox = RenderModule:createElement(SharedData.settingsButtonHitbox)

    local settingsButton = UIButtonObjectModule:createButton({
        elements = {settingsButtonHitbox},
        hitboxElement = settingsButtonHitbox,

        mouseButton = 1,

        onClick = function()
            ScreenTransitionModule:transition({
                callback = function()
                    UISceneHandlerModule:switch("settings")
                end
            })
        end
    })

    table.insert(scene._elements, settingsButtonHitbox)
    table.insert(scene._objects, settingsButton)
end

function Module:setupSidebarBackground(scene)
    local sidebarBackground = RenderModule:createElement(SharedData.sidebarBackground)
    table.insert(scene._elements, sidebarBackground)
end

function Module:setupShopBackButton(scene)
    local shopBackButtonHitbox = RenderModule:createElement(SharedData.shopBackButtonHitbox)
    local shopBackButtonLabel = RenderModule:createElement(SharedData.shopBackButtonLabel)

    local shopBackButton = UIButtonObjectModule:createButton({
        elements = {shopBackButtonHitbox, shopBackButtonLabel},
        hitboxElement = shopBackButtonHitbox,

        mouseButton = 1,

        onClick = function()
            ScreenTransitionModule:transition({
                callback = function()
                    UISceneHandlerModule:switch("game")
                end
            })
        end
    })

    table.insert(scene._elements, shopBackButtonHitbox)
    table.insert(scene._elements, shopBackButtonLabel)
    table.insert(scene._objects, shopBackButton)
end

function Module:setupBackToMenuButton(scene)
    local backToMenuButtonHitbox = RenderModule:createElement(SharedData.backToMenuButtonHitbox)
    table.insert(scene._elements, backToMenuButtonHitbox)

    local backToMenuButton = UIButtonObjectModule:createButton({
        elements = {
            backToMenuButtonHitbox,
        },

        hitboxElement = backToMenuButtonHitbox,

        mouseButton = 1,
        onClick = function()
            ScreenTransitionModule:transition({
                callback = function()
                    SaveFilesModule:unloadFile(SaveFilesModule.loadedFile)
                    BoxesObjectModule:clearBoxes()
                    
                    UISceneHandlerModule:switch("saveFiles")

                    
                end
            })
        end
    })

    table.insert(scene._objects, backToMenuButton)
end

function Module:setupCreditsLabel(scene)
    local creditsLabel = RenderModule:createElement(SharedData.creditsLabel)

    self._updateFunctions.creditsLabelUpdateFunction = function()
        if not creditsLabel then return end

        creditsLabel.text = SaveFilesModule.loadedFile.currencies.credits .. " C$"
    end

    table.insert(scene._elements, creditsLabel)
end

function Module:setupSessionPlaytimeLabel(scene)
    local sessionPlaytimeLabel = RenderModule:createElement(SharedData.sessionPlaytimeLabel)

    self._updateFunctions.sessionPlaytimeLabelUpdateFunction = function()
        if not sessionPlaytimeLabel then return end

        sessionPlaytimeLabel.text = 
        "Session Time: " .. extra.formatTime(
            SaveFilesModule.loadedFile.stats.playtime 
            - 
            SaveFilesModule.loadedFile.stats.playtimeAtSessionStart
        )

    end

    table.insert(scene._elements, sessionPlaytimeLabel)
end

function Module:update()
    for _, updateFunction in pairs(self._updateFunctions) do
        updateFunction()
    end
end

return Module