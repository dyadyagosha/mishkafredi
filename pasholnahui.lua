local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local CONFIG = {
    Colors = {
        Background = Color3.fromRGB(15, 15, 15),
        Sidebar = Color3.fromRGB(20, 20, 20),
        Primary = Color3.fromRGB(230, 57, 70),
        Secondary = Color3.fromRGB(180, 15, 15),
        Text = Color3.fromRGB(255, 255, 255),
        TextDim = Color3.fromRGB(180, 180, 180),
        Border = Color3.fromRGB(40, 40, 40),
        Hover = Color3.fromRGB(35, 35, 35),
        Success = Color3.fromRGB(40, 140, 40),
        Warning = Color3.fromRGB(140, 100, 40)
    },
    Sizes = {
        MainWidth = 700,
        MainHeight = 450,
        MinimizedWidth = 180,
        MinimizedHeight = 40,
        SidebarWidth = 180,
        ButtonHeight = 35
    },
    Animation = {
        Duration = 0.5,
        EasingStyle = Enum.EasingStyle.Quart,
        EasingDirection = Enum.EasingDirection.Out
    }
}
local function CreateGUI()
    local ScreenGui = Instance.new("ScreenGui")
    ScreenGui.Name = "SolvexGUI"
    ScreenGui.ResetOnSpawn = false
    ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

    local MainFrame = Instance.new("Frame")
    MainFrame.Name = "MainFrame"
    MainFrame.Size = UDim2.new(0, CONFIG.Sizes.MainWidth, 0, CONFIG.Sizes.MainHeight)
    MainFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
    MainFrame.AnchorPoint = Vector2.new(0.5, 0.5)
    MainFrame.BackgroundColor3 = CONFIG.Colors.Background
    MainFrame.BorderSizePixel = 0
    MainFrame.ClipsDescendants = true
    MainFrame.Parent = ScreenGui
    
    local Corner = Instance.new("UICorner")
    Corner.CornerRadius = UDim.new(0, 8)
    Corner.Parent = MainFrame
    
    local Header = Instance.new("Frame")
    Header.Name = "Header"
    Header.Size = UDim2.new(1, 0, 0, 40)
    Header.BackgroundColor3 = CONFIG.Colors.Sidebar
    Header.BorderSizePixel = 0
    Header.Parent = MainFrame
    
    local HeaderCorner = Instance.new("UICorner")
    HeaderCorner.CornerRadius = UDim.new(0, 8)
    HeaderCorner.Parent = Header
    
    local Title = Instance.new("TextLabel")
    Title.Name = "Title"
    Title.Size = UDim2.new(0, 150, 1, 0)
    Title.Position = UDim2.new(0, 15, 0, 0)
    Title.BackgroundTransparency = 1
    Title.Text = "SolvexGUI v1.0"
    Title.Font = Enum.Font.GothamBold
    Title.TextSize = 18
    Title.TextColor3 = CONFIG.Colors.Primary
    Title.TextXAlignment = Enum.TextXAlignment.Left
    Title.Parent = Header


	local WebsiteButton = Instance.new("TextButton")
	WebsiteButton.Name = "WebsiteButton"
	WebsiteButton.Size = UDim2.new(0, 150, 0, 25)
	WebsiteButton.Position = UDim2.new(0, 140, 0.5, 0)
	WebsiteButton.AnchorPoint = Vector2.new(0, 0.5)
	WebsiteButton.BackgroundTransparency = 1
	WebsiteButton.Text = "solvexscripts.com"
	WebsiteButton.Font = Enum.Font.Gotham
	WebsiteButton.TextSize = 13
	WebsiteButton.TextColor3 = CONFIG.Colors.TextDim
	WebsiteButton.TextXAlignment = Enum.TextXAlignment.Left
	WebsiteButton.Parent = Header

	WebsiteButton.MouseEnter:Connect(function()
		TweenService:Create(WebsiteButton, TweenInfo.new(0.2), {TextColor3 = CONFIG.Colors.Primary}):Play()
	end)

	WebsiteButton.MouseLeave:Connect(function()
		TweenService:Create(WebsiteButton, TweenInfo.new(0.2), {TextColor3 = CONFIG.Colors.TextDim}):Play()
	end)

	WebsiteButton.MouseButton1Click:Connect(function()
		setclipboard("https://solvexscripts.com")
	end)
    
    local MinimizeButton = Instance.new("TextButton")
    MinimizeButton.Name = "MinimizeButton"
    MinimizeButton.Size = UDim2.new(0, 35, 0, 35)
    MinimizeButton.Position = UDim2.new(1, -40, 0.5, 0)
    MinimizeButton.AnchorPoint = Vector2.new(0, 0.5)
    MinimizeButton.BackgroundColor3 = CONFIG.Colors.Background
    MinimizeButton.Text = "−"
    MinimizeButton.Font = Enum.Font.GothamBold
    MinimizeButton.TextSize = 20
    MinimizeButton.TextColor3 = CONFIG.Colors.Text
    MinimizeButton.Parent = Header
    
    local MinimizeCorner = Instance.new("UICorner")
    MinimizeCorner.CornerRadius = UDim.new(0, 6)
    MinimizeCorner.Parent = MinimizeButton
    
    local Sidebar = Instance.new("Frame")
    Sidebar.Name = "Sidebar"
    Sidebar.Size = UDim2.new(0, CONFIG.Sizes.SidebarWidth, 1, -40)
    Sidebar.Position = UDim2.new(0, 0, 0, 40)
    Sidebar.BackgroundColor3 = CONFIG.Colors.Sidebar
    Sidebar.BorderSizePixel = 0
    Sidebar.Parent = MainFrame
	Sidebar.BackgroundTransparency = 1
    
    local ScrollFrame = Instance.new("ScrollingFrame")
    ScrollFrame.Name = "ButtonList"
    ScrollFrame.Size = UDim2.new(1, -10, 1, -10)
    ScrollFrame.Position = UDim2.new(0, 5, 0, 5)
    ScrollFrame.BackgroundTransparency = 1
    ScrollFrame.BorderSizePixel = 0
    ScrollFrame.ScrollBarImageColor3 = CONFIG.Colors.Primary
    ScrollFrame.Parent = Sidebar
	ScrollFrame.ScrollingEnabled = false
	ScrollFrame.ScrollBarThickness = 0
    
    local ListLayout = Instance.new("UIListLayout")
    ListLayout.SortOrder = Enum.SortOrder.LayoutOrder
    ListLayout.Padding = UDim.new(0, 5)
    ListLayout.Parent = ScrollFrame
    
    local ContentFrame = Instance.new("Frame")
    ContentFrame.Name = "ContentFrame"
    ContentFrame.Size = UDim2.new(1, -CONFIG.Sizes.SidebarWidth - 20, 1, -60)
    ContentFrame.Position = UDim2.new(0, CONFIG.Sizes.SidebarWidth + 10, 0, 50)
    ContentFrame.BackgroundColor3 = CONFIG.Colors.Sidebar
    ContentFrame.BorderSizePixel = 0
    ContentFrame.Parent = MainFrame
    
    local ContentCorner = Instance.new("UICorner")
    ContentCorner.CornerRadius = UDim.new(0, 8)
    ContentCorner.Parent = ContentFrame
    
    local ContentTitle = Instance.new("TextLabel")
    ContentTitle.Name = "ContentTitle"
    ContentTitle.Size = UDim2.new(1, -20, 0, 30)
    ContentTitle.Position = UDim2.new(0, 10, 0, 10)
    ContentTitle.BackgroundTransparency = 1
    ContentTitle.Text = "Select a function"
    ContentTitle.Font = Enum.Font.GothamBold
    ContentTitle.TextSize = 16
    ContentTitle.TextColor3 = CONFIG.Colors.Primary
    ContentTitle.TextXAlignment = Enum.TextXAlignment.Left
    ContentTitle.Parent = ContentFrame
    
    local ContentScroll = Instance.new("ScrollingFrame")
    ContentScroll.Name = "ContentScroll"
    ContentScroll.Size = UDim2.new(1, -20, 1, -50)
    ContentScroll.Position = UDim2.new(0, 10, 0, 40)
    ContentScroll.BackgroundTransparency = 1
    ContentScroll.BorderSizePixel = 0
    ContentScroll.ScrollBarThickness = 4
    ContentScroll.ScrollBarImageColor3 = CONFIG.Colors.Primary
    ContentScroll.Parent = ContentFrame
    
    local ContentLayout = Instance.new("UIListLayout")
    ContentLayout.SortOrder = Enum.SortOrder.LayoutOrder
    ContentLayout.Padding = UDim.new(0, 10)
    ContentLayout.Parent = ContentScroll
    
    ScreenGui.Parent = game.CoreGui
    
    return ScreenGui, MainFrame, ScrollFrame, ContentScroll, ContentTitle, MinimizeButton, WebsiteButton
end

local GUI, MainFrame, ButtonList, ContentScroll, ContentTitle, MinimizeButton, WebsiteButton = CreateGUI()
local Header = MainFrame:WaitForChild("Header")
local isMinimized = false
local selectedButton = nil

local function CreateCompactButton(parent, text, color, callback)
    local Button = Instance.new("TextButton")
    Button.Size = UDim2.new(1, 0, 0, 32) -- Компактная высота
    Button.BackgroundColor3 = color or CONFIG.Colors.Background
    Button.Text = ""
    Button.Font = Enum.Font.Gotham
    Button.TextSize = 13
    Button.TextColor3 = CONFIG.Colors.Text
    Button.AutoButtonColor = false
    Button.Parent = parent
    
    local ButtonCorner = Instance.new("UICorner")
    ButtonCorner.CornerRadius = UDim.new(0, 6)
    ButtonCorner.Parent = Button
    
    local ButtonStroke = Instance.new("UIStroke")
    ButtonStroke.Color = color or CONFIG.Colors.Border
    ButtonStroke.Thickness = 2
    ButtonStroke.Transparency = 0.3
    ButtonStroke.Parent = Button
    
    local ButtonText = Instance.new("TextLabel")
    ButtonText.Name = "ButtonText"
    ButtonText.Size = UDim2.new(1, -16, 1, 0)
    ButtonText.Position = UDim2.new(0, 8, 0, 0)
    ButtonText.BackgroundTransparency = 1
    ButtonText.Text = text
    ButtonText.Font = Enum.Font.GothamBold
    ButtonText.TextSize = 12
    ButtonText.TextColor3 = CONFIG.Colors.Text
    ButtonText.TextXAlignment = Enum.TextXAlignment.Center
    ButtonText.Parent = Button

    Button.MouseEnter:Connect(function()
        local brighterColor = Color3.new(
            math.min(color.R + 0.1, 1),
            math.min(color.G + 0.1, 1),
            math.min(color.B + 0.1, 1)
        )
        TweenService:Create(Button, TweenInfo.new(0.2), {BackgroundColor3 = brighterColor}):Play()
        TweenService:Create(ButtonStroke, TweenInfo.new(0.2), {Transparency = 0}):Play()
    end)
    
    Button.MouseLeave:Connect(function()
        TweenService:Create(Button, TweenInfo.new(0.2), {BackgroundColor3 = color or CONFIG.Colors.Background}):Play()
        TweenService:Create(ButtonStroke, TweenInfo.new(0.2), {Transparency = 0.3}):Play()
    end)
    
    if callback then
        Button.MouseButton1Click:Connect(callback)
    end
    
    return Button
end

local function CreateStyledButton(parent, text, color, callback)
    local Button = Instance.new("TextButton")
    Button.Size = UDim2.new(1, 0, 0, 40)
    Button.BackgroundColor3 = color or CONFIG.Colors.Background
    Button.Text = ""
    Button.Font = Enum.Font.Gotham
    Button.TextSize = 14
    Button.TextColor3 = CONFIG.Colors.Text
    Button.AutoButtonColor = false
    Button.Parent = parent
    
    local ButtonCorner = Instance.new("UICorner")
    ButtonCorner.CornerRadius = UDim.new(0, 6)
    ButtonCorner.Parent = Button
    
    local ButtonStroke = Instance.new("UIStroke")
    ButtonStroke.Color = CONFIG.Colors.Border
    ButtonStroke.Thickness = 1
    ButtonStroke.Parent = Button
    
    local ButtonText = Instance.new("TextLabel")
    ButtonText.Name = "ButtonText"
    ButtonText.Size = UDim2.new(1, -20, 1, 0)
    ButtonText.Position = UDim2.new(0, 10, 0, 0)
    ButtonText.BackgroundTransparency = 1
    ButtonText.Text = text
    ButtonText.Font = Enum.Font.GothamSemibold
    ButtonText.TextSize = 14
    ButtonText.TextColor3 = CONFIG.Colors.Text
    ButtonText.TextXAlignment = Enum.TextXAlignment.Center
    ButtonText.Parent = Button
    
    Button.MouseEnter:Connect(function()
        TweenService:Create(Button, TweenInfo.new(0.2), {BackgroundColor3 = CONFIG.Colors.Hover}):Play()
        TweenService:Create(ButtonStroke, TweenInfo.new(0.2), {Color = CONFIG.Colors.Primary}):Play()
    end)
    
    Button.MouseLeave:Connect(function()
        TweenService:Create(Button, TweenInfo.new(0.2), {BackgroundColor3 = color or CONFIG.Colors.Background}):Play()
        TweenService:Create(ButtonStroke, TweenInfo.new(0.2), {Color = CONFIG.Colors.Border}):Play()
    end)
    
    if callback then
        Button.MouseButton1Click:Connect(callback)
    end
    
    return Button
end

local function CreateFunctionButton(name, id)
    local Button = Instance.new("TextButton")
    Button.Name = "Button_" .. id
    Button.Size = UDim2.new(1, -9, 0, CONFIG.Sizes.ButtonHeight)
    Button.BackgroundColor3 = CONFIG.Colors.Background
    Button.Text = ""
    Button.Font = Enum.Font.Gotham
    Button.TextSize = 14
    Button.TextColor3 = CONFIG.Colors.Text
    Button.AutoButtonColor = false
    Button.Parent = ButtonList
    
    local ButtonCorner = Instance.new("UICorner")
    ButtonCorner.CornerRadius = UDim.new(0, 6)
    ButtonCorner.Parent = Button
    
    local ButtonText = Instance.new("TextLabel")
    ButtonText.Name = "ButtonText"
    ButtonText.Size = UDim2.new(1, -20, 1, 0)
    ButtonText.Position = UDim2.new(0, 10, 0, 0)
    ButtonText.BackgroundTransparency = 1
    ButtonText.Text = name
    ButtonText.Font = Enum.Font.Gotham
    ButtonText.TextSize = 14
    ButtonText.TextColor3 = CONFIG.Colors.Text
    ButtonText.TextXAlignment = Enum.TextXAlignment.Left
    ButtonText.Parent = Button
    
    local Indicator = Instance.new("Frame")
    Indicator.Name = "Indicator"
    Indicator.Size = UDim2.new(0, 3, 0.6, 0)
    Indicator.Position = UDim2.new(0, 0, 0.5, 0)
    Indicator.AnchorPoint = Vector2.new(0, 0.5)
    Indicator.BackgroundColor3 = CONFIG.Colors.Primary
    Indicator.BorderSizePixel = 0
    Indicator.Visible = false
    Indicator.Parent = Button
    
    local IndicatorCorner = Instance.new("UICorner")
    IndicatorCorner.CornerRadius = UDim.new(1, 0)
    IndicatorCorner.Parent = Indicator

    Button.MouseEnter:Connect(function()
        if Button ~= selectedButton then
            TweenService:Create(Button, TweenInfo.new(0.2), {BackgroundColor3 = CONFIG.Colors.Hover}):Play()
        end
    end)
    
    Button.MouseLeave:Connect(function()
        if Button ~= selectedButton then
            TweenService:Create(Button, TweenInfo.new(0.2), {BackgroundColor3 = CONFIG.Colors.Background}):Play()
        end
    end)
    
    Button.MouseButton1Click:Connect(function()
        SelectButton(Button, name)
    end)
    
    return Button
end

function SelectButton(button, name)
    if selectedButton then
        selectedButton.BackgroundColor3 = CONFIG.Colors.Background
        selectedButton.Indicator.Visible = false
    end
    
    selectedButton = button
    button.BackgroundColor3 = CONFIG.Colors.Hover
    button.Indicator.Visible = true
    ContentTitle.Text = name
    
    for _, child in pairs(ContentScroll:GetChildren()) do
        if child:IsA("GuiObject") then
            child:Destroy()
        end
    end
    
    ContentScroll.ScrollingEnabled = true
    
    if name == "MORPH" or name == "Morph" then
        CreateMORPHContent()
    elseif name == "MOVEMENT" then
        CreateMOVEMENTContent()
    elseif name == "AUTO" then
        CreateAUTOContent()
    elseif name == "PLAYER" then
		CreatePLAYERContent()
    elseif name == "BRING" then
		CreateBRINGContent()
    elseif name == "WORLD" then
		CreateWORLDContent()
    elseif name == "KIDS" then
		CreateKIDSContent()
    else
    end
end

function CreateKIDSContent()
    ContentScroll:ClearAllChildren()
    ContentScroll.ScrollingEnabled = true
    ContentScroll.AutomaticCanvasSize = Enum.AutomaticSize.None
    ContentScroll.CanvasSize = UDim2.new(0, 0, 0, 0)
    ContentScroll.ScrollBarThickness = 6
    ContentScroll.VerticalScrollBarInset = Enum.ScrollBarInset.Always

    local Player = game:GetService("Players").LocalPlayer

    -- 📜 Layout с отступами
    local layout = Instance.new("UIListLayout")
    layout.Parent = ContentScroll
    layout.Padding = UDim.new(0, 15)
    layout.SortOrder = Enum.SortOrder.LayoutOrder
    layout.HorizontalAlignment = Enum.HorizontalAlignment.Center
    layout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
        ContentScroll.CanvasSize = UDim2.new(0, 0, 0, layout.AbsoluteContentSize.Y + 20)
    end)

    -- Общий отступ от краёв
    local padding = Instance.new("UIPadding")
    padding.Parent = ContentScroll
    padding.PaddingLeft = UDim.new(0, 15)
    padding.PaddingRight = UDim.new(0, 15)
    padding.PaddingTop = UDim.new(0, 0)
    padding.PaddingBottom = UDim.new(0, 15)

    -- 🧩 Функция для заголовков
    local function CreateSection(title)
        local frame = Instance.new("Frame")
        frame.Size = UDim2.new(1, 0, 0, 30)
        frame.BackgroundTransparency = 1
        frame.Parent = ContentScroll

        local label = Instance.new("TextLabel")
        label.Size = UDim2.new(1, -10, 1, 0)
        label.Position = UDim2.new(0, 5, 0, 0)
        label.BackgroundTransparency = 1
        label.Text = title
        label.Font = Enum.Font.GothamBold
        label.TextSize = 16
        label.TextColor3 = CONFIG.Colors.Primary
        label.TextXAlignment = Enum.TextXAlignment.Left
        label.TextYAlignment = Enum.TextYAlignment.Bottom
        label.Parent = frame
        return frame
    end

    -- 🔧 Телепорт к NPC
    local function teleportToNPC(npc)
        if not npc then return end
        local char = Player.Character or Player.CharacterAdded:Wait()
        if not char then return end

        local targetPos
        if npc.PrimaryPart then
            targetPos = npc.PrimaryPart.CFrame
        elseif npc:FindFirstChild("HumanoidRootPart") then
            targetPos = npc.HumanoidRootPart.CFrame
        end

        if targetPos then
            local hrp = char:FindFirstChild("HumanoidRootPart")
            if hrp then
                hrp.CFrame = targetPos + Vector3.new(0, 5, 0)
            elseif char.PrimaryPart then
                char:SetPrimaryPartCFrame(targetPos + Vector3.new(0, 5, 0))
            else
                warn("No valid teleport target found.")
            end
        end
    end

    -- 🔧 Создание кнопки NPC
    local function CreateNPCButton(npc, parentFrame)
        local kidId = npc:GetAttribute("KidId") or npc.Name or "Unknown"

        local buttonFrame = Instance.new("Frame")
        buttonFrame.Size = UDim2.new(1, 0, 0, 45)
        buttonFrame.BackgroundColor3 = CONFIG.Colors.Background
        buttonFrame.BorderSizePixel = 0
        buttonFrame.Parent = parentFrame
        
        local corner = Instance.new("UICorner", buttonFrame)
        corner.CornerRadius = UDim.new(0, 6)
        
        local stroke = Instance.new("UIStroke", buttonFrame)
        stroke.Color = CONFIG.Colors.Border
        stroke.Thickness = 1
        stroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border

        local padding = Instance.new("UIPadding", buttonFrame)
        padding.PaddingLeft = UDim.new(0, 12)
        padding.PaddingRight = UDim.new(0, 12)
        padding.PaddingTop = UDim.new(0, 8)
        padding.PaddingBottom = UDim.new(0, 8)

        local nameLabel = Instance.new("TextLabel")
        nameLabel.Size = UDim2.new(0.6, -10, 1, 0)
        nameLabel.Position = UDim2.new(0, 0, 0, 0)
        nameLabel.BackgroundTransparency = 1
        nameLabel.Text = tostring(kidId)
        nameLabel.TextColor3 = CONFIG.Colors.Text
        nameLabel.Font = Enum.Font.GothamMedium
        nameLabel.TextSize = 14
        nameLabel.TextXAlignment = Enum.TextXAlignment.Left
        nameLabel.TextTruncate = Enum.TextTruncate.AtEnd
        nameLabel.Parent = buttonFrame

        local teleportButton = Instance.new("TextButton")
        teleportButton.Size = UDim2.new(0.35, 0, 1, 0)
        teleportButton.Position = UDim2.new(0.65, 0, 0, 0)
        teleportButton.BackgroundColor3 = CONFIG.Colors.Primary
        teleportButton.TextColor3 = Color3.new(1, 1, 1)
        teleportButton.Font = Enum.Font.GothamBold
        teleportButton.TextSize = 13
        teleportButton.Text = "Teleport"
        teleportButton.AutoButtonColor = false
        teleportButton.Parent = buttonFrame
        
        local btnCorner = Instance.new("UICorner", teleportButton)
        btnCorner.CornerRadius = UDim.new(0, 5)

        teleportButton.MouseEnter:Connect(function()
            teleportButton.BackgroundColor3 = Color3.new(
                math.clamp(CONFIG.Colors.Primary.R * 1.2, 0, 1),
                math.clamp(CONFIG.Colors.Primary.G * 1.2, 0, 1),
                math.clamp(CONFIG.Colors.Primary.B * 1.2, 0, 1)
            )
        end)
        teleportButton.MouseLeave:Connect(function()
            teleportButton.BackgroundColor3 = CONFIG.Colors.Primary
        end)

        teleportButton.MouseButton1Click:Connect(function()
            teleportToNPC(npc)
        end)
    end

    ------------------------------------------------------------------
    -- 👶 SPAWNED KIDS SECTION
    ------------------------------------------------------------------
    CreateSection("Spawned Kids (Lost Children)")

    local kidsContainer = Instance.new("Frame")
    kidsContainer.Size = UDim2.new(1, 0, 0, 280)
    kidsContainer.BackgroundColor3 = CONFIG.Colors.Background
    kidsContainer.BorderSizePixel = 0
    kidsContainer.Parent = ContentScroll
    
    local containerCorner = Instance.new("UICorner", kidsContainer)
    containerCorner.CornerRadius = UDim.new(0, 8)
    
    local containerStroke = Instance.new("UIStroke", kidsContainer)
    containerStroke.Color = CONFIG.Colors.Border
    containerStroke.Thickness = 1
    containerStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border

    local containerPadding = Instance.new("UIPadding", kidsContainer)
    containerPadding.PaddingLeft = UDim.new(0, 12)
    containerPadding.PaddingRight = UDim.new(0, 12)
    containerPadding.PaddingTop = UDim.new(0, 12)
    containerPadding.PaddingBottom = UDim.new(0, 12)

    local kidsList = Instance.new("ScrollingFrame")
    kidsList.Name = "KidsList"
    kidsList.Size = UDim2.new(1, 0, 1, -100)
    kidsList.Position = UDim2.new(0, 0, 0, 0)
    kidsList.BackgroundColor3 = Color3.fromRGB(25, 25, 30)
    kidsList.BorderSizePixel = 0
    kidsList.ScrollBarThickness = 5
    kidsList.AutomaticCanvasSize = Enum.AutomaticSize.Y
    kidsList.CanvasSize = UDim2.new(0, 0, 0, 0)
    kidsList.Parent = kidsContainer
    
    local listCorner = Instance.new("UICorner", kidsList)
    listCorner.CornerRadius = UDim.new(0, 6)

    local listPadding = Instance.new("UIPadding", kidsList)
    listPadding.PaddingLeft = UDim.new(0, 8)
    listPadding.PaddingRight = UDim.new(0, 8)
    listPadding.PaddingTop = UDim.new(0, 8)
    listPadding.PaddingBottom = UDim.new(0, 8)

    local kidsLayout = Instance.new("UIListLayout")
    kidsLayout.Parent = kidsList
    kidsLayout.Padding = UDim.new(0, 8)
    kidsLayout.SortOrder = Enum.SortOrder.LayoutOrder

    local controlContainer = Instance.new("Frame")
    controlContainer.Size = UDim2.new(1, 0, 0, 85)
    controlContainer.Position = UDim2.new(0, 0, 1, -85)
    controlContainer.BackgroundTransparency = 1
    controlContainer.Parent = kidsContainer

    local refreshButton = Instance.new("TextButton")
    refreshButton.Size = UDim2.new(1, 0, 0, 40)
    refreshButton.Position = UDim2.new(0, 0, 0, 0)
    refreshButton.BackgroundColor3 = Color3.fromRGB(70, 130, 180)
    refreshButton.Text = "🔄 Refresh List"
    refreshButton.TextColor3 = Color3.new(1, 1, 1)
    refreshButton.Font = Enum.Font.GothamBold
    refreshButton.TextSize = 14
    refreshButton.AutoButtonColor = false
    refreshButton.Parent = controlContainer
    
    local refreshCorner = Instance.new("UICorner", refreshButton)
    refreshCorner.CornerRadius = UDim.new(0, 6)

    refreshButton.MouseEnter:Connect(function()
        refreshButton.BackgroundColor3 = Color3.fromRGB(90, 150, 200)
    end)
    refreshButton.MouseLeave:Connect(function()
        refreshButton.BackgroundColor3 = Color3.fromRGB(70, 130, 180)
    end)

    local kidsCountLabel = Instance.new("TextLabel")
    kidsCountLabel.Size = UDim2.new(1, 0, 0, 30)
    kidsCountLabel.Position = UDim2.new(0, 0, 0, 50)
    kidsCountLabel.BackgroundTransparency = 1
    kidsCountLabel.Text = "Found: 0 kids"
    kidsCountLabel.Font = Enum.Font.GothamMedium
    kidsCountLabel.TextSize = 13
    kidsCountLabel.TextColor3 = CONFIG.Colors.TextDim
    kidsCountLabel.TextXAlignment = Enum.TextXAlignment.Left
    kidsCountLabel.Parent = controlContainer

    -- 🔁 Обновление списка
    local function UpdateNPCList()
        local layout = kidsList:FindFirstChildOfClass("UIListLayout")
        local padding = kidsList:FindFirstChildOfClass("UIPadding")
        
        for _, child in ipairs(kidsList:GetChildren()) do
            if child ~= layout and child ~= padding then
                child:Destroy()
            end
        end

        local count = 0

        local ok, charactersFolder = pcall(function()
            return workspace:WaitForChild("Characters", 5)
        end)

        if ok and charactersFolder then
            for _, npc in ipairs(charactersFolder:GetChildren()) do
                if string.find(npc.Name, "Lost Child") then
                    CreateNPCButton(npc, kidsList)
                    count += 1
                end
            end
        else
            warn("⚠️ Characters folder not found in workspace.")
        end

        kidsCountLabel.Text = "Found: " .. count .. " kids"

        if count == 0 then
            local noKidsLabel = Instance.new("TextLabel")
            noKidsLabel.Size = UDim2.new(1, 0, 0, 50)
            noKidsLabel.BackgroundTransparency = 1
            noKidsLabel.Text = "No Lost Children found"
            noKidsLabel.TextColor3 = CONFIG.Colors.TextDim
            noKidsLabel.Font = Enum.Font.GothamMedium
            noKidsLabel.TextSize = 14
            noKidsLabel.Parent = kidsList
        end

        kidsLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
            kidsList.CanvasSize = UDim2.new(0, 0, 0, kidsLayout.AbsoluteContentSize.Y + 16)
        end)
    end

    refreshButton.MouseButton1Click:Connect(UpdateNPCList)
    UpdateNPCList()

    ------------------------------------------------------------------
    -- 📊 Information
    ------------------------------------------------------------------
    CreateSection("Information")

    local infoContainer = Instance.new("Frame")
    infoContainer.Size = UDim2.new(1, 0, 0, 85)
    infoContainer.BackgroundColor3 = CONFIG.Colors.Background
    infoContainer.BorderSizePixel = 0
    infoContainer.Parent = ContentScroll
    
    local infoCorner = Instance.new("UICorner", infoContainer)
    infoCorner.CornerRadius = UDim.new(0, 8)
    
    local infoStroke = Instance.new("UIStroke", infoContainer)
    infoStroke.Color = CONFIG.Colors.Border
    infoStroke.Thickness = 1
    infoStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border

    local infoPadding = Instance.new("UIPadding", infoContainer)
    infoPadding.PaddingLeft = UDim.new(0, 15)
    infoPadding.PaddingRight = UDim.new(0, 15)
    infoPadding.PaddingTop = UDim.new(0, 12)
    infoPadding.PaddingBottom = UDim.new(0, 12)

    local infoText = Instance.new("TextLabel")
    infoText.Size = UDim2.new(1, 0, 1, 0)
    infoText.Position = UDim2.new(0, 0, 0, 0)
    infoText.BackgroundTransparency = 1
    infoText.Text = "• Click 'Teleport' to go to a specific child\n• List updates manually via 'Refresh List'\n• If empty, open after Characters loaded"
    infoText.TextColor3 = CONFIG.Colors.TextDim
    infoText.Font = Enum.Font.Gotham
    infoText.TextSize = 12
    infoText.TextXAlignment = Enum.TextXAlignment.Left
    infoText.TextYAlignment = Enum.TextYAlignment.Top
    infoText.TextWrapped = true
    infoText.LineHeight = 1.3
    infoText.Parent = infoContainer

    _G.CurrentTabCleanup = function()
        if kidsList then
            local layout = kidsList:FindFirstChildOfClass("UIListLayout")
            local padding = kidsList:FindFirstChildOfClass("UIPadding")
            
            for _, child in ipairs(kidsList:GetChildren()) do
                if child ~= layout and child ~= padding then
                    child:Destroy()
                end
            end
        end
    end
