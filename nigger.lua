local Players = game:GetService("Players")
local PPP = game:GetService("ProximityPromptService")

local LocalPlayer = Players.LocalPlayer
local Character = LocalPlayer.Character

local PlayerGui = LocalPlayer.PlayerGui
local Notifications = PlayerGui:WaitForChild("Notification", 9e9).Notification

LocalPlayer.CharacterAdded:Connect(function(NewChar)
    Character = NewChar
end)

local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/UI-Libs/main/Vape.txt"))()
local Window = Library:Window("rezzy", Color3.fromRGB(44, 120, 224), Enum.KeyCode.RightControl)

local Tab = Window:Tab("Main")

local Airhorn =  true
local AutoKick = true

Tab:Toggle("Airhorn", true, function(Value)
    Airhorn = Value
end)

Tab:Toggle("Auto Kick", true, function(Value)
    AutoKick = Value
end)

LocalPlayer:GetAttributeChangedSignal("Stealing"):Connect(function()
    if not Airhorn then return end
    if not LocalPlayer:GetAttribute("Stealing") then return end

    print("Trigger")

    local Airhorn = LocalPlayer.Backpack:FindFirstChild("Megaphone") or LocalPlayer.Character:FindFirstChild("Megaphone")

    if Airhorn then
        if not Airhorn:IsDescendantOf(Character) then
            Character.Humanoid:EquipTool(Airhorn)
        end

        Airhorn:Activate()
    end
end)

Notifications.ChildAdded:Connect(function(Child)
    if AutoKick then
        if Child.Text:sub(1, 11) == "You stole <" then
            repeat task.wait() until not LocalPlayer:GetAttribute("Stealing")
            LocalPlayer:Kick(Child.Text:gsub("<[^>]->", ""))
        end
    end
end)
