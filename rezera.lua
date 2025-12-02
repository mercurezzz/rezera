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
MainFrame.Size = UDim2.new(0, 240, 0, 130)
MainFrame.Position = UDim2.new(0.5, -120, 0.8, -65)
MainFrame.BackgroundColor3 = Color3.fromRGB(20,20,20)
MainFrame.BorderSizePixel = 0
MainFrame.Parent = ScreenGui
MainFrame.AnchorPoint = Vector2.new(0.5,0.5)

local UICorner = Instance.new("UICorner")
UICorner.CornerRadius = UDim.new(0,20)
UICorner.Parent = MainFrame

-- Glow effect using UIStroke
local Glow = Instance.new("UIStroke")
Glow.Parent = MainFrame
Glow.Thickness = 3
Glow.Color = Color3.fromRGB(0,255,255)
Glow.Transparency = 0.5
Glow.ApplyStrokeMode = Enum.ApplyStrokeMode.Border

-- === Buttons ===
local function createButton(text, pos, color)
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(0, 220, 0, 50)
    btn.Position = pos
    btn.BackgroundColor3 = color
    btn.TextColor3 = Color3.fromRGB(255,255,255)
    btn.Text = text
    btn.BorderSizePixel = 0
    btn.Parent = MainFrame

    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0,15)
    corner.Parent = btn

    local stroke = Instance.new("UIStroke")
    stroke.Parent = btn
    stroke.Color = Color3.fromRGB(0,255,255)
    stroke.Thickness = 2
    stroke.Transparency = 0.4

    -- Hover effect
    btn.MouseEnter:Connect(function()
        stroke.Transparency = 0
    end)
    btn.MouseLeave:Connect(function()
        stroke.Transparency = 0.4
    end)

    return btn
end

local SpeedButton = createButton("Speed OFF", UDim2.new(0,10,0,10), Color3.fromRGB(0,170,255))
local LoadButton = createButton("Load Scripts", UDim2.new(0,10,0,70), Color3.fromRGB(0,255,128))

-- === Make frame draggable ===
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

-- === Load Scripts Button ===
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
