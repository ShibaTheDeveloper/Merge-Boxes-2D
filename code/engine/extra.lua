-- ~/code/engine/extra.lua

local Module = {}

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