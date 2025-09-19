local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local UserInputService = game:GetService("UserInputService")
local StarterGui = game:GetService("StarterGui")

-- Создаём ScreenGui
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "pizdets"
screenGui.Parent = LocalPlayer.PlayerGui

-- Основной фрейм
local Main = Instance.new("Frame")
Main.Size = UDim2.new(0, 300, 0, 200)
Main.AnchorPoint = Vector2.new(0.5, 0.5)
Main.Position = UDim2.new(0.5, 0, 0.5, 0)
Main.BackgroundColor3 = Color3.new(0, 0, 0)
Main.BackgroundTransparency = 0.4
Main.Parent = screenGui

local stroke = Instance.new("UIStroke")
stroke.Thickness = 3
stroke.Color = Color3.fromRGB(255, 0, 32)
stroke.Parent = Main

local Corner = Instance.new("UICorner")
Corner.CornerRadius = UDim.new(0, 15)
Corner.Parent = Main

-- Кнопка закрытия
local destroybutton = Instance.new("TextButton")
destroybutton.Text = "x"
destroybutton.Size = UDim2.new(0, 30, 0, 30)
destroybutton.AnchorPoint = Vector2.new(1, 0)
destroybutton.Position = UDim2.new(1, -5, 0, 5)
destroybutton.TextColor3 = Color3.fromRGB(255, 0, 0)
destroybutton.BackgroundTransparency = 1
destroybutton.Parent = Main
destroybutton.MouseButton1Click:Connect(function()
	screenGui:Destroy()
end)

-- Функция создания кнопок
local function makeButton(text, size, anchor, pos)
	local b = Instance.new("TextButton")
	b.Text = text
	b.Font = Enum.Font.Arcade
	b.TextSize = 28
	b.Size = size
	b.AnchorPoint = anchor
	b.Position = pos
	b.TextColor3 = Color3.fromRGB(255, 255, 255)
	b.BackgroundColor3 = Color3.fromRGB(255, 0, 50)
	b.BackgroundTransparency = 0

	local c = Instance.new("UICorner")
	c.CornerRadius = UDim.new(0, 6)
	c.Parent = b

	b.Parent = Main
	return b
end

-- Создание кнопок
local jumphack = makeButton("JUMP HACK", UDim2.new(0, 270, 0, 50),
	Vector2.new(0.5, 0), UDim2.new(0.5, 0, 0, 10))
local crpart = makeButton("PARTS", UDim2.new(0, 130, 0, 50),
	Vector2.new(0, 0), UDim2.new(0, 15, 0, 70))
local ds = makeButton("DISCORD", UDim2.new(0, 130, 0, 50),
	Vector2.new(1, 0), UDim2.new(1, -15, 0, 70))
local esp = makeButton("BASE ESP", UDim2.new(0, 270, 0, 40),
	Vector2.new(0.5, 1), UDim2.new(0.5, 0, 1, -10))

-- Заголовок
local solvex = Instance.new("TextLabel")
solvex.Text = "SOLVEX GUI"
solvex.Font = Enum.Font.Arcade
solvex.TextSize = 16
solvex.Size = UDim2.new(0, 200, 0, 20)
solvex.AnchorPoint = Vector2.new(0.5, 0)
solvex.Position = UDim2.new(0.5, 0, 0, -25)
solvex.TextColor3 = Color3.fromRGB(255, 255, 255)
solvex.BackgroundTransparency = 1
solvex.Parent = Main

-- ===================
-- ФУНКЦИОНАЛ
-- ===================

-- JUMP HACK
local jumpEnabled = false
jumphack.MouseButton1Click:Connect(function()
	jumpEnabled = not jumpEnabled
	local humanoid = LocalPlayer.Character and LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
	if humanoid then
		if jumpEnabled then
			humanoid.JumpPower = 77
			humanoid.UseJumpPower = true
		else
			humanoid.JumpPower = 50
			humanoid.UseJumpPower = false
		end
	end
	jumphack.BackgroundColor3 = jumpEnabled and Color3.fromRGB(11,11,11) or Color3.fromRGB(255,0,50)
end)

