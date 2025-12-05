local ReplicatedStorage = game:GetService("ReplicatedStorage")
local UserInputService = game:GetService("UserInputService")
local Players = game:GetService("Players")

local Converted = {
	["_UI"] = Instance.new("ScreenGui");
	["_Frame"] = Instance.new("Frame");
	["_Title"] = Instance.new("TextLabel");
	["_PlayerList"] = Instance.new("ScrollingFrame");
	["_UIPadding"] = Instance.new("UIPadding");
	["_UIListLayout"] = Instance.new("UIListLayout");
	["_Template"] = Instance.new("TextButton");
	["_Squircle"] = Instance.new("ImageLabel");
	["_Special"] = Instance.new("ImageLabel");
	["_Shadow"] = Instance.new("ImageLabel");
	["_SquircleOutline"] = Instance.new("ImageLabel");
	["_UIGradient"] = Instance.new("UIGradient");
	["_User"] = Instance.new("ImageLabel");
	["_TextLabel"] = Instance.new("TextLabel");
	["_UIListLayout1"] = Instance.new("UIListLayout");
	["_UIPadding1"] = Instance.new("UIPadding");
	["_Display"] = Instance.new("ImageLabel");
	["_TextLabel1"] = Instance.new("TextLabel");
	["_UIListLayout2"] = Instance.new("UIListLayout");
	["_UIPadding2"] = Instance.new("UIPadding");
	["_Bounds"] = Instance.new("TextButton");
	["_Icon"] = Instance.new("ImageLabel");
	["_UIAspectRatioConstraint"] = Instance.new("UIAspectRatioConstraint");
	["_Shadow1"] = Instance.new("ImageLabel");
	["_Special1"] = Instance.new("ImageLabel");
	["_Squircle1"] = Instance.new("ImageLabel");
	["_SquircleOutline1"] = Instance.new("ImageLabel");
	["_UIGradient1"] = Instance.new("UIGradient");
	["_Drag"] = Instance.new("TextButton");
}

Converted["_UI"].ZIndexBehavior = Enum.ZIndexBehavior.Sibling
Converted["_UI"].Name = "UI"
Converted["_UI"].Parent = gethui()
Converted["_UI"].ResetOnSpawn = false

Converted["_Frame"].BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Converted["_Frame"].BackgroundTransparency = 1
Converted["_Frame"].BorderColor3 = Color3.fromRGB(0, 0, 0)
Converted["_Frame"].BorderSizePixel = 0
Converted["_Frame"].Position = UDim2.new(0.02, 0, 0.3, 0)
Converted["_Frame"].Size = UDim2.new(0.17, 0, 0.45, 0)
Converted["_Frame"].Parent = Converted["_UI"]

Converted["_Title"].FontFace = Font.new("rbxassetid://12187365364", Enum.FontWeight.SemiBold, Enum.FontStyle.Normal)
Converted["_Title"].Text = "        Spammer"
Converted["_Title"].TextColor3 = Color3.fromRGB(255, 255, 255)
Converted["_Title"].TextScaled = true
Converted["_Title"].TextSize = 14
Converted["_Title"].TextWrapped = true
Converted["_Title"].BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Converted["_Title"].BackgroundTransparency = 1
Converted["_Title"].BorderColor3 = Color3.fromRGB(0, 0, 0)
Converted["_Title"].BorderSizePixel = 0
Converted["_Title"].Position = UDim2.new(0.0500000007, 0, 0.0299999993, 0)
Converted["_Title"].Size = UDim2.new(0.600000024, 0, 0.0700000003, 0)
Converted["_Title"].ZIndex = 2
Converted["_Title"].Name = "Title"
Converted["_Title"].Parent = Converted["_Frame"]

