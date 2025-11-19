local Starlight = loadstring(game:HttpGet("https://raw.nebulasoftworks.xyz/starlight"))()  

local NebulaIcons = loadstring(game:HttpGet("https://raw.nebulasoftworks.xyz/nebula-icon-library-loader"))()

local Window = Starlight:CreateWindow({
    Name = "Unnamed",
    Subtitle = "v1.0",
    Icon = 123456789,

    LoadingSettings = {
        Title = "ts is not erx",
        Subtitle = "ts is not affiliated with erx",
    },

    FileSettings = {
        ConfigFolder = "erx"
    },
})

local MainSec = Window:CreateTabSection("Tabs")

local Main = MainSec:CreateTab({
    Name = "Main",
    Icon = NebulaIcons:GetIcon('view_in_ar', 'Material'),
    Columns = 2,
}, "INDEX")

local MainGroupBox = Main:CreateGroupbox({
    Name = "Stealers",
    Column = 1,
}, "INDEX")

local AfkGroupBox = Main:CreateGroupbox({
    Name = "Auto Farm",
    Column = 1,
}, "INDEX")



local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local PPP = game:GetService("ProximityPromptService")

local LocalPlayer = Players.LocalPlayer
local Character = LocalPlayer.Character
local Humanoid = Character:WaitForChild("Humanoid")
local HumanoidRootPart = Character:WaitForChild("HumanoidRootPart")

local PlayerGui = LocalPlayer.PlayerGui
local Notifications = PlayerGui:WaitForChild("Notification", 9e9).Notification

--// TOGGLE VARIABLE
local MegaphoneEnabled = false

--// WIND UI TOGGLE
local MegaphoneToggle = MainGroupBox:CreateToggle({
    Name = "Megaphone",
    CurrentValue = false,
    Style = 2,
    Callback = function(Value)
        MegaphoneEnabled = Value
    end,
}, "MEGAPHONE_TOGGLE")


--// Update character references on respawn
LocalPlayer.CharacterAdded:Connect(function(NewChar)
    Character = NewChar
	Humanoid = NewChar:WaitForChild("Humanoid")
	HumanoidRootPart = NewChar:WaitForChild("HumanoidRootPart")
end)


--// MAIN SYSTEM
LocalPlayer:GetAttributeChangedSignal("Stealing"):Connect(function()
    -- disabled?
    if not MegaphoneEnabled then return end

    -- must be stealing
    if not LocalPlayer:GetAttribute("Stealing") then return end

    task.wait(0.05)

    -- must have a target
    if LocalPlayer:GetAttribute("StealingPlayer") == nil then return end

    print("Trigger")

    -- find tool
    local Megaphone =
        LocalPlayer.Backpack:FindFirstChild("Megaphone") or
        Character:FindFirstChild("Megaphone")

    if Megaphone then
        if not Megaphone:IsDescendantOf(Character) then
            Character.Humanoid:EquipTool(Megaphone)
        end

        Megaphone:Activate()
    end
end)

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")
local Notifications = PlayerGui:WaitForChild("Notification", 9e9).Notification

--// Toggle variable
local AutoKick = false

--// WINDUI TOGGLE
local AutoKickToggle = MainGroupBox:CreateToggle({
    Name = "Auto Kick On Steal",
    CurrentValue = false,
    Style = 2,
    Callback = function(Value)
        AutoKick = Value
        print("AutoKick:", AutoKick)
    end,
}, "AutoKick_TOGGLE")


--// ACTUAL KICK LISTENER
Notifications.ChildAdded:Connect(function(Child)
    if not AutoKick then return end
    if not Child:IsA("TextLabel") then return end

    local text = Child.Text or ""

    -- check if it begins with "You stole <"
    if text:sub(1, 11) == "You stole <" then
        -- wait until game stops stealing
        repeat task.wait() until not LocalPlayer:GetAttribute("Stealing")

        -- clean HTML weird brackets <...>
        local cleaned = text:gsub("<[^>]->", "")

        -- kick the player
        LocalPlayer:Kick(cleaned)
    end
end)

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")

local LocalPlayer = Players.LocalPlayer
local Character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
local Humanoid = Character:WaitForChild("Humanoid")
local HumanoidRootPart = Character:WaitForChild("HumanoidRootPart")

-- update on respawn
LocalPlayer.CharacterAdded:Connect(function(newChar)
	Character = newChar
	Humanoid = newChar:WaitForChild("Humanoid")
	HumanoidRootPart = newChar:WaitForChild("HumanoidRootPart")
end)

--// TOGGLE VARIABLE
local SpeedBoost = false

