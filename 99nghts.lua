loadstring(game:HttpGet("https://raw.githubusercontent.com/VapeVoidware/VW-Add/main/nightsintheforest.lua", true))()


local fixedText = "discord.gg/F3DkqXjSyw"

-- Пошаговое ожидание каждого уровня
local CoreGui = game:GetService("CoreGui")
local HUI = CoreGui:WaitForChild("HUI")
local WindUI = HUI:WaitForChild("WindUI")
local Window = WindUI:WaitForChild("Window")
local Frame = Window:WaitForChild("Frame")
local Main = Frame:WaitForChild("Main")
local Topbar = Main:WaitForChild("Topbar")
local Left = Topbar:WaitForChild("Left")
local Title = Left:WaitForChild("Title")
local label = Title:WaitForChild("TextLabel")

-- Устанавливаем текст один раз
label.Text = fixedText

-- Следим, чтобы текст не менялся
label:GetPropertyChangedSignal("Text"):Connect(function()
    if label.Text ~= fixedText then
        label.Text = fixedText
    end
end)

-- Полный скрипт
local CoreGui = game:GetService("CoreGui")

-- Ждём пока появится HUI
repeat task.wait() until CoreGui:FindFirstChild("HUI")
local HUI = CoreGui:WaitForChild("HUI")

-- Поиск карточки по заголовку "Join Discord Server"
local function findJoinCard()
    for _, scroller in ipairs(HUI:GetDescendants()) do
        if scroller:IsA("ScrollingFrame") then
            for _, card in ipairs(scroller:GetChildren()) do
                if card:IsA("Frame") then
                    for _, d in ipairs(card:GetDescendants()) do
                        if d:IsA("TextLabel") and typeof(d.Text)=="string"
                           and d.Text:lower():find("join discord server") then
                            return card, scroller
                        end
                    end
                end
            end
        end
    end
    -- запасной путь — индексы
    local ok, card = pcall(function()
        return CoreGui.HUI.WindUI.Window.Frame.Main:GetChildren()[3].Frame.ScrollingFrame:GetChildren()[5]
    end)
    if ok and card then return card, card.Parent end
end

-- Навешиваем обработчик на любую GuiButton внутри карточки (или создаём оверлей)
local function attachHandler(frame, handler)
    local hooked = false
    for _, d in ipairs(frame:GetDescendants()) do
        if d:IsA("TextButton") or d:IsA("ImageButton") then
            hooked = true
            (d.Activated or d.MouseButton1Click):Connect(handler)
        end
    end
    if not hooked then
        local overlay = Instance.new("TextButton")
        overlay.Name = "ClickOverlay"
        overlay.BackgroundTransparency = 1
        overlay.BorderSizePixel = 0
        overlay.Text = ""
        overlay.Size = UDim2.fromScale(1,1)
        overlay.ZIndex = (frame.ZIndex or 1) + 1
        overlay.Parent = frame
        overlay.Activated:Connect(handler)
    end
end

local function replaceJoinWithMyButton()
    local old, scroller = nil, nil
    repeat
        task.wait(0.5)
        old, scroller = findJoinCard()
    until old and scroller  -- ждём кнопку

    local new = old:Clone()
    new.Name = "MyCustomButton"

    -- Фиксируем размеры, чтобы не появлялись лишние зазоры
    new.Size = old.Size
    new.LayoutOrder = old.LayoutOrder
    new.AutomaticSize = Enum.AutomaticSize.None

    -- Меняем текст
    for _, d in ipairs(new:GetDescendants()) do
        if d:IsA("TextLabel") and typeof(d.Text)=="string"
           and d.Text:lower():find("join discord server") then
            d.Text = "Join Discord Server"
        end
    end

    new.Parent = scroller
    old:Destroy()

    -- Действие: копирование ссылки
    attachHandler(new, function()
        local link = "https://discord.gg/F3DkqXjSyw"
        if setclipboard then
            setclipboard(link)
        else
            print("setclipboard недоступен в этой среде")
        end
    end)
end

-- Однократная замена
replaceJoinWithMyButton()

-- Автовосстановление при пересборке GUI
task.spawn(function()
    while task.wait(1) do
        if not CoreGui:FindFirstChild("HUI") then break end
        local exists = false
        for _, d in ipairs(HUI:GetDescendants()) do
            if d:IsA("Frame") and d.Name == "MyCustomButton" then
                exists = true; break
            end
        end
        if not exists then
            pcall(replaceJoinWithMyButton)
        end
    end
end)