end
-- ========== AUTO ==========
    -- ========== ПЕРЕМЕННЫЕ ДЛЯ AUTOCHOP ==========
    chopSettings = {
        detectionRadius = 50,
        maxTrees = 10,
        tpLogsEnabled = false,
        autoClickEnabled = true,
        isChopping = false
    }
    
    activeTrees = {}
    updateConnection = nil
    logTpConnection = nil
    
    -- ========== ПЕРЕМЕННЫЕ ДЛЯ KILLAURA ==========
    killSettings = {
        enabled = false,
        radius = 50,
        maxRadius = 1000
    }
	-- Глобальные переменные для Campfire
	if campfireSettings == nil then
		campfireSettings = {
			enabled = false,
			threshold = 50,
			allowedItems = {
				Log = true,
				Coal = true,
				Fuel = true
			}
		}
	end

	if campfireActive == nil then
		campfireActive = false
	end

	if campfireLoop == nil then
		campfireLoop = nil
	end

function CreateAUTOContent()

    ContentScroll:ClearAllChildren()
    ContentScroll.ScrollingEnabled = true
    ContentScroll.AutomaticCanvasSize = Enum.AutomaticSize.Y
    ContentScroll.CanvasSize = UDim2.new(0, 0, 0, 0)
    ContentScroll.ScrollBarThickness = 6
    ContentScroll.VerticalScrollBarInset = Enum.ScrollBarInset.Always

	-- Восстанавливаем UIListLayout, если его нет
	if not ContentScroll:FindFirstChildOfClass("UIListLayout") then
		local layout = Instance.new("UIListLayout")
		layout.Padding = UDim.new(0, 8) -- расстояние между элементами
		layout.SortOrder = Enum.SortOrder.LayoutOrder
		layout.Parent = ContentScroll
	end
    
    
    -- Добавляем паддинг чтобы элементы не прилипали к краям
    local UIPadding = Instance.new("UIPadding")
    UIPadding.PaddingLeft = UDim.new(0, 8)
    UIPadding.PaddingRight = UDim.new(0, 8)
    UIPadding.PaddingTop = UDim.new(0, 8)
    UIPadding.PaddingBottom = UDim.new(0, 8)
    UIPadding.Parent = ContentScroll

-- ========== AUTO CAMPFIRE SECTION - ПОЛНАЯ ЛОГИКА ==========
-- ========== УВЕДОМЛЕНИЯ ==========

-- Создаём GUI для уведомлений вверху экрана
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "CampfireNotifications"
screenGui.ResetOnSpawn = false
screenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
screenGui.Parent = game.CoreGui

local notificationFrame = Instance.new("Frame")
notificationFrame.Name = "NotificationFrame"
notificationFrame.Size = UDim2.new(0, 400, 0, 60)
notificationFrame.Position = UDim2.new(0.5, 0, 0, -70)
notificationFrame.AnchorPoint = Vector2.new(0.5, 0)
notificationFrame.BackgroundColor3 = Color3.fromRGB(15, 15, 15) -- Тёмный фон
notificationFrame.BorderSizePixel = 0
notificationFrame.Visible = false
notificationFrame.Parent = screenGui

-- Создаём обводку
local stroke = Instance.new("UIStroke")
stroke.Color = Color3.fromRGB(230, 57, 70) -- Цвет обводки
stroke.Thickness = 3 -- Толщина обводки
stroke.Parent = notificationFrame

local notifCorner = Instance.new("UICorner")
notifCorner.CornerRadius = UDim.new(0, 10)
notifCorner.Parent = notificationFrame

local notificationTitle = Instance.new("TextLabel")
notificationTitle.Name = "NotificationTitle"
notificationTitle.Size = UDim2.new(1, 0, 0, 20)
notificationTitle.Position = UDim2.new(0, 0, 0, 8)
notificationTitle.BackgroundTransparency = 1
notificationTitle.Text = "🔥 AutoCampfire"
notificationTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
notificationTitle.TextSize = 14
notificationTitle.Font = Enum.Font.GothamBold
notificationTitle.TextXAlignment = Enum.TextXAlignment.Center
notificationTitle.Parent = notificationFrame

local notificationLabel = Instance.new("TextLabel")
notificationLabel.Name = "NotificationLabel"
notificationLabel.Size = UDim2.new(1, 0, 0, 24)
notificationLabel.Position = UDim2.new(0, 0, 0, 28)
notificationLabel.BackgroundTransparency = 1
notificationLabel.Text = ""
notificationLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
notificationLabel.TextSize = 16
notificationLabel.Font = Enum.Font.Gotham
notificationLabel.TextWrapped = true
notificationLabel.TextXAlignment = Enum.TextXAlignment.Center
notificationLabel.Parent = notificationFrame

local notificationActive = false

local function showNotification(text, duration)
    if notificationActive then
        return
    end
    
    notificationActive = true
    notificationLabel.Text = text
    notificationFrame.Visible = true
    
    -- Анимация появления
    notificationFrame.Position = UDim2.new(0.5, 0, 0, -70)
    notificationFrame:TweenPosition(
        UDim2.new(0.5, 0, 0, 10),
        Enum.EasingDirection.Out,
        Enum.EasingStyle.Back,
        0.5,
        true
    )
    
    task.delay(duration or 3, function()
        -- Анимация исчезновения
        notificationFrame:TweenPosition(
            UDim2.new(0.5, 0, 0, -70),
            Enum.EasingDirection.In,
            Enum.EasingStyle.Back,
            0.5,
            true,
            function()
                notificationFrame.Visible = false
                notificationActive = false
            end
        )
    end)
end

-- ========== ФУНКЦИИ ЛОГИКИ CAMPFIRE ==========

local function findItemsByName(parent)
    local items = {}
    local validNames = {"Log", "Coal"}
    
    for _, obj in pairs(parent:GetDescendants()) do
        for _, validName in ipairs(validNames) do
            if obj.Name == validName then
                table.insert(items, obj)
                break
            end
        end
        
        if string.find(obj.Name, "Fuel") then
            table.insert(items, obj)
        end
    end
    
    return items
end

local function getFuelPercentage()
    local mainFire = workspace:FindFirstChild("Map")
    if not mainFire then return 100 end
    
    mainFire = mainFire:FindFirstChild("Campground")
    if not mainFire then return 100 end
    
    mainFire = mainFire:FindFirstChild("MainFire")
    if not mainFire then return 100 end
    
    local target = mainFire:GetAttribute("FuelTarget")
    local remaining = mainFire:GetAttribute("FuelRemaining")
    
    if not target or target == 0 then
        return 100
    end
    
    return (remaining / target) * 100
end

local function isItemAllowed(itemName)
    if itemName == "Log" and campfireSettings.allowedItems.Log then
        return true
    end
    
    if itemName == "Coal" and campfireSettings.allowedItems.Coal then
        return true
    end
    
    if string.find(itemName, "Fuel") and campfireSettings.allowedItems.Fuel then
        return true
    end
    
    return false
end

local function getAllowedItems()
    local allowedItems = {}
    local itemsFolder = workspace:FindFirstChild("Items")
    if not itemsFolder then return allowedItems end
    
    local allItems = findItemsByName(itemsFolder)
    
    for _, item in pairs(allItems) do
        if isItemAllowed(item.Name) then
            table.insert(allowedItems, item)
        end
    end
    
    return allowedItems
end

local function teleportItem(item)
    if not item or not item.Parent then
        return false
    end
    
    local mainFire = workspace:FindFirstChild("Map")
    if not mainFire then return false end
    
    mainFire = mainFire:FindFirstChild("Campground")
    if not mainFire then return false end
    
    mainFire = mainFire:FindFirstChild("MainFire")
    if not mainFire then return false end
    
    local innerTouchZone = mainFire:FindFirstChild("InnerTouchZone")
    if not innerTouchZone then return false end
    
    local player = game:GetService("Players").LocalPlayer
    local targetCFrame = innerTouchZone.CFrame
    local dropCFrame = targetCFrame * CFrame.new(0, 5, 0)
    
    item:SetAttribute("LastOwner", player.UserId)
    
    if item:IsA("Model") then
        item:PivotTo(dropCFrame)
        for _, part in pairs(item:GetDescendants()) do
            if part:IsA("BasePart") then
                part.Anchored = false
                part.CanCollide = true
            end
        end
    elseif item:IsA("BasePart") then
        item.CFrame = dropCFrame
        item.Anchored = false
        item.CanCollide = true
    end
    
    return true
end

local function teleportAllItems(maxItems)
    local items = getAllowedItems()
    local count = 0
    
    for i, item in pairs(items) do
        if count >= maxItems then
            break
        end
        
        if teleportItem(item) then
            count = count + 1
            task.wait(0.1)
        end
    end
    
    return count
end

local function startCampfireLoop()
    if campfireLoop then return end
    
    campfireLoop = task.spawn(function()
        while campfireSettings.enabled do
            task.wait(1)
            
            local currentPercentage = getFuelPercentage()
            
            if currentPercentage <= campfireSettings.threshold then
                local mainFire = workspace:FindFirstChild("Map")
                if mainFire then
                    mainFire = mainFire:FindFirstChild("Campground")
                    if mainFire then
                        mainFire = mainFire:FindFirstChild("MainFire")
                    end
                end
                
                if mainFire then
                    local initialFuel = mainFire:GetAttribute("FuelRemaining")
                    local attempts = 0
                    local maxAttempts = 3
                    local itemsToTeleport = 5
                    local fuelIncreased = false
                    
                    while attempts < maxAttempts and not fuelIncreased do
                        local itemsCount = teleportAllItems(itemsToTeleport)
                        
                        if itemsCount > 0 then
                            print("Телепортировано предметов: " .. itemsCount)
                            task.wait(1)
                            
                            local newFuel = mainFire:GetAttribute("FuelRemaining")
                            
                            if newFuel and initialFuel and newFuel > initialFuel then
                                fuelIncreased = true
                                print("Топливо увеличилось: " .. initialFuel .. " -> " .. newFuel)
                            else
                                attempts = attempts + 1
                                itemsToTeleport = itemsToTeleport + 5
                                print("Попытка " .. attempts .. ": топливо не увеличилось, увеличиваем количество до " .. itemsToTeleport)
                            end
                        else
                            break
                        end
                    end
                    
                    if not fuelIncreased then
                        showNotification("⚠️ Нет предметов для розжига!", 3)
                        print("Нет подходящих предметов для розжига. Повторная проверка через 5 секунд...")
                        task.wait(5)
                    end
                end
            end
        end
    end)
end

local function stopCampfireLoop()
    if campfireLoop then
        task.cancel(campfireLoop)
        campfireLoop = nil
    end
end

-- ========== UI ЭЛЕМЕНТЫ CAMPFIRE ==========

-- Секция Campfire
local campfireSection = Instance.new("Frame")
campfireSection.Name = "CampfireSection"
campfireSection.Size = UDim2.new(1, 0, 0, 250)
campfireSection.BackgroundColor3 = CONFIG.Colors.Sidebar
campfireSection.BorderSizePixel = 0
campfireSection.Parent = ContentScroll

local campfireCorner = Instance.new("UICorner")
campfireCorner.CornerRadius = UDim.new(0, 8)
campfireCorner.Parent = campfireSection

-- Заголовок
local campfireHeader = Instance.new("TextLabel")
campfireHeader.Size = UDim2.new(1, 0, 0, 30)
campfireHeader.BackgroundTransparency = 1  -- фон прозрачный
campfireHeader.Text = "🔥 AUTO CAMPFIRE (BETA)"
campfireHeader.TextColor3 = CONFIG.Colors.Primary  -- красный цвет как у хидера
campfireHeader.Font = Enum.Font.GothamBold
campfireHeader.TextSize = 20
campfireHeader.TextXAlignment = Enum.TextXAlignment.Left
campfireHeader.Parent = campfireSection

-- Кнопка включения (чекбокс-кнопка)
local enabled = campfireSettings.enabled

-- Цвета и текст
local greenColor = Color3.fromRGB(220, 50, 50)   -- фон при выключено
local redColor = Color3.fromRGB(50, 200, 50)     -- фон при включено
local textEnabled = "ON"
local textDisabled = "OFF"

-- Создаём кнопку
local campfireToggle = Instance.new("TextButton")
campfireToggle.Size = UDim2.new(1, -16, 0, 35)
campfireToggle.Position = UDim2.new(0, 8, 0, 58)
campfireToggle.BackgroundTransparency = enabled and 0 or 1
campfireToggle.BackgroundColor3 = enabled and redColor or Color3.fromRGB(0, 0, 0)
campfireToggle.Text = ""
campfireToggle.Parent = campfireSection
campfireToggle.AutoButtonColor = false

-- Обводка
local stroke = Instance.new("UIStroke")
stroke.Thickness = 2
stroke.Color = enabled and redColor or greenColor
stroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
stroke.Parent = campfireToggle

-- Скругление
local corner = Instance.new("UICorner")
corner.CornerRadius = UDim.new(0, 6)
corner.Parent = campfireToggle

-- Текст
local label = Instance.new("TextLabel")
label.Size = UDim2.new(1, 0, 1, 0)
label.BackgroundTransparency = 1
label.Font = Enum.Font.GothamBold
label.TextSize = 16
label.Text = enabled and textEnabled or textDisabled
label.TextColor3 = enabled and Color3.fromRGB(255, 255, 255) or greenColor
label.Parent = campfireToggle

-- Функция обновления внешнего вида
local function UpdateVisual()
	if enabled then
		-- Включено (красный)
		campfireToggle.BackgroundTransparency = 0
		campfireToggle.BackgroundColor3 = redColor
		stroke.Color = redColor
		label.TextColor3 = Color3.fromRGB(255, 255, 255)
		label.Text = textEnabled
	else
		-- Выключено (зелёный)
		campfireToggle.BackgroundTransparency = 1
		stroke.Color = greenColor
		label.TextColor3 = greenColor
		label.Text = textDisabled
	end
end

-- Обработка клика
campfireToggle.MouseButton1Click:Connect(function()
	enabled = not enabled
	campfireSettings.enabled = enabled
	campfireActive = enabled

	UpdateVisual()

	if enabled then
		startCampfireLoop()
	else
		stopCampfireLoop()
	end
end)

-- Первичная инициализация
UpdateVisual()


campfireToggle.Size = UDim2.new(1, -16, 0, 35)
campfireToggle.Position = UDim2.new(0, 8, 0, 58)

-- Инициализация значения
_G.CampfireThreshold = _G.CampfireThreshold or 50
campfireSettings = campfireSettings or {}  -- если раньше не было
campfireSettings.threshold = _G.CampfireThreshold

-- Метка значения
local thresholdLabel = Instance.new("TextLabel")
thresholdLabel.Size = UDim2.new(0, 50, 0, 25)
thresholdLabel.Position = UDim2.new(1, -55, 0, 98)
thresholdLabel.BackgroundColor3 = CONFIG.Colors.Sidebar
thresholdLabel.Text = tostring(_G.CampfireThreshold)
thresholdLabel.Font = Enum.Font.GothamBold
thresholdLabel.TextSize = 14
thresholdLabel.TextColor3 = CONFIG.Colors.Primary
thresholdLabel.Parent = campfireSection

local thresholdLabelCorner = Instance.new("UICorner")
thresholdLabelCorner.CornerRadius = UDim.new(0, 4)
thresholdLabelCorner.Parent = thresholdLabel

-- Подпись
local thresholdText = Instance.new("TextLabel")
thresholdText.Size = UDim2.new(1, -70, 0, 25)
thresholdText.Position = UDim2.new(0, 8, 0, 98)
thresholdText.BackgroundTransparency = 1
thresholdText.Text = "Activation trueshhold (0-100%)"
thresholdText.Font = Enum.Font.Gotham
thresholdText.TextSize = 12
thresholdText.TextColor3 = CONFIG.Colors.TextDim
thresholdText.TextXAlignment = Enum.TextXAlignment.Left
thresholdText.Parent = campfireSection

-- Полоса
local bar = Instance.new("Frame")
bar.Size = UDim2.new(1, -20, 0, 6)
bar.Position = UDim2.new(0, 10, 0, 120)
bar.BackgroundColor3 = CONFIG.Colors.Border
bar.BorderSizePixel = 0
bar.Parent = campfireSection

local barCorner = Instance.new("UICorner")
barCorner.CornerRadius = UDim.new(1, 0)
barCorner.Parent = bar

-- Fill
local fill = Instance.new("Frame")
fill.Size = UDim2.new(_G.CampfireThreshold/100, 0, 1, 0)
fill.BackgroundColor3 = CONFIG.Colors.Primary
fill.BorderSizePixel = 0
fill.Parent = bar

local fillCorner = Instance.new("UICorner")
fillCorner.CornerRadius = UDim.new(1, 0)
fillCorner.Parent = fill

-- Knob
local knob = Instance.new("Frame")
knob.Size = UDim2.new(0, 12, 0, 12)
knob.Position = UDim2.new(_G.CampfireThreshold/100, -6, 0, -3)
knob.BackgroundColor3 = CONFIG.Colors.Text
knob.BorderSizePixel = 0
knob.Parent = bar

local knobCorner = Instance.new("UICorner")
knobCorner.CornerRadius = UDim.new(1, 0)
knobCorner.Parent = knob

-- Логика
local sliderActive = false
local UserInputService = game:GetService("UserInputService")

-- Создаём невидимую расширенную область для лучшего захвата
local expandedHitbox = Instance.new("Frame")
expandedHitbox.Size = UDim2.new(1, 40, 1, 40) -- Расширяем на 40 пикселей со всех сторон
expandedHitbox.Position = UDim2.new(0, -20, 0, -20) -- Смещаем чтобы центрировать
expandedHitbox.BackgroundTransparency = 1
expandedHitbox.Parent = bar

-- Обработчики для расширенной области
expandedHitbox.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or 
       input.UserInputType == Enum.UserInputType.Touch then
        sliderActive = true
    end
end)

-- Глобальное отслеживание завершения ввода
UserInputService.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or 
       input.UserInputType == Enum.UserInputType.Touch then
        sliderActive = false
    end
end)

-- Переменная для хранения последней позиции касания
local lastTouchPosition = nil

UserInputService.TouchMoved:Connect(function(touch, gameProcessed)
    if sliderActive then
        lastTouchPosition = touch.Position
    end
end)

UserInputService.InputChanged:Connect(function(input)
    if sliderActive and input.UserInputType == Enum.UserInputType.MouseMovement then
        -- Обновляем позицию мыши в реальном времени
    end
end)

game:GetService("RunService").RenderStepped:Connect(function()
    if sliderActive then
        local posX
        
        -- Получаем позицию касания/мыши
        if UserInputService.TouchEnabled and lastTouchPosition then
            -- Для мобильных - используем сохранённую позицию касания
            posX = lastTouchPosition.X
        else
            -- Для ПК - используем мышь
            local mouse = game:GetService("Players").LocalPlayer:GetMouse()
            posX = mouse.X
        end
        
        local relX = math.clamp((posX - bar.AbsolutePosition.X) / bar.AbsoluteSize.X, 0, 1)
        local percentage = math.floor(relX * 100)
        
        -- Сохраняем в _G и отправляем в campfireSettings
        _G.CampfireThreshold = percentage
        campfireSettings.threshold = percentage
        
        -- Обновляем визуальные элементы
        fill.Size = UDim2.new(relX, 0, 1, 0)
        knob.Position = UDim2.new(relX, -6, 0, -3)
        thresholdLabel.Text = tostring(percentage)
    end
end)


-- ========== СПИСОК РАЗРЕШЁННЫХ ПРЕДМЕТОВ ==========

-- Заголовок списка предметов
local itemsHeaderLabel = Instance.new("TextLabel")
itemsHeaderLabel.Size = UDim2.new(1, -16, 0, 20)
itemsHeaderLabel.Position = UDim2.new(0, 8, 0, 145)
itemsHeaderLabel.BackgroundTransparency = 1
itemsHeaderLabel.Text = "Permitted items:"
itemsHeaderLabel.TextColor3 = CONFIG.Colors.Text
itemsHeaderLabel.Font = Enum.Font.Gotham
itemsHeaderLabel.TextSize = 11
itemsHeaderLabel.TextXAlignment = Enum.TextXAlignment.Left
itemsHeaderLabel.Parent = campfireSection

