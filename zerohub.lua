-- Zero Hub for Steal a Brainrot
-- Supported: Delta, Xeno, Arceus Neo, Krnl

local Library = {Toggle = false}
local ScreenGui = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")
local Title = Instance.new("TextLabel")
local ScrollingFrame = Instance.new("ScrollingFrame")
local UIListLayout = Instance.new("UIListLayout")

-- Настройка GUI
ScreenGui.Name = "ZeroHub"
ScreenGui.Parent = game:GetService("CoreGui")

Frame.Name = "MainFrame"
Frame.Parent = ScreenGui
Frame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
Frame.Position = UDim2.new(0.3, 0, 0.3, 0)
Frame.Size = UDim2.new(0, 250, 0, 350)
Frame.Active = true
Frame.Draggable = true

Title.Parent = Frame
Title.Size = UDim2.new(1, 0, 0, 40)
Title.Text = "ZERO HUB - BRAINROT"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.BackgroundColor3 = Color3.fromRGB(45, 45, 45)

ScrollingFrame.Parent = Frame
ScrollingFrame.Size = UDim2.new(1, 0, 1, -40)
ScrollingFrame.Position = UDim2.new(0, 0, 0, 40)
ScrollingFrame.CanvasSize = UDim2.new(0, 0, 2, 0)

UIListLayout.Parent = ScrollingFrame
UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder

-- Функция создания кнопок
local function CreateButton(name, callback)
    local Button = Instance.new("TextButton")
    Button.Parent = ScrollingFrame
    Button.Size = UDim2.new(1, -10, 0, 40)
    Button.Text = name
    Button.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
    Button.TextColor3 = Color3.fromRGB(255, 255, 255)
    Button.MouseButton1Click:Connect(callback)
end

-- ФУНКЦИИ
CreateButton("Auto Farm", function()
    print("Auto Farm Activated")
    _G.AutoFarm = true
    while _G.AutoFarm do
        -- Логика сбора мозгов (зависит от путей в Workspace)
        task.wait(0.5)
    end
end)

CreateButton("Instant Steal", function()
    -- Пример мгновенной кражи через сокращение времени HoldDuration
    for _, v in pairs(game:GetService("Workspace"):GetDescendants()) do
        if v:IsA("ProximityPrompt") then
            v.HoldDuration = 0
        end
    end
end)

CreateButton("Fly (Press E)", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com"))()
end)

CreateButton("Speed Boost", function()
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 100
end)

CreateButton("Infinite Jump", function()
    game:GetService("UserInputService").JumpRequest:Connect(function()
        game.Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid"):ChangeState("Jumping")
    end)
end)

CreateButton("Server Hop", function()
    local TeleportService = game:GetService("TeleportService")
    TeleportService:Teleport(game.PlaceId, game.Players.LocalPlayer)
end)

-- Проверка на ошибки (Anti-Nil)
if not game:IsLoaded() then game.Loaded:Wait() end
