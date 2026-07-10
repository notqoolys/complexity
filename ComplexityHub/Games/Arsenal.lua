--[[
    Complexity Hub - Arsenal Module
    Architecture Framework for 5 Tabs (6-9 Features each)
--]]

if getgenv().ComplexityLoaded then return end
getgenv().ComplexityLoaded = true

-- Load Fluent UI Library
local Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()

local Window = Fluent:CreateWindow({
    Title = "Complexity Hub",
    SubTitle = "Arsenal Edition",
    TabWidth = 160,
    Size = UDim2.fromOffset(580, 460),
    Acrylic = true,
    Theme = "Dark"
})

-- 5 Distinct Tabs
local Tabs = {
    Combat   = Window:AddTab({ Title = "Combat", Icon = "crosshair" }),
    Visuals  = Window:AddTab({ Title = "Visuals", Icon = "eye" }),
    Weapons  = Window:AddTab({ Title = "Weapon Mods", Icon = "zap" }),
    Movement = Window:AddTab({ Title = "Movement", Icon = "move" }),
    Utility  = Window:AddTab({ Title = "Utility & UI", Icon = "settings" })
}

-- Global Configurations System
getgenv().ComplexityConfig = {
    -- Combat
    SilentAim = false, Aimbot = false, FOV = 100, TargetPart = "Head", HitboxSize = 2, Triggerbot = false, Wallbang = false, TeamCheck = true, VisCheck = true,
    -- Visuals
    Boxes = false, Skeletons = false, Chams = false, Tracers = false, NameTags = false, HealthBar = false, Offscreen = false, Radar = false,
    -- Weapons
    NoRecoil = false, NoSpread = false, RapidFire = false, InfAmmo = false, FastSwitch = false, AutoFire = false, BulletTracers = false,
    -- Movement
    Bhop = false, SpeedHack = false, SpeedValue = 16, InfJump = false, Noclip = false, NoFall = false, SlideControl = false, AntiAim = false,
    -- Utility
    AutoJoin = false, StreamerMode = false, FpsBooster = false, KillSay = false, CustomTheme = "Dark"
}

--- ====================================================================
--- PLACEHOLDER FUNCTIONAL ARCHITECTURE (To be fully written in series)
--- ====================================================================

-- Movement Implementation Example
task.spawn(function()
    local UserInputService = game:GetService("UserInputService")
    local LocalPlayer = game:GetService("Players").LocalPlayer
    
    while task.wait() do
        if getgenv().ComplexityConfig.Bhop and LocalPlayer.Character then
            local humanoid = LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
            if humanoid and humanoid.FloorMaterial ~= Enum.Material.Air then
                if UserInputService:IsKeyDown(Enum.KeyCode.Space) then
                    humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
                end
            end
        end
    end
end)

--- ====================================================================
--- POPULATING THE 5 TABS (6-9 Features Each)
--- ====================================================================

-- 1. COMBAT TAB (9 Features)
Tabs.Combat:AddToggle("SilentAim", { Title = "Silent Aim", Default = false, Callback = function(v) getgenv().ComplexityConfig.SilentAim = v end })
Tabs.Combat:AddToggle("Aimbot", { Title = "Vector Aimbot", Default = false, Callback = function(v) getgenv().ComplexityConfig.Aimbot = v end })
Tabs.Combat:AddSlider("FOV", { Title = "FOV Ring Radius", Min = 10, Max = 500, Default = 100, Callback = function(v) getgenv().ComplexityConfig.FOV = v end })
Tabs.Combat:AddDropdown("Target", { Title = "Target Priority", Options = {"Head", "Torso", "Random"}, Default = "Head", Callback = function(v) getgenv().ComplexityConfig.TargetPart = v end })
Tabs.Combat:AddSlider("Hitbox", { Title = "Hitbox Expander Size", Min = 2, Max = 15, Default = 2, Callback = function(v) getgenv().ComplexityConfig.HitboxSize = v end })
Tabs.Combat:AddToggle("Trigger", { Title = "Triggerbot", Default = false, Callback = function(v) getgenv().ComplexityConfig.Triggerbot = v end })
Tabs.Combat:AddToggle("Wallbang", { Title = "Wall Penetration", Default = false, Callback = function(v) getgenv().ComplexityConfig.Wallbang = v end })
Tabs.Combat:AddToggle("Team", { Title = "Team Check", Default = true, Callback = function(v) getgenv().ComplexityConfig.TeamCheck = v end })
Tabs.Combat:AddToggle("VisCheck", { Title = "Visibility Check", Default = true, Callback = function(v) getgenv().ComplexityConfig.VisCheck = v end })