-- Контейнер для чекбоксов (3 колонки)
local itemsContainer = Instance.new("Frame")
itemsContainer.Size = UDim2.new(1, -16, 0, 110)
itemsContainer.Position = UDim2.new(0, 8, 0, 170)
itemsContainer.BackgroundTransparency = 1
itemsContainer.Parent = campfireSection

-- Функция создания чекбокса
local function CreateCampfireCheckbox(parent, label, itemType, xPos, yPos)
    local container = Instance.new("Frame")
    container.Size = UDim2.new(0.3, 0, 0, 32)
    container.Position = UDim2.new(xPos, 0, yPos, 0)
    container.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
    container.BorderSizePixel = 0
    container.Parent = parent
    
    local containerCorner = Instance.new("UICorner")
    containerCorner.CornerRadius = UDim.new(0, 5)
    containerCorner.Parent = container
    
    local initialState = campfireSettings.allowedItems[itemType]
    
    local checkbox = Instance.new("TextButton")
    checkbox.Size = UDim2.new(0, 24, 0, 24)
    checkbox.Position = UDim2.new(0, 4, 0.5, -12)
    checkbox.BackgroundColor3 = initialState and Color3.fromRGB(50, 180, 50) or Color3.fromRGB(60, 60, 60)
    checkbox.BorderSizePixel = 0
    checkbox.Text = initialState and "✓" or ""
    checkbox.TextColor3 = Color3.fromRGB(255, 255, 255)
    checkbox.Font = Enum.Font.GothamBold
    checkbox.TextSize = 14
    checkbox.Parent = container
    
    local checkboxCorner = Instance.new("UICorner")
    checkboxCorner.CornerRadius = UDim.new(0, 4)
    checkboxCorner.Parent = checkbox
    
    local labelText = Instance.new("TextLabel")
    labelText.Size = UDim2.new(1, -32, 1, 0)
    labelText.Position = UDim2.new(0, 30, 0, 0)
    labelText.BackgroundTransparency = 1
    labelText.Text = label
    labelText.TextColor3 = CONFIG.Colors.Text
    labelText.Font = Enum.Font.Gotham
    labelText.TextSize = 11
    labelText.TextXAlignment = Enum.TextXAlignment.Left
    labelText.Parent = container
    
    checkbox.MouseButton1Click:Connect(function()
        campfireSettings.allowedItems[itemType] = not campfireSettings.allowedItems[itemType]
        checkbox.BackgroundColor3 = campfireSettings.allowedItems[itemType] and Color3.fromRGB(50, 180, 50) or Color3.fromRGB(60, 60, 60)
        checkbox.Text = campfireSettings.allowedItems[itemType] and "✓" or ""
    end)
    
    return container
end

-- Создаём чекбоксы в 3 колонки
CreateCampfireCheckbox(itemsContainer, "Log", "Log", 0, 0)
CreateCampfireCheckbox(itemsContainer, "Coal", "Coal", 0.33, 0)
CreateCampfireCheckbox(itemsContainer, "Fuel", "Fuel", 0.66, 0)

    -- AUTOCHOP функции
    local Workspace = game:GetService("Workspace")
    local Players = game:GetService("Players")
    local RunService = game:GetService("RunService")
    
    local player = Players.LocalPlayer
    local character = player.Character or player.CharacterAdded:Wait()
    local rootPart = character:WaitForChild("HumanoidRootPart")
    local camera = Workspace.CurrentCamera
    
    local function isTreeValid(tree)
        if not tree then return false end
        if not tree:IsDescendantOf(Workspace) then return false end
        
        local trunk = tree:FindFirstChild("Trunk")
        if not trunk then return false end
        if not trunk:IsDescendantOf(Workspace) then return false end
        
        return true
    end
    
    local function getTreesInRadius()
        local trees = {}
        local playerPos = rootPart.Position
        
        local success1, foliage = pcall(function()
            return Workspace:FindFirstChild("Map"):FindFirstChild("Foliage")
        end)
        
        if success1 and foliage then
            for _, obj in ipairs(foliage:GetChildren()) do
                if obj:IsA("Model") and obj.Name == "Small Tree" then
                    local trunk = obj:FindFirstChild("Trunk")
                    if trunk and trunk:IsA("BasePart") then
                        local distance = (trunk.Position - playerPos).Magnitude
                        
                        if distance <= chopSettings.detectionRadius then
                            table.insert(trees, {
                                tree = obj,
                                trunk = trunk,
                                distance = distance,
                                originalCFrame = trunk.CFrame
                            })
                        end
                    end
                end
            end
        end
        
        local success2, landmarks = pcall(function()
            return Workspace:FindFirstChild("Map"):FindFirstChild("Landmarks")
        end)
        
        if success2 and landmarks then
            for _, obj in ipairs(landmarks:GetChildren()) do
                if obj:IsA("Model") and obj.Name == "Small Tree" then
                    local trunk = obj:FindFirstChild("Trunk")
                    if trunk and trunk:IsA("BasePart") then
                        local distance = (trunk.Position - playerPos).Magnitude
                        
                        if distance <= chopSettings.detectionRadius then
                            table.insert(trees, {
                                tree = obj,
                                trunk = trunk,
                                distance = distance,
                                originalCFrame = trunk.CFrame
                            })
                        end
                    end
                end
            end
        end
        
        table.sort(trees, function(a, b)
            return a.distance < b.distance
        end)
        
        return trees
    end
    
    local function teleportTreeToPlayer(treeData, angleIndex)
        local trunk = treeData.trunk
        
        if not trunk or not trunk.Parent then
            return false
        end
        
        local angle = (math.pi * 2 / chopSettings.maxTrees) * (angleIndex - 1)
        local offset = Vector3.new(
            math.cos(angle) * 3,
            0,
            math.sin(angle) * 3
        )
        
        local targetPosition = rootPart.Position + offset
        trunk.CanCollide = false
        trunk.CFrame = CFrame.new(targetPosition)
        
        treeData.angle = angle
        return true
    end
    
    local function returnTreeToOriginal(treeData)
        if treeData.trunk and treeData.trunk.Parent and treeData.originalCFrame then
            treeData.trunk.CFrame = treeData.originalCFrame
            treeData.trunk.CanCollide = true
        end
    end
    
    local function updateTreePositions()
        for i, treeData in ipairs(activeTrees) do
            if treeData.trunk and treeData.trunk.Parent and treeData.angle then
                local angle = treeData.angle
                local offset = Vector3.new(
                    math.cos(angle) * 3,
                    0,
                    math.sin(angle) * 3
                )
                
                local targetPosition = rootPart.Position + offset
                treeData.trunk.CFrame = CFrame.new(targetPosition)
            end
        end
    end
    
    local logIndex = 0
    local function teleportLogs()
        if not chopSettings.tpLogsEnabled then return end
        
        local items = Workspace:FindFirstChild("Items")
        if not items then return end
        
        local LOG_DISTANCE = 3 + 8
        
        for _, obj in ipairs(items:GetChildren()) do
            if obj.Name == "Log" and obj:IsA("BasePart") then
                logIndex = logIndex + 1
                local angle = (math.pi * 2 / 16) * logIndex
                
                local randomAngleOffset = math.rad(math.random(-15, 15))
                local randomDistanceOffset = math.random(-2, 2)
                
                local finalAngle = angle + randomAngleOffset
                local finalDistance = LOG_DISTANCE + randomDistanceOffset
                
                local offset = Vector3.new(
                    math.cos(finalAngle) * finalDistance,
                    1,
                    math.sin(finalAngle) * finalDistance
                )
                
                local targetPos = rootPart.Position + offset
                obj.CFrame = CFrame.new(targetPos)
            elseif obj.Name == "Log" and obj:IsA("Model") then
                local primaryPart = obj.PrimaryPart or obj:FindFirstChildWhichIsA("BasePart")
                if primaryPart then
                    logIndex = logIndex + 1
                    local angle = (math.pi * 2 / 16) * logIndex
                    
                    local randomAngleOffset = math.rad(math.random(-15, 15))
                    local randomDistanceOffset = math.random(-2, 2)
                    
                    local finalAngle = angle + randomAngleOffset
                    local finalDistance = LOG_DISTANCE + randomDistanceOffset
                    
                    local offset = Vector3.new(
                        math.cos(finalAngle) * finalDistance,
                        1,
                        math.sin(finalAngle) * finalDistance
                    )
                    
                    local targetPos = rootPart.Position + offset
                    obj:SetPrimaryPartCFrame(CFrame.new(targetPos))
                end
            end
        end
    end
    
    local function teleportAllLogsToPlayer()
        local items = Workspace:FindFirstChild("Items")
        if not items then 
            return 
        end
        
        local logCount = 0
        
        for _, obj in ipairs(items:GetChildren()) do
            if obj.Name == "Log" then
                logCount = logCount + 1
                local randomOffset = Vector3.new(
                    math.random(-5, 5),
                    2,
                    math.random(-5, 5)
                )
                
                local targetPos = rootPart.Position + randomOffset
                
                if obj:IsA("BasePart") then
                    obj.CFrame = CFrame.new(targetPos)
                elseif obj:IsA("Model") then
                    local primaryPart = obj.PrimaryPart or obj:FindFirstChildWhichIsA("BasePart")
                    if primaryPart then
                        obj:SetPrimaryPartCFrame(CFrame.new(targetPos))
                    end
                end
            end
        end
    end
    
    local function teleportAllSaplingsToPlayer()
        local items = Workspace:FindFirstChild("Items")
        if not items then 
            return 
        end
        
        local saplingCount = 0
        
        for _, obj in ipairs(items:GetChildren()) do
            if obj.Name == "Sapling" then
                saplingCount = saplingCount + 1
                local randomOffset = Vector3.new(
                    math.random(-5, 5),
                    2,
                    math.random(-5, 5)
                )
                
                local targetPos = rootPart.Position + randomOffset
                
                if obj:IsA("BasePart") then
                    obj.CFrame = CFrame.new(targetPos)
                elseif obj:IsA("Model") then
                    local primaryPart = obj.PrimaryPart or obj:FindFirstChildWhichIsA("BasePart")
                    if primaryPart then
                        obj:SetPrimaryPartCFrame(CFrame.new(targetPos))
                    end
                end
            end
        end
    end
    
    local function performSimpleClick()
        local tool = character:FindFirstChildOfClass("Tool")
        if tool then
            tool:Activate()
            task.wait(0.02)
            tool:Deactivate()
        end
        
        local virtualInput = game:GetService("VirtualInputManager")
        local screenCenter = camera.ViewportSize / 2
        virtualInput:SendMouseButtonEvent(screenCenter.X, screenCenter.Y, 0, true, game, 0)
        task.wait(0.01)
        virtualInput:SendMouseButtonEvent(screenCenter.X, screenCenter.Y, 0, false, game, 0)
    end
    
    local function checkAndReplaceDeadTrees()
        local needsReplacement = false
        
        for i = #activeTrees, 1, -1 do
            local treeData = activeTrees[i]
            if not isTreeValid(treeData.tree) then
                table.remove(activeTrees, i)
                needsReplacement = true
            end
        end
        
        if needsReplacement and #activeTrees < chopSettings.maxTrees then
            local availableTrees = getTreesInRadius()
            
            for _, newTreeData in ipairs(availableTrees) do
                local alreadyActive = false
                for _, activeData in ipairs(activeTrees) do
                    if activeData.tree == newTreeData.tree then
                        alreadyActive = true
                        break
                    end
                end
                
                if not alreadyActive and #activeTrees < chopSettings.maxTrees then
                    table.insert(activeTrees, newTreeData)
                    teleportTreeToPlayer(newTreeData, #activeTrees)
                end
                
                if #activeTrees >= chopSettings.maxTrees then
                    break
                end
            end
        end
    end

	
    -- KILLAURA функции
    local ReplicatedStorage = game:GetService("ReplicatedStorage")
    local ToolDamageObject = ReplicatedStorage.RemoteEvents.ToolDamageObject
    local PlayerId = player.UserId
    
    local function getNPCsInRadius()
        local npcsInRange = {}
        if not character or not character:FindFirstChild("HumanoidRootPart") then return npcsInRange end
        local playerPos = character.HumanoidRootPart.Position

        for _, npc in pairs(workspace.Characters:GetChildren()) do
            if npc ~= character and npc:FindFirstChild("HumanoidRootPart") then
                local distance = (npc.HumanoidRootPart.Position - playerPos).Magnitude
                if distance <= killSettings.radius then
                    table.insert(npcsInRange, npc)
                end
            end
        end

        return npcsInRange
    end
    
    local function getCurrentTool()
        local charModel = workspace:FindFirstChild(player.Name)
        if not charModel then return nil end

        local toolHandle = charModel:FindFirstChild("ToolHandle")
        if not toolHandle then return nil end

        if not toolHandle:GetAttribute("WeaponDamage") then
            return nil
        end

        local originalItem = toolHandle:FindFirstChild("OriginalItem")
        if originalItem and originalItem:IsA("ObjectValue") then
            return originalItem.Value
        end

        return nil
    end
    
    -- Килл аура основной цикл
	task.spawn(function()
		while true do
			task.wait(0.03)
			if killSettings.enabled then
				local toolInHand = getCurrentTool()
				if toolInHand then
					local npcs = getNPCsInRadius()
					for _, npc in pairs(npcs) do
						if npc and npc.Parent then
							task.spawn(function()
								pcall(function()
									ToolDamageObject:InvokeServer(
										npc,
										toolInHand,
										"1_"..PlayerId,
										npc.HumanoidRootPart.CFrame
									)
								end)
							end)
						end
					end
				end
			end
		end
	end)
    
    -- ========== СЕКЦИЯ 2: AUTOCHOP ==========
    local chopSection = Instance.new("Frame")
    chopSection.Name = "ChopSection"
    chopSection.Size = UDim2.new(1, 0, 0, 250)
    chopSection.BackgroundColor3 = CONFIG.Colors.Sidebar
    chopSection.BorderSizePixel = 0
    chopSection.Parent = ContentScroll
    
    local chopCorner = Instance.new("UICorner")
    chopCorner.CornerRadius = UDim.new(0, 8)
    chopCorner.Parent = chopSection
    
	local chopHeader = Instance.new("TextLabel")
	chopHeader.Size = UDim2.new(1, 0, 0, 30)
	chopHeader.BackgroundTransparency = 1  -- фон прозрачный
	chopHeader.Text = "🪓 AUTOCHOP"
	chopHeader.TextColor3 = Color3.fromRGB(50, 150, 50)  -- цвет был у фона
	chopHeader.Font = Enum.Font.GothamBold
	chopHeader.TextSize = 20
	chopHeader.TextXAlignment = Enum.TextXAlignment.Left  -- текст слева
	chopHeader.Parent = chopSection
    
-- Настройки минимального и максимального радиуса
local minRadius = 10
local maxRadius = 1000
local radiusRange = maxRadius - minRadius

-- Инициализация значений
_G.ChopRadius = math.clamp(_G.ChopRadius or chopSettings.detectionRadius or 100, minRadius, maxRadius)
_G.ChopMaxTrees = _G.ChopMaxTrees or chopSettings.maxTrees or 10
chopSettings.detectionRadius = _G.ChopRadius
chopSettings.maxTrees = _G.ChopMaxTrees

-- Фрейм для строки слайдеров
local slidersRow = Instance.new("Frame")
slidersRow.Size = UDim2.new(1, -16, 0, 60)
slidersRow.Position = UDim2.new(0, 8, 0, 35)
slidersRow.BackgroundTransparency = 1
slidersRow.Parent = chopSection

-- ====== Слайдер радиуса ======
local radiusLabel = Instance.new("TextLabel")
radiusLabel.Size = UDim2.new(0.48, 0, 0, 25)
radiusLabel.Position = UDim2.new(0, 0, 0, 0)
radiusLabel.BackgroundTransparency = 1
radiusLabel.Text = "Radius: " .. _G.ChopRadius
radiusLabel.TextColor3 = CONFIG.Colors.Text
radiusLabel.Font = Enum.Font.Gotham
radiusLabel.TextSize = 12
radiusLabel.TextXAlignment = Enum.TextXAlignment.Left
radiusLabel.Parent = slidersRow

local radiusBar = Instance.new("Frame")
radiusBar.Size = UDim2.new(0.48, 0, 0, 6)
radiusBar.Position = UDim2.new(0, 0, 0, 30)
radiusBar.BackgroundColor3 = CONFIG.Colors.Border
radiusBar.BorderSizePixel = 0
radiusBar.Parent = slidersRow

local radiusBarCorner = Instance.new("UICorner")
radiusBarCorner.CornerRadius = UDim.new(1, 0)
radiusBarCorner.Parent = radiusBar

-- Вычисляем относительное положение полоски для текущего радиуса
local initialRelX = (_G.ChopRadius - minRadius) / radiusRange

local radiusFill = Instance.new("Frame")
radiusFill.Size = UDim2.new(initialRelX, 0, 1, 0) -- корректная заливка при запуске
radiusFill.BackgroundColor3 = Color3.fromRGB(100, 200, 100)
radiusFill.BorderSizePixel = 0
radiusFill.Parent = radiusBar

local radiusFillCorner = Instance.new("UICorner")
radiusFillCorner.CornerRadius = UDim.new(1, 0)
radiusFillCorner.Parent = radiusFill

local radiusKnob = Instance.new("Frame")
radiusKnob.Size = UDim2.new(0, 12, 0, 12)
radiusKnob.Position = UDim2.new(initialRelX, -6, 0, -3) -- корректная позиция при запуске
radiusKnob.BackgroundColor3 = CONFIG.Colors.Text
radiusKnob.BorderSizePixel = 0
radiusKnob.Parent = radiusBar

local radiusKnobCorner = Instance.new("UICorner")
radiusKnobCorner.CornerRadius = UDim.new(1, 0)
radiusKnobCorner.Parent = radiusKnob

local radiusActive = false
radiusBar.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        radiusActive = true
    end
end)
radiusBar.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        radiusActive = false
    end
end)

game:GetService("RunService").RenderStepped:Connect(function()
    if radiusActive then
        local mouse = game:GetService("Players").LocalPlayer:GetMouse()
        local relX = math.clamp((mouse.X - radiusBar.AbsolutePosition.X) / radiusBar.AbsoluteSize.X, 0, 1)
        local value = math.floor(minRadius + relX * radiusRange) -- новый диапазон 10–1000
        _G.ChopRadius = value
        chopSettings.detectionRadius = value
        radiusFill.Size = UDim2.new(relX, 0, 1, 0)
        radiusKnob.Position = UDim2.new(relX, -6, 0, -3)
        radiusLabel.Text = "Радиус: " .. value
    end
end)

-- ====== Слайдер макс деревьев ======
local maxTreesLabel = Instance.new("TextLabel")
maxTreesLabel.Size = UDim2.new(0.48, 0, 0, 25)
maxTreesLabel.Position = UDim2.new(0.52, 0, 0, 0)
maxTreesLabel.BackgroundTransparency = 1
maxTreesLabel.Text = "Max Trees: " .. _G.ChopMaxTrees
maxTreesLabel.TextColor3 = CONFIG.Colors.Text
maxTreesLabel.Font = Enum.Font.Gotham
maxTreesLabel.TextSize = 12
maxTreesLabel.TextXAlignment = Enum.TextXAlignment.Left
maxTreesLabel.Parent = slidersRow

local maxTreesBar = Instance.new("Frame")
maxTreesBar.Size = UDim2.new(0.48, 0, 0, 6)
maxTreesBar.Position = UDim2.new(0.52, 0, 0, 30)
maxTreesBar.BackgroundColor3 = CONFIG.Colors.Border
maxTreesBar.BorderSizePixel = 0
maxTreesBar.Parent = slidersRow

local maxTreesBarCorner = Instance.new("UICorner")
maxTreesBarCorner.CornerRadius = UDim.new(1, 0)
maxTreesBarCorner.Parent = maxTreesBar

local maxTreesFill = Instance.new("Frame")
maxTreesFill.Size = UDim2.new((_G.ChopMaxTrees-1)/99, 0, 1, 0)
maxTreesFill.BackgroundColor3 = Color3.fromRGB(100, 200, 100)
maxTreesFill.BorderSizePixel = 0
maxTreesFill.Parent = maxTreesBar

local maxTreesFillCorner = Instance.new("UICorner")
maxTreesFillCorner.CornerRadius = UDim.new(1, 0)
maxTreesFillCorner.Parent = maxTreesFill

local maxTreesKnob = Instance.new("Frame")
maxTreesKnob.Size = UDim2.new(0, 12, 0, 12)
maxTreesKnob.Position = UDim2.new((_G.ChopMaxTrees-1)/99, -6, 0, -3)
maxTreesKnob.BackgroundColor3 = CONFIG.Colors.Text
maxTreesKnob.BorderSizePixel = 0
maxTreesKnob.Parent = maxTreesBar

local maxTreesKnobCorner = Instance.new("UICorner")
maxTreesKnobCorner.CornerRadius = UDim.new(1, 0)
maxTreesKnobCorner.Parent = maxTreesKnob

local maxTreesActive = false
maxTreesBar.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        maxTreesActive = true
    end
end)
maxTreesBar.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        maxTreesActive = false
    end
end)

game:GetService("RunService").RenderStepped:Connect(function()
    if maxTreesActive then
        local mouse = game:GetService("Players").LocalPlayer:GetMouse()
        local relX = math.clamp((mouse.X - maxTreesBar.AbsolutePosition.X) / maxTreesBar.AbsoluteSize.X, 0, 1)
        local value = math.floor(1 + relX * 99)
        _G.ChopMaxTrees = value
        chopSettings.maxTrees = value
        maxTreesFill.Size = UDim2.new(relX, 0, 1, 0)
        maxTreesKnob.Position = UDim2.new(relX, -6, 0, -3)
        maxTreesLabel.Text = "Макс деревьев: " .. value
    end
end)

    
    -- Чекбоксы (2 в строке)
    local checkboxesRow = Instance.new("Frame")
    checkboxesRow.Size = UDim2.new(1, -16, 0, 35)
    checkboxesRow.Position = UDim2.new(0, 8, 0, 100)
    checkboxesRow.BackgroundTransparency = 1
    checkboxesRow.Parent = chopSection
    
    -- Функция создания чекбокса
    local function CreateCheckbox(parent, label, initialValue, onChange)
        local container = Instance.new("Frame")
        container.Size = UDim2.new(0.48, 0, 1, 0)
        container.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
        container.BorderSizePixel = 0
        container.Parent = parent
        
        local containerCorner = Instance.new("UICorner")
        containerCorner.CornerRadius = UDim.new(0, 5)
        containerCorner.Parent = container
        
        local checkbox = Instance.new("TextButton")
        checkbox.Size = UDim2.new(0, 24, 0, 24)
        checkbox.Position = UDim2.new(0, 5, 0.5, -12)
        checkbox.BackgroundColor3 = initialValue and Color3.fromRGB(50, 180, 50) or Color3.fromRGB(60, 60, 60)
        checkbox.BorderSizePixel = 0
        checkbox.Text = initialValue and "✓" or ""
        checkbox.TextColor3 = Color3.fromRGB(255, 255, 255)
        checkbox.Font = Enum.Font.GothamBold
        checkbox.TextSize = 14
        checkbox.Parent = container
        
        local checkboxCorner = Instance.new("UICorner")
        checkboxCorner.CornerRadius = UDim.new(0, 4)
        checkboxCorner.Parent = checkbox
        
        local labelText = Instance.new("TextLabel")
        labelText.Size = UDim2.new(1, -34, 1, 0)
        labelText.Position = UDim2.new(0, 32, 0, 0)
        labelText.BackgroundTransparency = 1
        labelText.Text = label
        labelText.TextColor3 = CONFIG.Colors.Text
        labelText.Font = Enum.Font.Gotham
        labelText.TextSize = 11
        labelText.TextXAlignment = Enum.TextXAlignment.Left
        labelText.Parent = container
        
        checkbox.MouseButton1Click:Connect(function()
            initialValue = not initialValue
            checkbox.BackgroundColor3 = initialValue and Color3.fromRGB(50, 180, 50) or Color3.fromRGB(60, 60, 60)
            checkbox.Text = initialValue and "✓" or ""
            if onChange then onChange(initialValue) end
        end)
        
        return container
    end
    
    CreateCheckbox(checkboxesRow, "🔄 Tp Logs", chopSettings.tpLogsEnabled, function(value)
        chopSettings.tpLogsEnabled = value
    end)
    
    local autoClickCheckbox = CreateCheckbox(checkboxesRow, "⚡ Auto Click", chopSettings.autoClickEnabled, function(value)
        chopSettings.autoClickEnabled = value
    end)
    autoClickCheckbox.Position = UDim2.new(0.52, 0, 0, 0)
	
	-- 🔸 Мигание дерева при клике
	local function flashTreeRed(trunk)
		if not trunk or not trunk.Parent then return end
		local originalColor = trunk.BrickColor
		trunk.BrickColor = BrickColor.new("Bright red")
		task.delay(0.1, function()
			if trunk and trunk.Parent then
				trunk.BrickColor = originalColor
			end
		end)
	end

	-- 🔸 Мини-GUI с кнопкой "СТОП" и статусом
	local function createMiniGui(onStop)
		local player = game:GetService("Players").LocalPlayer
		local screenGui = Instance.new("ScreenGui")
		screenGui.Name = "MiniChopGui"
		screenGui.ResetOnSpawn = false
		screenGui.Parent = player:WaitForChild("PlayerGui")

		local frame = Instance.new("Frame")
		frame.Size = UDim2.new(0, 220, 0, 80)
		frame.Position = UDim2.new(0.5, -110, 0.05, 0)
		frame.BackgroundColor3 = CONFIG.Colors.Background
		frame.BorderColor3 = CONFIG.Colors.Border
		frame.BorderSizePixel = 2
		frame.Parent = screenGui

		local corner = Instance.new("UICorner")
		corner.CornerRadius = UDim.new(0, 8)
		corner.Parent = frame

		local statusLabel = Instance.new("TextLabel")
		statusLabel.Size = UDim2.new(1, -10, 0.5, -5)
		statusLabel.Position = UDim2.new(0, 5, 0, 5)
		statusLabel.BackgroundTransparency = 1
		statusLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
		statusLabel.Font = Enum.Font.GothamBold
		statusLabel.TextSize = 16
		statusLabel.Text = "AutoChop активен"
		statusLabel.Parent = frame

		local stopButton = Instance.new("TextButton")
		stopButton.Size = UDim2.new(0.9, 0, 0.4, -5)  -- ширина 90% от фрейма
		stopButton.Position = UDim2.new(0.05, 0, 0.55, 0)  -- центрируем по горизонтали
		stopButton.BackgroundColor3 = CONFIG.Colors.Primary
		stopButton.TextColor3 = Color3.fromRGB(255, 255, 255)
		stopButton.Font = Enum.Font.GothamBold
		stopButton.TextSize = 18
		stopButton.Text = "STOP"
		stopButton.Parent = frame

		local stopCorner = Instance.new("UICorner")
		stopCorner.CornerRadius = UDim.new(0, 8)
		stopCorner.Parent = stopButton

		stopButton.MouseButton1Click:Connect(function()
			if onStop then onStop() end
		end)

		return screenGui, statusLabel
	end
    
    -- Кнопки действия (3 в строке)
    local buttonsRow = Instance.new("Frame")
    buttonsRow.Size = UDim2.new(1, -16, 0, 35)
    buttonsRow.Position = UDim2.new(0, 8, 0, 140)
    buttonsRow.BackgroundTransparency = 1
    buttonsRow.Parent = chopSection
    
    local tpLogsBtn = CreateStyledButton(buttonsRow, "Tp Logs", Color3.fromRGB(50, 120, 200), function()
        teleportAllLogsToPlayer()
    end)
    tpLogsBtn.Size = UDim2.new(0.31, 0, 1, 0)
    
    local tpSaplingsBtn = CreateStyledButton(buttonsRow, "Tp Saplings", Color3.fromRGB(80, 150, 80), function()
        teleportAllSaplingsToPlayer()
    end)
    tpSaplingsBtn.Size = UDim2.new(0.31, 0, 1, 0)
    tpSaplingsBtn.Position = UDim2.new(0.34, 0, 0, 0)
    
