local IdManagerModule = require("modules.engine.id_manager")
local AnimateModule = require("modules.engine.animate")

local manager = IdManagerModule:createManager()

local Module = {}
Module._sources = {}

local Source = {
    id = 0,
    audioPath = "",
    object = nil,
    _fade = {}
}
Source.__index = Source

function Source:remove()
    if self.object then
        self.object:release()
    end

    if self.id and Module._sources[self.id] then
        Module._sources[self.id] = nil
        manager:release(self.id)
    end
end

function Source:stop()
    if not self.object then Source:remove() return end
    love.audio.stop(self.object)
end

function Source:pause()
    if not self.object then Source:remove() return end
    love.audio.pause(self.object)
end

function Source:fadeIn(duration, targetVolume)
    if not self.object then Source:remove() return end
    if not targetVolume then targetVolume = 1 end
    self.object:setVolume(0)

    love.audio.play(self.object)

    self._fade = {
        type = "in",
        duration = duration,
        elapsed = 0,
        startVolume = 0,
        targetVolume = targetVolume
    }
end

function Source:fadeOut(duration)
    if not self.object then return end

    self._fade = {
        type = "out",
        duration = duration,
        elapsed = 0,
        startVolume = self.object:getVolume(),
        targetVolume = 0
    }
end

function Source:play(randomizePitch, pitchRange)
    if not self.object then Source:remove() return end

    local previousPitch = self.object:getPitch()

    if randomizePitch then
        pitchRange = pitchRange or .1

        local randomPitch = previousPitch + (math.random() * 2 - 1) * pitchRange
        self.object:setPitch(randomPitch)
    end

    love.audio.play(self.object)
    self.object:setPitch(previousPitch)
end

function Module:updateAll(deltaTime)
    for _, source in pairs(Module._sources) do
        if not source.object then source:remove() goto continue end

        local fade = source._fade
        if not fade then goto continue end
        if type(fade.duration) ~= "number" then goto continue end

        fade.elapsed = (fade.elapsed or 0) + deltaTime

        local timer = math.min(fade.elapsed / fade.duration, 1)
        local currentVolume = (fade.startVolume or 0) + ((fade.targetVolume or 0) - (fade.startVolume or 0)) * timer
        source.object:setVolume(currentVolume)

        if timer > 1 then
            local fadeType = fade.type
            source._fade = {}

            if fadeType == "out" then
                source:stop()
            end
        end

        :: continue ::
    end
end

function Module:createSource(audioPath, sourceType)
    if sourceType ~= "static" and sourceType ~= "stream" then sourceType = "stream" end

    if not (audioPath and love.filesystem.getInfo(audioPath)) then
        return
    end

    local source = setmetatable({
        id = manager:get(),
        audioPath = audioPath,
        object = love.audio.newSource(audioPath, sourceType),
        _fade = {}
    }, Source)

    Module._sources[source.id] = source

    return source
end

return Module