Converted["_PlayerList"].AutomaticCanvasSize = Enum.AutomaticSize.Y
Converted["_PlayerList"].CanvasSize = UDim2.new(0, 0, 5, 0)
Converted["_PlayerList"].ScrollBarImageTransparency = 0.800000011920929
Converted["_PlayerList"].ScrollBarThickness = 6
Converted["_PlayerList"].Active = true
Converted["_PlayerList"].AnchorPoint = Vector2.new(0.5, 0)
Converted["_PlayerList"].BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Converted["_PlayerList"].BackgroundTransparency = 1
Converted["_PlayerList"].BorderColor3 = Color3.fromRGB(0, 0, 0)
Converted["_PlayerList"].BorderSizePixel = 0
Converted["_PlayerList"].Position = UDim2.new(0.5, 0, 0.129999995, 0)
Converted["_PlayerList"].Size = UDim2.new(0.949999988, 0, 0.870000005, 0)
Converted["_PlayerList"].ZIndex = 2
Converted["_PlayerList"].Name = "PlayerList"
Converted["_PlayerList"].Parent = Converted["_Frame"]

Converted["_UIPadding"].PaddingLeft = UDim.new(0.0199999996, 0)
Converted["_UIPadding"].PaddingRight = UDim.new(0.0599999987, 0)
Converted["_UIPadding"].Parent = Converted["_PlayerList"]

Converted["_UIListLayout"].Padding = UDim.new(0, 6)
Converted["_UIListLayout"].SortOrder = Enum.SortOrder.LayoutOrder
Converted["_UIListLayout"].Parent = Converted["_PlayerList"]

Converted["_Template"].Text = ""
Converted["_Template"].TextColor3 = Color3.fromRGB(255, 255, 255)
Converted["_Template"].TextSize = 14
Converted["_Template"].AutoButtonColor = false
Converted["_Template"].AutomaticSize = Enum.AutomaticSize.X
Converted["_Template"].BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Converted["_Template"].BackgroundTransparency = 1
Converted["_Template"].BorderSizePixel = 0
Converted["_Template"].Size = UDim2.new(1, 0, 0.140000001, 0)
Converted["_Template"].Visible = false
Converted["_Template"].Name = "Template"
Converted["_Template"].Parent = Converted["_PlayerList"]

Converted["_Squircle"].Image = "rbxassetid://95506668331330"
Converted["_Squircle"].ImageColor3 = Color3.fromRGB(83.00000265240669, 83.00000265240669, 92.00000211596489)
Converted["_Squircle"].ImageTransparency = 1
Converted["_Squircle"].ScaleType = Enum.ScaleType.Slice
Converted["_Squircle"].SliceCenter = Rect.new(256, 256, 256, 256)
Converted["_Squircle"].SliceScale = 0.03906000033020973
Converted["_Squircle"].BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Converted["_Squircle"].BackgroundTransparency = 1
Converted["_Squircle"].BorderSizePixel = 0
Converted["_Squircle"].Size = UDim2.new(1, 0, 1, 0)
Converted["_Squircle"].Name = "Squircle"
Converted["_Squircle"].Parent = Converted["_Template"]

Converted["_Special"].Image = "rbxassetid://95506668331330"
Converted["_Special"].ImageTransparency = 1
Converted["_Special"].ScaleType = Enum.ScaleType.Slice
Converted["_Special"].SliceCenter = Rect.new(256, 256, 256, 256)
Converted["_Special"].SliceScale = 0.03906000033020973
Converted["_Special"].BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Converted["_Special"].BackgroundTransparency = 1
Converted["_Special"].BorderSizePixel = 0
Converted["_Special"].Size = UDim2.new(1, 0, 1, 0)
Converted["_Special"].Name = "Special"
Converted["_Special"].Parent = Converted["_Template"]

Converted["_Shadow"].Image = "rbxassetid://128614934990510"
Converted["_Shadow"].ImageColor3 = Color3.fromRGB(0, 0, 0)
Converted["_Shadow"].ImageTransparency = 1
Converted["_Shadow"].ScaleType = Enum.ScaleType.Slice
Converted["_Shadow"].SliceCenter = Rect.new(512, 512, 512, 512)
Converted["_Shadow"].SliceScale = 0.019530000165104866
Converted["_Shadow"].AnchorPoint = Vector2.new(0.5, 0.5)
Converted["_Shadow"].BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Converted["_Shadow"].BackgroundTransparency = 1
Converted["_Shadow"].BorderSizePixel = 0
Converted["_Shadow"].Position = UDim2.new(0.5, 0, 0.5, 0)
Converted["_Shadow"].Size = UDim2.new(1, 3, 1, 3)
Converted["_Shadow"].Name = "Shadow"
Converted["_Shadow"].Parent = Converted["_Template"]