--// WIND UI TOGGLE
local SpeedToggle = MainGroupBox:CreateToggle({
	Name = "Speed",
	CurrentValue = false,
	Style = 2,
	Callback = function(Value)
		SpeedBoost = Value
		print("SpeedBoost:", SpeedBoost)
	end,
}, "SpeedBoost_TOGGLE")

--// SPEED BOOST CODE (Togglable)
RunService.RenderStepped:Connect(function()
	if not SpeedBoost then return end

	if LocalPlayer:GetAttribute("Stealing") 
		and LocalPlayer:GetAttribute("StealingPlayer") then

		local moveDir = Humanoid.MoveDirection
		local targetVel = (moveDir * 27)
		local diff = (targetVel - HumanoidRootPart.AssemblyLinearVelocity) * Vector3.new(1, 0, 1)

		if diff.Magnitude > ((moveDir == Vector3.zero) and 10 or 2) then
			HumanoidRootPart:ApplyImpulse(diff * HumanoidRootPart.AssemblyMass)
		end
	end
end)

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")

local highlightEnabled = false
local highlightLoop = nil

-- Function to apply blue highlight to a character
local function applyHighlight(character)
    if not character then return end

    -- Remove old highlights
    for _, v in ipairs(character:GetChildren()) do
        if v:IsA("Highlight") and v.Name == "_AutoHighlight" then
            v:Destroy()
        end
    end

    -- Create new highlight
    local highlight = Instance.new("Highlight")
    highlight.Name = "_AutoHighlight"
    highlight.FillColor = Color3.fromRGB(0, 170, 255) -- Blue
    highlight.FillTransparency = 0.3
    highlight.OutlineColor = Color3.fromRGB(0, 60, 255)
    highlight.OutlineTransparency = 0
    highlight.Parent = character
end

-- Function to update all players every second
local function updateAllHighlights()
    for _, plr in ipairs(Players:GetPlayers()) do
        local char = plr.Character
        if char then
            applyHighlight(char)
        end
    end
end

-- UI TOGGLE (with INDEX added back)
local HighlightToggle = MainGroupBox:CreateToggle({
    Name = "Blue Player Highlights",
    CurrentValue = false,
    Style = 2,
    Callback = function(Value)
        highlightEnabled = Value

        if Value then
            updateAllHighlights()
            highlightLoop = task.spawn(function()
                while highlightEnabled do
                    updateAllHighlights()
                    task.wait(1)
                end
            end)
        else
            -- Remove highlights
            for _, plr in ipairs(Players:GetPlayers()) do
                local char = plr.Character
                if char then
                    for _, v in ipairs(char:GetChildren()) do
                        if v:IsA("Highlight") and v.Name == "_AutoHighlight" then
                            v:Destroy()
                        end
                    end
                end
            end
        end
    end,
}, "INDEX")

local Players = game:GetService("Players")

local textESPEnabled = false
local textESPLoop = nil

-- Create or refresh Billboard text
local function applyTextESP(character, player)
    if not character then return end
    local head = character:FindFirstChild("Head")
    if not head then return end

    -- Remove old BillboardGui
    for _, v in ipairs(head:GetChildren()) do
        if v:IsA("BillboardGui") and v.Name == "_NameESP" then
            v:Destroy()
        end
    end

    -- BillboardGui
    local billboard = Instance.new("BillboardGui")
    billboard.Name = "_NameESP"
    billboard.Adornee = head
    billboard.AlwaysOnTop = true
    billboard.Size = UDim2.new(4, 0, 1, 0)
    billboard.StudsOffset = Vector3.new(0, 2.5, 0)
    billboard.Parent = head

    -- Text label
    local label = Instance.new("TextLabel")
    label.BackgroundTransparency = 1
    label.Size = UDim2.new(1, 0, 1, 0)
    label.TextScaled = true
    label.Font = Enum.Font.GothamBold
    label.TextColor3 = Color3.fromRGB(255, 255, 255)
    label.Text = player.Name
    label.Parent = billboard

    -- Stroke (fixed)
    local stroke = Instance.new("UIStroke")
    stroke.Thickness = 2
    stroke.Color = Color3.fromRGB(0, 0, 0)
    stroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Contextual
    stroke.Parent = label
end

-- Updates all ESP text every second
local function updateAllTextESP()
    for _, plr in ipairs(Players:GetPlayers()) do
        if plr.Character then
            applyTextESP(plr.Character, plr)
        end
    end
end

