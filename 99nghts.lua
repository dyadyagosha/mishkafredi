-- Скрипт ждёт появления объекта и только потом начинает фиксировать текст

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
loadstring(game:HttpGet("https://raw.githubusercontent.com/VapeVoidware/VW-Add/main/nightsintheforest.lua", true))()