Converted["_SquircleOutline"].Image = "rbxassetid://107571049497876"
Converted["_SquircleOutline"].ImageTransparency = 0.8500000238418579
Converted["_SquircleOutline"].ScaleType = Enum.ScaleType.Slice
Converted["_SquircleOutline"].SliceCenter = Rect.new(256, 256, 256, 256)
Converted["_SquircleOutline"].SliceScale = 0.03906000033020973
Converted["_SquircleOutline"].BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Converted["_SquircleOutline"].BackgroundTransparency = 1
Converted["_SquircleOutline"].BorderSizePixel = 0
Converted["_SquircleOutline"].Size = UDim2.new(1, 0, 1, 0)
Converted["_SquircleOutline"].Name = "SquircleOutline"
Converted["_SquircleOutline"].Parent = Converted["_Template"]

Converted["_UIGradient"].Color = ColorSequence.new{
	ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 255, 255)),
	ColorSequenceKeypoint.new(0.5, Color3.fromRGB(255, 255, 255)),
	ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 255, 255))
}
Converted["_UIGradient"].Rotation = 70
Converted["_UIGradient"].Transparency = NumberSequence.new{
	NumberSequenceKeypoint.new(0, 0.10000000149011612),
	NumberSequenceKeypoint.new(0.5, 1),
	NumberSequenceKeypoint.new(1, 0.10000000149011612)
}
Converted["_UIGradient"].Parent = Converted["_SquircleOutline"]

Converted["_User"].Image = "rbxassetid://95506668331330"
Converted["_User"].ImageTransparency = 1
Converted["_User"].ScaleType = Enum.ScaleType.Slice
Converted["_User"].SliceCenter = Rect.new(256, 256, 256, 256)
Converted["_User"].SliceScale = 0.03906000033020973
Converted["_User"].BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Converted["_User"].BackgroundTransparency = 1
Converted["_User"].BorderSizePixel = 0
Converted["_User"].Size = UDim2.new(1, 0, 0.600000024, 0)
Converted["_User"].Name = "User"
Converted["_User"].Parent = Converted["_Template"]

Converted["_TextLabel"].FontFace = Font.new("rbxassetid://12187365364", Enum.FontWeight.SemiBold, Enum.FontStyle.Normal)
Converted["_TextLabel"].RichText = true
Converted["_TextLabel"].Text = "Roblox"
Converted["_TextLabel"].TextColor3 = Color3.fromRGB(255, 255, 255)
Converted["_TextLabel"].TextSize = 18
Converted["_TextLabel"].TextWrapped = true
Converted["_TextLabel"].AutomaticSize = Enum.AutomaticSize.XY
Converted["_TextLabel"].BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Converted["_TextLabel"].BackgroundTransparency = 1
Converted["_TextLabel"].BorderSizePixel = 0
Converted["_TextLabel"].Parent = Converted["_User"]

Converted["_UIListLayout1"].Padding = UDim.new(0, 8)
Converted["_UIListLayout1"].FillDirection = Enum.FillDirection.Horizontal
Converted["_UIListLayout1"].HorizontalAlignment = Enum.HorizontalAlignment.Center
Converted["_UIListLayout1"].SortOrder = Enum.SortOrder.LayoutOrder
Converted["_UIListLayout1"].VerticalAlignment = Enum.VerticalAlignment.Center
Converted["_UIListLayout1"].Parent = Converted["_User"]

Converted["_UIPadding1"].PaddingLeft = UDim.new(0, 16)
Converted["_UIPadding1"].PaddingRight = UDim.new(0, 16)
Converted["_UIPadding1"].Parent = Converted["_User"]