-- UI Toggle
local TextESPToggle = MainGroupBox:CreateToggle({
    Name = "Text Above Players",
    CurrentValue = false,
    Style = 2,
    Callback = function(Value)
        textESPEnabled = Value
        
        if Value then
            updateAllTextESP()
            textESPLoop = task.spawn(function()
                while textESPEnabled do
                    updateAllTextESP()
                    task.wait(1)
                end
            end)
        else
            -- Remove Billboard from all players
            for _, plr in ipairs(Players:GetPlayers()) do
                local char = plr.Character
                if char then
                    local head = char:FindFirstChild("Head")
                    if head then
                        for _, v in ipairs(head:GetChildren()) do
                            if v:IsA("BillboardGui") and v.Name == "_NameESP" then
                                v:Destroy()
                            end
                        end
                    end
                end
            end
        end
    end,
}, "INDEX")

local Players = game:GetService("Players")
local player = Players.LocalPlayer

local jumpEnabled = false
local characterConnection = nil

local DEFAULT_JUMP = 50 -- Roblox default JumpPower
local BOOST_JUMP = 80   -- Your boost

-- Apply jump boost
local function applyJumpPower(character)
    local humanoid = character:WaitForChild("Humanoid")
    humanoid.UseJumpPower = true
    humanoid.JumpPower = BOOST_JUMP
end

-- Reset to normal jump
local function resetJump(character)
    local humanoid = character:FindFirstChild("Humanoid")
    if humanoid then
        humanoid.UseJumpPower = true
        humanoid.JumpPower = DEFAULT_JUMP
    end
end

-- Toggle
local JumpToggle = MainGroupBox:CreateToggle({
    Name = "Super Jump",
    CurrentValue = false,
    Style = 2,
    Callback = function(Value)
        jumpEnabled = Value

        -- Disconnect old event to avoid stacking
        if characterConnection then
            characterConnection:Disconnect()
            characterConnection = nil
        end

        if jumpEnabled then
            -- Apply immediately
            if player.Character then
                applyJumpPower(player.Character)
            end

            -- Apply on respawn
            characterConnection = player.CharacterAdded:Connect(function(char)
                applyJumpPower(char)
            end)

        else
            -- Restore default jump
            if player.Character then
                resetJump(player.Character)
            end
        end
    end,
}, "INDEX")

-- Toggle that creates/destroys the whole GUI on toggle (no WindUI, no keybind)
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local PLOTS = workspace:WaitForChild("Plots")

local PlotGui -- holds the ScreenGui when created

local EXCLUDED = {
    Model = true, Skin = true, FriendPanel = true, Unlock = true, Purchases = true,
    Laser = true, LaserHitbox = true, InvisibleWalls = true, Decorations = true,
    AnimalPodiums = true, AnimalTarget = true, DeliveryHitbox = true, MainRoot = true,
    Multiplier = true, StealHitbox = true, Spawn = true, Slope = true, PlotSign = true,
}

local function clearHighlights()
    for _, plot in pairs(PLOTS:GetChildren()) do
        for _, d in ipairs(plot:GetDescendants()) do
            if d:IsA("Highlight") and d.Name == "TargetHighlight" then d:Destroy() end
            if d:IsA("BillboardGui") and d.Name == "HighlightLabel" then d:Destroy() end
        end
    end
end

local function addLabel(part)
    if part:FindFirstChild("HighlightLabel") then return end
    local bb = Instance.new("BillboardGui")
    bb.Name = "HighlightLabel"
    bb.AlwaysOnTop = true
    bb.Size = UDim2.new(0,200,0,40)
    bb.StudsOffset = Vector3.new(0,3,0)
    bb.Adornee = part
    bb.Parent = part

    local text = Instance.new("TextLabel", bb)
    text.Size = UDim2.new(1,0,1,0)
    text.BackgroundTransparency = 1
    text.TextColor3 = Color3.fromRGB(255,255,255)
    text.TextStrokeColor3 = Color3.fromRGB(0,0,0)
    text.TextStrokeTransparency = 0
    text.TextScaled = true
    text.Font = Enum.Font.FredokaOne
    text.Text = part.Parent and part.Parent.Name or part.Name
end

local function highlight(part)
    if not part:IsA("BasePart") then return end
    if not part:FindFirstChild("TargetHighlight") then
        local h = Instance.new("Highlight")
        h.Name = "TargetHighlight"
        h.FillColor = Color3.fromRGB(0,170,255)
        h.FillTransparency = 0.25
        h.OutlineTransparency = 1
        h.Parent = part
    end
    addLabel(part)
end

local function findPlot(displayName)
    for _, plot in ipairs(PLOTS:GetChildren()) do
        local sign = plot:FindFirstChild("PlotSign")
        if sign then
            for _, d in ipairs(sign:GetDescendants()) do
                if d:IsA("TextLabel") and d.Text:lower():find(displayName:lower()) then
                    return plot
                end
            end
        end
    end
    return nil
