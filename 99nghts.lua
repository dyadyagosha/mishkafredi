local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")
local player = game.Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

-- === Цвета ===
local COLORS = {
	bgDark    = Color3.fromRGB(11, 11, 11),     -- #0b0b0b
	bgLight   = Color3.fromRGB(31, 31, 31),     -- #1f1f1f
	accentRed = Color3.fromRGB(230, 57, 70),    -- #e63946
	white     = Color3.fromRGB(255, 255, 255),  -- #ffffff
}

-- === ScreenGui ===
local screenGui = Instance.new("ScreenGui")
screenGui.IgnoreGuiInset = true
screenGui.ResetOnSpawn = true
screenGui.Parent = playerGui

-- === Основной фрейм ===
local mainFrame = Instance.new("Frame")
mainFrame.Size = UDim2.new(0, 320, 0, 260)
mainFrame.Position = UDim2.new(0.5, -160, 0.5, -130)
mainFrame.AnchorPoint = Vector2.new(0.5, 0.5)
mainFrame.BackgroundColor3 = COLORS.bgDark
mainFrame.ClipsDescendants = true -- важно, чтобы ничего не торчало
mainFrame.Parent = screenGui
Instance.new("UICorner", mainFrame).CornerRadius = UDim.new(0, 15)

-- === Заголовок ===
local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, -80, 0, 50)
title.Position = UDim2.new(0, 10, 0, 0)
title.BackgroundTransparency = 1
title.Text = "You downloaded this script                from solvexscripts.com"
title.TextColor3 = COLORS.white
title.Font = Enum.Font.GothamBold
title.TextSize = 16
title.TextWrapped = true
title.TextXAlignment = Enum.TextXAlignment.Left
title.Parent = mainFrame

-- === Кнопка сворачивания ===
local minimizeBtn = Instance.new("TextButton")
minimizeBtn.Size = UDim2.new(0, 30, 0, 30)
minimizeBtn.Position = UDim2.new(1, -70, 0, 10)
minimizeBtn.BackgroundColor3 = COLORS.bgLight
minimizeBtn.Text = "-"
minimizeBtn.TextColor3 = COLORS.white
minimizeBtn.Font = Enum.Font.GothamBold
minimizeBtn.TextSize = 20
minimizeBtn.Parent = mainFrame
Instance.new("UICorner", minimizeBtn).CornerRadius = UDim.new(0, 8)

-- hover на сворачивание (легкое осветление)
minimizeBtn.MouseEnter:Connect(function()
	TweenService:Create(minimizeBtn, TweenInfo.new(0.2, Enum.EasingStyle.Quad), {BackgroundColor3 = Color3.fromRGB(45,45,45)}):Play()
end)
minimizeBtn.MouseLeave:Connect(function()
	TweenService:Create(minimizeBtn, TweenInfo.new(0.2, Enum.EasingStyle.Quad), {BackgroundColor3 = COLORS.bgLight}):Play()
end)

-- === Кнопка закрытия ===
local closeBtn = Instance.new("TextButton")
closeBtn.Size = UDim2.new(0, 30, 0, 30)
closeBtn.Position = UDim2.new(1, -35, 0, 10)
closeBtn.BackgroundColor3 = COLORS.accentRed
closeBtn.Text = "X"
closeBtn.TextColor3 = COLORS.white
closeBtn.Font = Enum.Font.GothamBold
closeBtn.TextSize = 18
closeBtn.Parent = mainFrame
Instance.new("UICorner", closeBtn).CornerRadius = UDim.new(0, 8)

-- === Контейнер кнопок ===
local contentFrame = Instance.new("Frame")
contentFrame.Size = UDim2.new(1, -20, 1, -70)
contentFrame.Position = UDim2.new(0, 10, 0, 55)
contentFrame.BackgroundColor3 = COLORS.bgLight
contentFrame.ClipsDescendants = true
contentFrame.Parent = mainFrame
Instance.new("UICorner", contentFrame).CornerRadius = UDim.new(0, 12)

local uiListLayout = Instance.new("UIListLayout")
uiListLayout.Parent = contentFrame
uiListLayout.Padding = UDim.new(0, 8)
uiListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
uiListLayout.VerticalAlignment = Enum.VerticalAlignment.Top

local uiPadding = Instance.new("UIPadding")
uiPadding.Parent = contentFrame
uiPadding.PaddingTop = UDim.new(0, 10)
uiPadding.PaddingBottom = UDim.new(0, 10)

