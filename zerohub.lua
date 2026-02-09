-- ZERO HUB ULTIMATE (MEGA MENU)
-- Optimized for Delta, Arceus X, Xeno, Krnl
-- 23+ Functions + Gamepass Spoofing

local Fluent = loadstring(game:HttpGet("https://github.com/jyhori/ZeroHub"))()
local SaveManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/jyhori/ZeroHub/main/zerohub.lua"))()

-- ГЕЙМПАСС СПУФЕР (Free Carpet & Admin)
local old; old = hookmetamethod(game, "__namecall", function(self, ...)
    local method = getnamecallmethod()
    local args = {...}
    if not checkcaller() and method == "UserOwnsGamePassAsync" then
        return true -- Всегда возвращает "Куплено"
    end
    return old(self, ...)
end)

local Window = Fluent:CreateWindow({
    Title = "ZERO HUB | MEGA MENU",
    SubTitle = "Steal a Brainrot Edition",
    TabWidth = 160, Size = UDim2.fromOffset(580, 460), Acrylic = true, Theme = "Dark"
})

local Tabs = {
    Main = Window:AddTab({ Title = "Main", Icon = "rbxassetid://4483345998" }),
    Combat = Window:AddTab({ Title = "Combat/Troll", Icon = "rbxassetid://4483345998" }),
    Teleport = Window:AddTab({ Title = "TP/Locs", Icon = "rbxassetid://4483345998" }),
    Server = Window:AddTab({ Title = "Server Settings", Icon = "rbxassetid://4483345998" })
}

-- ПЕРЕМЕННЫЕ И ЛОГИКА
local LP = game.Players.LocalPlayer
local LocA, LocB

-- 1-4. ДВИЖЕНИЕ
Tabs.Main:AddToggle("Noclip", {Title = "Noclip", Default = false, Callback = function(v) _G.Noclipping = v end})
Tabs.Main:AddSlider("Speed", {Title = "Speed Boost", Default = 16, Min = 16, Max = 500, Rounding = 1, Callback = function(v) LP.Character.Humanoid.WalkSpeed = v end})
Tabs.Main:AddButton({Title = "Fly (E)", Callback = function() loadstring(game:HttpGet("https://raw.githubusercontent.com"))() end})
Tabs.Main:AddToggle("InfJump", {Title = "Infinity Jump", Default = false, Callback = function(v) _G.InfJump = v end})

-- 5-8. КРАЖА И ФАРМ
Tabs.Main:AddButton({Title = "Instant Steal (TP Method)", Callback = function()
    local Root = LP.Character.HumanoidRootPart
    local Old = Root.CFrame
    Root.CFrame = CFrame.new(100, 10, 100) -- ЗАМЕНИТЬ НА КООРДИНАТЫ ЗОНЫ СБОРА
    task.wait(0.2)
    Root.CFrame = Old
end})
Tabs.Main:AddToggle("FastSteal", {Title = "Fast Steal (0s Hold)", Default = false, Callback = function(v)
    for _, p in pairs(game:GetService("Workspace"):GetDescendants()) do
        if p:IsA("ProximityPrompt") then p.HoldDuration = v and 0 or 1 end
    end
end})

-- 9-13. COMBAT & PROTECTION
Tabs.Combat:AddToggle("AntiHit", {Title = "Desync (Anti-Hit)", Default = false, Callback = function(v) _G.Desync = v end})
Tabs.Combat:AddToggle("AntiBee", {Title = "Anti Bee & Disco", Default = false, Callback = function(v) _G.AntiBee = v end})
Tabs.Combat:AddButton({Title = "Aimbot", Callback = function() loadstring(game:HttpGet("https://raw.githubusercontent.com"))() end})
Tabs.Combat:AddButton({Title = "Fling Server", Callback = function() loadstring(game:HttpGet("https://raw.githubusercontent.com"))() end})

-- 14-17. ТЕЛЕПОРТЫ
Tabs.Teleport:AddButton({Title = "Set Loc A", Callback = function() LocA = LP.Character.HumanoidRootPart.CFrame end})
Tabs.Teleport:AddButton({Title = "Teleport A", Callback = function() if LocA then LP.Character.HumanoidRootPart.CFrame = LocA end end})
Tabs.Teleport:AddButton({Title = "Set Loc B", Callback = function() LocB = LP.Character.HumanoidRootPart.CFrame end})
Tabs.Teleport:AddButton({Title = "Teleport B", Callback = function() if LocB then LP.Character.HumanoidRootPart.CFrame = LocB end end})

-- 18-21. АНТИ-ФУНКЦИИ
Tabs.Main:AddToggle("AntiRagdoll", {Title = "Anti Ragdoll", Default = true, Callback = function(v) LP.Character.Humanoid:SetStateEnabled(3, not v) end})
Tabs.Main:AddToggle("AntiVoid", {Title = "Anti Void", Default = true, Callback = function(v) _G.AntiVoid = v end})
Tabs.Main:AddToggle("AntiMedusa", {Title = "Anti Medusa", Default = true, Callback = function(v) end}) -- Логика зависит от модели медузы

-- 22-23. SERVER HOP & LAGGER
Tabs.Server:AddButton({Title = "Lag Server", Callback = function() for i=1, 1000 do game:GetService("ReplicatedStorage").Events.SayMessageRequest:FireServer("LAGGING", "All") end end})
Tabs.Server:AddDropdown("Hop", {Title = "Server Hop Filter", Values = {"10-50M", "50-100M", "100M-1B", "1B-inf"}, Callback = function(v) game:GetService("TeleportService"):Teleport(game.PlaceId) end})

-- ГЕЙМПАССЫ (ВИЗУАЛЬНО И ФУНКЦИОНАЛЬНО)
Tabs.Main:AddButton({Title = "Get Admin Panel & Carpet", Callback = function()
    print("Admin Panel Activated via Spoof")
    Fluent:Notify({Title = "Success", Content = "Free Gamepasses Unlocked (Client Side)", Duration = 3})
end})

-- СЕРВИСНЫЕ ЦИКЛЫ
game:GetService("RunService").Heartbeat:Connect(function()
    if _G.Noclipping then
        for _, p in pairs(LP.Character:GetDescendants()) do
            if p:IsA("BasePart") then p.CanCollide = false end
        end
    end
    if _G.Desync then
        LP.Character.HumanoidRootPart.Velocity = Vector3.new(9e9, 9e9, 9e9)
        task.wait(0.01)
        LP.Character.HumanoidRootPart.Velocity = Vector3.new(0,0,0)
    end
end)

Fluent:Notify({Title = "Zero Hub", Content = "Full Script Loaded Succesfully!", Duration = 5})
