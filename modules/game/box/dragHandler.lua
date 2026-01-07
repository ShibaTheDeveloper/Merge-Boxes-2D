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
        for _, box in pairs(BoxesObjectModule.boxes) do
            if box.element:isPointInside(mouseX, mouseY) and not box.merging then
                self._draggedBox = box
                self._draggedBox.dragging = true

                lastDraggedBoxAlpha = self._draggedBox.element.color.alpha
                self._draggedBox.element.color.alpha = CONSTANTS.DRAGGED_BOX_ALPHA
                self._draggedBox.element.zIndex = CONSTANTS.BASE_BOX_ZINDEX + 1

                break
            end
        end
    end

    if not mouseDown and self._draggedBox then
        self._draggedBox.element.color.alpha = lastDraggedBoxAlpha

        self._draggedBox.dragging = false
        self._draggedBox = nil
    end

    self._wasMouseDown = mouseDown
end

return Module