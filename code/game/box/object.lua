-- ~/code/game/box/object.lua

local IdManagerModule = require("code.engine.idManager")
local RenderModule = require("code.engine.render")
local BoxesData = require("code.data.boxes")

local manager = IdManagerModule:createManager()

local Module = {}
Module.boxes = {}

local CONSTANTS = require("code.game.box.constants")

local Box = {
    id = 0,
    element = nil,

    dragging = false,
    merging = false,

    description = "",
    quote = "",
    name = "",

    weight = 0,
    tier = 1,

    velocityX = 0,
    velocityY = 0,
}
Box.__index = Box

function Box:remove()
    local id = self.id

    Module.boxes[id] = nil
    manager:release(id)

    self.element:remove()
end

function Module:createBox(tier, x, y)
    local data = BoxesData[tier]
    if not data then return end

    local element = RenderModule:createElement({
        x = x,
        y = y,
        spritePath = data.spritePath,
        type = "sprite",
        scaleX = data.scale,
        scaleY = data.scale,
        zIndex = CONSTANTS.BASE_BOX_ZINDEX
    })

    local box = setmetatable({
        id = manager:get(),
        element = element,

        dragging = false,
        merging = false,

        description = data.description,
        quote = data.quote,
        name = data.name,

        weight = data.weight,
        tier = data.tier,

        velocityX = 0,
        velocityY = 0,
    }, Box)

    self.boxes[box.id] = box

    box._scaleTween = {
        startX = data.scale * CONSTANTS.SPAWN_SCALE_MULTIPLIER,
        startY = data.scale * CONSTANTS.SPAWN_SCALE_MULTIPLIER,
        targetX = data.scale,
        targetY = data.scale,
        timeSinceStart = 0,
        duration = CONSTANTS.BASE_SCALE_TWEEN_DURATION
    }

    return box
end

function Module:getSortedArray()
    local array = {}

    for _, box in pairs(self.boxes) do
        table.insert(array, box)
    end

    table.sort(array, function(a, b)
        return a.element.zIndex > b.element.zIndex
    end)

    return array
end

return Module