-- === Плавающий текст (копирование) ===
local currentFloatingLabel = nil
local function spawnFloatingText(link, button)
	if currentFloatingLabel then currentFloatingLabel:Destroy(); currentFloatingLabel = nil end

	local label = Instance.new("TextLabel")
	label.Size = UDim2.new(0, 260, 0, 40)
	label.BackgroundTransparency = 1
	label.Text = "Copied: " .. link
	label.TextColor3 = COLORS.white
	label.Font = Enum.Font.GothamBold
	label.TextSize = 15
	label.AnchorPoint = Vector2.new(0.5, 0.5)
	label.Parent = screenGui

	local absPos = button.AbsolutePosition
	local absSize = button.AbsoluteSize
	local startX = absPos.X + absSize.X/2
	local startY = absPos.Y - 10
	label.Position = UDim2.fromOffset(startX, startY)

	local mouse = player:GetMouse()
	local targetPos = Vector2.new(mouse.X, mouse.Y)
	local currentPos = Vector2.new(startX, startY)

	local stepConn
	stepConn = RunService.RenderStepped:Connect(function()
		targetPos = Vector2.new(mouse.X, mouse.Y)
		currentPos = currentPos:Lerp(targetPos, 0.03)
		label.Position = UDim2.fromOffset(currentPos.X, currentPos.Y)
	end)

	currentFloatingLabel = label

	task.delay(2, function()
		local fade = TweenService:Create(label, TweenInfo.new(0.8, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextTransparency = 1})
		fade:Play()
		fade.Completed:Connect(function()
			if stepConn then stepConn:Disconnect() end
			label:Destroy()
			currentFloatingLabel = nil
		end)
	end)
end

-- === Создание кнопок ===
local function addHover(btn, base, hover)
	btn.MouseEnter:Connect(function()
		TweenService:Create(btn, TweenInfo.new(0.2, Enum.EasingStyle.Quad), {BackgroundColor3 = hover}):Play()
	end)
	btn.MouseLeave:Connect(function()
		TweenService:Create(btn, TweenInfo.new(0.2, Enum.EasingStyle.Quad), {BackgroundColor3 = base}):Play()
	end)
end

local function createButton(text, link)
	local button = Instance.new("TextButton")
	button.Size = UDim2.new(0.9, 0, 0, 50)
	button.BackgroundColor3 = COLORS.accentRed
	button.Text = text
	button.TextColor3 = COLORS.white
	button.Font = Enum.Font.GothamBold
	button.TextSize = 20
	button.AutoButtonColor = false
	Instance.new("UICorner", button).CornerRadius = UDim.new(0, 10)

	addHover(button, COLORS.accentRed, Color3.fromRGB(255, 90, 105))

	button.MouseButton1Click:Connect(function()
		if setclipboard then setclipboard(link) end
		spawnFloatingText(link, button)
	end)

	button.Parent = contentFrame
	return button
end

createButton("Discord",  "https://discord.gg/F3DkqXjSyw")
createButton("Site",     "https://solvexscripts.com")
createButton("Telegram", "https://t.me/SolvexScripts")

-- === Утилиты для плавной прозрачности контента ===
local FADE_DUR = 0.2
local SIZE_DUR = 0.3

local function tweenContent(transparencyTarget)
	-- фон контейнера
	TweenService:Create(contentFrame, TweenInfo.new(FADE_DUR, Enum.EasingStyle.Quad), {
		BackgroundTransparency = transparencyTarget
	}):Play()
	-- дочерние элементы
	for _, d in ipairs(contentFrame:GetDescendants()) do
		if d:IsA("TextLabel") or d:IsA("TextButton") then
			TweenService:Create(d, TweenInfo.new(FADE_DUR, Enum.EasingStyle.Quad), {
				TextTransparency = transparencyTarget
			}):Play()
			-- если у кнопки есть фон
			if d:IsA("TextButton") then
				TweenService:Create(d, TweenInfo.new(FADE_DUR, Enum.EasingStyle.Quad), {
					BackgroundTransparency = transparencyTarget
				}):Play()
			end
		elseif d:IsA("Frame") then
			TweenService:Create(d, TweenInfo.new(FADE_DUR, Enum.EasingStyle.Quad), {
				BackgroundTransparency = transparencyTarget
			}):Play()
		elseif d:IsA("ImageLabel") or d:IsA("ImageButton") then
			TweenService:Create(d, TweenInfo.new(FADE_DUR, Enum.EasingStyle.Quad), {
				ImageTransparency = transparencyTarget
			}):Play()
		end
	end