Converted["_Display"].Image = "rbxassetid://95506668331330"
Converted["_Display"].ImageTransparency = 1
Converted["_Display"].ScaleType = Enum.ScaleType.Slice
Converted["_Display"].SliceCenter = Rect.new(256, 256, 256, 256)
Converted["_Display"].SliceScale = 0.03906000033020973
Converted["_Display"].AnchorPoint = Vector2.new(0, 1)
Converted["_Display"].BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Converted["_Display"].BackgroundTransparency = 1
Converted["_Display"].BorderSizePixel = 0
Converted["_Display"].Position = UDim2.new(0, 0, 0.860000014, 0)
Converted["_Display"].Size = UDim2.new(1, 0, 0.300000012, 0)
Converted["_Display"].Name = "Display"
Converted["_Display"].Parent = Converted["_Template"]

Converted["_TextLabel1"].FontFace = Font.new("rbxassetid://12187365364", Enum.FontWeight.SemiBold, Enum.FontStyle.Normal)
Converted["_TextLabel1"].RichText = true
Converted["_TextLabel1"].Text = "@Roblox"
Converted["_TextLabel1"].TextColor3 = Color3.fromRGB(255, 255, 255)
Converted["_TextLabel1"].TextSize = 14
Converted["_TextLabel1"].TextTransparency = 0.30000001192092896
Converted["_TextLabel1"].TextWrapped = true
Converted["_TextLabel1"].AutomaticSize = Enum.AutomaticSize.XY
Converted["_TextLabel1"].BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Converted["_TextLabel1"].BackgroundTransparency = 1
Converted["_TextLabel1"].BorderSizePixel = 0
Converted["_TextLabel1"].Parent = Converted["_Display"]

Converted["_UIListLayout2"].Padding = UDim.new(0, 8)
Converted["_UIListLayout2"].FillDirection = Enum.FillDirection.Horizontal
Converted["_UIListLayout2"].HorizontalAlignment = Enum.HorizontalAlignment.Center
Converted["_UIListLayout2"].SortOrder = Enum.SortOrder.LayoutOrder
Converted["_UIListLayout2"].VerticalAlignment = Enum.VerticalAlignment.Center
Converted["_UIListLayout2"].Parent = Converted["_Display"]

Converted["_UIPadding2"].PaddingLeft = UDim.new(0, 16)
Converted["_UIPadding2"].PaddingRight = UDim.new(0, 16)
Converted["_UIPadding2"].Parent = Converted["_Display"]

Converted["_Bounds"].Font = Enum.Font.SourceSans
Converted["_Bounds"].Text = ""
Converted["_Bounds"].TextColor3 = Color3.fromRGB(0, 0, 0)
Converted["_Bounds"].TextSize = 14
Converted["_Bounds"].BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Converted["_Bounds"].BackgroundTransparency = 0.9900000095367432
Converted["_Bounds"].BorderColor3 = Color3.fromRGB(0, 0, 0)
Converted["_Bounds"].BorderSizePixel = 0
Converted["_Bounds"].Size = UDim2.new(1, 0, 1, 0)
Converted["_Bounds"].ZIndex = 100
Converted["_Bounds"].Name = "Bounds"
Converted["_Bounds"].Parent = Converted["_Template"]

Converted["_Icon"].Image = "rbxassetid://113199298512471"
Converted["_Icon"].BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Converted["_Icon"].BackgroundTransparency = 1
Converted["_Icon"].BorderColor3 = Color3.fromRGB(0, 0, 0)
Converted["_Icon"].BorderSizePixel = 0
Converted["_Icon"].Position = UDim2.new(0.0500000007, 0, 0.0450000018, 0)
Converted["_Icon"].Size = UDim2.new(0.159999996, 0, 0.159999996, 0)
Converted["_Icon"].ZIndex = 2
Converted["_Icon"].Name = "Icon"
Converted["_Icon"].Parent = Converted["_Frame"]

Converted["_UIAspectRatioConstraint"].AspectRatio = 2.5
Converted["_UIAspectRatioConstraint"].Parent = Converted["_Icon"]

