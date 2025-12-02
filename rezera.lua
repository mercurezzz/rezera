-- LocalScript
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local Workspace = game:GetService("Workspace")
local Lighting = game:GetService("Lighting")

-- === Avatar cleanup ===
local function cleanAvatar(character)
    for _, acc in ipairs(character:GetChildren()) do
        if acc:IsA("Accessory") or acc:IsA("Hat") then acc:Destroy() end
    end

    local head = character:FindFirstChild("Head")
    if head then
        for _, decal in ipairs(head:GetChildren()) do
            if decal:IsA("Decal") then decal:Destroy() end
        end
    end

    for _, child in ipairs(character:GetChildren()) do
        if child:IsA("Shirt") or child:IsA("Pants") or child:IsA("ShirtGraphic") then
            child:Destroy()
        end
    end

    for _, part in ipairs(character:GetChildren()) do
        if part:IsA("BasePart") then
            part.Color = Color3.fromRGB(255,255,255)
            part.Material = Enum.Material.SmoothPlastic
        end
    end
end

local function onCharacterAdded(character)
    cleanAvatar(character)
end

if LocalPlayer.Character then
    onCharacterAdded(LocalPlayer.Character)
end
LocalPlayer.CharacterAdded:Connect(onCharacterAdded)

-- === Nighttime ===
Lighting.TimeOfDay = "00:00:00"
Lighting.Brightness = 2
Lighting.FogEnd = 500
Lighting.Ambient = Color3.fromRGB(20,20,20)
Lighting.OutdoorAmbient = Color3.fromRGB(20,20,20)

-- === GUI Setup ===
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Parent = LocalPlayer:WaitForChild("PlayerGui")
ScreenGui.ResetOnSpawn = false

local MainFrame = Instance.new("Frame")
MainFrame.Size = UDim2.new(0, 220, 0, 110)
MainFrame.Position = UDim2.new(0.5, -110, 0.8, -55)
MainFrame.BackgroundColor3 = Color3.fromRGB(30,30,30)
MainFrame.BorderSizePixel = 0
MainFrame.Parent = ScreenGui
MainFrame.AnchorPoint = Vector2.new(0.5,0.5)

local UICorner = Instance.new("UICorner")
UICorner.CornerRadius = UDim.new(0,15)
UICorner.Parent = MainFrame

-- === Speed Button ===
local SpeedButton = Instance.new("TextButton")
SpeedButton.Size = UDim2.new(0,200,0,40)
SpeedButton.Position = UDim2.new(0,10,0,10)
SpeedButton.BackgroundColor3 = Color3.fromRGB(0,170,255)
SpeedButton.TextColor3 = Color3.fromRGB(255,255,255)
SpeedButton.Text = "Speed OFF"
SpeedButton.BorderSizePixel = 0
SpeedButton.Parent = MainFrame

-- === Script Load Button ===
local LoadButton = Instance.new("TextButton")
LoadButton.Size = UDim2.new(0,200,0,40)
LoadButton.Position = UDim2.new(0,10,0,60)
LoadButton.BackgroundColor3 = Color3.fromRGB(0,255,128)
LoadButton.TextColor3 = Color3.fromRGB(255,255,255)
LoadButton.Text = "Load Scripts"
LoadButton.BorderSizePixel = 0
LoadButton.Parent = MainFrame

-- === Make draggable ===
local dragging = false
local dragInput, dragStart, startPos

MainFrame.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = true
        dragStart = input.Position
        startPos = MainFrame.Position
        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then
                dragging = false
            end
        end)
    end
end)

MainFrame.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement then
        dragInput = input
    end
end)

UserInputService.InputChanged:Connect(function(input)
    if input == dragInput and dragging then
        local delta = input.Position - dragStart
        MainFrame.Position = UDim2.new(
            startPos.X.Scale,
            startPos.X.Offset + delta.X,
            startPos.Y.Scale,
            startPos.Y.Offset + delta.Y
        )
    end
end)

-- === Speed Toggle ===
local speedEnabled = false
SpeedButton.MouseButton1Click:Connect(function()
    speedEnabled = not speedEnabled
    SpeedButton.Text = speedEnabled and "Speed ON" or "Speed OFF"
end)

RunService.RenderStepped:Connect(function()
    local character = LocalPlayer.Character
    if character and character:FindFirstChild("HumanoidRootPart") and character:FindFirstChild("Humanoid") then
        local hrp = character.HumanoidRootPart
        local humanoid = character.Humanoid

        if speedEnabled then
            local dir = humanoid.MoveDirection
            if dir.Magnitude > 0 then
                local moveVelocity = dir.Unit * 32
                hrp.Velocity = Vector3.new(moveVelocity.X, hrp.Velocity.Y, moveVelocity.Z)
                humanoid.JumpPower = 35
            end
        end
    end
end)

-- === Load scripts button ===
LoadButton.MouseButton1Click:Connect(function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/tienkhanh1/spicy/main/Chilli.lua"))()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/pinkaroo/Scripts/refs/heads/main/SAB/AllSABLoadstrings"))()
end)

-- === Mouse Lock Toggle ===
local toggleKey = Enum.KeyCode.LeftAlt
local isLocked = true

local function updateLockState()
    if isLocked then
        UserInputService.MouseBehavior = Enum.MouseBehavior.LockCenter
        UserInputService.MouseIconEnabled = false
    else
        UserInputService.MouseBehavior = Enum.MouseBehavior.Default
        UserInputService.MouseIconEnabled = true
    end
end

updateLockState()

UserInputService.InputBegan:Connect(function(input, gameProcessed)
    if gameProcessed then return end
    if input.KeyCode == toggleKey then
        isLocked = not isLocked
        updateLockState()
    end
end)
