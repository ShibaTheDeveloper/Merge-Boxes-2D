local Elements = {}

local Element = {
    type = "sprite",
    tableIndex = 0,
    zIndex = 0,

    offsetX = 0,
    offsetY = 0,
    scaleX = 1,
    scaleY = 1,
    x = 0,
    y = 0,

    rotation = 0,
    alpha = 0,
}
Element.__index = Element

function Element:remove()
    Elements[self.tableIndex] = nil
    self = nil
end

function Element:draw() --%note spaghettios
    if self.type == "sprite" then love.graphics.draw(self.drawable, self.x, self.y, self.rotation, self.scaleX, self.scaleY, self.offsetX, self.offsetY)
    else love.graphics.print(self.text, self.x, self.y, self.rotation, self.scaleX, self.scaleY, self.offsetX, self.offsetY) end
end

local Module = {}
Module._elements = Elements
Module._types = {}

function Module:createElement(type, data)
    if (type ~= "text") and (type ~= "sprite") then return end

    local element = setmetatable(data or {}, Element)

    table.insert(self._elements, element)
    element.tableIndex = #Elements
    element.type = type

    if type == "sprite" then
        element.drawable = love.graphics.newImage(data.spritePath)
        element.spritePath = data.spritePath
     end

    return element
end

function Module:drawAll()
    for _, element in pairs(self._elements) do
        element:draw()
    end
end

return Module