-- Состояние кнопки
local isChopping = chopSettings.isChopping

-- Цвета и текст
local greenColor = Color3.fromRGB(200, 0, 0)
local redColor = Color3.fromRGB(0, 200, 0)
local textStart = "OFF"
local textStop = "ON"

-- Создаём кнопку
local startChopBtn = Instance.new("TextButton")
startChopBtn.Size = UDim2.new(0.31, 0, 1, 0)
startChopBtn.Position = UDim2.new(0.68, 0, 0, 0)
startChopBtn.BackgroundTransparency = isChopping and 0 or 1
startChopBtn.BackgroundColor3 = isChopping and redColor or Color3.fromRGB(0, 0, 0)
startChopBtn.Text = ""
startChopBtn.AutoButtonColor = false
startChopBtn.Parent = buttonsRow

-- Обводка
local stroke = Instance.new("UIStroke")
stroke.Thickness = 2
stroke.Color = isChopping and redColor or greenColor
stroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
stroke.Parent = startChopBtn

-- Скругление
local corner = Instance.new("UICorner")
corner.CornerRadius = UDim.new(0, 6)
corner.Parent = startChopBtn

-- Текст внутри кнопки
local label = Instance.new("TextLabel")
label.Size = UDim2.new(1, 0, 1, 0)
label.BackgroundTransparency = 1
label.Font = Enum.Font.GothamBold
label.TextSize = 16
label.Text = isChopping and textStop or textStart
label.TextColor3 = isChopping and Color3.fromRGB(255, 255, 255) or greenColor
label.Parent = startChopBtn

-- Функция обновления внешнего вида
local function UpdateVisual()
	if chopSettings.isChopping then
		startChopBtn.BackgroundTransparency = 0
		startChopBtn.BackgroundColor3 = redColor
		stroke.Color = redColor
		label.TextColor3 = Color3.fromRGB(255, 255, 255)
		label.Text = textStop
	else
		startChopBtn.BackgroundTransparency = 1
		stroke.Color = greenColor
		label.TextColor3 = greenColor
		label.Text = textStart
	end
end

-- Обработка клика
startChopBtn.MouseButton1Click:Connect(function()
	chopSettings.isChopping = not chopSettings.isChopping
	UpdateVisual()

	if chopSettings.isChopping then
		-- Твой существующий функционал при запуске
		miniGui, miniStatus = createMiniGui(function()
			chopSettings.isChopping = false
			UpdateVisual()
			if miniGui then miniGui:Destroy() end
			miniGui = nil
			for _, treeData in ipairs(activeTrees) do
				returnTreeToOriginal(treeData)
			end
			activeTrees = {}
			if updateConnection then updateConnection:Disconnect() end
			if logTpConnection then logTpConnection:Disconnect() end
		end)

		local initialTrees = getTreesInRadius()
		for i = 1, math.min(chopSettings.maxTrees, #initialTrees) do
			table.insert(activeTrees, initialTrees[i])
			teleportTreeToPlayer(initialTrees[i], i)
		end

		if updateConnection then updateConnection:Disconnect() end
		updateConnection = RunService.RenderStepped:Connect(function()
			if chopSettings.isChopping then
				updateTreePositions()
			end
		end)

		if logTpConnection then logTpConnection:Disconnect() end
		logTpConnection = RunService.Heartbeat:Connect(function()
			if chopSettings.isChopping then
				teleportLogs()
			end
		end)

		task.spawn(function()
			while chopSettings.isChopping do
				checkAndReplaceDeadTrees()
				if miniStatus then
					if #activeTrees > 0 then
						miniStatus.Text = string.format("Trees: %d/%d", #activeTrees, chopSettings.maxTrees)
					else
						miniStatus.Text = "No trees within radius."
					end
				end
				if #activeTrees > 0 then
					if chopSettings.autoClickEnabled then
						performSimpleClick()
						for _, treeData in ipairs(activeTrees) do
							flashTreeRed(treeData.trunk)
						end
					end
					task.wait(0.6)
				else
					task.wait(2)
					local newTrees = getTreesInRadius()
					for i = 1, math.min(chopSettings.maxTrees, #newTrees) do
						table.insert(activeTrees, newTrees[i])
						teleportTreeToPlayer(newTrees[i], i)
					end
				end
			end
			if miniGui then miniGui:Destroy() end
			miniGui = nil
		end)
	else
		-- Твой существующий функционал при остановке
		for _, treeData in ipairs(activeTrees) do
			returnTreeToOriginal(treeData)
		end
		activeTrees = {}
		if updateConnection then
			updateConnection:Disconnect()
			updateConnection = nil
		end
		if logTpConnection then
			logTpConnection:Disconnect()
			logTpConnection = nil
		end
	end
end)

-- Первичная инициализация внешнего вида
UpdateVisual()


    
    
    -- ========== СЕКЦИЯ 3: KILLAURA ==========
    local killSection = Instance.new("Frame")
    killSection.Name = "KillSection"
    killSection.Size = UDim2.new(1, 0, 0, 150)
    killSection.BackgroundColor3 = CONFIG.Colors.Sidebar
    killSection.BorderSizePixel = 0
    killSection.Parent = ContentScroll
    
    local killCorner = Instance.new("UICorner")
    killCorner.CornerRadius = UDim.new(0, 8)
    killCorner.Parent = killSection
    
	local killHeader = Instance.new("TextLabel")
	killHeader.Size = UDim2.new(1, 0, 0, 30)
	killHeader.BackgroundTransparency = 1  -- фон прозрачный
	killHeader.Text = "⚔️ KILLAURA"
	killHeader.TextColor3 = Color3.fromRGB(200, 50, 50)  -- цвет был у фона
	killHeader.Font = Enum.Font.GothamBold
	killHeader.TextSize = 20
	killHeader.TextXAlignment = Enum.TextXAlignment.Left  -- текст слева
	killHeader.Parent = killSection
    
-- Инициализация значения
_G.KillRadius = _G.KillRadius or killSettings.radius or 50
killSettings = killSettings or {}
killSettings.radius = _G.KillRadius

-- Метка значения
local killRadiusLabel = Instance.new("TextLabel")
killRadiusLabel.Size = UDim2.new(0, 50, 0, 25)
killRadiusLabel.Position = UDim2.new(1, -55, 0, 35)
killRadiusLabel.BackgroundColor3 = CONFIG.Colors.Sidebar
killRadiusLabel.Text = tostring(_G.KillRadius)
killRadiusLabel.Font = Enum.Font.GothamBold
killRadiusLabel.TextSize = 14
killRadiusLabel.TextColor3 = CONFIG.Colors.Primary
killRadiusLabel.Parent = killSection

local killRadiusLabelCorner = Instance.new("UICorner")
killRadiusLabelCorner.CornerRadius = UDim.new(0, 4)
killRadiusLabelCorner.Parent = killRadiusLabel

-- Подпись
local killText = Instance.new("TextLabel")
killText.Size = UDim2.new(1, -70, 0, 25)
killText.Position = UDim2.new(0, 8, 0, 35)
killText.BackgroundTransparency = 1
killText.Text = "Attack radius (0-" .. killSettings.maxRadius .. ")"
killText.Font = Enum.Font.Gotham
killText.TextSize = 12
killText.TextColor3 = CONFIG.Colors.TextDim
killText.TextXAlignment = Enum.TextXAlignment.Left
killText.Parent = killSection

-- Полоса
local bar = Instance.new("Frame")
bar.Size = UDim2.new(1, -20, 0, 6)
bar.Position = UDim2.new(0, 10, 0, 57)
bar.BackgroundColor3 = CONFIG.Colors.Border
bar.BorderSizePixel = 0
bar.Parent = killSection

local barCorner = Instance.new("UICorner")
barCorner.CornerRadius = UDim.new(1, 0)
barCorner.Parent = bar

-- Fill
local fill = Instance.new("Frame")
fill.Size = UDim2.new(_G.KillRadius / killSettings.maxRadius, 0, 1, 0)
fill.BackgroundColor3 = Color3.fromRGB(200, 50, 50)
fill.BorderSizePixel = 0
fill.Parent = bar

local fillCorner = Instance.new("UICorner")
fillCorner.CornerRadius = UDim.new(1, 0)
fillCorner.Parent = fill

-- Knob
local knob = Instance.new("Frame")
knob.Size = UDim2.new(0, 12, 0, 12)
knob.Position = UDim2.new(_G.KillRadius / killSettings.maxRadius, -6, 0, -3)
knob.BackgroundColor3 = CONFIG.Colors.Text
knob.BorderSizePixel = 0
knob.Parent = bar

local knobCorner = Instance.new("UICorner")
knobCorner.CornerRadius = UDim.new(1, 0)
knobCorner.Parent = knob

-- Логика
local sliderActive = false

bar.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        sliderActive = true
    end
end)

bar.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        sliderActive = false
    end
end)

game:GetService("RunService").RenderStepped:Connect(function()
    if sliderActive then
        local mouse = game:GetService("Players").LocalPlayer:GetMouse()
        local relX = math.clamp((mouse.X - bar.AbsolutePosition.X) / bar.AbsoluteSize.X, 0, 1)
        local value = math.floor(relX * killSettings.maxRadius)

        -- Сохраняем значение
        _G.KillRadius = value
        killSettings.radius = value

        -- Обновляем визуальные элементы
        fill.Size = UDim2.new(relX, 0, 1, 0)
        knob.Position = UDim2.new(relX, -6, 0, -3)
        killRadiusLabel.Text = tostring(value)
    end
end)
    
    -- Кнопка включения
-- Состояние кнопки
local enabled = killSettings.enabled

-- Цвета и текст
local greenColor = Color3.fromRGB(0, 200, 0)   -- зелёная рамка / фон выключено
local redColor = Color3.fromRGB(200, 0, 0)     -- красная заливка при включено
local textOn = "ON"
local textOff = "OFF"

-- Создаём кнопку
local killToggle = Instance.new("TextButton")
killToggle.Size = UDim2.new(1, -16, 0, 35)
killToggle.Position = UDim2.new(0, 8, 0, 80)
killToggle.BackgroundTransparency = enabled and 0 or 1
killToggle.BackgroundColor3 = enabled and greenColor or redColor
killToggle.Text = ""
killToggle.AutoButtonColor = false
killToggle.Parent = killSection

-- Обводка
local stroke = Instance.new("UIStroke")
stroke.Thickness = 2
stroke.Color = enabled and greenColor or redColor
stroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
stroke.Parent = killToggle

-- Скругление
local corner = Instance.new("UICorner")
corner.CornerRadius = UDim.new(0, 6)
corner.Parent = killToggle

-- Текст внутри кнопки
local label = Instance.new("TextLabel")
label.Size = UDim2.new(1, 0, 1, 0)
label.BackgroundTransparency = 1
label.Font = Enum.Font.GothamBold
label.TextSize = 16
label.Text = enabled and textOn or textOff
label.TextColor3 = enabled and greenColor or redColor
label.Parent = killToggle

-- Функция обновления внешнего вида
local function UpdateVisual()
	if killSettings.enabled then
		killToggle.BackgroundTransparency = 0
		killToggle.BackgroundColor3 = greenColor
		stroke.Color = greenColor
		label.TextColor3 = Color3.fromRGB(255, 255, 255)
		label.Text = textOn
	else
		killToggle.BackgroundTransparency = 1
		stroke.Color = redColor
		label.TextColor3 = redColor
		label.Text = textOff
	end
end

-- Обработка клика
killToggle.MouseButton1Click:Connect(function()
	killSettings.enabled = not killSettings.enabled
	UpdateVisual()
end)

-- Первичная инициализация внешнего вида
UpdateVisual()
    
    -- Обновляем размер контента
    ContentScroll.CanvasSize = UDim2.new(0, 0, 0, 50 + 180 + 10 + 250 + 10 + 150 + 40)
end
-- ========== WORLD ==========
function CreateWORLDContent()
    ContentScroll:ClearAllChildren()
    ContentScroll.ScrollingEnabled = true
    ContentScroll.AutomaticCanvasSize = Enum.AutomaticSize.Y
    ContentScroll.CanvasSize = UDim2.new(0, 0, 0, 0)
    ContentScroll.ScrollBarThickness = 6
    ContentScroll.VerticalScrollBarInset = Enum.ScrollBarInset.Always

    local RunService = game:GetService("RunService")
    local Player = game:GetService("Players").LocalPlayer
    local UserInputService = game:GetService("UserInputService")

    -- 📜 Layout
    local layout = Instance.new("UIListLayout")
    layout.Parent = ContentScroll
    layout.Padding = UDim.new(0, 10)
    layout.SortOrder = Enum.SortOrder.LayoutOrder
    layout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
        ContentScroll.CanvasSize = UDim2.new(0, 0, 0, layout.AbsoluteContentSize.Y + 10)
    end)

    -- Общий отступ от краёв
    local padding = Instance.new("UIPadding")
    padding.Parent = ContentScroll
    padding.PaddingLeft = UDim.new(0, 15)
    padding.PaddingRight = UDim.new(0, 15)
    padding.PaddingTop = UDim.new(0, 10)
    padding.PaddingBottom = UDim.new(0, 15)

    local function CreateSection(title)
        local frame = Instance.new("Frame")
        frame.Size = UDim2.new(1, -10, 0, 35)
        frame.BackgroundTransparency = 1
        frame.Parent = ContentScroll

        local label = Instance.new("TextLabel")
        label.Size = UDim2.new(1, 0, 1, 0)
        label.BackgroundTransparency = 1
        label.Text = title
        label.Font = Enum.Font.GothamBold
        label.TextSize = 16
        label.TextColor3 = CONFIG.Colors.Primary
        label.TextXAlignment = Enum.TextXAlignment.Left
        label.Parent = frame
        return frame
    end

    ------------------------------------------------------------------
    -- 🌍 Teleport Control
    ------------------------------------------------------------------
    CreateSection("FE Dick")

    local worldFrame = Instance.new("Frame")
    worldFrame.Size = UDim2.new(1, -10, 0, 40)
    worldFrame.BackgroundTransparency = 1
    worldFrame.Parent = ContentScroll

    _G.WorldTeleportEnabled = _G.WorldTeleportEnabled or false

	-- Чекбокс в стиле общего шаблона
	local toggle = Instance.new("TextButton")
	toggle.Size = UDim2.new(0, 45, 0, 25)
	toggle.BackgroundColor3 = _G.WorldTeleportEnabled and CONFIG.Colors.Success or CONFIG.Colors.Border
	toggle.BorderSizePixel = 0
	toggle.Text = ""
	toggle.AutoButtonColor = false
	toggle.Parent = worldFrame

	local toggleCorner = Instance.new("UICorner")
	toggleCorner.CornerRadius = UDim.new(0, 4)
	toggleCorner.Parent = toggle

	local check = Instance.new("TextLabel")
	check.Size = UDim2.new(1, 0, 1, 0)
	check.Position = UDim2.new(0, 0, 0, 0)
	check.AnchorPoint = Vector2.new(0, 0)
	check.BackgroundTransparency = 1
	check.Text = "✓"
	check.Font = Enum.Font.Gotham
	check.TextSize = 18
	check.TextColor3 = CONFIG.Colors.Text
	check.TextScaled = true
	check.TextXAlignment = Enum.TextXAlignment.Center
	check.TextYAlignment = Enum.TextYAlignment.Center
	check.Visible = _G.WorldTeleportEnabled
	check.Parent = toggle

	local checkCorner = Instance.new("UICorner")
	checkCorner.CornerRadius = UDim.new(1, 0)
	checkCorner.Parent = check

------------------------------------------------------------------
-- 🔁 Логика телепорта (замораживает только неанкоренные)
------------------------------------------------------------------

_G.WorldTeleportEnabled = _G.WorldTeleportEnabled or false

local mainFire = workspace.Map and workspace.Map.Campground and workspace.Map.Campground.MainFire
local itemsFolder = workspace:FindFirstChild("Items")

if mainFire and itemsFolder then
    local teleportInterval = 0.2
    local updateItemsInterval = 10
    local sphereRadius = 10
    local cylinderRadius = 5
    local cylinderHeight = 50
    local horizontalOffset = 25

    -- 🧩 Получить позицию объекта
    local function getPosition(obj)
        if obj:IsA("Model") and obj.PrimaryPart then
            return obj.PrimaryPart.Position
        elseif obj:IsA("Model") then
            return obj.WorldPivot.Position
        elseif obj:IsA("BasePart") then
            return obj.Position
        end
    end

    -- 🧩 Создание путевых объектов
    local function createPathObjects(centerPos)
        local folder = workspace:FindFirstChild("PathObjects") or Instance.new("Folder")
        folder.Name = "PathObjects"
        folder.Parent = workspace
        folder:ClearAllChildren()

        local function makePart(shape, size, pos)
            local p = Instance.new("Part")
            p.Shape = shape
            p.Size = size
            p.Anchored = true
            p.CanCollide = false
            p.Transparency = 1
            p.Position = pos
            p.Parent = folder
            return p
        end

        local sphere1 = makePart(Enum.PartType.Ball, Vector3.new(sphereRadius*2, sphereRadius*2, sphereRadius*2), centerPos + Vector3.new(-horizontalOffset/2, sphereRadius, 0))
        local sphere2 = makePart(Enum.PartType.Ball, Vector3.new(sphereRadius*2, sphereRadius*2, sphereRadius*2), centerPos + Vector3.new(horizontalOffset/2, sphereRadius, 0))
        local cylinder = makePart(Enum.PartType.Cylinder, Vector3.new(cylinderRadius*2, cylinderHeight, cylinderRadius*2), centerPos + Vector3.new(0, cylinderHeight/2 + sphereRadius, 0))
        local topSphere = makePart(Enum.PartType.Ball, Vector3.new(sphereRadius*2, sphereRadius*2, sphereRadius*2), cylinder.Position + Vector3.new(0, cylinderHeight/2 + sphereRadius, 0))

        return {sphere1, sphere2, cylinder, topSphere}
    end

    -- 🧩 Случайная позиция на поверхности
    local function randomEdgePosition(part)
        if part.Shape == Enum.PartType.Ball then
            local theta = math.random() * 2 * math.pi
            local phi = math.random() * math.pi
            local x = sphereRadius * math.sin(phi) * math.cos(theta)
            local y = sphereRadius * math.sin(phi) * math.sin(theta)
            local z = sphereRadius * math.cos(phi)
            return part.Position + Vector3.new(x, y, z)
        elseif part.Shape == Enum.PartType.Cylinder then
            local angle = math.random() * 2 * math.pi
            local y = (math.random() - 0.5) * cylinderHeight
            local x = cylinderRadius * math.cos(angle)
            local z = cylinderRadius * math.sin(angle)
            return part.Position + Vector3.new(x, y, z)
        else
            return part.Position
        end
    end

    -- 🧩 Собрать все предметы и запомнить их изначальное состояние анкора
    local function getAllItems(existing)
        local all = {}
        for _, item in pairs(itemsFolder:GetChildren()) do
            if not existing[item] then
                local pos = getPosition(item)
                if pos then
                    all[item] = {
                        wasAnchored = {}
                    }
                    -- Запоминаем изначальное состояние всех частей
                    for _, part in pairs(item:GetDescendants()) do
                        if part:IsA("BasePart") then
                            all[item].wasAnchored[part] = part.Anchored
                        end
                    end
                end
            end
        end
        return all
    end

    -- 🧩 Заморозить только те части, которые были не анкорены
    local function freezeItem(item, info)
        for part, wasAnchored in pairs(info.wasAnchored) do
            if part:IsA("BasePart") and not wasAnchored then
                part.Anchored = true
            end
        end
    end

    -- 🧩 Разморозить только те, что были не анкорены
    local function unfreezeItem(item, info)
        for part, wasAnchored in pairs(info.wasAnchored) do
            if part:IsA("BasePart") and not wasAnchored then
                part.Anchored = false
            end
        end
    end

    -- === Запуск ===
    local centerPos = getPosition(mainFire)
    local pathParts = createPathObjects(centerPos)
    local allItems = getAllItems({})

    -- 🔁 Обновление списка предметов
    task.spawn(function()
        while true do
            local newItems = getAllItems(allItems)
            for item, info in pairs(newItems) do
                allItems[item] = info
            end
            task.wait(updateItemsInterval)
        end
    end)

    -- 🔁 Телепорт предметов
    task.spawn(function()
        while true do
            if _G.WorldTeleportEnabled then
                for item, info in pairs(allItems) do
                    if item and item.Parent then
                        local target = pathParts[math.random(1, #pathParts)]
                        local newPos = randomEdgePosition(target)
                        if item:IsA("Model") and item.PrimaryPart then
                            item:SetPrimaryPartCFrame(CFrame.new(newPos))
                        elseif item:IsA("Model") then
                            item:PivotTo(CFrame.new(newPos))
                        elseif item:IsA("BasePart") then
                            item.CFrame = CFrame.new(newPos)
                        end
                    end
                end
            end
            task.wait(teleportInterval)
        end
    end)

    -- 🟢 GUI-переключатель
	toggle.MouseButton1Click:Connect(function()
		_G.WorldTeleportEnabled = not _G.WorldTeleportEnabled
		check.Visible = _G.WorldTeleportEnabled
		toggle.BackgroundColor3 = _G.WorldTeleportEnabled and CONFIG.Colors.Success or CONFIG.Colors.Border

		for item, info in pairs(allItems) do
			if _G.WorldTeleportEnabled then
				freezeItem(item, info)
			else
				unfreezeItem(item, info)
			end
		end
	end)

else
    warn("❌ MainFire или Items не найдены")
end

    ------------------------------------------------------------------
    -- 🌫️ Fog Transparency Control
    ------------------------------------------------------------------
    CreateSection("Fog Transparency")

    local fogFrame = Instance.new("Frame")
    fogFrame.Size = UDim2.new(1, -10, 0, 80)
    fogFrame.BackgroundTransparency = 1
    fogFrame.Parent = ContentScroll

    _G.FogTransparencyValue = _G.FogTransparencyValue or 1
    _G.FogRemoved = _G.FogRemoved or false

	-- Метка
	local label = Instance.new("TextLabel")
	label.Size = UDim2.new(1, 0, 0, 20)
	label.Position = UDim2.new(0, 5, 0, 10)
	label.BackgroundTransparency = 1
	label.Font = Enum.Font.Gotham
	label.TextSize = 14
	label.TextColor3 = CONFIG.Colors.TextDim
	label.Text = _G.FogRemoved and "Deleted" or tostring(math.floor(_G.FogTransparencyValue*100)).."%"
	label.Parent = fogFrame

	-- Бар слайдера
	local bar = Instance.new("Frame")
	bar.Size = UDim2.new(0.9, 0, 0, 6)
	bar.Position = UDim2.new(0, 10, 0, 30)
	bar.BackgroundColor3 = CONFIG.Colors.Border
	bar.BorderSizePixel = 0
	bar.Parent = fogFrame

	local barCorner = Instance.new("UICorner")
	barCorner.CornerRadius = UDim.new(1, 0)
	barCorner.Parent = bar

	-- Fill
	local fill = Instance.new("Frame")
	fill.Size = UDim2.new(_G.FogTransparencyValue, 0, 1, 0)
	fill.BackgroundColor3 = _G.FogRemoved and Color3.fromRGB(180,180,180) or CONFIG.Colors.Primary
	fill.BorderSizePixel = 0
	fill.Parent = bar

	local fillCorner = Instance.new("UICorner")
	fillCorner.CornerRadius = UDim.new(1, 0)
	fillCorner.Parent = fill

	-- Knob
	local knob = Instance.new("Frame")
	knob.Size = UDim2.new(0, 12, 0, 12)
	knob.Position = UDim2.new(_G.FogTransparencyValue, -6, 0.5, -6)
	knob.BackgroundColor3 = _G.FogRemoved and Color3.fromRGB(150,150,150) or CONFIG.Colors.Primary
	knob.BorderSizePixel = 0
	knob.Parent = bar

	local knobCorner = Instance.new("UICorner")
	knobCorner.CornerRadius = UDim.new(1, 0)
	knobCorner.Parent = knob

	-- Кнопка Delete
	local deleteButton = Instance.new("TextButton")
	deleteButton.Size = UDim2.new(0.5, 0, 0, 30)
	deleteButton.Position = UDim2.new(0.25, 0, 0, 45)
	deleteButton.BackgroundColor3 = Color3.fromRGB(200, 50, 50)
	deleteButton.TextColor3 = Color3.new(1, 1, 1)
	deleteButton.Font = Enum.Font.GothamBold
	deleteButton.TextSize = 14
	deleteButton.Text = "Delete Fog"
	deleteButton.Parent = fogFrame
	local deleteCorner = Instance.new("UICorner")
	deleteCorner.CornerRadius = UDim.new(0, 5)
	deleteCorner.Parent = deleteButton

	-- Функция применения прозрачности
	local function setFogTransparency(val)
		local map = workspace:FindFirstChild("Map")
		if not map then return end
		local boundaries = map:FindFirstChild("Boundaries")
		if not boundaries then return end
		local fog = boundaries:FindFirstChild("Fog")
		if not fog then return end

		local tr = 1 - val
		for _, part in ipairs(fog:GetDescendants()) do
			if part:IsA("BasePart") then
				part.Transparency = tr
			end
		end
	end

	-- Логика слайдера
	local dragging = false
	local function updateSlider(x)
		local pos = bar.AbsolutePosition.X
		local size = bar.AbsoluteSize.X
		local pct = math.clamp((x - pos)/size, 0, 1)
		_G.FogTransparencyValue = pct
		fill.Size = UDim2.new(pct, 0, 1, 0)
		knob.Position = UDim2.new(pct, -6, 0.5, -6)
		label.Text = tostring(math.floor(pct*100)).."%"
		setFogTransparency(pct)
	end

	bar.InputBegan:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 and not _G.FogRemoved then
			dragging = true
			ContentScroll.ScrollingEnabled = false
			updateSlider(input.Position.X)
		end
	end)

	knob.InputBegan:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 and not _G.FogRemoved then
			dragging = true
			ContentScroll.ScrollingEnabled = false
		end
	end)

	UserInputService.InputChanged:Connect(function(input)
		if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
			updateSlider(input.Position.X)
		end
	end)

	UserInputService.InputEnded:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 and dragging then
			dragging = false
			ContentScroll.ScrollingEnabled = true
		end
	end)

	-- Кнопка удаления
	deleteButton.MouseButton1Click:Connect(function()
		local fog = workspace:FindFirstChild("Map") and workspace.Map.Boundaries:FindFirstChild("Fog")
		if fog then
			fog:Destroy()
			_G.FogRemoved = true
			fill.BackgroundColor3 = Color3.fromRGB(180,180,180)
			knob.BackgroundColor3 = Color3.fromRGB(150,150,150)
			label.Text = "Deleted"
		end
	end)
