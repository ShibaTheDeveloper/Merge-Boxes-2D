-- ~/code/engine/saves/files.lua

local SavesDecodeModule = require("code.engine.saves.decode")
local SavesEncodeModule = require("code.engine.saves.encode")

local extra = require("code.engine.extra")

local CONSTANTS = require("code.engine.saves.constants")

local Module = {}
Module.loadedFile = nil

function Module:saveFile()
    local finalOutput = SavesEncodeModule:encodeSettings(self.loadedFile)
    local fileName = CONSTANTS.SETTINGS_FILE_NAME

    love.filesystem.write(fileName, finalOutput)
end

function Module:loadFile()
    local fileName = CONSTANTS.SETTINGS_FILE_NAME

    local file = love.filesystem.read(fileName)
    local decodedFile = (file and SavesDecodeModule:decodeSettings(file) or nil)

    if not decodedFile then
        decodedFile = extra.cloneTable(CONSTANTS.DEFAULT_SETTINGS)
    end

    self.loadedFile = decodedFile

    return decodedFile
end

return Module