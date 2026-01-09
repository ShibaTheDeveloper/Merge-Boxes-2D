-- ~/code/game/ui/scenes/saveFiles.lua

local ScreenTransitionModule = require("code.game.vfx.screenTransition")

local UIButtonObjectModule = require("code.game.ui.objects.button")
local UISceneHandlerModule = require("code.game.ui.sceneHandler")

local SaveFilesModule = require("code.engine.saveFiles")
local RenderModule = require("code.engine.render")

local ScenesData = require("code.data.scenes")

local Module = {}
Module._elements = {}
Module._buttons = {}
Module.name = "saveFiles"

local SceneData = ScenesData[Module.name]

function Module:clean()
    for _, element in pairs(self._elements) do
        element:remove()
    end

    for _, button in pairs(self._buttons) do
        button:remove()
    end

    self._elements = {}
    self._buttons = {}
end

local function setupBackground(self)
    local background = RenderModule:createElement(SceneData.background)
    table.insert(self._elements, background)
end

local function setupSaveFileButtons(self)
    local saves = SaveFilesModule.getAllSaveFiles()

    if #saves == 0 then return end

    local firstHitbox = RenderModule:createElement(SceneData.templateSaveFileBackground)
    local buttonWidth = firstHitbox.drawable:getWidth()
    firstHitbox:remove()

    local totalWidth = (#saves * buttonWidth) + ((#saves - 1))
    local startX = (_G.WINDOW_WIDTH - totalWidth) / 2

    for index, save in ipairs(saves) do
        local templateSaveFileBackground = RenderModule:createElement(SceneData.templateSaveFileBackground)
        local templateSaveFileLabel = RenderModule:createElement(SceneData.templateSaveFileLabel)

        local x = startX + (buttonWidth / 2) + ((index - 1) * (buttonWidth))

        templateSaveFileBackground.x = x
        templateSaveFileLabel.x = x

        templateSaveFileLabel.text = "Slot " .. tostring(save.slot)

        table.insert(self._elements, templateSaveFileBackground)
        table.insert(self._elements, templateSaveFileLabel)
    end
end

local function setupBackToMenuButton(self)
    local backToMenuButtonHitbox = RenderModule:createElement(SceneData.backToMenuButtonHitbox)
    local backToMenuButtonLabel = RenderModule:createElement(SceneData.backToMenuButtonLabel)

    table.insert(self._elements, backToMenuButtonHitbox)
    table.insert(self._elements, backToMenuButtonLabel)

    local backToMenuButton = UIButtonObjectModule:createButton({
        elements = {
            backToMenuButtonHitbox,
            backToMenuButtonLabel
        },

        hitboxElement = backToMenuButtonHitbox,

        cooldown = 999,

        mouseButton = 1,
        onClick = function()
            ScreenTransitionModule:transition({
                callback = function()
                    UISceneHandlerModule:switch("mainMenu")
                end
            })
        end
    })

    table.insert(self._buttons, backToMenuButton)
end

function Module:init()
    setupBackToMenuButton(self)
    setupSaveFileButtons(self)
    setupBackground(self)
end

return Module