end
-- ========== BRING ==========
function CreateBRINGContent()
    ContentScroll:ClearAllChildren()
    ContentScroll.ScrollingEnabled = true
    ContentScroll.AutomaticCanvasSize = Enum.AutomaticSize.Y
    ContentScroll.CanvasSize = UDim2.new(0, 0, 0, 0)
    ContentScroll.ScrollBarThickness = 6
    ContentScroll.VerticalScrollBarInset = Enum.ScrollBarInset.Always

    local Player = game:GetService("Players").LocalPlayer
    local itemsFolder = workspace:WaitForChild("Items")
    local npcFolder = workspace:WaitForChild("Characters")

    -- 📜 Layout
    local layout = Instance.new("UIListLayout")
    layout.Parent = ContentScroll
    layout.Padding = UDim.new(0, 10)
    layout.SortOrder = Enum.SortOrder.LayoutOrder
    layout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
        ContentScroll.CanvasSize = UDim2.new(0, 0, 0, layout.AbsoluteContentSize.Y + 10)
    end)

    -- 🧩 Функция для заголовков
    local function CreateSection(title)
        local frame = Instance.new("Frame")
        frame.Size = UDim2.new(1, -10, 0, 35)
        frame.BackgroundTransparency = 1
        frame.Parent = ContentScroll

        local label = Instance.new("TextLabel")
        label.Size = UDim2.new(1, 0, 1, 0)
        label.BackgroundTransparency = 1
        label.Text = title
        label.Font = Enum.Font.GothamBold
        label.TextSize = 16
        label.TextColor3 = CONFIG.Colors.Primary
        label.TextXAlignment = Enum.TextXAlignment.Left
        label.Parent = frame
        return frame
    end

    -- 🔧 Функция телепортации к игроку
    local function teleportToPlayer(obj)
        local char = Player.Character
        if not char or not char.PrimaryPart then return end
        local pos = char.PrimaryPart.Position + Vector3.new(0, 5, 0)
        
        if obj:IsA("Model") and obj.PrimaryPart then
            obj:SetPrimaryPartCFrame(CFrame.new(pos))
        elseif obj:IsA("BasePart") then
            obj.CFrame = CFrame.new(pos)
        elseif obj:IsA("Model") then
            obj:PivotTo(CFrame.new(pos))
        end
    end

    -- 🔧 Функция подтверждения с блокировкой интерфейса
    local function confirm(promptText, callback)
        local confirmFrame = Instance.new("Frame")
        confirmFrame.Size = UDim2.new(0, 300, 0, 120)
        confirmFrame.Position = UDim2.new(0.5, -150, 0.5, -60)
        confirmFrame.BackgroundColor3 = CONFIG.Colors.Background
        confirmFrame.BorderSizePixel = 1
        confirmFrame.BorderColor3 = CONFIG.Colors.Border
        confirmFrame.ZIndex = 100
        confirmFrame.Parent = ContentScroll.Parent.Parent

        Instance.new("UICorner", confirmFrame).CornerRadius = UDim.new(0, 8)

        local promptLabel = Instance.new("TextLabel")
        promptLabel.Size = UDim2.new(1, -20, 0, 60)
        promptLabel.Position = UDim2.new(0, 10, 0, 10)
        promptLabel.BackgroundTransparency = 1
        promptLabel.Text = promptText
        promptLabel.TextWrapped = true
        promptLabel.Font = Enum.Font.Gotham
        promptLabel.TextSize = 14
        promptLabel.TextColor3 = CONFIG.Colors.Text
        promptLabel.Parent = confirmFrame

        local yesBtn = Instance.new("TextButton")
        yesBtn.Size = UDim2.new(0.45, -5, 0, 30)
        yesBtn.Position = UDim2.new(0.05, 0, 1, -40)
        yesBtn.BackgroundColor3 = Color3.fromRGB(50, 200, 50)
        yesBtn.Text = "Yes"
        yesBtn.Font = Enum.Font.GothamBold
        yesBtn.TextSize = 14
        yesBtn.TextColor3 = Color3.new(1, 1, 1)
        yesBtn.AutoButtonColor = false
        yesBtn.Parent = confirmFrame
        Instance.new("UICorner", yesBtn).CornerRadius = UDim.new(0, 4)

        local noBtn = Instance.new("TextButton")
        noBtn.Size = UDim2.new(0.45, -5, 0, 30)
        noBtn.Position = UDim2.new(0.5, 5, 1, -40)
        noBtn.BackgroundColor3 = Color3.fromRGB(200, 50, 50)
        noBtn.Text = "No"
        noBtn.Font = Enum.Font.GothamBold
        noBtn.TextSize = 14
        noBtn.TextColor3 = Color3.new(1, 1, 1)
        noBtn.AutoButtonColor = false
        noBtn.Parent = confirmFrame
        Instance.new("UICorner", noBtn).CornerRadius = UDim.new(0, 4)

        yesBtn.MouseButton1Click:Connect(function()
            confirmFrame:Destroy()
            if callback then callback(true) end
        end)

        noBtn.MouseButton1Click:Connect(function()
            confirmFrame:Destroy()
            if callback then callback(false) end
        end)
    end

    -- 🔧 Функция обновления списка (универсальная)
    local function refreshList(folder, listFrame)
        listFrame:ClearAllChildren()
        
        local listLayout = Instance.new("UIListLayout")
        listLayout.Parent = listFrame
        listLayout.Padding = UDim.new(0, 3)
        listLayout.SortOrder = Enum.SortOrder.LayoutOrder

        for _, obj in ipairs(folder:GetChildren()) do
            if obj:IsA("Model") or obj:IsA("BasePart") then
                local btn = Instance.new("TextButton")
                btn.Size = UDim2.new(1, -5, 0, 25)
                btn.BackgroundColor3 = CONFIG.Colors.Background
                btn.Text = obj.Name
                btn.Font = Enum.Font.Gotham
                btn.TextSize = 12
                btn.TextColor3 = CONFIG.Colors.Text
                btn.TextXAlignment = Enum.TextXAlignment.Left
                btn.AutoButtonColor = false
                btn.Parent = listFrame
                
                local padding = Instance.new("UIPadding", btn)
                padding.PaddingLeft = UDim.new(0, 5)
                
                Instance.new("UICorner", btn).CornerRadius = UDim.new(0, 3)

                -- Hover эффект
                btn.MouseEnter:Connect(function()
                    btn.BackgroundColor3 = CONFIG.Colors.Border
                end)
                btn.MouseLeave:Connect(function()
                    btn.BackgroundColor3 = CONFIG.Colors.Background
                end)

                btn.MouseButton1Click:Connect(function()
                    teleportToPlayer(obj)
                end)
            end
        end
    end

    ------------------------------------------------------------------
    -- 📦 ITEMS SECTION
    ------------------------------------------------------------------
    CreateSection("Items Teleport")

    local itemsContainer = Instance.new("Frame")
    itemsContainer.Size = UDim2.new(1, -10, 0, 250)
    itemsContainer.BackgroundColor3 = CONFIG.Colors.Background
    itemsContainer.BorderSizePixel = 1
    itemsContainer.BorderColor3 = CONFIG.Colors.Border
    itemsContainer.Parent = ContentScroll
    Instance.new("UICorner", itemsContainer).CornerRadius = UDim.new(0, 6)

    -- Список предметов
    local itemsList = Instance.new("ScrollingFrame")
    itemsList.Name = "ItemsList"
    itemsList.Size = UDim2.new(1, -10, 1, -135)
    itemsList.Position = UDim2.new(0, 5, 0, 5)
    itemsList.BackgroundColor3 = CONFIG.Colors.Border
    itemsList.BorderSizePixel = 0
    itemsList.ScrollBarThickness = 4
    itemsList.AutomaticCanvasSize = Enum.AutomaticSize.Y
    itemsList.CanvasSize = UDim2.new(0, 0, 0, 0)
    itemsList.Parent = itemsContainer
    Instance.new("UICorner", itemsList).CornerRadius = UDim.new(0, 4)

    -- Контейнер для кнопок управления предметами
    local itemsBtnContainer = Instance.new("Frame")
    itemsBtnContainer.Size = UDim2.new(1, -10, 0, 120)
    itemsBtnContainer.Position = UDim2.new(0, 5, 1, -125)
    itemsBtnContainer.BackgroundTransparency = 1
    itemsBtnContainer.Parent = itemsContainer

    -- Кнопка Refresh
    local refreshItemsBtn = Instance.new("TextButton")
    refreshItemsBtn.Size = UDim2.new(0.48, 0, 0, 25)
    refreshItemsBtn.Position = UDim2.new(0, 0, 0, 0)
    refreshItemsBtn.BackgroundColor3 = Color3.fromRGB(70, 130, 180)
    refreshItemsBtn.Text = "Refresh"
    refreshItemsBtn.Font = Enum.Font.GothamBold
    refreshItemsBtn.TextSize = 12
    refreshItemsBtn.TextColor3 = Color3.new(1, 1, 1)
    refreshItemsBtn.AutoButtonColor = false
    refreshItemsBtn.Parent = itemsBtnContainer
    Instance.new("UICorner", refreshItemsBtn).CornerRadius = UDim.new(0, 4)

    -- Кнопка TP Food
    local tpFoodBtn = Instance.new("TextButton")
    tpFoodBtn.Size = UDim2.new(0.48, 0, 0, 25)
    tpFoodBtn.Position = UDim2.new(0.52, 0, 0, 0)
    tpFoodBtn.BackgroundColor3 = Color3.fromRGB(60, 180, 60)
    tpFoodBtn.Text = "TP Food"
    tpFoodBtn.Font = Enum.Font.GothamBold
    tpFoodBtn.TextSize = 12
    tpFoodBtn.TextColor3 = Color3.new(1, 1, 1)
    tpFoodBtn.AutoButtonColor = false
    tpFoodBtn.Parent = itemsBtnContainer
    Instance.new("UICorner", tpFoodBtn).CornerRadius = UDim.new(0, 4)

    -- Кнопка TP Logs
    local tpLogsBtn = Instance.new("TextButton")
    tpLogsBtn.Size = UDim2.new(0.48, 0, 0, 25)
    tpLogsBtn.Position = UDim2.new(0, 0, 0, 30)
    tpLogsBtn.BackgroundColor3 = Color3.fromRGB(160, 90, 30)
    tpLogsBtn.Text = "TP Logs"
    tpLogsBtn.Font = Enum.Font.GothamBold
    tpLogsBtn.TextSize = 12
    tpLogsBtn.TextColor3 = Color3.new(1, 1, 1)
    tpLogsBtn.AutoButtonColor = false
    tpLogsBtn.Parent = itemsBtnContainer
    Instance.new("UICorner", tpLogsBtn).CornerRadius = UDim.new(0, 4)

    -- Кнопка TP ALL Items
    local tpAllItemsBtn = Instance.new("TextButton")
    tpAllItemsBtn.Size = UDim2.new(0.48, 0, 0, 25)
    tpAllItemsBtn.Position = UDim2.new(0.52, 0, 0, 30)
    tpAllItemsBtn.BackgroundColor3 = Color3.fromRGB(200, 50, 50)
    tpAllItemsBtn.Text = "TP ALL"
    tpAllItemsBtn.Font = Enum.Font.GothamBold
    tpAllItemsBtn.TextSize = 12
    tpAllItemsBtn.TextColor3 = Color3.new(1, 1, 1)
    tpAllItemsBtn.AutoButtonColor = false
    tpAllItemsBtn.Parent = itemsBtnContainer
    Instance.new("UICorner", tpAllItemsBtn).CornerRadius = UDim.new(0, 4)

    -- Информационная метка (сколько предметов)
    local itemsCountLabel = Instance.new("TextLabel")
    itemsCountLabel.Size = UDim2.new(1, 0, 0, 20)
    itemsCountLabel.Position = UDim2.new(0, 0, 0, 60)
    itemsCountLabel.BackgroundTransparency = 1
    itemsCountLabel.Text = "Items: 0"
    itemsCountLabel.Font = Enum.Font.Gotham
    itemsCountLabel.TextSize = 11
    itemsCountLabel.TextColor3 = CONFIG.Colors.TextDim
    itemsCountLabel.TextXAlignment = Enum.TextXAlignment.Left
    itemsCountLabel.Parent = itemsBtnContainer

    -- Обработчики для кнопок предметов
    refreshItemsBtn.MouseButton1Click:Connect(function()
        refreshList(itemsFolder, itemsList)
        itemsCountLabel.Text = "Items: " .. #itemsFolder:GetChildren()
    end)

    tpFoodBtn.MouseButton1Click:Connect(function()
        local count = 0
        for _, obj in ipairs(itemsFolder:GetChildren()) do
            if obj:GetAttribute("RestoreHunger") ~= nil then
                teleportToPlayer(obj)
                count = count + 1
                task.wait(0.05) -- небольшая задержка между телепортами
            end
        end
        itemsCountLabel.Text = "Teleported " .. count .. " food items"
    end)

    tpLogsBtn.MouseButton1Click:Connect(function()
        local count = 0
        for _, obj in ipairs(itemsFolder:GetChildren()) do
            if string.find(string.lower(obj.Name), "log") then
                teleportToPlayer(obj)
                count = count + 1
                task.wait(0.05)
            end
        end
        itemsCountLabel.Text = "Teleported " .. count .. " logs"
    end)

    tpAllItemsBtn.MouseButton1Click:Connect(function()
        confirm("Are you sure you want to teleport ALL items?", function(result)
            if result then
                local count = 0
                for _, obj in ipairs(itemsFolder:GetChildren()) do
                    teleportToPlayer(obj)
                    count = count + 1
                    task.wait(0.05)
                end
                itemsCountLabel.Text = "Teleported " .. count .. " items"
            end
        end)
    end)

    -- Инициализация списка предметов
    refreshList(itemsFolder, itemsList)
    itemsCountLabel.Text = "Items: " .. #itemsFolder:GetChildren()

    ------------------------------------------------------------------
    -- 👤 NPCs SECTION
    ------------------------------------------------------------------
    CreateSection("NPCs Teleport")

    local npcContainer = Instance.new("Frame")
    npcContainer.Size = UDim2.new(1, -10, 0, 250)
    npcContainer.BackgroundColor3 = CONFIG.Colors.Background
    npcContainer.BorderSizePixel = 1
    npcContainer.BorderColor3 = CONFIG.Colors.Border
    npcContainer.Parent = ContentScroll
    Instance.new("UICorner", npcContainer).CornerRadius = UDim.new(0, 6)

    -- Список NPC
    local npcList = Instance.new("ScrollingFrame")
    npcList.Name = "NPCList"
    npcList.Size = UDim2.new(1, -10, 1, -90)
    npcList.Position = UDim2.new(0, 5, 0, 5)
    npcList.BackgroundColor3 = CONFIG.Colors.Border
    npcList.BorderSizePixel = 0
    npcList.ScrollBarThickness = 4
    npcList.AutomaticCanvasSize = Enum.AutomaticSize.Y
    npcList.CanvasSize = UDim2.new(0, 0, 0, 0)
    npcList.Parent = npcContainer
    Instance.new("UICorner", npcList).CornerRadius = UDim.new(0, 4)

    -- Контейнер для кнопок управления NPC
    local npcBtnContainer = Instance.new("Frame")
    npcBtnContainer.Size = UDim2.new(1, -10, 0, 75)
    npcBtnContainer.Position = UDim2.new(0, 5, 1, -80)
    npcBtnContainer.BackgroundTransparency = 1
    npcBtnContainer.Parent = npcContainer

    -- Кнопка Refresh NPC
    local refreshNPCBtn = Instance.new("TextButton")
    refreshNPCBtn.Size = UDim2.new(0.48, 0, 0, 25)
    refreshNPCBtn.Position = UDim2.new(0, 0, 0, 0)
    refreshNPCBtn.BackgroundColor3 = Color3.fromRGB(70, 130, 180)
    refreshNPCBtn.Text = "Refresh"
    refreshNPCBtn.Font = Enum.Font.GothamBold
    refreshNPCBtn.TextSize = 12
    refreshNPCBtn.TextColor3 = Color3.new(1, 1, 1)
    refreshNPCBtn.AutoButtonColor = false
    refreshNPCBtn.Parent = npcBtnContainer
    Instance.new("UICorner", refreshNPCBtn).CornerRadius = UDim.new(0, 4)

    -- Кнопка TP ALL NPCs
    local tpAllNPCBtn = Instance.new("TextButton")
    tpAllNPCBtn.Size = UDim2.new(0.48, 0, 0, 25)
    tpAllNPCBtn.Position = UDim2.new(0.52, 0, 0, 0)
    tpAllNPCBtn.BackgroundColor3 = Color3.fromRGB(200, 50, 50)
    tpAllNPCBtn.Text = "TP ALL NPCs"
    tpAllNPCBtn.Font = Enum.Font.GothamBold
    tpAllNPCBtn.TextSize = 12
    tpAllNPCBtn.TextColor3 = Color3.new(1, 1, 1)
    tpAllNPCBtn.AutoButtonColor = false
    tpAllNPCBtn.Parent = npcBtnContainer
    Instance.new("UICorner", tpAllNPCBtn).CornerRadius = UDim.new(0, 4)

    -- Информационная метка для NPC
    local npcCountLabel = Instance.new("TextLabel")
    npcCountLabel.Size = UDim2.new(1, 0, 0, 20)
    npcCountLabel.Position = UDim2.new(0, 0, 0, 30)
    npcCountLabel.BackgroundTransparency = 1
    npcCountLabel.Text = "NPCs: 0"
    npcCountLabel.Font = Enum.Font.Gotham
    npcCountLabel.TextSize = 11
    npcCountLabel.TextColor3 = CONFIG.Colors.TextDim
    npcCountLabel.TextXAlignment = Enum.TextXAlignment.Left
    npcCountLabel.Parent = npcBtnContainer

    -- Обработчики для кнопок NPC
    refreshNPCBtn.MouseButton1Click:Connect(function()
        refreshList(npcFolder, npcList)
        npcCountLabel.Text = "NPCs: " .. #npcFolder:GetChildren()
    end)

    tpAllNPCBtn.MouseButton1Click:Connect(function()
        confirm("Are you sure you want to teleport ALL NPCs?", function(result)
            if result then
                local count = 0
                for _, obj in ipairs(npcFolder:GetChildren()) do
                    teleportToPlayer(obj)
                    count = count + 1
                    task.wait(0.05)
                end
                npcCountLabel.Text = "Teleported " .. count .. " NPCs"
            end
        end)
    end)

    -- Инициализация списка NPC
    refreshList(npcFolder, npcList)
    npcCountLabel.Text = "NPCs: " .. #npcFolder:GetChildren()

    -- Cleanup function for BRING tab
    _G.CurrentTabCleanup = function()
        -- Очистка при переключении вкладки (если нужно)
    end
end
-- ========== Player ==========
function CreatePLAYERContent()
    ContentScroll:ClearAllChildren()
    ContentScroll.ScrollingEnabled = true
    ContentScroll.AutomaticCanvasSize = Enum.AutomaticSize.Y
    ContentScroll.CanvasSize = UDim2.new(0, 0, 0, 0)
    ContentScroll.ScrollBarThickness = 6
    ContentScroll.VerticalScrollBarInset = Enum.ScrollBarInset.Always

    local Player = game:GetService("Players").LocalPlayer
    local Lighting = game:GetService("Lighting")
    local RunService = game:GetService("RunService")
    local UserInputService = game:GetService("UserInputService")

    -- 📜 Layout
    local layout = Instance.new("UIListLayout")
    layout.Parent = ContentScroll
    layout.Padding = UDim.new(0, 10)
    layout.SortOrder = Enum.SortOrder.LayoutOrder
    layout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
        ContentScroll.CanvasSize = UDim2.new(0, 0, 0, layout.AbsoluteContentSize.Y + 10)
    end)

    -- Общий отступ от краёв
    local padding = Instance.new("UIPadding")
    padding.Parent = ContentScroll
    padding.PaddingLeft = UDim.new(0, 15)
    padding.PaddingRight = UDim.new(0, 15)
    padding.PaddingTop = UDim.new(0, 10)
    padding.PaddingBottom = UDim.new(0, 15)

    local function CreateSection(title)
        local frame = Instance.new("Frame")
        frame.Size = UDim2.new(1, -10, 0, 35)
        frame.BackgroundTransparency = 1
        frame.Parent = ContentScroll

        local label = Instance.new("TextLabel")
        label.Size = UDim2.new(1, 0, 1, 0)
        label.BackgroundTransparency = 1
        label.Text = title
        label.Font = Enum.Font.GothamBold
        label.TextSize = 16
        label.TextColor3 = CONFIG.Colors.Primary
        label.TextXAlignment = Enum.TextXAlignment.Left
        label.Parent = frame
        return frame
    end

------------------------------------------------------------------
-- 🌞 FULL BRIGHT (исправленный)
------------------------------------------------------------------
CreateSection("Full Bright")

local fbFrame = Instance.new("Frame")
fbFrame.Size = UDim2.new(1, -10, 0, 25)
fbFrame.BackgroundTransparency = 1
fbFrame.Parent = ContentScroll

_G.FullBrightEnabled = _G.FullBrightEnabled or false

