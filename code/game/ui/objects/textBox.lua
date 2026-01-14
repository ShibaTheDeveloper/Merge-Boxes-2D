local IdManagerModule = require("code.engine.idManager")
local manager = IdManagerModule:createManager()

local TextBox = {
    id = 0,

    elements = {},

    hitboxElement = nil,
    fieldElement = nil,

    onChange = nil,

    placeholder = "",
    text = "",

    focused = false,
}
TextBox.__index = TextBox

local Module = {}
Module._textBoxes = {}

function TextBox:remove()
    Module._textBoxes[self.id] = nil
    manager:release(self.id)
end

function TextBox:mousePressed(x, y, _)
    local isPointInside = self.hitboxElement:isPointInside(x, y)
    self.focused = isPointInside
end

function TextBox:textInput(input)
    if not self.focused then return end
    self.text = self.text .. input
end

function TextBox:update(deltaTime)
    ---@diagnostic disable-next-line: inject-field
    self.fieldElement.text = (self.text and self.text or self.placeholderText)
end

function Module:createTextBox(data)
    if not data then return end
    if not data.hitboxElement then return end
    if not data.fieldElement then return end
    if #data.elements == 0 then return end

    local textBox = setmetatable({
        id = manager:get(),

        elements = {},

        hitboxElement = data.hitboxElement,
        fieldElement = data.fieldElement,

        onChange = data.onChange,

        placeholder = data.placeholderText or "",
        text = "",

        focused = false,
    }, TextBox)

    self._textBoxes[textBox.id] = textBox
    return textBox
end

function Module:mousePressed(x, y, button)
    for _, textBox in pairs(self._textBoxes) do
        textBox:mousePressed(x, y, button)
    end
end

function Module:textInput(input)
    for _, textBox in pairs(self._textBoxes) do
        textBox:textInput(input)
    end
end

function Module:updateAll(deltaTime)
    for _, textBox in pairs(self._textBoxes) do
        textBox:update(deltaTime)
    end
end

return Module