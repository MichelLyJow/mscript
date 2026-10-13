local PlaceId = game.PlaceId

local Scripts = {
    -- Blox Fruits (Sea1,Sea2,Sea3)
    [2753915549] = "https://raw.githubusercontent.com/MichelLyJow/mscript/refs/heads/main/BloxFruits.lua",
    [4442272183] = "https://raw.githubusercontent.com/MichelLyJow/mscript/refs/heads/main/BloxFruits.lua",
    [7449423635] = "https://raw.githubusercontent.com/MichelLyJow/mscript/refs/heads/main/BloxFruits.lua",
    [] = "",
}

local TargetScript = Scripts[PlaceId]

if TargetScript then
    local success, err = pcall(function()
        loadstring(game:HttpGet(TargetScript))()
    end)
    
    if not success then
        warn("[Loader] Error: " .. tostring(err))
    end
else
    warn("[Loader] Place ID " .. tostring(PlaceId) .. " tidak terdaftar!")
end
