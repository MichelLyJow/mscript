local BLOX_FRUITS_SCRIPT = "https://raw.githubusercontent.com/MichelLyJow/mscript/refs/heads/main/BloxFruits.lua"

local byPlaceId = {
    [2753915549] = BLOX_FRUITS_SCRIPT,
    [4442272183] = BLOX_FRUITS_SCRIPT,
    [7449423635] = BLOX_FRUITS_SCRIPT,
}

local byGameId = {
    [994732206] = BLOX_FRUITS_SCRIPT,
}

local gameId = game.GameId
while gameId == 0 and game.PlaceId == 0 do
    task.wait()
    gameId = game.GameId
end

local url = byGameId[gameId] or byPlaceId[game.PlaceId]

if not url then
    return
end

for i = 1, 3 do
    local ok, source = pcall(game.HttpGet, game, url)
    
    if ok and type(source) == "string" and source ~= "" then
        local chunk = loadstring(source)
        if chunk then
            chunk()
            return
        end
    end
    
    task.wait(0.5)
end