-- FullBright чекбокс в общем стиле
local fbToggle = Instance.new("TextButton")
fbToggle.Size = UDim2.new(0, 45, 0, 25)
fbToggle.BackgroundColor3 = _G.FullBrightEnabled and CONFIG.Colors.Success or CONFIG.Colors.Border
fbToggle.BorderSizePixel = 0
fbToggle.Text = ""
fbToggle.AutoButtonColor = false
fbToggle.Parent = fbFrame

local fbToggleCorner = Instance.new("UICorner")
fbToggleCorner.CornerRadius = UDim.new(0, 4)
fbToggleCorner.Parent = fbToggle

local fbMark = Instance.new("TextLabel")
fbMark.Size = UDim2.new(1, 0, 1, 0)
fbMark.Position = UDim2.new(0, 0, 0, 0)
fbMark.AnchorPoint = Vector2.new(0, 0)
fbMark.BackgroundTransparency = 1
fbMark.Text = "✓"
fbMark.Font = Enum.Font.Gotham
fbMark.TextSize = 18
fbMark.TextColor3 = CONFIG.Colors.Text
fbMark.TextScaled = true
fbMark.TextXAlignment = Enum.TextXAlignment.Center
fbMark.TextYAlignment = Enum.TextYAlignment.Center
fbMark.Visible = _G.FullBrightEnabled
fbMark.Parent = fbToggle

local fbMarkCorner = Instance.new("UICorner")
fbMarkCorner.CornerRadius = UDim.new(1, 0)
fbMarkCorner.Parent = fbMark

------------------------------------------------------------------
-- 🔦 Логика FullBright
------------------------------------------------------------------
local Lighting = game:GetService("Lighting")
local RunService = game:GetService("RunService")

local savedLighting = nil
local savedEffects = {}
local running = false
local checkInterval = 0.5
local fbConn, fbNewConn

local effectClasses = {
    ["ColorCorrectionEffect"] = true,
    ["BloomEffect"] = true,
    ["BlurEffect"] = true,
    ["Atmosphere"] = true,
    ["SunRaysEffect"] = true,
    ["DepthOfFieldEffect"] = true,
    ["Sky"] = true,
    ["GlowEffect"] = true, -- 👈 Добавлен GlowEffect
}

local function isControllableEffect(inst)
    if not inst then return false end
    return effectClasses[inst.ClassName] or inst:IsA("PostEffect") or inst:IsA("Atmosphere")
end

local function saveEffectState(inst)
    if not inst or not inst.Parent or savedEffects[inst] then return end

    local ok, snapshot = pcall(function()
        local s = { ClassName = inst.ClassName, Enabled = inst.Enabled }
        if inst:IsA("Atmosphere") then
            s.Density = inst.Density
            s.Haze = inst.Haze
            s.Offset = inst.Offset
        end
        return s
    end)
    if ok then savedEffects[inst] = snapshot end
end

local function disableEffect(inst)
    if not inst or not inst.Parent then return end
    saveEffectState(inst)
    pcall(function()
        if inst:IsA("Atmosphere") then
            inst.Density = 0
            inst.Haze = 0
            inst.Enabled = false
        else
            if inst.Enabled ~= nil then inst.Enabled = false end
        end
    end)
end

local function restoreEffect(inst, snapshot)
    if not inst or not snapshot or not inst.Parent then return end
    pcall(function()
        if inst:IsA("Atmosphere") then
            if snapshot.Density then inst.Density = snapshot.Density end
            if snapshot.Haze then inst.Haze = snapshot.Haze end
            if snapshot.Offset then inst.Offset = snapshot.Offset end
        end
        if snapshot.Enabled ~= nil then inst.Enabled = snapshot.Enabled end
    end)
end

local function makeBright()
    pcall(function()
        Lighting.Brightness = 3
        Lighting.GlobalShadows = false
        Lighting.FogEnd = 1e6
        Lighting.FogStart = 1e6
        Lighting.ClockTime = 14
    end)
end

local function restoreLighting()
    if not savedLighting then return end
    pcall(function()
        for k, v in pairs(savedLighting) do
            if Lighting[k] ~= nil then
                Lighting[k] = v
            end
        end
    end)
end

------------------------------------------------------------------
-- 🔁 Запуск и остановка FullBright
------------------------------------------------------------------
local function startFullBright()
    savedEffects = {}
    savedLighting = {
        Brightness = Lighting.Brightness,
        GlobalShadows = Lighting.GlobalShadows,
        FogEnd = Lighting.FogEnd,
        FogStart = Lighting.FogStart,
        ClockTime = Lighting.ClockTime,
        Ambient = Lighting.Ambient,
        OutdoorAmbient = Lighting.OutdoorAmbient,
    }

    -- Отключаем все текущие эффекты
    for _, inst in pairs(Lighting:GetChildren()) do
        if isControllableEffect(inst) then
            disableEffect(inst)
        end
    end

    makeBright()
    running = true

    -- Обновляем яркость и отключаем эффекты постоянно
    fbConn = RunService.Heartbeat:Connect(function()
        if not running then return end
        makeBright()
        for _, inst in pairs(Lighting:GetChildren()) do
            if isControllableEffect(inst) then
                if not savedEffects[inst] then
                    disableEffect(inst)
                elseif inst.Enabled then
                    disableEffect(inst)
                end
            end
        end
    end)

    -- Отслеживаем появление новых эффектов
    fbNewConn = Lighting.ChildAdded:Connect(function(inst)
        if running and isControllableEffect(inst) then
            disableEffect(inst)
        end
    end)
end

local function stopFullBright()
    running = false
    if fbConn then fbConn:Disconnect() fbConn = nil end
    if fbNewConn then fbNewConn:Disconnect() fbNewConn = nil end

    -- Восстанавливаем все эффекты
    for inst, snapshot in pairs(savedEffects) do
        restoreEffect(inst, snapshot)
    end

    restoreLighting()
    savedEffects = {}
    savedLighting = nil
end

------------------------------------------------------------------
-- 🧩 Переключатель
------------------------------------------------------------------
if _G.FullBrightEnabled then startFullBright() end

fbToggle.MouseButton1Click:Connect(function()
    _G.FullBrightEnabled = not _G.FullBrightEnabled
    fbMark.Visible = _G.FullBrightEnabled
    fbToggle.BackgroundColor3 = _G.FullBrightEnabled and CONFIG.Colors.Success or CONFIG.Colors.Border
    if _G.FullBrightEnabled then
        startFullBright()
    else
        stopFullBright()
    end
end)
    ------------------------------------------------------------------
    -- 🦾 God Mode (HipHeight)
    ------------------------------------------------------------------
	CreateSection("God Mode")

	local gmFrame = Instance.new("Frame")
	gmFrame.Size = UDim2.new(1, -10, 0, 80)
	gmFrame.BackgroundTransparency = 1
	gmFrame.Parent = ContentScroll

	_G.GodModeEnabled = _G.GodModeEnabled or false
	_G.HipHeightValue = _G.HipHeightValue or 30

	-- Оставляем чекбокс в стиле общего шаблона
	local gmToggle = Instance.new("TextButton")
	gmToggle.Size = UDim2.new(0, 45, 0, 25)
	gmToggle.BackgroundColor3 = _G.GodModeEnabled and CONFIG.Colors.Success or CONFIG.Colors.Border
	gmToggle.BorderSizePixel = 0
	gmToggle.Text = ""
	gmToggle.AutoButtonColor = false
	gmToggle.Parent = gmFrame

	local gmToggleCorner = Instance.new("UICorner")
	gmToggleCorner.CornerRadius = UDim.new(0, 4)
	gmToggleCorner.Parent = gmToggle

	local gmMark = Instance.new("TextLabel")
	gmMark.Size = UDim2.new(1, 0, 1, 0)
	gmMark.Position = UDim2.new(0, 0, 0, 0)
	gmMark.AnchorPoint = Vector2.new(0, 0)
	gmMark.BackgroundTransparency = 1
	gmMark.Text = "✓"
	gmMark.Font = Enum.Font.Gotham
	gmMark.TextSize = 18
	gmMark.TextColor3 = CONFIG.Colors.Text
	gmMark.TextScaled = true
	gmMark.TextXAlignment = Enum.TextXAlignment.Center
	gmMark.TextYAlignment = Enum.TextYAlignment.Center
	gmMark.Visible = _G.GodModeEnabled
	gmMark.Parent = gmToggle

	local gmMarkCorner = Instance.new("UICorner")
	gmMarkCorner.CornerRadius = UDim.new(1, 0)
	gmMarkCorner.Parent = gmMark

	-- Название
	local gmLabel = Instance.new("TextLabel")
	gmLabel.Size = UDim2.new(0, 150, 0, 24)
	gmLabel.Position = UDim2.new(0, 36, 0, 5)
	gmLabel.BackgroundTransparency = 1
	gmLabel.Text = ""
	gmLabel.TextColor3 = CONFIG.Colors.Text
	gmLabel.Font = Enum.Font.Gotham
	gmLabel.TextSize = 13
	gmLabel.TextXAlignment = Enum.TextXAlignment.Left
	gmLabel.Parent = gmFrame

	-- Подпись (слева)
	local heightText = Instance.new("TextLabel")
	heightText.Size = UDim2.new(1, -70, 0, 25)
	heightText.Position = UDim2.new(0, 10, 0, 40)
	heightText.BackgroundTransparency = 1
	heightText.Text = "Height"
	heightText.Font = Enum.Font.Gotham
	heightText.TextSize = 12
	heightText.TextColor3 = CONFIG.Colors.TextDim
	heightText.TextXAlignment = Enum.TextXAlignment.Left
	heightText.Parent = gmFrame

	-- Значение (справа в прямоугольнике)
	local heightLabel = Instance.new("TextLabel")
	heightLabel.Size = UDim2.new(0, 50, 0, 25)
	heightLabel.Position = UDim2.new(1, -55, 0, 40)
	heightLabel.BackgroundColor3 = CONFIG.Colors.Sidebar
	heightLabel.Text = tostring(_G.HipHeightValue)
	heightLabel.Font = Enum.Font.GothamBold
	heightLabel.TextSize = 14
	heightLabel.TextColor3 = CONFIG.Colors.Primary
	heightLabel.BorderSizePixel = 0
	heightLabel.Parent = gmFrame

	local heightLabelCorner = Instance.new("UICorner")
	heightLabelCorner.CornerRadius = UDim.new(0, 4)
	heightLabelCorner.Parent = heightLabel

	-- Слайдер (точно как “Скорость ходьбы”)
	local bar = Instance.new("Frame")
	bar.Size = UDim2.new(1, -20, 0, 6)
	bar.Position = UDim2.new(0, 10, 0, 70)
	bar.BackgroundColor3 = CONFIG.Colors.Border
	bar.BorderSizePixel = 0
	bar.Parent = gmFrame

	local barCorner = Instance.new("UICorner")
	barCorner.CornerRadius = UDim.new(1, 0)
	barCorner.Parent = bar

	local fill = Instance.new("Frame")
	fill.Size = UDim2.new((_G.HipHeightValue or 0) / 100, 0, 1, 0)
	fill.BackgroundColor3 = CONFIG.Colors.Primary
	fill.BorderSizePixel = 0
	fill.Parent = bar

	local fillCorner = Instance.new("UICorner")
	fillCorner.CornerRadius = UDim.new(1, 0)
	fillCorner.Parent = fill

	local knob = Instance.new("Frame")
	knob.Size = UDim2.new(0, 12, 0, 12)
	knob.Position = UDim2.new((_G.HipHeightValue or 0) / 100, -6, 0.5, -6)
	knob.BackgroundColor3 = CONFIG.Colors.Text
	knob.BorderSizePixel = 0
	knob.Parent = bar

	local knobCorner = Instance.new("UICorner")
	knobCorner.CornerRadius = UDim.new(1, 0)
	knobCorner.Parent = knob

    local minH, maxH = 0, 100
    local dragging = false

    local function applyHeight()
        local hum = Player.Character and Player.Character:FindFirstChildOfClass("Humanoid")
        if hum and _G.GodModeEnabled then
            hum.HipHeight = _G.HipHeightValue
        elseif hum then
            hum.HipHeight = 0
        end
    end

    local function updateSlider(x)
        local pos = bar.AbsolutePosition.X
        local size = bar.AbsoluteSize.X
        local pct = math.clamp((x - pos) / size, 0, 1)
        fill.Size = UDim2.new(pct, 0, 1, 0)
        knob.Position = UDim2.new(pct, -6, 0.5, -6)
        _G.HipHeightValue = math.floor(minH + (maxH - minH) * pct)
        heightLabel.Text = tostring(_G.HipHeightValue)
        applyHeight()
    end

    local initialPct = (_G.HipHeightValue - minH) / (maxH - minH)
    fill.Size = UDim2.new(initialPct, 0, 1, 0)
    knob.Position = UDim2.new(initialPct, -6, 0.5, -6)

	gmToggle.MouseButton1Click:Connect(function()
		_G.GodModeEnabled = not _G.GodModeEnabled
		gmMark.Visible = _G.GodModeEnabled
		gmToggle.BackgroundColor3 = _G.GodModeEnabled and CONFIG.Colors.Success or CONFIG.Colors.Border
		applyHeight()
	end)

    bar.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = true
            ContentScroll.ScrollingEnabled = false
            updateSlider(input.Position.X)
        end
    end)
    knob.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = true
            ContentScroll.ScrollingEnabled = false
        end
    end)
    UserInputService.InputChanged:Connect(function(input)
        if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
            updateSlider(input.Position.X)
        end
    end)
    UserInputService.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 and dragging then
            dragging = false
            ContentScroll.ScrollingEnabled = true
        end
    end)

    Player.CharacterAdded:Connect(function()
        task.wait(1)
        applyHeight()
    end)

    _G.CurrentTabCleanup = function()
        if fbConnection then fbConnection:Disconnect() end
    end
	------------------------------------------------------------------
    -- TP TO BASE 
    ------------------------------------------------------------------
    CreateSection("Campfire Teleport")

    local tpFrame = Instance.new("Frame")
    tpFrame.Size = UDim2.new(1, -10, 0, 45)
    tpFrame.BackgroundTransparency = 1
    tpFrame.Parent = ContentScroll

    local tpButton = Instance.new("TextButton")
    tpButton.Size = UDim2.new(0.9, 0, 0, 35)
    tpButton.Position = UDim2.new(0.05, 0, 0, 0)
    tpButton.BackgroundColor3 = CONFIG.Colors.Primary
    tpButton.Text = "Tp to camp 🔥"
    tpButton.Font = Enum.Font.GothamBold
    tpButton.TextSize = 14
    tpButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    tpButton.AutoButtonColor = false
    tpButton.Parent = tpFrame
    Instance.new("UICorner", tpButton).CornerRadius = UDim.new(0, 6)

    -- Эффект при наведении
    tpButton.MouseEnter:Connect(function()
        tpButton.BackgroundColor3 = CONFIG.Colors.Text
        tpButton.TextColor3 = CONFIG.Colors.Background
    end)
    tpButton.MouseLeave:Connect(function()
        tpButton.BackgroundColor3 = CONFIG.Colors.Primary
        tpButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    end)

    -- Логика телепорта
    tpButton.MouseButton1Click:Connect(function()
        local player = game.Players.LocalPlayer
        local char = player.Character or player.CharacterAdded:Wait()
        local hrp = char:WaitForChild("HumanoidRootPart")
        local target = workspace:FindFirstChild("Map")

        if target and target:FindFirstChild("Campground") and target.Campground:FindFirstChild("MainFire") then
            local mainFire = target.Campground.MainFire

            local success, result = pcall(function()
                if mainFire.GetPivot then
                    local pivot = mainFire:GetPivot()
                    return pivot.Position
                elseif mainFire:IsA("Model") and mainFire.PrimaryPart then
                    return mainFire.PrimaryPart.Position
                elseif mainFire:IsA("BasePart") then
                    return mainFire.Position
                else
                    return nil
                end
            end)

            if success and result then
                hrp.CFrame = CFrame.new(result + Vector3.new(0, 5, 0))
            else
                warn("❌ Невозможно определить позицию MainFire!")
            end
        else
            warn("❌ Место назначения не найдено!")
        end
    end)

end

-- ========== MOVEMENT КОНТЕНТ ==========
function CreateMOVEMENTContent()
    -- Очистка контента
    ContentScroll:ClearAllChildren()
    ContentScroll.ScrollingEnabled = true
    ContentScroll.AutomaticCanvasSize = Enum.AutomaticSize.Y
    ContentScroll.CanvasSize = UDim2.new(0, 0, 0, 0)
    ContentScroll.ScrollBarThickness = 6
    ContentScroll.VerticalScrollBarInset = Enum.ScrollBarInset.Always
	
if not ContentScroll:FindFirstChildOfClass("UIListLayout") then
	local layout = Instance.new("UIListLayout")
	layout.Padding = UDim.new(0, 8) -- расстояние между элементами
	layout.SortOrder = Enum.SortOrder.LayoutOrder
	layout.Parent = ContentScroll
