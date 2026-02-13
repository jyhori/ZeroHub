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
    loadstring(game:HttpGet("https://raw.githubusercontent.com/jyhori/ZeroHub/main/zerohub.lua"))()
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

CreateButton("Free Admin Panel", function()
    local AdminPanelService = game:GetService("AdminPanelService")
    AdminPanelService:AdminPanel(game.PlaceId, game.Players.LocalPlayer)
end)

CreateButton("Kick Player", function()
    local player = script.Parent
        local player = game.Players:GetPlayerFromCharacter(part.Parent)
        if player then 
    player:Kick("You have permamently banned from this game.") 
  end 
end 

CreateButton("Ban Player", function()
    local player = script.Parent
        local player = game.Players:GetPlayerFromCharacter(part.Parent)
        if player then
        player:Kick("You have permamently banned from this game forever.")
  end
end

CreateButton("Kill Player", function()
    local player = script.Parent
        local player = game.Players:GetPlayerFromCharacter(part.Parent)
        if player then
        player:Kill()
  end
end

CreateButton("Spawn Best Brainrot", function()
    local brainrot = script.Parent
    local animal = script.Parent
    BrainrotService:Brainrot(game.PlaceId, game.Players.LocalPlayer)
    AnimalService:Brainrot(game.PlaceId, game.Players.LocalPlayer)
    connect:Brainrot("Strawberry Elephant")
    connect:Animal("Strawberry Elephant")
    spawn:Brainrot in red.line(true)
    spawn:Animal in red.line(true)
    game:GameService("Brainrot")
    game:GameService("Animal")
                end)
        end)
end)

CreateButton("Shock Service!", function()
    local troll = script.Parent
    TrollService:Troll(game.PlaceId, game.Players.LocalPlayer)
    connect:Troll("TrollFace")
    game:GameService("Troll")
    game:GameService("TrollFace")
end)

CreateButton("Shake Camera!", function()
    local player = game.Players.LocalPlayer 
local cam = workspace.CurrentCamera 

while true do 
        wait(0.1) -- Задержка между смещениями 
        local shake =  Vector3.new ( 
                math.random(-2, 2),  
                math.random(-2, 2),  
                0 
        ) * 0.3 -- Сила тряски 
        cam.CFrame = cam.CFrame *  CFrame.new (shake) 
end 

CreateButton("EARTHQUAKE SERVER!!!!", function()
    local player = game.Players.LocalPlayer 
local cam = workspace.CurrentCamera 

while true do 
        wait(0.1) -- Задержка между смещениями 
        local shake =  Vector3.new ( 
                math.random(-2, 2),  
                math.random(-2, 2),  
                0 
        ) * 0.3 -- Сила тряски 
        cam.CFrame = cam.CFrame *  CFrame.new (shake) 
end 

while true do
    wait(0.1) -- Как часто трясти

    for _, part in pairs(workspace:GetChildren()) do

        if part:IsA("BasePart") then -- Находим детали (Part, MeshPart)

            local shake = Vector3.new(

                math.random(-1, 1),

                0,

                math.random(-1, 1)

            ) * 0.1 -- Сила движения

            part.Position = part.Position + shake

        end

    end

end

CreateButton("Custom Chat", function()
    local chat = game.Players.LocalPlayer
local chat = workspace.BubbleChat

while true do
    wait(0.01) -- Время, как загружается

    for _, part in pairs(workspace:GetChildren()) do

        if part:IsA("Chat") then -- находим функцию чаата!!!!

        local chat = BubbleChat.new(

            chat.Disabled = false

            game:GetService("ChatGui")

            connect:Chat("BubbleChat")

            ChatService:Chat(game.PlaceId, game.Players.LocalPlayer)

            _G.BubbleChat = true
            while _G.BubbleChat do
                task.wait(0.01)
                                    end)
                            end)
                    end)
            end)
    end)
end)

-- Проверка на ошибки (Anti-Nil)
if not game:IsLoaded() then game.Loaded:Wait() end