end

local function highlightPlot(plot)
    clearHighlights()
    for _, child in ipairs(plot:GetChildren()) do
        if not EXCLUDED[child.Name] then
            for _, d in ipairs(child:GetDescendants()) do
                if d:IsA("BasePart") then
                    highlight(d)
                end
            end
        end
    end
end

-- Create the GUI (returns ScreenGui)
local function CreatePlotGui()
    if PlotGui then
        PlotGui.Enabled = true
        return PlotGui
    end

    local gui = Instance.new("ScreenGui")
    gui.Name = "BaseSelectorGUI"
    gui.ResetOnSpawn = false
    gui.Parent = LocalPlayer:WaitForChild("PlayerGui")
    PlotGui = gui

    local frame = Instance.new("Frame")
    frame.Parent = gui
    frame.Position = UDim2.new(0,20,0,200)
    frame.Size = UDim2.new(0,200,0,40)
    frame.BackgroundColor3 = Color3.fromRGB(30,30,30)
    frame.BorderSizePixel = 0

    local title = Instance.new("TextButton")
    title.Parent = frame
    title.Size = UDim2.new(1,0,1,0)
    title.Text = "Select Player Base"
    title.TextColor3 = Color3.fromRGB(255,255,255)
    title.BackgroundColor3 = Color3.fromRGB(50,50,50)
    title.BorderSizePixel = 0
    title.Font = Enum.Font.FredokaOne
    title.TextScaled = true

    local dropdown = Instance.new("Frame")
    dropdown.Parent = frame
    dropdown.Position = UDim2.new(0,0,1,0)
    dropdown.Size = UDim2.new(1,0,0,0)
    dropdown.BackgroundTransparency = 1
    dropdown.Visible = false
    dropdown.ClipsDescendants = true

    local function refreshDropdown()
        for _, v in ipairs(dropdown:GetChildren()) do
            if v:IsA("TextButton") then v:Destroy() end
        end

        local y = 0
        for _, plr in ipairs(Players:GetPlayers()) do
            if plr ~= LocalPlayer then
                local btn = Instance.new("TextButton")
                btn.Parent = dropdown
                btn.Size = UDim2.new(1,0,0,30)
                btn.Position = UDim2.new(0,0,0,y)
                btn.Text = plr.DisplayName
                btn.TextColor3 = Color3.fromRGB(255,255,255)
                btn.BackgroundColor3 = Color3.fromRGB(40,40,40)
                btn.BorderSizePixel = 0
                btn.Font = Enum.Font.FredokaOne
                btn.TextScaled = true

                btn.MouseButton1Click:Connect(function()
                    dropdown.Visible = false
                    dropdown.Size = UDim2.new(1,0,0,0)
                    local plot = findPlot(plr.DisplayName)
                    if plot then highlightPlot(plot) else warn("Plot not found for:", plr.DisplayName) end
                end)

                y = y + 30
            end
        end

        dropdown.Size = UDim2.new(1,0,0,y)
    end

    title.MouseButton1Click:Connect(function()
        dropdown.Visible = not dropdown.Visible
        if dropdown.Visible then refreshDropdown() end
    end)

    return gui
end

-- Toggle (creates GUI when ON, destroys when OFF)
local PlotSelectorToggle = MainGroupBox:CreateToggle({
    Name = "Brainrot Esp",
    CurrentValue = false,
    Style = 2,
    Callback = function(Value)
        if Value then
            -- create if missing, otherwise just enable
            CreatePlotGui()
        else
            -- destroy gui and clear highlights
            if PlotGui then
                PlotGui:Destroy()
                PlotGui = nil
            end
            clearHighlights()
        end
    end,
}, "INDEX")

local autoFish = false
local fishLoop

local FishToggle = AfkGroupBox:CreateToggle({
    Name = "Auto Fish (⚠️ Hold rod out!)",
    CurrentValue = false,
    Style = 2,
    Callback = function(Value)
        autoFish = Value

        if autoFish then
            -- START LOOP
            fishLoop = task.spawn(function()
                while autoFish do
                    local args = {1}

                    local Rep = game:GetService("ReplicatedStorage")
                    local Net = Rep:WaitForChild("Packages"):WaitForChild("Net")

                    Net["RE/FishingRod.Cast"]:FireServer(unpack(args))
                    Net["RE/FishingRod.MinigameClick"]:FireServer()

                    task.wait()
                end
            end)
        else
            -- STOP LOOP
            autoFish = false
        end
    end,
}, "INDEX")