Converted["_Shadow1"].Image = "rbxassetid://128614934990510"
Converted["_Shadow1"].ImageColor3 = Color3.fromRGB(0, 0, 0)
Converted["_Shadow1"].ImageTransparency = 1
Converted["_Shadow1"].ScaleType = Enum.ScaleType.Slice
Converted["_Shadow1"].SliceCenter = Rect.new(512, 512, 512, 512)
Converted["_Shadow1"].SliceScale = 0.019530000165104866
Converted["_Shadow1"].AnchorPoint = Vector2.new(0.5, 0.5)
Converted["_Shadow1"].BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Converted["_Shadow1"].BackgroundTransparency = 1
Converted["_Shadow1"].BorderSizePixel = 0
Converted["_Shadow1"].Position = UDim2.new(0.5, 0, 0.5, 0)
Converted["_Shadow1"].Size = UDim2.new(1, 3, 1, 3)
Converted["_Shadow1"].Name = "Shadow"
Converted["_Shadow1"].Parent = Converted["_Frame"]

Converted["_Special1"].Image = "rbxassetid://95506668331330"
Converted["_Special1"].ImageTransparency = 1
Converted["_Special1"].ScaleType = Enum.ScaleType.Slice
Converted["_Special1"].SliceCenter = Rect.new(256, 256, 256, 256)
Converted["_Special1"].SliceScale = 0.03906000033020973
Converted["_Special1"].BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Converted["_Special1"].BackgroundTransparency = 1
Converted["_Special1"].BorderSizePixel = 0
Converted["_Special1"].Size = UDim2.new(1, 0, 1, 0)
Converted["_Special1"].Name = "Special"
Converted["_Special1"].Parent = Converted["_Frame"]

Converted["_Squircle1"].Image = "rbxassetid://95506668331330"
Converted["_Squircle1"].ImageColor3 = Color3.fromRGB(0, 0, 0)
Converted["_Squircle1"].ImageTransparency = 0.4
Converted["_Squircle1"].ScaleType = Enum.ScaleType.Slice
Converted["_Squircle1"].SliceCenter = Rect.new(256, 256, 256, 256)
Converted["_Squircle1"].SliceScale = 0.03906000033020973
Converted["_Squircle1"].BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Converted["_Squircle1"].BackgroundTransparency = 1
Converted["_Squircle1"].BorderSizePixel = 0
Converted["_Squircle1"].Size = UDim2.new(1, 0, 1, 0)
Converted["_Squircle1"].Name = "Squircle"
Converted["_Squircle1"].Parent = Converted["_Frame"]

Converted["_SquircleOutline1"].Image = "rbxassetid://107571049497876"
Converted["_SquircleOutline1"].ImageColor3 = Color3.fromRGB(255, 90.00000223517418, 90.00000223517418)
Converted["_SquircleOutline1"].ScaleType = Enum.ScaleType.Slice
Converted["_SquircleOutline1"].SliceCenter = Rect.new(256, 256, 256, 256)
Converted["_SquircleOutline1"].SliceScale = 0.03906000033020973
Converted["_SquircleOutline1"].BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Converted["_SquircleOutline1"].BackgroundTransparency = 1
Converted["_SquircleOutline1"].BorderSizePixel = 0
Converted["_SquircleOutline1"].Size = UDim2.new(1, 0, 1, 0)
Converted["_SquircleOutline1"].Name = "SquircleOutline"
Converted["_SquircleOutline1"].Parent = Converted["_Frame"]

Converted["_UIGradient1"].Color = ColorSequence.new{
	ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 255, 255)),
	ColorSequenceKeypoint.new(0.5, Color3.fromRGB(255, 255, 255)),
	ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 255, 255))
}
Converted["_UIGradient1"].Rotation = 70
Converted["_UIGradient1"].Transparency = NumberSequence.new{
	NumberSequenceKeypoint.new(0, 0.10000000149011612),
	NumberSequenceKeypoint.new(0.5, 1),
	NumberSequenceKeypoint.new(1, 0.10000000149011612)
}
Converted["_UIGradient1"].Parent = Converted["_SquircleOutline1"]

