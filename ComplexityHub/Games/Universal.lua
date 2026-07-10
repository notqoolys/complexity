--[[
    Complexity Hub - Universal Fallback Module
    Basic features that execute on any game environment
--]]

local Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()
local Window = Fluent:CreateWindow({
    Title = "Complexity Hub",
    SubTitle = "Universal Mode",
    TabWidth = 160,
    Size = UDim2.fromOffset(580, 460),
    Theme = "Dark"
})

local Tabs = {
    Visuals  = Window:AddTab({ Title = "Visuals", Icon = "eye" }),
    Movement = Window:AddTab({ Title = "Movement", Icon = "move" })
}

Tabs.Visuals:AddParagraph({ Title = "Universal Fallback Activated", Content = "This game is not natively mapped out in Complexity Hub yet. Only basic engine wrappers are available." })
Window:SelectTab(1)
