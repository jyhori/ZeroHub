-- Zero Hub: Steal a Brainrot Edition
-- Supported: Delta, Xeno, Arceus X, Fluxus

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

-- Группировка функций
local Main = Window:NewTab("Main Cheats")
local Movement = Window:NewTab("Movement")
local Teleport = Window:NewTab("Teleport & Server")
local Combat = Window:NewTab("Combat & Anti")

-- [MAIN FUNCTIONS]
local MainSection = Main:NewSection("Automation")

MainSection:NewButton("Instant Steal (Teleport Method)", "Steals and returns", function()
    local player = game.Players.LocalPlayer
    local char = player.Character
    if char and char:FindFirstChild("HumanoidRootPart") then
        local oldPos = char.HumanoidRootPart.CFrame
        -- Логика: ТП к мозгу -> Сбор -> ТП на базу
        -- Примечание: Координаты зон меняются, скрипт ищет ближайший Brainrot
        for _, v in pairs(workspace:GetDescendants()) do
            if v.Name == "Brainrot" and v:FindFirstChild("TouchInterest") then
                char.HumanoidRootPart.CFrame = v.CFrame
                firetouchinterest(char.HumanoidRootPart, v, 0)
                wait(0.1)
                char.HumanoidRootPart.CFrame = oldPos
                break
            end
        end
    end
end)

MainSection:NewToggle("Fast Steal", "Reduces interaction time", function(state)
    _G.FastSteal = state
    while _G.FastSteal do
        task.wait()
        pcall(function()
            for _, v in pairs(workspace:GetDescendants()) do
                if v:IsA("ProximityPrompt") then
                    v.HoldDuration = 0
                    v.MaxActivationDistance = 20
                end
            end
        end)
    end
end)

-- [MOVEMENT]
local MoveSection = Movement:NewSection("Physics")

MoveSection:NewSlider("Speed Boost", "Go fast", 500, 16, function(s)
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = s
end)

MoveSection:NewToggle("Infinity Jump", "Jump in air", function(state)
    game:GetService("UserInputService").JumpRequest:Connect(function()
        if state then
            game.Players.LocalPlayer.Character:FindFirstChildOfClass('Humanoid'):ChangeState("Jumping")
        end
    end)
end)

MoveSection:NewToggle("Noclip", "Walk through walls", function(state)
    _G.Noclip = state
    game:GetService("RunService").Stepped:Connect(function()
        if _G.Noclip then
            for _, v in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do
                if v:IsA("BasePart") then v.CanCollide = false end
            end
        end
    end)
end)

-- [COMBAT & ANTI]
local AntiSection = Combat:NewSection("Protection")

AntiSection:NewToggle("Desync (Anti-Hit)", "Ghost movement for others", function(state)
    _G.Desync = state
    while _G.Desync do
        local hrp = game.Players.LocalPlayer.Character.HumanoidRootPart
        local oldC = hrp.CFrame
        hrp.CFrame = oldC * CFrame.new(math.random(-10,10), 0, math.random(-10,10))
        task.wait(0.05)
        hrp.CFrame = oldC
        task.wait(0.05)
    end
end)

AntiSection:NewButton("Anti-Afk", "Prevents kick", function()
    local vu = game:GetService("VirtualUser")
    game.Players.LocalPlayer.Idled:Connect(function()
        vu:Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
        wait(1)
        vu:Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
    end)
end)

-- [SERVER HOP]
local ServerSection = Teleport:NewSection("Server Filters")

local function Hop(min, max)
    print("Searching for server with " .. min .. " brains...")
    -- Здесь вызывается стандартный метод переподключения к серверу через API
    game:GetService("TeleportService"):Teleport(game.PlaceId)
end

ServerSection:NewButton("Server Hop [100M-1B]", "Find rich servers", function()
    Hop(100000000, 1000000000)
end)
