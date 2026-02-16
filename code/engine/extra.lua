-- ~/code/engine/extra.lua

local RenderModule = require("code.engine.render")

local Module = {}

function Module.HSVtoRGB(h, s, v)
    local r, g, b

    local i = math.floor(h * 6)
    local f = h * 6 - i
    local p = v * (1 - s)
    local q = v * (1 - f * s)
    local t = v * (1 - (1 - f) * s)

    i = i % 6

    if i == 0 then r, g, b = v, t, p
    elseif i == 1 then r, g, b = q, v, p
    elseif i == 2 then r, g, b = p, v, t
    elseif i == 3 then r, g, b = p, q, v
    elseif i == 4 then r, g, b = t, p, v
    elseif i == 5 then r, g, b = v, p, q
    end

    return RenderModule:createColor(math.floor(r*255), math.floor(g*255), math.floor(b*255))
end

function Module.xorByte(a, b)
    local result = 0
    local bitval = 1

    while a > 0 or b > 0 do
        local abit = a % 2
        local bbit = b % 2

        if (abit + bbit) == 1 then
            result = result + bitval
        end

        a = math.floor(a / 2)
        b = math.floor(b / 2)
        bitval = bitval * 2
    end

    return result
end

function Module.clamp(x, min, max)
    x = (x > max and max or x)
    x = (x < min and min or x)

    return x
end

function Module.cloneTable(table)
    local newTable = {}

   for index, value in pairs(table) do
        newTable[index] = value
    end

    return newTable
end

function Module.lerp(a, b, lerpFactor)
    return a + (b - a) * lerpFactor
end

function Module.getRotationByWave(type, speed)
    local mathFunction = math[type]
    if not mathFunction then return end
    
    local rotation = mathFunction(love.timer.getTime() * speed)
    return rotation
end

function Module.formatTime(seconds)
    local hours = math.floor(seconds / 3600)
    local minutes = math.floor((seconds % 3600) / 60)
    local secs = math.floor(seconds % 60)

    return string.format("%02d:%02d:%02d", hours, minutes, secs)
end

return Module