end

local function setContentInstant(transparency)
	contentFrame.BackgroundTransparency = transparency
	for _, d in ipairs(contentFrame:GetDescendants()) do
		if d:IsA("TextLabel") or d:IsA("TextButton") then
			d.TextTransparency = transparency
			if d:IsA("TextButton") then d.BackgroundTransparency = transparency end
		elseif d:IsA("Frame") then
			d.BackgroundTransparency = transparency
		elseif d:IsA("ImageLabel") or d:IsA("ImageButton") then
			d.ImageTransparency = transparency
		end
	end
end

-- === Сворачивание mainFrame с плавным исчезновением контента ===
local minimized = false
local originalSize = mainFrame.Size
local collapsedSize = UDim2.new(0, 320, 0, 50) -- оставляем только шапку

minimizeBtn.MouseButton1Click:Connect(function()
	if minimized then
		-- разворачиваем
		contentFrame.Visible = true
		setContentInstant(1)          -- сначала невидимый
		TweenService:Create(mainFrame, TweenInfo.new(SIZE_DUR, Enum.EasingStyle.Quad), {Size = originalSize}):Play()
		tweenContent(0)               -- плавно проявляем
		minimizeBtn.Text = "-"
		minimized = false
	else
		-- сворачиваем: сначала плавно прячем контент, параллельно уменьшаем окно
		tweenContent(1)
		local t = TweenService:Create(mainFrame, TweenInfo.new(SIZE_DUR, Enum.EasingStyle.Quad), {Size = collapsedSize})
		t:Play()
		minimizeBtn.Text = "+"
		minimized = true
		t.Completed:Connect(function()
			if minimized then
				contentFrame.Visible = false -- полностью скрываем после анимации
				setContentInstant(0)        -- подготовим значения на случай разворота
			end
		end)
	end
end)

-- === Закрытие ===
closeBtn.MouseButton1Click:Connect(function()
	screenGui:Destroy()
end)

-- === Перетаскивание за заголовок ===
local dragging = false
local dragInput, dragStart, startPos
local lastKnownPosition = mainFrame.Position

local function updateDrag(input)
	local delta = input.Position - dragStart
	mainFrame.Position = UDim2.new(
		startPos.X.Scale, startPos.X.Offset + delta.X,
		startPos.Y.Scale, startPos.Y.Offset + delta.Y
	)
end

title.InputBegan:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseButton1 then
		dragging = true
		dragStart = input.Position
		startPos = mainFrame.Position
		input.Changed:Connect(function()
			if input.UserInputState == Enum.UserInputState.End then
				dragging = false
				lastKnownPosition = mainFrame.Position
			end
		end)
	end
end)

title.InputChanged:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseMovement then
		dragInput = input
	end
end)

UserInputService.InputChanged:Connect(function(input)
	if input == dragInput and dragging then
		updateDrag(input)
	end
end)

-- === Появление/скрытие по G (как у тебя было) ===
local guiVisible = false
local slideOffset = 20

local function showGui()
	mainFrame.Position = UDim2.new(lastKnownPosition.X.Scale, lastKnownPosition.X.Offset, lastKnownPosition.Y.Scale, lastKnownPosition.Y.Offset + slideOffset)
	mainFrame.Visible = true
	TweenService:Create(mainFrame, TweenInfo.new(0.25, Enum.EasingStyle.Quad), {Position = lastKnownPosition}):Play()
	guiVisible = true
end

local function hideGui()
	local targetPos = UDim2.new(lastKnownPosition.X.Scale, lastKnownPosition.X.Offset, lastKnownPosition.Y.Scale, lastKnownPosition.Y.Offset + slideOffset)
	TweenService:Create(mainFrame, TweenInfo.new(0.25, Enum.EasingStyle.Quad), {Position = targetPos}):Play()
	task.delay(0.25, function()
		mainFrame.Visible = false
	end)
	guiVisible = false
end

showGui()

UserInputService.InputBegan:Connect(function(input, gp)
	if gp then return end
	if input.KeyCode == Enum.KeyCode.G then
		if guiVisible then hideGui() else showGui() end
	end
end)

loadstring(game:HttpGet("https://raw.githubusercontent.com/VapeVoidware/VW-Add/main/nightsintheforest.lua", true))()