end
    
    local Player = game:GetService("Players").LocalPlayer
    local RunService = game:GetService("RunService")
    local UserInputService = game:GetService("UserInputService")
    
    local yOffset = 0
    
    -- Вспомогательная функция создания секции
    local function CreateSection(title)
        local section = Instance.new("TextLabel")
        section.Size = UDim2.new(1, 0, 0, 30)
        section.Position = UDim2.new(0, 0, 0, yOffset)
        section.BackgroundTransparency = 1
        section.Text = title
        section.Font = Enum.Font.GothamBold
        section.TextSize = 15
        section.TextColor3 = CONFIG.Colors.Primary
        section.TextXAlignment = Enum.TextXAlignment.Left
        section.Parent = ContentScroll
        yOffset = yOffset + 35
        return section
    end
    
    -- Вспомогательная функция создания переключателя
    local function CreateToggle(title, startState)
        local frame = Instance.new("Frame")
        frame.Size = UDim2.new(1, -10, 0, 40)
        frame.Position = UDim2.new(0, 0, 0, yOffset)
        frame.BackgroundColor3 = CONFIG.Colors.Background
        frame.BorderSizePixel = 0
        frame.Parent = ContentScroll
        
        local corner = Instance.new("UICorner")
        corner.CornerRadius = UDim.new(0, 6)
        corner.Parent = frame
        
        local label = Instance.new("TextLabel")
        label.Size = UDim2.new(1, -60, 1, 0)
        label.Position = UDim2.new(0, 10, 0, 0)
        label.BackgroundTransparency = 1
        label.Text = title
        label.Font = Enum.Font.Gotham
        label.TextSize = 13
        label.TextColor3 = CONFIG.Colors.Text
        label.TextXAlignment = Enum.TextXAlignment.Left
        label.Parent = frame
        
        local toggle = Instance.new("TextButton")
        toggle.Size = UDim2.new(0, 45, 0, 25)
        toggle.Position = UDim2.new(1, -50, 0.5, 0)
        toggle.AnchorPoint = Vector2.new(0, 0.5)
        toggle.BackgroundColor3 = startState and CONFIG.Colors.Success or CONFIG.Colors.Border
        toggle.Text = ""
        toggle.Parent = frame
        
        local toggleCorner = Instance.new("UICorner")
        toggleCorner.CornerRadius = UDim.new(0, 4)
        toggleCorner.Parent = toggle
        

		local mark = Instance.new("TextLabel")
		mark.Size = UDim2.new(1, 0, 1, 0)        -- занимает всю кнопку
		mark.Position = UDim2.new(0, 0, 0, 0)
		mark.AnchorPoint = Vector2.new(0, 0)     -- AnchorPoint для растянутого текста обычно 0,0
		mark.BackgroundTransparency = 1
		mark.Text = "✓"
		mark.Font = Enum.Font.Gotham
		mark.TextSize = 18
		mark.TextColor3 = CONFIG.Colors.Text
		mark.TextScaled = true                    -- масштабировать под размер TextLabel
		mark.TextXAlignment = Enum.TextXAlignment.Center
		mark.TextYAlignment = Enum.TextYAlignment.Center
		mark.Visible = startState
		mark.Parent = toggle
        
        local markCorner = Instance.new("UICorner")
        markCorner.CornerRadius = UDim.new(1, 0)
        markCorner.Parent = mark
        
        yOffset = yOffset + 45
        
        return toggle, mark
    end
    
    ------------------------------------------------------------------
    -- WalkSpeed Section
    ------------------------------------------------------------------
    CreateSection("Walk Speed")
    
    local speedFrame = Instance.new("Frame")
    speedFrame.Size = UDim2.new(1, -10, 0, 70)
    speedFrame.Position = UDim2.new(0, 0, 0, yOffset)
    speedFrame.BackgroundColor3 = CONFIG.Colors.Background
    speedFrame.BorderSizePixel = 0
    speedFrame.Parent = ContentScroll
    
    local speedCorner = Instance.new("UICorner")
    speedCorner.CornerRadius = UDim.new(0, 6)
    speedCorner.Parent = speedFrame
    
    local speedLabel = Instance.new("TextLabel")
    speedLabel.Size = UDim2.new(0, 50, 0, 25)
    speedLabel.Position = UDim2.new(1, -55, 0, 10)
    speedLabel.BackgroundColor3 = CONFIG.Colors.Sidebar
    speedLabel.Text = tostring(_G.WalkSpeedValue or 16)
    speedLabel.Font = Enum.Font.GothamBold
    speedLabel.TextSize = 14
    speedLabel.TextColor3 = CONFIG.Colors.Primary
    speedLabel.Parent = speedFrame
    
    local speedLabelCorner = Instance.new("UICorner")
    speedLabelCorner.CornerRadius = UDim.new(0, 4)
    speedLabelCorner.Parent = speedLabel
    
    local speedText = Instance.new("TextLabel")
    speedText.Size = UDim2.new(1, -70, 0, 25)
    speedText.Position = UDim2.new(0, 10, 0, 10)
    speedText.BackgroundTransparency = 1
    speedText.Text = "Speed (16-100)"
    speedText.Font = Enum.Font.Gotham
    speedText.TextSize = 12
    speedText.TextColor3 = CONFIG.Colors.TextDim
    speedText.TextXAlignment = Enum.TextXAlignment.Left
    speedText.Parent = speedFrame
    
    local bar = Instance.new("Frame")
    bar.Size = UDim2.new(1, -20, 0, 6)
    bar.Position = UDim2.new(0, 10, 0, 45)
    bar.BackgroundColor3 = CONFIG.Colors.Border
    bar.BorderSizePixel = 0
    bar.Parent = speedFrame
    
    local barCorner = Instance.new("UICorner")
    barCorner.CornerRadius = UDim.new(1, 0)
    barCorner.Parent = bar
    
    local fill = Instance.new("Frame")
    fill.Size = UDim2.new(0, 0, 1, 0)
    fill.BackgroundColor3 = CONFIG.Colors.Primary
    fill.BorderSizePixel = 0
    fill.Parent = bar
    
    local fillCorner = Instance.new("UICorner")
    fillCorner.CornerRadius = UDim.new(1, 0)
    fillCorner.Parent = fill
    
    local knob = Instance.new("Frame")
    knob.Size = UDim2.new(0, 12, 0, 12)
    knob.Position = UDim2.new(0, -6, 0, -3)
    knob.BackgroundColor3 = CONFIG.Colors.Text
    knob.BorderSizePixel = 0
    knob.Parent = bar
    
    local knobCorner = Instance.new("UICorner")
    knobCorner.CornerRadius = UDim.new(1, 0)
    knobCorner.Parent = knob
    
    yOffset = yOffset + 75
    
    -- WalkSpeed Logic
    local minSpeed, maxSpeed = 16, 100
    local currentSpeed = _G.WalkSpeedValue or 16
    _G.WalkSpeedValue = currentSpeed
    local draggingSpeed = false
    
    local function updateSlider(x)
        local pos = bar.AbsolutePosition.X
        local size = bar.AbsoluteSize.X
        local pct = math.clamp((x - pos) / size, 0, 1)
        fill.Size = UDim2.new(pct, 0, 1, 0)
        knob.Position = UDim2.new(pct, -6, 0, -3)
        currentSpeed = math.floor(minSpeed + (maxSpeed - minSpeed) * pct)
        speedLabel.Text = tostring(currentSpeed)
        _G.WalkSpeedValue = currentSpeed
        local hum = Player.Character and Player.Character:FindFirstChildOfClass("Humanoid")
        if hum then hum.WalkSpeed = currentSpeed end
    end
    
    local initialPct = (currentSpeed - minSpeed) / (maxSpeed - minSpeed)
    fill.Size = UDim2.new(initialPct, 0, 1, 0)
    knob.Position = UDim2.new(initialPct, -6, 0, -3)
    
    local wsConnection = RunService.Heartbeat:Connect(function()
        local hum = Player.Character and Player.Character:FindFirstChildOfClass("Humanoid")
        if UserInputService:IsKeyDown(Enum.KeyCode.LeftShift) and _G.WalkSpeedValue < 29 then
			hum.WalkSpeed = 29
		elseif hum and hum.WalkSpeed ~= _G.WalkSpeedValue then
            hum.WalkSpeed = _G.WalkSpeedValue	
        end
    end)
    
    bar.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            draggingSpeed = true
            updateSlider(input.Position.X)
        end
    end)
    
    knob.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            draggingSpeed = true
        end
    end)
    
    UserInputService.InputChanged:Connect(function(input)
        if draggingSpeed and input.UserInputType == Enum.UserInputType.MouseMovement then
            updateSlider(input.Position.X)
        end
    end)
    
    UserInputService.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 and draggingSpeed then
            draggingSpeed = false
        end
    end)
    
    ------------------------------------------------------------------
    -- Infinite Jump
    ------------------------------------------------------------------
    CreateSection("Jump Hack")
    
    _G.infinjump = _G.infinjump or false
    local ijToggle, ijMark = CreateToggle("Infinite Jump", _G.infinjump)
    
    local ijConnection
    local function EnableInfiniteJump(state)
        if state then
            ijConnection = UserInputService.JumpRequest:Connect(function()
                if _G.infinjump then
                    local hum = Player.Character and Player.Character:FindFirstChildOfClass("Humanoid")
                    if hum then hum:ChangeState("Jumping") end
                end
            end)
        elseif ijConnection then
            ijConnection:Disconnect()
            ijConnection = nil
        end
    end
    
    if _G.infinjump then EnableInfiniteJump(true) end
    
    ijToggle.MouseButton1Click:Connect(function()
        _G.infinjump = not _G.infinjump
        ijMark.Visible = _G.infinjump
        ijToggle.BackgroundColor3 = _G.infinjump and CONFIG.Colors.Success or CONFIG.Colors.Border
        EnableInfiniteJump(_G.infinjump)
    end)
    
    ------------------------------------------------------------------
    -- Fly Mode
    ------------------------------------------------------------------
    CreateSection("Flight Mode")
    
    _G.fly = _G.fly or false
    _G.FlySpeed = _G.FlySpeed or 1
    local flyToggle, flyMark = CreateToggle("Fly Mode", _G.fly)
    
    -- Fly Speed Control
    local flySpeedFrame = Instance.new("Frame")
    flySpeedFrame.Size = UDim2.new(1, -10, 0, 45)
    flySpeedFrame.Position = UDim2.new(0, 0, 0, yOffset)
    flySpeedFrame.BackgroundColor3 = CONFIG.Colors.Background
    flySpeedFrame.BorderSizePixel = 0
    flySpeedFrame.Parent = ContentScroll
    
    local flySpeedCorner = Instance.new("UICorner")
    flySpeedCorner.CornerRadius = UDim.new(0, 6)
    flySpeedCorner.Parent = flySpeedFrame
    
    local flySpeedText = Instance.new("TextLabel")
    flySpeedText.Size = UDim2.new(0, 100, 1, 0)
    flySpeedText.Position = UDim2.new(0, 10, 0, 0)
    flySpeedText.BackgroundTransparency = 1
    flySpeedText.Text = "Flight Speed:"
    flySpeedText.Font = Enum.Font.Gotham
    flySpeedText.TextSize = 12
    flySpeedText.TextColor3 = CONFIG.Colors.TextDim
    flySpeedText.TextXAlignment = Enum.TextXAlignment.Left
    flySpeedText.Parent = flySpeedFrame
    
    local minus = Instance.new("TextButton")
    minus.Size = UDim2.new(0, 35, 0, 30)
    minus.Position = UDim2.new(1, -125, 0.5, 0)
    minus.AnchorPoint = Vector2.new(0, 0.5)
    minus.BackgroundColor3 = CONFIG.Colors.Sidebar
    minus.Text = "-"
    minus.Font = Enum.Font.GothamBold
    minus.TextSize = 18
    minus.TextColor3 = CONFIG.Colors.Text
    minus.Parent = flySpeedFrame
    
    local minusCorner = Instance.new("UICorner")
    minusCorner.CornerRadius = UDim.new(0, 4)
    minusCorner.Parent = minus
    
    local flySpeedLabel = Instance.new("TextLabel")
    flySpeedLabel.Size = UDim2.new(0, 40, 0, 30)
    flySpeedLabel.Position = UDim2.new(1, -85, 0.5, 0)
    flySpeedLabel.AnchorPoint = Vector2.new(0, 0.5)
    flySpeedLabel.BackgroundTransparency = 1
    flySpeedLabel.Text = tostring(_G.FlySpeed).."x"
    flySpeedLabel.Font = Enum.Font.GothamBold
    flySpeedLabel.TextSize = 14
    flySpeedLabel.TextColor3 = CONFIG.Colors.Primary
    flySpeedLabel.Parent = flySpeedFrame
    
    local plus = Instance.new("TextButton")
    plus.Size = UDim2.new(0, 35, 0, 30)
    plus.Position = UDim2.new(1, -40, 0.5, 0)
    plus.AnchorPoint = Vector2.new(0, 0.5)
    plus.BackgroundColor3 = CONFIG.Colors.Sidebar
    plus.Text = "+"
    plus.Font = Enum.Font.GothamBold
    plus.TextSize = 18
    plus.TextColor3 = CONFIG.Colors.Text
    plus.Parent = flySpeedFrame
    
    local plusCorner = Instance.new("UICorner")
    plusCorner.CornerRadius = UDim.new(0, 4)
    plusCorner.Parent = plus
    
    yOffset = yOffset + 50
    
    -- Fly Logic
    local ctrl = {f=0, b=0, l=0, r=0}
    local lastctrl = {f=0, b=0, l=0, r=0}
    local maxspeed = 50
    local speed = 0
    local bg, bv
    
    local function FlyLoop()
        local char = Player.Character
        if not char then return end
        local hrp = char:FindFirstChild("HumanoidRootPart")
        if not hrp then return end
        
        bg = Instance.new("BodyGyro", hrp)
        bg.P = 9e4
        bg.maxTorque = Vector3.new(9e9, 9e9, 9e9)
        bg.cframe = hrp.CFrame
        
        bv = Instance.new("BodyVelocity", hrp)
        bv.velocity = Vector3.new(0, 0.1, 0)
        bv.maxForce = Vector3.new(9e9, 9e9, 9e9)
        
        while _G.fly and RunService.RenderStepped:Wait() do
            if ctrl.l + ctrl.r ~= 0 or ctrl.f + ctrl.b ~= 0 then
                speed = speed + 0.5 + (speed / maxspeed)
                if speed > maxspeed then speed = maxspeed end
            elseif not (ctrl.l + ctrl.r ~= 0 or ctrl.f + ctrl.b ~= 0) and speed ~= 0 then
                speed = speed - 1
                if speed < 0 then speed = 0 end
            end
            
            if (ctrl.l + ctrl.r) ~= 0 or (ctrl.f + ctrl.b) ~= 0 then
                bv.velocity = ((workspace.CurrentCamera.CoordinateFrame.lookVector * (ctrl.f + ctrl.b)) + 
                    ((workspace.CurrentCamera.CoordinateFrame * CFrame.new(ctrl.l + ctrl.r, (ctrl.f + ctrl.b) * 0.2, 0).p) - 
                    workspace.CurrentCamera.CoordinateFrame.p)) * speed * _G.FlySpeed
                lastctrl = {f = ctrl.f, b = ctrl.b, l = ctrl.l, r = ctrl.r}
            elseif (ctrl.l + ctrl.r) == 0 and (ctrl.f + ctrl.b) == 0 and speed ~= 0 then
                bv.velocity = ((workspace.CurrentCamera.CoordinateFrame.lookVector * (lastctrl.f + lastctrl.b)) + 
                    ((workspace.CurrentCamera.CoordinateFrame * CFrame.new(lastctrl.l + lastctrl.r, (lastctrl.f + lastctrl.b) * 0.2, 0).p) - 
                    workspace.CurrentCamera.CoordinateFrame.p)) * speed * _G.FlySpeed
            else
                bv.velocity = Vector3.new(0, 0, 0)
            end
            
            bg.cframe = workspace.CurrentCamera.CoordinateFrame * CFrame.Angles(-math.rad((ctrl.f + ctrl.b) * 50 * speed / maxspeed), 0, 0)
        end
        
        ctrl = {f=0, b=0, l=0, r=0}
        lastctrl = {f=0, b=0, l=0, r=0}
        speed = 0
        if bv then bv:Destroy() end
        if bg then bg:Destroy() end
    end
    
    flyToggle.MouseButton1Click:Connect(function()
        _G.fly = not _G.fly
        flyMark.Visible = _G.fly
        flyToggle.BackgroundColor3 = _G.fly and CONFIG.Colors.Success or CONFIG.Colors.Border
        if _G.fly then 
            task.spawn(FlyLoop)
        end
    end)
    
    plus.MouseButton1Click:Connect(function()
        _G.FlySpeed = _G.FlySpeed + 1
        flySpeedLabel.Text = tostring(_G.FlySpeed).."x"
    end)
    
    minus.MouseButton1Click:Connect(function()
        _G.FlySpeed = math.max(1, _G.FlySpeed - 1)
        flySpeedLabel.Text = tostring(_G.FlySpeed).."x"
    end)
    
    UserInputService.InputBegan:Connect(function(i, g)
        if g or not _G.fly then return end
        if i.KeyCode == Enum.KeyCode.W then ctrl.f = 1 end
        if i.KeyCode == Enum.KeyCode.S then ctrl.b = -1 end
        if i.KeyCode == Enum.KeyCode.A then ctrl.l = -1 end
        if i.KeyCode == Enum.KeyCode.D then ctrl.r = 1 end
    end)
    
    UserInputService.InputEnded:Connect(function(i)
        if i.KeyCode == Enum.KeyCode.W then ctrl.f = 0 end
        if i.KeyCode == Enum.KeyCode.S then ctrl.b = 0 end
        if i.KeyCode == Enum.KeyCode.A then ctrl.l = 0 end
        if i.KeyCode == Enum.KeyCode.D then ctrl.r = 0 end
    end)
    
    ------------------------------------------------------------------
    -- VoidProtect
    ------------------------------------------------------------------
    CreateSection("Void Protect")
		if _G.voidprotect == nil then
			_G.voidprotect = true
		elseif _G.voidprotect == false then
			_G.voidprotect = false
		else 
			_G.voidprotect = true
	end
    _G.voidprotect = _G.voidprotect or false
    local vpToggle, vpMark = CreateToggle("Void Protect", _G.voidprotect)
    
    local vpConn
    local function EnableVoidProtect(state)
        if state then
            vpConn = RunService.Heartbeat:Connect(function()
                local hrp = Player.Character and Player.Character:FindFirstChild("HumanoidRootPart")
                if hrp and hrp.Position.Y < -80 then
                    hrp.CFrame = CFrame.new(hrp.Position.X, 5, hrp.Position.Z)
                end
            end)
        elseif vpConn then
            vpConn:Disconnect()
        end
    end
    
    EnableVoidProtect(_G.voidprotect)
    
    vpToggle.MouseButton1Click:Connect(function()
        _G.voidprotect = not _G.voidprotect
        vpMark.Visible = _G.voidprotect
        vpToggle.BackgroundColor3 = _G.voidprotect and CONFIG.Colors.Success or CONFIG.Colors.Border
        EnableVoidProtect(_G.voidprotect)
    end)
    
    ------------------------------------------------------------------
    -- NoClip
    ------------------------------------------------------------------
    CreateSection("NoClip")
    
    _G.noclip = _G.noclip or false
    local ncToggle, ncMark = CreateToggle("NoClip (passing through walls)", _G.noclip)
    
    -- NoClip Logic
    local collisionDisabled = _G.noclip or false
    local originalCanCollide = setmetatable({}, {__mode = "k"})
    local character
    
    local function disableAllCollisions(chr)
        for _, desc in ipairs(chr:GetDescendants()) do
            if desc:IsA("BasePart") then
                if originalCanCollide[desc] == nil then
                    originalCanCollide[desc] = desc.CanCollide
                end
                desc.CanCollide = false
            end
        end
    end
    
    local function restoreAllCollisions(chr)
        for _, desc in ipairs(chr:GetDescendants()) do
            if desc:IsA("BasePart") and originalCanCollide[desc] ~= nil then
                desc.CanCollide = originalCanCollide[desc]
                originalCanCollide[desc] = nil
            end
        end
    end
    
    local function hookCharacter(chr)
        character = chr
        chr.DescendantAdded:Connect(function(desc)
            if desc:IsA("BasePart") and collisionDisabled then
                if originalCanCollide[desc] == nil then
                    originalCanCollide[desc] = desc.CanCollide
                end
                desc.CanCollide = false
            end
        end)
    end
    
    if Player.Character then
        hookCharacter(Player.Character)
        if collisionDisabled then
            disableAllCollisions(Player.Character)
        end
    end
    
    Player.CharacterAdded:Connect(function(chr)
        hookCharacter(chr)
        if collisionDisabled then
            task.delay(0.05, function()
                if collisionDisabled then
                    disableAllCollisions(chr)
                end
            end)
        end
    end)
    
    local ncConn = RunService.Heartbeat:Connect(function()
        if collisionDisabled and character then
            disableAllCollisions(character)
        end
    end)
    
    ncToggle.MouseButton1Click:Connect(function()
        _G.noclip = not _G.noclip
        collisionDisabled = _G.noclip
        ncMark.Visible = _G.noclip
        ncToggle.BackgroundColor3 = _G.noclip and CONFIG.Colors.Success or CONFIG.Colors.Border
        
        if collisionDisabled and character then
            disableAllCollisions(character)
        elseif not collisionDisabled and character then
            restoreAllCollisions(character)
        end
    end)
    
    -- Cleanup function
    _G.CurrentTabCleanup = function()
        if vpConn then vpConn:Disconnect() vpConn = nil end
        if ijConnection then ijConnection:Disconnect() ijConnection = nil end
        if wsConnection then wsConnection:Disconnect() wsConnection = nil end
        if ncConn then ncConn:Disconnect() ncConn = nil end
        if collisionDisabled and character then
            restoreAllCollisions(character)
            collisionDisabled = false
            _G.noclip = false
        end
    end
    
    ContentScroll.CanvasSize = UDim2.new(0, 0, 0, yOffset + 70)
end
-- ========== MORPH КОНТЕНТ ==========
-- MORPH — исправленная версия (фикс проваливания, восстановления и серых прямоугольников)
-- Положить как LocalScript (StarterPlayerScripts)

-- Services
local Players = game:GetService("Players")
local Workspace = game:GetService("Workspace")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")

-- Player refs
local player = Players.LocalPlayer
local camera = Workspace.CurrentCamera
local npcFolder = Workspace:WaitForChild("Characters")

-- ========== Настройки ==========
local MOVE_SPEED = 12
local ROTATION_SPEED = 12
local ANIM_THRESHOLD = 0.08
local RESTORE_UP_OFFSET = 20
local FOOT_TOLERANCE = 1.2
local MORPH_SPAWN_OFFSET = 5
-- =================================

-- Состояние / ссылки
local originalChar, originalHumanoid = nil, nil
local savedHumanoidValues = {
    WalkSpeed = 16,
    JumpPower = 50,
    PlatformStand = false,
    AutoRotate = true,
    AnimateDisabled = nil,
    CameraOffset = Vector3.new(0, 0, 0),
    MaxSlopeAngle = 89,
}
local savedPartProps = {}
local savedAccessories = {} -- для предметов в руках и аксессуаров
local savedTools = {} -- для сохранения инструментов
local morphClone = nil
local morphHum = nil
local morphPrimary = nil
local loadedAnims = {}
local animPlaying = nil
local animJumpConn = nil
local lastMorphCFrame = nil

-- Ввод
local moveDir = Vector3.new(0,0,0)
local jumpRequested = false

-- Ссылки на события
local renderConn = nil
local charAddedConn = nil
local charRemovingConn = nil
local humanoidDiedConn = nil
local hideStepConn = nil

-- ========== Вспомогательные функции ==========

local function safeGetProperty(inst, prop)
    local ok, val = pcall(function() return inst[prop] end)
    if ok then return val end
    return nil
end

local function getPrimaryPart(model)
    if not model then return nil end
    if model.PrimaryPart and model.PrimaryPart:IsA("BasePart") then return model.PrimaryPart end
    local candidates = { "HumanoidRootPart", "LowerTorso", "UpperTorso", "Torso", "RootPart" }
    for _, n in ipairs(candidates) do
        local p = model:FindFirstChild(n)
        if p and p:IsA("BasePart") then return p end
    end
    for _, d in ipairs(model:GetDescendants()) do
        if d:IsA("BasePart") then return d end
    end
    return nil
end

-- Сохраняем исходные свойства частей персонажа
local function saveAppearanceForCharacter(char)
    savedPartProps = {}
    savedAccessories = {}
    savedTools = {}
    if not char then return end
    
    -- Сохраняем все части тела
    for _, inst in ipairs(char:GetDescendants()) do
        if inst:IsA("BasePart") then
            local t = {
                CanCollide = safeGetProperty(inst, "CanCollide"),
                Transparency = safeGetProperty(inst, "Transparency"),
                Material = safeGetProperty(inst, "Material"),
                Color = safeGetProperty(inst, "Color"),
                Reflectance = safeGetProperty(inst, "Reflectance"),
                CastShadow = safeGetProperty(inst, "CastShadow"),
                Anchored = safeGetProperty(inst, "Anchored"),
                Decals = {},
            }
            for _, child in ipairs(inst:GetChildren()) do
                if child:IsA("Decal") or child:IsA("Texture") then
                    t.Decals[child] = {
                        Transparency = safeGetProperty(child, "Transparency"),
                    }
                elseif child:IsA("SurfaceAppearance") then
                    t.Decals[child] = {
                        Enabled = true
                    }
                elseif child:IsA("SpecialMesh") then
                    t.Decals[child] = {
                        MeshType = safeGetProperty(child, "MeshType"),
                        Scale = safeGetProperty(child, "Scale"),
                    }
                end
            end
            savedPartProps[inst] = t
        elseif inst:IsA("Accessory") then
            -- Сохраняем аксессуары (предметы в руках и т.д.)
            savedAccessories[inst] = {
                Parent = inst.Parent,
                Handle = inst:FindFirstChild("Handle"),
            }
        end
    end
    
    -- Сохраняем инструменты в рюкзаке и руках
    local backpack = player:FindFirstChild("Backpack")
    if backpack then
        for _, tool in ipairs(backpack:GetChildren()) do
            if tool:IsA("Tool") then
                table.insert(savedTools, {Tool = tool, Location = "Backpack"})
            end
        end
    end
    
    -- Инструмент в руках
    local equippedTool = char:FindFirstChildOfClass("Tool")
    if equippedTool then
        table.insert(savedTools, {Tool = equippedTool, Location = "Character", Equipped = true})
    end
end

local isMorphActive = false

-- Скрываем персонажа локально
local descAddedConn  -- сохраняем подписку на DescendantAdded

local function hideCharacterLocally(char)
    if not char then return end

    -- Отключаем старое подключение Heartbeat
    if hideStepConn then
        hideStepConn:Disconnect()
        hideStepConn = nil
    end
    if descAddedConn then
        descAddedConn:Disconnect()
        descAddedConn = nil
    end

    local function disablePart(part)
        if part:IsA("BasePart") then
            pcall(function()
                part.CanCollide = false
                part.Transparency = 1
            end)
            for _, child in ipairs(part:GetChildren()) do
                if child:IsA("Decal") or child:IsA("Texture") then
                    pcall(function() child.Transparency = 1 end)
                elseif child:IsA("SurfaceAppearance") then
                    pcall(function() child.Enabled = false end)
                end
            end
        end
    end

    -- Скрываем все части сразу
    for _, inst in ipairs(char:GetDescendants()) do
        disablePart(inst)
        if inst:IsA("Accessory") then
            local handle = inst:FindFirstChild("Handle")
            if handle then disablePart(handle) end
        end
    end

    -- Подписка на новые части
    descAddedConn = char.DescendantAdded:Connect(function(inst)
        task.wait()
        disablePart(inst)
    end)

    -- Постоянный контроль видимости через Heartbeat
    hideStepConn = RunService.Heartbeat:Connect(function()
        if not isMorphActive then return end
        if not char.Parent then return end
        for _, inst in ipairs(char:GetDescendants()) do
            if inst:IsA("BasePart") then
                pcall(function() inst.CanCollide = false end)
                if inst.Transparency < 1 then pcall(function() inst.Transparency = 1 end) end
            end
        end
    end)

    isMorphActive = true
end

-- Восстановление внешнего вида
-- Восстановление внешнего вида персонажа
-- keepHRPHidden = true → HumanoidRootPart остаётся невидимым и с CanCollide = false
local function restoreCharacterAppearance(char, keepHRPHidden)
    if not char then return end

    -- Отключаем постоянное скрытие
    if hideStepConn then
        hideStepConn:Disconnect()
        hideStepConn = nil
    end

    if savedPartProps and next(savedPartProps) then
        for part, props in pairs(savedPartProps) do
            if part and part.Parent then
                pcall(function()
                    -- HRP остаётся скрытым, если нужно
                    if part.Name == "HumanoidRootPart" and keepHRPHidden then
                        part.CanCollide = false
                        part.Transparency = 1
                    else
                        if props.CanCollide ~= nil then part.CanCollide = props.CanCollide end
                        if props.Transparency ~= nil then part.Transparency = props.Transparency end
                        if props.Material ~= nil then part.Material = props.Material end
                        if props.Color ~= nil then part.Color = props.Color end
                        if props.Reflectance ~= nil then part.Reflectance = props.Reflectance end
                        if props.CastShadow ~= nil then part.CastShadow = props.CastShadow end
                        if props.Anchored ~= nil then part.Anchored = props.Anchored end
                    end
                end)

                -- Восстановление декалей и текстур
                if props.Decals then
                    for dec, data in pairs(props.Decals) do
                        if dec and dec.Parent then
                            pcall(function()
                                if data.Transparency ~= nil then dec.Transparency = data.Transparency end
                                if data.Enabled ~= nil then dec.Enabled = data.Enabled end
                                if data.MeshType ~= nil and dec:IsA("SpecialMesh") then dec.MeshType = data.MeshType end
                                if data.Scale ~= nil and dec:IsA("SpecialMesh") then dec.Scale = data.Scale end
                            end)
                        end
                    end
                end
            end
        end
    else
        -- Фоллбэк: скрываем HRP, остальные части делаем видимыми и с коллизией
        for _, inst in ipairs(char:GetDescendants()) do
            if inst:IsA("BasePart") then
                pcall(function()
                    if inst.Name == "HumanoidRootPart" and keepHRPHidden then
                        inst.CanCollide = false
                        inst.Transparency = 1
                    else
                        inst.Transparency = 0
                        inst.CanCollide = true
                    end
                end)
                for _, child in ipairs(inst:GetChildren()) do
                    if child:IsA("Decal") or child:IsA("Texture") then
                        pcall(function() child.Transparency = 0 end)
                    elseif child:IsA("SurfaceAppearance") then
                        pcall(function() child.Enabled = true end)
                    end
                end
            end
        end
    end
end

local function stopAllMorphAnims()
    for _, t in pairs(loadedAnims) do
        if t then pcall(function() t:Stop() end) end
    end
    animPlaying = nil
end

local function playMorphAnim(name)
    if not loadedAnims or not loadedAnims[name] then return end
    if animPlaying == name then return end
    stopAllMorphAnims()
    pcall(function() loadedAnims[name]:Play() end)
    animPlaying = name
end

local function updateMoveAnim(isMoving)
    if not morphHum then return end
    if isMoving then
        if loadedAnims and loadedAnims.Walk then
            playMorphAnim("Walk")
        end
    else
        if loadedAnims and loadedAnims.Idle then
            playMorphAnim("Idle")
        else
            stopAllMorphAnims()
        end
    end
end

-- ========== Движение и синхронизация ==========
local function MoveAndSync(dt)
    if not morphClone or not morphPrimary then return end

    local camCF = camera.CFrame
    local forward = Vector3.new(camCF.LookVector.X, 0, camCF.LookVector.Z)
    if forward.Magnitude == 0 then forward = Vector3.new(0,0,-1) end
    forward = forward.Unit
    local right = Vector3.new(camCF.RightVector.X, 0, camCF.RightVector.Z)
    if right.Magnitude == 0 then right = Vector3.new(1,0,0) end
    right = right.Unit

    local moveVector = forward * moveDir.Z + right * moveDir.X
    local isMoving = moveVector.Magnitude > ANIM_THRESHOLD

    if isMoving then
        local dirUnit = moveVector.Unit
        local targetCFrame = CFrame.new(morphPrimary.Position, morphPrimary.Position + Vector3.new(dirUnit.X, 0, dirUnit.Z))
        local alpha = math.clamp(ROTATION_SPEED * dt, 0, 1)
        local lerped = morphPrimary.CFrame:Lerp(targetCFrame, alpha)

        local newPos = morphPrimary.Position + dirUnit * MOVE_SPEED * dt
        morphPrimary.CFrame = CFrame.new(newPos, newPos + Vector3.new(lerped.LookVector.X, 0, lerped.LookVector.Z))
    end

    if morphHum and jumpRequested then
        if morphHum.FloorMaterial ~= Enum.Material.Air then
            pcall(function() morphHum.Jump = true end)
            jumpRequested = false
        end
    end

    -- Синхронизация HRP оригинала
    if originalChar and morphPrimary then
        local hrp = originalChar:FindFirstChild("HumanoidRootPart")
        if hrp then
            pcall(function()
                hrp.CFrame = morphPrimary.CFrame
                hrp.AssemblyLinearVelocity = Vector3.new(0, 0, 0)
            end)
        end
    end

    updateMoveAnim(isMoving)
end

if not renderConn then
    renderConn = RunService.RenderStepped:Connect(MoveAndSync)
end

-- ========== Ввод ==========
UserInputService.InputBegan:Connect(function(input, gameProcessed)
    if gameProcessed then return end
    if input.KeyCode == Enum.KeyCode.W then moveDir = Vector3.new(moveDir.X, 0, 1) end
    if input.KeyCode == Enum.KeyCode.S then moveDir = Vector3.new(moveDir.X, 0, -1) end
    if input.KeyCode == Enum.KeyCode.A then moveDir = Vector3.new(-1, 0, moveDir.Z) end
    if input.KeyCode == Enum.KeyCode.D then moveDir = Vector3.new(1, 0, moveDir.Z) end
    if input.KeyCode == Enum.KeyCode.Space then jumpRequested = true end
end)