-- 2. VISUALS TAB (8 Features)
Tabs.Visuals:AddToggle("Boxes", { Title = "2D Bounding Boxes", Default = false, Callback = function(v) getgenv().ComplexityConfig.Boxes = v end })
Tabs.Visuals:AddToggle("Skeletons", { Title = "Skeleton Lines", Default = false, Callback = function(v) getgenv().ComplexityConfig.Skeletons = v end })
Tabs.Visuals:AddToggle("Chams", { Title = "Chams Highlight Glow", Default = false, Callback = function(v) getgenv().ComplexityConfig.Chams = v end })
Tabs.Visuals:AddToggle("Tracers", { Title = "Snapline Tracers", Default = false, Callback = function(v) getgenv().ComplexityConfig.Tracers = v end })
Tabs.Visuals:AddToggle("Names", { Title = "Name & Distance Tags", Default = false, Callback = function(v) getgenv().ComplexityConfig.NameTags = v end })
Tabs.Visuals:AddToggle("Health", { Title = "Dynamic Health Bar", Default = false, Callback = function(v) getgenv().ComplexityConfig.HealthBar = v end })
Tabs.Visuals:AddToggle("Offscreen", { Title = "Off-Screen Indicators", Default = false, Callback = function(v) getgenv().ComplexityConfig.Offscreen = v end })
Tabs.Visuals:AddToggle("Radar", { Title = "2D Screen Radar Map", Default = false, Callback = function(v) getgenv().ComplexityConfig.Radar = v end })

-- 3. WEAPON MODS TAB (7 Features)
Tabs.Weapons:AddToggle("Recoil", { Title = "No Recoil", Default = false, Callback = function(v) getgenv().ComplexityConfig.NoRecoil = v end })
Tabs.Weapons:AddToggle("Spread", { Title = "No Spread", Default = false, Callback = function(v) getgenv().ComplexityConfig.NoSpread = v end })
Tabs.Weapons:AddToggle("Rapid", { Title = "Rapid Fire (RPM)", Default = false, Callback = function(v) getgenv().ComplexityConfig.RapidFire = v end })
Tabs.Weapons:AddToggle("InfAmmo", { Title = "Infinite Ammo Clip", Default = false, Callback = function(v) getgenv().ComplexityConfig.InfAmmo = v end })
Tabs.Weapons:AddToggle("FastSwitch", { Title = "Instant Holster Switch", Default = false, Callback = function(v) getgenv().ComplexityConfig.FastSwitch = v end })
Tabs.Weapons:AddToggle("AutoFire", { Title = "Force Automatic", Default = false, Callback = function(v) getgenv().ComplexityConfig.AutoFire = v end })
Tabs.Weapons:AddToggle("BulletTracers", { Title = "Neon Bullet Tracers", Default = false, Callback = function(v) getgenv().ComplexityConfig.BulletTracers = v end })

-- 4. MOVEMENT TAB (8 Features)
Tabs.Movement:AddToggle("Bhop", { Title = "Auto Bunnyhop", Default = false, Callback = function(v) getgenv().ComplexityConfig.Bhop = v end })
Tabs.Movement:AddToggle("SpeedToggle", { Title = "Speed Hack", Default = false, Callback = function(v) getgenv().ComplexityConfig.SpeedHack = v end })
Tabs.Movement:AddSlider("SpeedVal", { Title = "Speed Multiplier", Min = 16, Max = 150, Default = 16, Callback = function(v) getgenv().ComplexityConfig.SpeedValue = v end })
Tabs.Movement:AddToggle("InfJump", { Title = "Infinite Jump", Default = false, Callback = function(v) getgenv().ComplexityConfig.InfJump = v end })
Tabs.Movement:AddToggle("Noclip", { Title = "Noclip / Collision Bypass", Default = false, Callback = function(v) getgenv().ComplexityConfig.Noclip = v end })
Tabs.Movement:AddToggle("NoFall", { Title = "No Fall Damage Status", Default = false, Callback = function(v) getgenv().ComplexityConfig.NoFall = v end })
Tabs.Movement:AddToggle("Slide", { Title = "Infinite Momentum Slide", Default = false, Callback = function(v) getgenv().ComplexityConfig.SlideControl = v end })
Tabs.Movement:AddToggle("AntiAim", { Title = "Anti-Aim Rotation (Spinbot)", Default = false, Callback = function(v) getgenv().ComplexityConfig.AntiAim = v end })

-- 5. UTILITY & UI TAB (8 Features)
Tabs.Utility:AddToggle("AutoJoin", { Title = "Server Matchmaking Hopper", Default = false, Callback = function(v) getgenv().ComplexityConfig.AutoJoin = v end })
Tabs.Utility:AddToggle("Streamer", { Title = "Streamer Mode (Blur Names)", Default = false, Callback = function(v) getgenv().ComplexityConfig.StreamerMode = v end })
Tabs.Utility:AddToggle("Booster", { Title = "FPS & Performance Booster", Default = false, Callback = function(v) getgenv().ComplexityConfig.FpsBooster = v end })
Tabs.Utility:AddToggle("KillSay", { Title = "Auto Kill-Say Toxicity Spammer", Default = false, Callback = function(v) getgenv().ComplexityConfig.KillSay = v end })

local SaveManager = Fluent: someSettings or {} -- Configuration fallback placeholders
Window:SelectTab(1)
Fluent:Notify({ Title = "Complexity Hub", Content = "Arsenal configuration module initialized successfully.", Duration = 5 })
