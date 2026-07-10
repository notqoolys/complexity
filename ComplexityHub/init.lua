--[[
    Complexity Hub - Main Bootloader
    Educational Series Framework
--]]

local HttpService = game:GetService("HttpService")
local PlaceId = game.PlaceId

-- Replace 'YourGitHubUsername' with your actual GitHub username once uploaded
local baseUrl = "https://raw.githubusercontent.com/ttqoolys/Complexity/main/Games/"

local GameScripts = {
    [286090429]  = "Arsenal.lua",   -- Arsenal
    [6872265039] = "BedWars.lua",   -- BedWars (Example)
}

if GameScripts[PlaceId] then
    local scriptUrl = baseUrl .. GameScripts[PlaceId]
    local success, scriptContent = pcall(function()
        return game:HttpGet(scriptUrl)
    end)
    
    if success then
        loadstring(scriptContent)()
    else
        warn("Complexity: Failed to load game-specific module. Falling back to Universal.")
        loadstring(game:HttpGet(baseUrl .. "Universal.lua"))()
    end
else
    print("Complexity: Game not natively supported. Loading Universal Module.")
    local success, scriptContent = pcall(function()
        return game:HttpGet(baseUrl .. "Universal.lua")
    end)
    if success then
        loadstring(scriptContent)()
    else
        warn("Complexity: Failed to load Universal module.")
    end
end