UserInputService.InputEnded:Connect(function(input, gameProcessed)
    if input.KeyCode == Enum.KeyCode.W or input.KeyCode == Enum.KeyCode.S then moveDir = Vector3.new(moveDir.X, 0, 0) end
    if input.KeyCode == Enum.KeyCode.A or input.KeyCode == Enum.KeyCode.D then moveDir = Vector3.new(0, 0, moveDir.Z) end
end)

-- ========== Обновление ссылок на оригинал ==========
local function updateOriginalCharacterRefs()
    originalChar = player.Character
    if originalChar then
        originalHumanoid = originalChar:FindFirstChildOfClass("Humanoid")
        if originalHumanoid then
            savedHumanoidValues.WalkSpeed = safeGetProperty(originalHumanoid, "WalkSpeed") or savedHumanoidValues.WalkSpeed
            if safeGetProperty(originalHumanoid, "JumpPower") ~= nil then
                savedHumanoidValues.JumpPower = safeGetProperty(originalHumanoid, "JumpPower")
            else
                savedHumanoidValues.JumpPower = safeGetProperty(originalHumanoid, "JumpHeight") or savedHumanoidValues.JumpPower
            end
            savedHumanoidValues.PlatformStand = safeGetProperty(originalHumanoid, "PlatformStand") or false
            savedHumanoidValues.AutoRotate = safeGetProperty(originalHumanoid, "AutoRotate")
            if savedHumanoidValues.AutoRotate == nil then
                savedHumanoidValues.AutoRotate = true
            end
            savedHumanoidValues.CameraOffset = safeGetProperty(originalHumanoid, "CameraOffset") or Vector3.new(0, 0, 0)
            savedHumanoidValues.MaxSlopeAngle = safeGetProperty(originalHumanoid, "MaxSlopeAngle") or 89
            
            local animScript = originalChar:FindFirstChild("Animate")
            if animScript and animScript:IsA("LocalScript") then
                savedHumanoidValues.AnimateDisabled = safeGetProperty(animScript, "Disabled")
            else
                savedHumanoidValues.AnimateDisabled = nil
            end
        end
    else
        originalHumanoid = nil
    end
end

function RestoreCharacter()
    -- Выключаем морф и все подписки
    isMorphActive = false

    if animJumpConn then animJumpConn:Disconnect(); animJumpConn = nil end
    if charRemovingConn then charRemovingConn:Disconnect(); charRemovingConn = nil end
    if humanoidDiedConn then humanoidDiedConn:Disconnect(); humanoidDiedConn = nil end
    if hideStepConn then hideStepConn:Disconnect(); hideStepConn = nil end
    if descAddedConn then descAddedConn:Disconnect(); descAddedConn = nil end

    -- Удаляем морф
    if morphClone then
        stopAllMorphAnims()
        pcall(function() morphClone:Destroy() end)
        morphClone, morphHum, morphPrimary, loadedAnims, animPlaying = nil, nil, nil, {}, nil
    end

    -- Обновляем ссылки на оригинал
    updateOriginalCharacterRefs()
    if not originalChar or not originalHumanoid then return end

    local hrp = originalChar:FindFirstChild("HumanoidRootPart")
    if hrp then
        -- Если lastMorphCFrame валидный, используем его
        local safeCFrame = (lastMorphCFrame and lastMorphCFrame.Position.Y > 0) and lastMorphCFrame or hrp.CFrame
        -- Поднимаем персонажа на безопасное расстояние вверх
        pcall(function() hrp.CFrame = safeCFrame + Vector3.new(0, RESTORE_UP_OFFSET, 0) end)
    end

    -- Восстанавливаем видимость и коллизию частей
    restoreCharacterAppearance(originalChar, true)

    -- Восстанавливаем инструменты
    for _, toolData in ipairs(savedTools) do
        local tool = toolData.Tool
        if tool then
            if toolData.Location == "Backpack" then
                local backpack = player:FindFirstChild("Backpack")
                if backpack then tool.Parent = backpack end
            elseif toolData.Location == "Character" then
                tool.Parent = originalChar
            end
        end
    end

    -- Агрессивное восстановление Humanoid через небольшой таймер
    task.delay(0.5, function()
        local humanoid = originalHumanoid
        local animScript = originalChar:FindFirstChild("Animate")

        if humanoid then
            pcall(function()
                humanoid.PlatformStand = false
                humanoid.AutoRotate = true
                humanoid.WalkSpeed = savedHumanoidValues.WalkSpeed or 16
                if humanoid.JumpPower ~= nil then
                    humanoid.JumpPower = savedHumanoidValues.JumpPower or 50
                else
                    humanoid.JumpHeight = savedHumanoidValues.JumpPower or 50
                end
            end)
        end

        if animScript and animScript:IsA("LocalScript") then
            pcall(function() animScript.Disabled = false end)
        end

        -- Пробуждаем Humanoid через смену состояний
        local states = {Enum.HumanoidStateType.Physics, Enum.HumanoidStateType.GettingUp, Enum.HumanoidStateType.Freefall, Enum.HumanoidStateType.Running}
        for _, state in ipairs(states) do
            pcall(function() humanoid:ChangeState(state) end)
            task.wait(0.05)
        end

        -- Лёгкая телепортация для корректного столкновения с землёй
        if hrp then
            local pos = hrp.Position
            pcall(function() hrp.CFrame = CFrame.new(pos + Vector3.new(0, 0.1, 0)) end)
            task.wait(0.05)
            pcall(function() hrp.CFrame = CFrame.new(pos) end)
        end

        -- Восстановление камеры
        if humanoid then
            camera.CameraSubject = humanoid
        elseif hrp then
            camera.CameraSubject = hrp
        end
    end)

    moveDir, jumpRequested = Vector3.new(0,0,0), false
    savedPartProps, savedAccessories, savedTools = {}, {}, {}
end

-- ========== MorphInto ==========
local function MorphInto(npc)
	isMorphActive = true
    if not npc or not npc:IsA("Model") then return end

    if morphClone then
        if morphClone then
            pcall(function() morphClone:Destroy() end)
            morphClone = nil
            morphHum = nil
            morphPrimary = nil
            loadedAnims = {}
        end
    end

    updateOriginalCharacterRefs()

    if originalChar then
        saveAppearanceForCharacter(originalChar)
        hideCharacterLocally(originalChar)
    end

    if originalHumanoid then
        pcall(function() originalHumanoid.PlatformStand = true end)
        pcall(function() originalHumanoid.WalkSpeed = 0 end)
        pcall(function()
            if originalHumanoid.JumpPower ~= nil then
                originalHumanoid.JumpPower = 0
            else
                originalHumanoid.JumpHeight = 0
            end
        end)
        pcall(function() originalHumanoid.AutoRotate = false end)
        local animScript = originalChar:FindFirstChild("Animate")
        if animScript and animScript:IsA("LocalScript") then
            pcall(function() animScript.Disabled = true end)
        end
    end

    morphClone = npc:Clone()
    morphClone.Name = "MorphClone_" .. tostring(player.Name)
    morphClone.Parent = Workspace

    morphPrimary = getPrimaryPart(morphClone)
    
    -- Улучшенное размещение морфа
    local refHRP = originalChar and originalChar:FindFirstChild("HumanoidRootPart")
    if refHRP and morphPrimary then
        -- Поднимаем морф выше чтобы избежать проваливания
        morphPrimary.CFrame = refHRP.CFrame * CFrame.new(0, MORPH_SPAWN_OFFSET, 0)
    elseif morphPrimary and originalChar and originalChar.PrimaryPart then
        morphPrimary.CFrame = originalChar.PrimaryPart.CFrame * CFrame.new(0, MORPH_SPAWN_OFFSET, 0)
    end

    -- Настройка коллизий морфа
    local minY = nil
    local baseparts = {}
    for _, part in ipairs(morphClone:GetDescendants()) do
        if part:IsA("BasePart") then
            table.insert(baseparts, part)
            if not minY or part.Position.Y < minY then
                minY = part.Position.Y
            end
        end
    end
    
    for _, part in ipairs(baseparts) do
        pcall(function() part.Anchored = false end)
        local enable = false
        if morphPrimary and part == morphPrimary then
            enable = true
        elseif minY and part.Position.Y <= (minY + FOOT_TOLERANCE) then
            enable = true
        end
        pcall(function() part.CanCollide = enable end)
    end

    morphHum = morphClone:FindFirstChildOfClass("Humanoid")
    if morphHum then
        pcall(function() morphHum.AutoRotate = false end)
        pcall(function() morphHum.PlatformStand = false end)
    end

    if morphHum then
        camera.CameraSubject = morphHum
    elseif morphPrimary then
        camera.CameraSubject = morphPrimary
    end

    loadedAnims = {}
    animPlaying = nil
    local animationsFolder = npc:FindFirstChild("Animations")
    if morphHum and animationsFolder then
        local animator = morphHum:FindFirstChildOfClass("Animator")
        if animator then
            for _, anim in ipairs(animationsFolder:GetChildren()) do
                if anim:IsA("Animation") then
                    local ok, track = pcall(function() return animator:LoadAnimation(anim) end)
                    if ok and track then
                        loadedAnims[anim.Name] = track
                    end
                end
            end
        end
    end

    if morphHum then
        if animJumpConn then animJumpConn:Disconnect(); animJumpConn = nil end
        animJumpConn = morphHum.Jumping:Connect(function()
            if loadedAnims and loadedAnims.Jump then
                playMorphAnim("Jump")
                task.delay(0.45, function()
                    local moving = (moveDir.Z ~= 0 or moveDir.X ~= 0)
                    updateMoveAnim(moving)
                end)
            end
        end)
    end

    if morphPrimary then
        lastMorphCFrame = morphPrimary.CFrame
    else
        lastMorphCFrame = nil
    end

    if charRemovingConn then charRemovingConn:Disconnect(); charRemovingConn = nil end
    charRemovingConn = player.CharacterRemoving:Connect(function()
        pcall(function() RestoreCharacter() end)
    end)

    if humanoidDiedConn then humanoidDiedConn:Disconnect(); humanoidDiedConn = nil end
    if originalHumanoid then
        humanoidDiedConn = originalHumanoid.Died:Connect(function()
            pcall(function() RestoreCharacter() end)
        end)
    end

    updateMoveAnim(false)
end

charAddedConn = player.CharacterAdded:Connect(function(char)
    task.wait(0.05)
    updateOriginalCharacterRefs()
    if morphClone and originalChar then
        saveAppearanceForCharacter(originalChar)
        hideCharacterLocally(originalChar)
        if originalHumanoid then
            pcall(function() originalHumanoid.PlatformStand = true end)
            pcall(function() originalHumanoid.WalkSpeed = 0 end)
            pcall(function()
                if originalHumanoid.JumpPower ~= nil then originalHumanoid.JumpPower = 0 else originalHumanoid.JumpHeight = 0 end
            end)
            pcall(function() originalHumanoid.AutoRotate = false end)
        end
    end
end)

local function cleanupOnClose()
    pcall(function() RestoreCharacter() end)
    if charAddedConn then charAddedConn:Disconnect(); charAddedConn = nil end
    if renderConn then renderConn:Disconnect(); renderConn = nil end
    if hideStepConn then hideStepConn:Disconnect(); hideStepConn = nil end
end

-- ========== MORPH КОНТЕНТ ==========
function CreateMORPHContent()
    -- Отключаем скроллинг основного окна
    ContentScroll:ClearAllChildren()
    ContentScroll.ScrollingEnabled = false
    ContentScroll.CanvasSize = UDim2.new(0, 0, 0, 0)
    ContentScroll.CanvasPosition = Vector2.new(0, 0)
    
    -- Контейнер для горизонтального расположения
    local HorizontalContainer = Instance.new("Frame")
    HorizontalContainer.Name = "HorizontalContainer"
    HorizontalContainer.Size = UDim2.new(1, 0, 1, 0)
    HorizontalContainer.BackgroundTransparency = 1
    HorizontalContainer.Parent = ContentScroll
    
    -- ЛЕВАЯ ПАНЕЛЬ - Управление
    local LeftPanel = Instance.new("Frame")
    LeftPanel.Name = "LeftPanel"
    LeftPanel.Size = UDim2.new(0.48, 0, 1, 0)
    LeftPanel.Position = UDim2.new(0, 0, 0, 0)
    LeftPanel.BackgroundColor3 = CONFIG.Colors.Background
    LeftPanel.BorderSizePixel = 0
    LeftPanel.Parent = HorizontalContainer
    
    local LeftCorner = Instance.new("UICorner")
    LeftCorner.CornerRadius = UDim.new(0, 8)
    LeftCorner.Parent = LeftPanel
    
    -- Заголовок левой панели
    local LeftTitle = Instance.new("TextLabel")
    LeftTitle.Size = UDim2.new(1, -20, 0, 32)
    LeftTitle.Position = UDim2.new(0, 12, 0, 12)
    LeftTitle.BackgroundTransparency = 1
    LeftTitle.Text = "Control Panel"
    LeftTitle.Font = Enum.Font.GothamBold
    LeftTitle.TextSize = 16
    LeftTitle.TextColor3 = CONFIG.Colors.Primary
    LeftTitle.TextXAlignment = Enum.TextXAlignment.Left
    LeftTitle.Parent = LeftPanel
    
    local LeftScroll = Instance.new("ScrollingFrame")
    LeftScroll.Name = "LeftScroll"
    LeftScroll.Size = UDim2.new(1, -24, 1, -60)
    LeftScroll.Position = UDim2.new(0, 12, 0, 48)
    LeftScroll.BackgroundTransparency = 1
    LeftScroll.BorderSizePixel = 0
    LeftScroll.ScrollBarThickness = 3
    LeftScroll.ScrollBarImageColor3 = CONFIG.Colors.Primary
    LeftScroll.ScrollBarImageTransparency = 0.5
    LeftScroll.Parent = LeftPanel
    
    local LeftLayout = Instance.new("UIListLayout")
    LeftLayout.SortOrder = Enum.SortOrder.LayoutOrder
    LeftLayout.Padding = UDim.new(0, 12)
    LeftLayout.Parent = LeftScroll
    
    LeftLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
        LeftScroll.CanvasSize = UDim2.new(0, 0, 0, LeftLayout.AbsoluteContentSize.Y + 12)
    end)
    
    -- Описание
    local DescLabel = Instance.new("TextLabel")
    DescLabel.Size = UDim2.new(1, 0, 0, 100)
    DescLabel.BackgroundTransparency = 1
    DescLabel.Text = "Morph into NPC characters seamlessly. Choose a model from the list below. Models appear dynamically as they spawn on the map."
    DescLabel.Font = Enum.Font.Gotham
    DescLabel.TextSize = 13
    DescLabel.TextColor3 = CONFIG.Colors.TextDim
    DescLabel.TextWrapped = true
    DescLabel.TextXAlignment = Enum.TextXAlignment.Left
    DescLabel.TextYAlignment = Enum.TextYAlignment.Top
    DescLabel.Parent = LeftScroll
    
    -- Кнопка восстановления
    local RestoreButton = CreateCompactButton(
        LeftScroll,
        "Restore Normal",
        CONFIG.Colors.Primary,
        function()
            RestoreCharacter()
        end
    )
    
	-- Кнопка обновления
	local RefreshButton = CreateCompactButton(
		LeftScroll,
		"🔄 Refresh List",
		Color3.fromRGB(70, 130, 180),  -- вот тут задаём цвет
		function()
			GenerateMorphButtons()
		end
	)
    
    -- ПРАВАЯ ПАНЕЛЬ - Список моделей
    local RightPanel = Instance.new("Frame")
    RightPanel.Name = "RightPanel"
    RightPanel.Size = UDim2.new(0.48, 0, 1, 0)
    RightPanel.Position = UDim2.new(0.48, 12, 0, 0)
    RightPanel.BackgroundColor3 = CONFIG.Colors.Background
    RightPanel.BorderSizePixel = 0
    RightPanel.Parent = HorizontalContainer
    
    local RightCorner = Instance.new("UICorner")
    RightCorner.CornerRadius = UDim.new(0, 8)
    RightCorner.Parent = RightPanel
    
    -- Заголовок списка
    local ListTitle = Instance.new("TextLabel")
    ListTitle.Size = UDim2.new(1, -20, 0, 32)
    ListTitle.Position = UDim2.new(0, 12, 0, 12)
    ListTitle.BackgroundTransparency = 1
    ListTitle.Text = "Available Models"
    ListTitle.Font = Enum.Font.GothamBold
    ListTitle.TextSize = 16
    ListTitle.TextColor3 = CONFIG.Colors.Primary
    ListTitle.TextXAlignment = Enum.TextXAlignment.Left
    ListTitle.Parent = RightPanel
    
    -- Скроллер для моделей
    local ModelsScrollFrame = Instance.new("ScrollingFrame")
    ModelsScrollFrame.Name = "ModelsScroll"
    ModelsScrollFrame.Size = UDim2.new(1, -24, 1, -60)
    ModelsScrollFrame.Position = UDim2.new(0, 12, 0, 48)
    ModelsScrollFrame.BackgroundTransparency = 1
    ModelsScrollFrame.BorderSizePixel = 0
    ModelsScrollFrame.ScrollBarThickness = 3
    ModelsScrollFrame.ScrollBarImageColor3 = CONFIG.Colors.Primary
    ModelsScrollFrame.ScrollBarImageTransparency = 0.5
    ModelsScrollFrame.Parent = RightPanel
    
    local ModelsLayout = Instance.new("UIListLayout")
    ModelsLayout.SortOrder = Enum.SortOrder.LayoutOrder
    ModelsLayout.Padding = UDim.new(0, 8)
    ModelsLayout.Parent = ModelsScrollFrame
    
    ModelsLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
        ModelsScrollFrame.CanvasSize = UDim2.new(0, 0, 0, ModelsLayout.AbsoluteContentSize.Y + 12)
    end)
    
    -- Генерация кнопок морфов
    GenerateMorphButtons()
end

function GenerateMorphButtons()
    -- Находим правую панель со списком моделей
    local modelsScroll = ContentScroll:FindFirstChild("HorizontalContainer")
    if modelsScroll then
        modelsScroll = modelsScroll:FindFirstChild("RightPanel")
        if modelsScroll then
            modelsScroll = modelsScroll:FindFirstChild("ModelsScroll")
        end
    end
    
    if not modelsScroll then
        warn("ModelsScroll не найден!")
        return
    end
    
    -- Удаляем старые кнопки морфов
    for _, child in ipairs(modelsScroll:GetChildren()) do
        if child:IsA("TextButton") and child.Name:match("^MorphBtn_") then
            child:Destroy()
        end
    end
    
    -- Создаём новые кнопки
    local buttonIndex = 0
    for _, obj in ipairs(npcFolder:GetChildren()) do
        if obj:IsA("Model") then
            local MorphBtn = Instance.new("TextButton")
            MorphBtn.Name = "MorphBtn_" .. obj.Name
            MorphBtn.Size = UDim2.new(1, 0, 0, 48)
            MorphBtn.BackgroundColor3 = CONFIG.Colors.Background
            MorphBtn.Text = ""
            MorphBtn.AutoButtonColor = false
            MorphBtn.LayoutOrder = buttonIndex
            MorphBtn.Parent = modelsScroll
            
            local MorphCorner = Instance.new("UICorner")
            MorphCorner.CornerRadius = UDim.new(0, 8)
            MorphCorner.Parent = MorphBtn
            
            local MorphStroke = Instance.new("UIStroke")
            MorphStroke.Color = CONFIG.Colors.Border
            MorphStroke.Thickness = 1
            MorphStroke.Transparency = 0.5
            MorphStroke.Parent = MorphBtn
            
            local Icon = Instance.new("TextLabel")
            Icon.Size = UDim2.new(0, 32, 1, 0)
            Icon.Position = UDim2.new(0, 12, 0, 0)
            Icon.BackgroundTransparency = 1
            Icon.Text = "👤"
            Icon.Font = Enum.Font.GothamBold
            Icon.TextSize = 20
            Icon.TextColor3 = CONFIG.Colors.Primary
            Icon.TextXAlignment = Enum.TextXAlignment.Center
            Icon.Parent = MorphBtn
            
            local MorphText = Instance.new("TextLabel")
            MorphText.Size = UDim2.new(1, -64, 1, 0)
            MorphText.Position = UDim2.new(0, 52, 0, 0)
            MorphText.BackgroundTransparency = 1
            MorphText.Text = obj.Name
            MorphText.Font = Enum.Font.GothamSemibold
            MorphText.TextSize = 14
            MorphText.TextColor3 = CONFIG.Colors.Text
            MorphText.TextXAlignment = Enum.TextXAlignment.Left
            MorphText.TextTruncate = Enum.TextTruncate.AtEnd
            MorphText.Parent = MorphBtn
            
            -- Hover эффект
            MorphBtn.MouseEnter:Connect(function()
                TweenService:Create(MorphBtn, TweenInfo.new(0.15, Enum.EasingStyle.Quad), {BackgroundColor3 = CONFIG.Colors.Hover}):Play()
                TweenService:Create(MorphStroke, TweenInfo.new(0.15, Enum.EasingStyle.Quad), {Color = CONFIG.Colors.Primary, Transparency = 0}):Play()
                TweenService:Create(Icon, TweenInfo.new(0.15, Enum.EasingStyle.Quad), {TextSize = 22}):Play()
            end)
            
            MorphBtn.MouseLeave:Connect(function()
                TweenService:Create(MorphBtn, TweenInfo.new(0.15, Enum.EasingStyle.Quad), {BackgroundColor3 = CONFIG.Colors.Background}):Play()
                TweenService:Create(MorphStroke, TweenInfo.new(0.15, Enum.EasingStyle.Quad), {Color = CONFIG.Colors.Border, Transparency = 0.5}):Play()
                TweenService:Create(Icon, TweenInfo.new(0.15, Enum.EasingStyle.Quad), {TextSize = 20}):Play()
            end)
            
            -- Клик для морфа
            MorphBtn.MouseButton1Click:Connect(function()
                MorphInto(obj)
            end)
            
            buttonIndex = buttonIndex + 1
        end
    end
end

-- Сворачивание/разворачивание
MinimizeButton.MouseButton1Click:Connect(function()
    isMinimized = not isMinimized
    
    local targetSize, targetText
    if isMinimized then
        targetSize = UDim2.new(0, CONFIG.Sizes.MinimizedWidth, 0, CONFIG.Sizes.MinimizedHeight)
        targetText = "+"
        MainFrame.ContentFrame.Visible = false
        WebsiteButton.Visible = false
    else
        targetSize = UDim2.new(0, CONFIG.Sizes.MainWidth, 0, CONFIG.Sizes.MainHeight)
        targetText = "−"
        MainFrame.ContentFrame.Visible = true
        WebsiteButton.Visible = true
    end
    
    local tween = TweenService:Create(
        MainFrame,
        TweenInfo.new(CONFIG.Animation.Duration, CONFIG.Animation.EasingStyle, CONFIG.Animation.EasingDirection),
        {Size = targetSize}
    )
    tween:Play()
    MinimizeButton.Text = targetText
end)

-- === Перетаскивание только за Header (мышь + тач) ===
local UserInputService = game:GetService("UserInputService")
local Header = MainFrame:WaitForChild("Header")

local dragging = false
local dragInput, dragStart, startPos

local function update(input)
	local delta = input.Position - dragStart
	MainFrame.Position = UDim2.new(
		startPos.X.Scale,
		startPos.X.Offset + delta.X,
		startPos.Y.Scale,
		startPos.Y.Offset + delta.Y
	)
end

-- Начало перетаскивания
Header.InputBegan:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseButton1 
	or input.UserInputType == Enum.UserInputType.Touch then
		dragging = true
		dragStart = input.Position
		startPos = MainFrame.Position

		local conn
		conn = input.Changed:Connect(function()
			if input.UserInputState == Enum.UserInputState.End then
				dragging = false
				if conn then conn:Disconnect() end
			end
		end)
	end
end)

-- Обновление Input при перемещении
Header.InputChanged:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseMovement 
	or input.UserInputType == Enum.UserInputType.Touch then
		dragInput = input
	end
end)

-- Движение (общее для всех типов ввода)
UserInputService.InputChanged:Connect(function(input)
	if dragging and input == dragInput then
		update(input)
	end
end)

-- ========== ДОБАВЛЕНИЕ ФУНКЦИЙ ==========
local functions = {
    "MORPH",
    "MOVEMENT", 
    "PLAYER",
    "AUTO",
    "BRING",
    "KIDS",
    "WORLD"
}

for i, funcName in ipairs(functions) do
    CreateFunctionButton(funcName, i)
end

-- Анимация появления
MainFrame.Size = UDim2.new(0, 0, 0, 0)
MainFrame.BackgroundTransparency = 1

wait(0.1)

local appearTween = TweenService:Create(
    MainFrame,
    TweenInfo.new(CONFIG.Animation.Duration, CONFIG.Animation.EasingStyle, CONFIG.Animation.EasingDirection),
    {
        Size = UDim2.new(0, CONFIG.Sizes.MainWidth, 0, CONFIG.Sizes.MainHeight),
        BackgroundTransparency = 0.2
    }
)
appearTween:Play()