Converted["_Drag"].Font = Enum.Font.SourceSans
Converted["_Drag"].Text = ""
Converted["_Drag"].TextColor3 = Color3.fromRGB(0, 0, 0)
Converted["_Drag"].TextSize = 14
Converted["_Drag"].BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Converted["_Drag"].BackgroundTransparency = 0.9900000095367432
Converted["_Drag"].BorderColor3 = Color3.fromRGB(0, 0, 0)
Converted["_Drag"].BorderSizePixel = 0
Converted["_Drag"].Size = UDim2.new(1, 0, 0.129999995, 0)
Converted["_Drag"].ZIndex = 100
Converted["_Drag"].Name = "Drag"
Converted["_Drag"].Parent = Converted["_Frame"]

local DragObject = Converted._Frame
local DragHandle = Converted._Drag

local IsDragging = false
local DragOffset = Vector2.new()

local function GetPosition(Input)
	local Pos = Input.Position
	return Vector2.new(Pos.X, Pos.Y)
end

DragHandle.InputBegan:Connect(function(Input)
	if Input.UserInputType ~= Enum.UserInputType.MouseButton1 and Input.UserInputType ~= Enum.UserInputType.Touch then return end

	IsDragging = true

	local MousePosition = GetPosition(Input)
	local GuiPosition = DragObject.AbsolutePosition
	DragOffset = MousePosition - Vector2.new(GuiPosition.X, GuiPosition.Y)

	Input.Changed:Connect(function()
		if Input.UserInputState == Enum.UserInputState.End then
			IsDragging = false
		end
	end)
end)

UserInputService.InputChanged:Connect(function(Input)
	if not IsDragging then return end
	if Input.UserInputType ~= Enum.UserInputType.MouseMovement and Input.UserInputType ~= Enum.UserInputType.Touch then return end

	local MousePosition = GetPosition(Input)
	local NewPosition = MousePosition - DragOffset

	DragObject.Position = UDim2.new(0, NewPosition.X, 0, NewPosition.Y)
end)

local function GetThumbnail(UserId)
	local Success, Result = pcall(function()
		return Players:GetUserThumbnailAsync(UserId, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size420x420)
	end)

	if not Success then return nil end
	return Result
end

local function Execute(Player, Command, Yield)
	if Yield then
		ReplicatedStorage.Packages.Net["RE/AdminPanelService/ExecuteCommand"]:FireServer(Player, Command)
	else
		task.spawn(function()
			ReplicatedStorage.Packages.Net["RE/AdminPanelService/ExecuteCommand"]:FireServer(Player, Command)
		end)
	end
end

local function Spam(Player)
	local FirstBatch = {"rocket", "tiny", "balloon", "inverse"}
	local SecondBatch = {"ragdoll", "jumpscare", "morph"}

	for _, Command in pairs(FirstBatch) do
		Execute(Player, Command)
	end

	task.wait(1)

	for _, Command in pairs(SecondBatch) do
		Execute(Player, Command)
	end

	task.wait(1)

	Execute(Player, "jail")
end

local function AddPlayerFrame(Player)
	if Player == Players.LocalPlayer or Converted._PlayerList:FindFirstChild(Player.Name) then return end

	local PlayerFrame = Converted._Template:Clone()
	PlayerFrame.Parent = Converted._PlayerList

	PlayerFrame:WaitForChild("User", 9e9)
	PlayerFrame:WaitForChild("Display", 9e9)

	PlayerFrame.User.TextLabel.Text = Player.DisplayName
	PlayerFrame.Display.TextLabel.Text = "@" .. Player.Name
	PlayerFrame.Name = Player.Name
	PlayerFrame.Visible = true

	local Thumb = GetThumbnail(Player.UserId)
	if Thumb then
		PlayerFrame.User.Image = Thumb
	end

	PlayerFrame.Bounds.MouseButton1Click:Connect(function()
		Spam(Player)
	end)
end

local function RemovePlayerFrame(Player)
	local Frame = Converted._PlayerList:FindFirstChild(Player.Name)
	if Frame then
		Frame:Destroy()
	end
end

for _, Player in pairs(Players:GetPlayers()) do
	AddPlayerFrame(Player)
end

Players.PlayerAdded:Connect(function(Player)
	AddPlayerFrame(Player)
end)

Players.PlayerRemoving:Connect(function(Player)
	RemovePlayerFrame(Player)
end)
