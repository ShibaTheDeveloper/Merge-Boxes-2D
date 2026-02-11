-- ~/code/game/ui/shared.lua

local ScreenTransitionModule = require("code.game.vfx.screenTransition")

local UIButtonObjectModule = require("code.game.ui.objects.button")
local UISceneHandlerModule = require("code.game.ui.sceneHandler")

local SaveFilesModule = require("code.engine.saveFiles")
local RenderModule = require("code.engine.render")

local UIData = require("code.data.ui")

local Module = {}

function Module:setupSettingsButton(scene)
    if not scene then return end

    local settingsButtonHitbox = RenderModule:createElement(UIData.shared.settingsButtonHitbox)
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
    local sidebarBackground = RenderModule:createElement(UIData.shared.sidebarBackground)
    table.insert(scene._elements, sidebarBackground)
end

function Module:setupShopBackButton(self)
    local shopBackButtonHitbox = RenderModule:createElement(UIData.shared.shopBackButtonHitbox)
    local shopBackButtonLabel = RenderModule:createElement(UIData.shared.shopBackButtonLabel)

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
                    SaveFilesModule.loadFile(_G.SaveFilesSelectedSlot)
                    UISceneHandlerModule:switch("game")
                end
            })
        end
    })

    table.insert(self._objects, shopBackButton)
end

return Module