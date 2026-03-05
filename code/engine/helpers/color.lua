local Module = {}

-- Converts HSV to RGB
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

    return math.floor(r*255), math.floor(g*255), math.floor(b*255)
end

-- Converts RGB to HSV
function Module.RGBtoHSV(r, g, b)
    r = r / 255
    g = g / 255
    b = b / 255

    local max = math.max(r, g, b)
    local min = math.min(r, g, b)
    local delta = max - min

    local h, s, v = 0, 0, max

    if delta ~= 0 then
        if max == r then
            h = (g - b) / delta % 6
        elseif max == g then
            h = (b - r) / delta + 2
        elseif max == b then
            h = (r - g) / delta + 4
        end
        h = h / 6
    end

    if max ~= 0 then
        s = delta / max
    end

    return h, s, v
end

return Module