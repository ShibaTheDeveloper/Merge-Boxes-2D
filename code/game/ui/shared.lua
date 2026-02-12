-- ~/code/game/ui/shared.lua

local ScreenTransitionModule = require("code.game.vfx.screenTransition")

local UIButtonObjectModule = require("code.game.ui.objects.button")
local UISceneHandlerModule = require("code.game.ui.sceneHandler")

local SaveFilesModule = require("code.engine.saves.files")
local RenderModule = require("code.engine.render")
local extra = require("code.engine.extra")

local UIData = require("code.data.ui")
local Shared = UIData.shared

local Module = {}

function Module:setupSettingsButton(scene)
    if not scene then return end

    local settingsButtonHitbox = RenderModule:createElement(Shared.settingsButtonHitbox)
    table.insert(scene._elements, settingsButtonHitbox)

    local settingsButton = UIButtonObjectModule:createButton({
        elements = {
            settingsButtonHitbox,
        },

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

    table.insert(scene._objects, settingsButton)
end

function Module:setupSidebarBackground(scene)
    local sidebarBackground = RenderModule:createElement(Shared.sidebarBackground)
    table.insert(scene._elements, sidebarBackground)
end

function Module:setupShopBackButton(self)
    local shopBackButtonHitbox = RenderModule:createElement(Shared.shopBackButtonHitbox)
    local shopBackButtonLabel = RenderModule:createElement(Shared.shopBackButtonLabel)

    table.insert(self._elements, shopBackButtonHitbox)
    table.insert(self._elements, shopBackButtonLabel)

    local shopBackButton = UIButtonObjectModule:createButton({
        elements = {
            shopBackButtonHitbox,
            shopBackButtonLabel
        },

        hitboxElement = shopBackButtonHitbox,

        mouseButton = 1,
        onClick = function()
            ScreenTransitionModule:transition({
                callback = function()
                    UISceneHandlerModule:switch("game", SaveFilesModule.loadedFile.slot, true)
                end
            })
        end
    })

    table.insert(self._objects, shopBackButton)
end

function Module:setupCreditsLabel(self)
    local creditsLabel = RenderModule:createElement(Shared.creditsLabel)
    table.insert(self._elements, creditsLabel)

    return function()
        if creditsLabel then
            creditsLabel.text = SaveFilesModule.loadedFile.currencies.credits .. " C$"
        end
    end
end

function Module:setupSessionPlaytimeLabel(self, keepSessionPlaytime)
    if not keepSessionPlaytime then
        SaveFilesModule.loadedFile.stats.playtimeAtSessionStart = SaveFilesModule.loadedFile.stats.playtime
    end

    local sessionPlaytimeLabel = RenderModule:createElement(Shared.sessionPlaytimeLabel)
    table.insert(self._elements, sessionPlaytimeLabel)

    return function()
        if sessionPlaytimeLabel then
            sessionPlaytimeLabel.text = "Session Time: " .. extra.formatTime(SaveFilesModule.loadedFile.stats.playtime - SaveFilesModule.loadedFile.stats.playtimeAtSessionStart)
        end
    end
end

return Module