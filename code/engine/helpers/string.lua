local Module = {}

-- Insert base functions into module
for key, value in pairs(string) do
    Module[key] = value
end

function Module.formatTime(seconds)
    local m = math.floor(seconds / 60)
    local s = seconds % 60
    return string.format("%02d:%02d:%02d", 0, m, s)
end

return Module