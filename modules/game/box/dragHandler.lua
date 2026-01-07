local BoxesObjectModule = require("modules.game.box.object")
local extra = require("modules.engine.extra")

local CONSTANTS = require("modules.game.box.constants")

local Module = {}
Module._wasMouseDown = false
Module._mouseDown = false
Module._draggedBox = nil

local lastDraggedBoxAlpha = 0

function Module:update()
    local mouseDown = love.mouse.isDown(1)
    local mouseX, mouseY = extra.getScaledMousePos()

    if mouseDown and not self._wasMouseDown then
        local boxesArray = BoxesObjectModule:getSortedArray()

        local success = false
        for _, box in pairs(boxesArray) do
            if not box.element:isPointInside(mouseX, mouseY) then goto continue end
            if box.merging then goto continue end

            self._draggedBox = box
            self._draggedBox.dragging = true

            lastDraggedBoxAlpha = self._draggedBox.element.color.alpha
            self._draggedBox.element.color.alpha = CONSTANTS.DRAGGED_BOX_ALPHA

            self._draggedBox.element.zIndex = CONSTANTS.BASE_BOX_ZINDEX + 2

            success = true

            if success then break end
            :: continue ::
        end
    end

    if not mouseDown and self._draggedBox then
        self._draggedBox.element.color.alpha = lastDraggedBoxAlpha
        self._draggedBox.element.zIndex = CONSTANTS.BASE_BOX_ZINDEX + 1

        self._draggedBox.dragging = false
        self._draggedBox = nil
    end

    self._wasMouseDown = mouseDown
end

return Module