-- PARTS (с проверкой)
local partName = "MyCube"
local partsCreated = false

local function getExistingParts()
	local list = {}
	for _, p in ipairs(workspace:GetChildren()) do
		if p:IsA("Part") and p.Name == partName then
			table.insert(list, p)
		end
	end
	return list
end

local function createParts()
	local newParts = {}

	local cube = Instance.new("Part")
	cube.Name = partName
	cube.Size = Vector3.new(3, 2.2, 399)
	cube.Position = Vector3.new(-535, 21.9, 59.5)
	cube.Anchored = true
	cube.Color = Color3.fromRGB(255, 0, 0)
	cube.Material = Enum.Material.SmoothPlastic
	cube.Parent = workspace
	table.insert(newParts, cube)

	local cube1 = cube:Clone()
	cube1.Position = Vector3.new(-285.5, 21.9, 59.5)
	cube1.Parent = workspace
	table.insert(newParts, cube1)

	local cube2 = Instance.new("Part")
	cube2.Name = partName
	cube2.Size = Vector3.new(251.5, 2.2, 3)
	cube2.Position = Vector3.new(-410.75, 22, -140.09)
	cube2.Anchored = true
	cube2.Color = Color3.fromRGB(255, 0, 0)
	cube2.Material = Enum.Material.SmoothPlastic
	cube2.Parent = workspace
	table.insert(newParts, cube2)

	local cube3 = cube2:Clone()
	cube3.Position = Vector3.new(-410.75, 22, 258.09)
	cube3.Parent = workspace
	table.insert(newParts, cube3)

	return newParts
end

crpart.MouseButton1Click:Connect(function()
	local existing = getExistingParts()
	if #existing > 0 then
		-- Удаляем все существующие парты
		for _, p in ipairs(existing) do
			if p and p.Parent then p:Destroy() end
		end
		partsCreated = false
	else
		-- Создаём новые
		createParts()
		partsCreated = true
	end

	-- Меняем цвет кнопки
	crpart.BackgroundColor3 = partsCreated and Color3.fromRGB(11,11,11) or Color3.fromRGB(255,0,50)
end)

-- DISCORD
ds.MouseButton1Click:Connect(function()
	if setclipboard then
		setclipboard("https://discord.gg/F3DkqXjSyw")
	elseif pcall(function() StarterGui:SetCore("SendNotification",{}) end) then
		StarterGui:SetCore("SendNotification", {
			Title = "Link Copied",
			Text = "discord.gg/F3DkqXjSyw",
			Duration = 5
		})
	end

	local oldText = ds.Text
	ds.Text = "COPIED!"
	ds.BackgroundColor3 = Color3.fromRGB(11,11,11)
	task.delay(1,function()
		ds.Text = oldText
		ds.BackgroundColor3 = Color3.fromRGB(255,0,50)
	end)
end)

-- BASE ESP (тумблер)
local espEnabled = false
esp.MouseButton1Click:Connect(function()
	espEnabled = not espEnabled
	esp.BackgroundColor3 = espEnabled and Color3.fromRGB(11,11,11) or Color3.fromRGB(255,0,50)
end)

-- ===================
-- Drag Logic
-- ===================
local dragging = false
local dragStart, startPos

Main.InputBegan:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseButton1 then
		dragging = true
		dragStart = input.Position
		startPos = Main.Position
	end
end)

UserInputService.InputChanged:Connect(function(input)
	if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
		local delta = input.Position - dragStart
		Main.Position = UDim2.new(
			startPos.X.Scale,
			startPos.X.Offset + delta.X,
			startPos.Y.Scale,
			startPos.Y.Offset + delta.Y
		)
	end
end)

UserInputService.InputEnded:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseButton1 then
		dragging = false
	end
end)
