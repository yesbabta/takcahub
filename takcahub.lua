-- takcahub - universal
pcall(function()
    for _, g in pairs(game:GetService("CoreGui"):GetChildren()) do
        if g.Name:find("WindUI") then g:Destroy() end
    end
    if gethui then
        for _, g in pairs(gethui():GetChildren()) do
            if g.Name:find("WindUI") then g:Destroy() end
        end
    end
end)
task.wait(0.4)

local WindUI = loadstring(game:HttpGet("https://github.com/Footagesus/WindUI/releases/latest/download/main.lua"))()
if not WindUI then warn("[takcahub] WindUI не загружен") return end

local Players = game:GetService("Players")
local UIS = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local Workspace = game:GetService("Workspace")
local Lighting = game:GetService("Lighting")
local HttpService = game:GetService("HttpService")
local TweenService = game:GetService("TweenService")
local TeleportService = game:GetService("TeleportService")

local START_TIME = os.clock()
local ICON_ASSET = "rbxassetid://97479647106054"

local player = Players.LocalPlayer
local camera = Workspace.CurrentCamera
local mouse = player:GetMouse()

local settings = {
    aimEnabled = true,
    silentAim = false,
    hardLock = false,
    teamCheck = true,
    ignoreFriends = true,
    aimPart = "Head",
    currentBind = Enum.KeyCode.E,
    aimMode = "Hold",
    targetPriority = "Crosshair",
    prediction = 0.0,
    radius = 200,
    smoothness = 0.3,
    circleColor = Color3.fromRGB(124, 92, 255),
    fovVisible = true,
    triggerBot = false,
    triggerDelay = 0.05,
    soundOnToggle = true,
    randomCircleColor = false,
    currentTheme = "Dark",
    walkSpeed = 16,
    jumpPower = 50,
    flyEnabled = false,
    flySpeed = 60,
    noclip = false,
    infJump = false,
    fullbright = false,
    espEnabled = false,
    toggleState = false,
    holdState = false,
    lockedTarget = nil,

    -- CFrame movement
    cframeSpeedEnabled = false,
    cframeSpeed = 28,
    cframeJumpEnabled = false,
    cframeJumpHeight = 3,
    cframeFlyEnabled = false,
    cframeFlySpeed = 65,
    cframeClickTP = false,
    cframeAirWalk = false,
    cframeTeleportStep = 12,

    -- UI
    fontName = "Gotham",
    uiAnimations = true,
    rotatingIcon = true,
}
getgenv().takcahubConfig = settings

local CONFIG_FILE = "takcahub_config.json"

local function saveConfig()
    if not writefile then return false end
    local ok = pcall(function()
        local data = {}
        for k, v in pairs(settings) do
            if typeof(v) == "Color3" then
                data[k] = {__t = "C3", r = v.R, g = v.G, b = v.B}
            elseif typeof(v) == "EnumItem" then
                data[k] = {__t = "E", et = tostring(v.EnumType), n = v.Name}
            elseif k ~= "lockedTarget" and k ~= "toggleState" and k ~= "holdState" then
                data[k] = v
            end
        end
        writefile(CONFIG_FILE, HttpService:JSONEncode(data))
    end)
    return ok
end

local function loadConfig()
    if not isfile or not readfile then return false end
    if not isfile(CONFIG_FILE) then return false end
    local ok = pcall(function()
        local data = HttpService:JSONDecode(readfile(CONFIG_FILE))
        for k, v in pairs(data) do
            if settings[k] ~= nil then
                if type(v) == "table" and v.__t == "C3" then
                    settings[k] = Color3.new(v.r, v.g, v.b)
                elseif type(v) == "table" and v.__t == "E" then
                    local enum = Enum[v.et]
                    if enum then settings[k] = enum[v.n] end
                else
                    settings[k] = v
                end
            end
        end
    end)
    return ok
end

local circle = Drawing.new("Circle")
circle.Visible = false
circle.Radius = settings.radius
circle.Thickness = 1.5
circle.Filled = false
circle.Color = settings.circleColor
circle.Transparency = 1

local function isAlive(char)
    local hum = char:FindFirstChildOfClass("Humanoid")
    return hum and hum.Health > 0
end

local function getCenter()
    return camera.ViewportSize / 2
end

local function insideCircle(sp)
    return (getCenter() - Vector2.new(sp.X, sp.Y)).Magnitude <= settings.radius
end

local function isEnemy(plr)
    if not settings.teamCheck then return true end
    if not plr.Team then return true end
    if player.Team and plr.Team == player.Team then return false end
    return true
end

local function isFriend(plr)
    if not settings.ignoreFriends then return false end
    local ok, friends = pcall(function() return player:GetFriendsOnline() end)
    if ok and friends then
        for _, f in ipairs(friends) do
            if f.VisitorId == plr.UserId or f.Username == plr.Name then return true end
        end
    end
    return false
end

local function getAimPart(char)
    local partName = settings.aimPart
    if partName == "Random" then
        partName = ({"Head", "UpperTorso", "LowerTorso", "Torso"})[math.random(1, 4)]
    elseif partName == "Chest" then partName = "UpperTorso"
    elseif partName == "Body" then partName = "LowerTorso"
    end
    local part = char:FindFirstChild(partName)
    if not part then
        part = char:FindFirstChild("Torso") or char:FindFirstChild("HumanoidRootPart") or char:FindFirstChild("Head")
    end
    return part
end

local function getTarget()
    if settings.hardLock and settings.lockedTarget then
        local part = settings.lockedTarget
        local char = part and part.Parent
        if char and isAlive(char) then return part end
        settings.lockedTarget = nil
    end
    local candidates = {}
    for _, plr in ipairs(Players:GetPlayers()) do
        if plr ~= player and plr.Character then
            local char = plr.Character
            local part = getAimPart(char)
            if part and isAlive(char) and isEnemy(plr) and not isFriend(plr) then
                local sp, onScreen = camera:WorldToViewportPoint(part.Position)
                if onScreen and insideCircle(sp) then
                    table.insert(candidates, {
                        part = part,
                        screenDist = (Vector2.new(sp.X, sp.Y) - getCenter()).Magnitude,
                        worldDist = (camera.CFrame.Position - part.Position).Magnitude,
                        health = char:FindFirstChildOfClass("Humanoid").Health,
                    })
                end
            end
        end
    end
    if #candidates == 0 then return nil end
    table.sort(candidates, function(a, b)
        if settings.targetPriority == "Health" then return a.health < b.health
        elseif settings.targetPriority == "Crosshair" then return a.screenDist < b.screenDist
        else return a.worldDist < b.worldDist end
    end)
    local nearest = candidates[1].part
    if nearest and settings.hardLock then settings.lockedTarget = nearest end
    return nearest
end

local function smoothAim(targetPos)
    local currentCF = camera.CFrame
    local targetCF = CFrame.lookAt(currentCF.Position, targetPos)
    if settings.smoothness > 0 then
        local lerp = 1 - math.exp(-settings.smoothness * 0.5)
        camera.CFrame = currentCF:Lerp(targetCF, lerp)
    else
        camera.CFrame = targetCF
    end
end

local Window = WindUI:CreateWindow({
    Title = "takcahub",
    Icon = ICON_ASSET,
    IconSize = 20,
    ToggleKey = Enum.KeyCode.RightShift,
    Size = UDim2.fromOffset(640, 520),
    MinSize = Vector2.new(520, 420),
    MaxSize = Vector2.new(950, 750),
    Transparent = false,
    Acrylic = true,
    Resizable = true,
    SideBarWidth = 180,
    HideSearchBar = false,
    AutoScale = true,
    Folder = "takcahub",
    User = { Enabled = true, Anonymous = false },
})

-- ========== STATUS / LOGS / UI POLISH ==========
local executorName = "Unknown"
local function detectExecutor()
    local ok, result = pcall(function()
        if type(identifyexecutor) == "function" then
            local a, b = identifyexecutor()
            if a and tostring(a) ~= "" then
                if b and tostring(b) ~= "" then
                    return tostring(a) .. " " .. tostring(b)
                end
                return tostring(a)
            end
        end
        if type(getexecutorname) == "function" then
            local a = getexecutorname()
            if a and tostring(a) ~= "" then return tostring(a) end
        end
        if syn then return "Synapse" end
        if KRNL_LOADED then return "KRNL" end
        if fluxus then return "Fluxus" end
        if is_sirhurt_closure then return "SirHurt" end
        return "Unknown"
    end)
    if ok and result then return result end
    return "Unknown"
end
executorName = detectExecutor()

local function formatUptime(seconds)
    seconds = math.max(0, math.floor(seconds))
    local d = math.floor(seconds / 86400)
    seconds = seconds % 86400
    local h = math.floor(seconds / 3600)
    seconds = seconds % 3600
    local m = math.floor(seconds / 60)
    local s = seconds % 60
    if d > 0 then
        return string.format("%dd %02dh %02dm %02ds", d, h, m, s)
    end
    return string.format("%02dh %02dm %02ds", h, m, s)
end

local logBuffer = {}
local MAX_LOGS = 120
local LogsParagraph = nil

local function pushLog(kind, message)
    local line = string.format("[%s] %s", os.date("%H:%M:%S"), tostring(message))
    table.insert(logBuffer, 1, line)
    while #logBuffer > MAX_LOGS do table.remove(logBuffer) end
    print("[takcahub][" .. tostring(kind) .. "] " .. tostring(message))

    if LogsParagraph then
        pcall(function()
            LogsParagraph:SetDesc(table.concat(logBuffer, "\n"))
        end)
    end
end

local UptimeTag = Window:Tag({
    Title = "Online • 00h 00m 00s",
    Icon = "circle",
    Color = Color3.fromRGB(34, 224, 212),
})

local ExecutorTag = Window:Tag({
    Title = "Injector • " .. executorName,
    Icon = "cpu",
    Color = Color3.fromRGB(124, 92, 255),
})

task.spawn(function()
    while true do
        if not UptimeTag then break end
        pcall(function()
            UptimeTag:SetTitle("Online • " .. formatUptime(os.clock() - START_TIME))
        end)
        task.wait(1)
    end
end)

-- Small rotating icon. It only updates one ImageLabel and has no heavy loop.
task.spawn(function()
    task.wait(1.25)
    pcall(function()
        local gui = WindUI.ScreenGui
        if not gui then return end

        local windowFolder = gui:FindFirstChild("Window")
        local firstWindow = windowFolder and windowFolder:GetChildren()[1]
        local background = firstWindow and firstWindow:FindFirstChild("Background", true)
        if not background then return end

        local spin = Instance.new("ImageLabel")
        spin.Name = "TakcaSpinner"
        spin.BackgroundTransparency = 1
        spin.Size = UDim2.fromOffset(34, 34)
        spin.AnchorPoint = Vector2.new(1, 0)
        spin.Position = UDim2.new(1, -18, 0, 18)
        spin.Image = ICON_ASSET
        spin.ImageTransparency = 0
        spin.ZIndex = 50
        spin.Parent = background

        local stroke = Instance.new("UIStroke")
        stroke.Thickness = 1
        stroke.Transparency = 0.45
        stroke.Parent = spin

        task.spawn(function()
            while spin.Parent do
                if settings.rotatingIcon then
                    spin.Rotation = (spin.Rotation + 1.8) % 360
                end
                RunService.RenderStepped:Wait()
            end
        end)
    end)
end)

pushLog("SYSTEM", "UI loaded • Executor: " .. executorName)

task.spawn(function()
    task.wait(0.9)
    pushLog("SYSTEM", "Window initialized")
end)

task.spawn(function()
    task.wait(1.5)
    pcall(function()
        local gui = WindUI.ScreenGui
        if not gui then return end
        local folder = gui:FindFirstChild("Window")
        if not folder then return end
        local first = folder:GetChildren()[1]
        if not first then return end
        local bg = first:FindFirstChild("Background", true)
        if not bg then return end
        local rc = Instance.new("Frame")
        rc.Name = "RaysContainer"
        rc.Size = UDim2.new(1, 0, 1, 0)
        rc.BackgroundTransparency = 1
        rc.ClipsDescendants = true
        rc.ZIndex = 0
        rc.Parent = bg
        local cor = Instance.new("UICorner")
        cor.CornerRadius = UDim.new(0, 16)
        cor.Parent = rc
        for i = 1, 3 do
            local ray = Instance.new("Frame")
            ray.Size = UDim2.new(0, 260, 0, 260)
            ray.Position = UDim2.new(0.5, -130, 0.5, -130)
            ray.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            ray.BackgroundTransparency = 0.9
            ray.BorderSizePixel = 0
            ray.ZIndex = 0
            ray.Parent = rc
            local rcor = Instance.new("UICorner")
            rcor.CornerRadius = UDim.new(0, 200)
            rcor.Parent = ray
            local grad = Instance.new("UIGradient")
            grad.Color = ColorSequence.new({
                ColorSequenceKeypoint.new(0, Color3.fromRGB(124, 92, 255)),
                ColorSequenceKeypoint.new(0.5, Color3.fromRGB(34, 224, 212)),
                ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 95, 174)),
            })
            grad.Transparency = NumberSequence.new({
                NumberSequenceKeypoint.new(0, 1),
                NumberSequenceKeypoint.new(0.5, 0.75),
                NumberSequenceKeypoint.new(1, 1),
            })
            grad.Rotation = i * 60
            grad.Parent = ray
        end
    end)
end)

local function notify(title, content, icon)
    pushLog(title, content)
    pcall(function()
        WindUI:Notify({ Title = title, Content = content, Duration = 3, Icon = icon or "info" })
    end)
end

-- ========== HOME / STATUS ==========
local HomeTab = Window:Tab({ Title = "Home", Icon = "house" })
HomeTab:Section({ Title = "Profile & Runtime", Opened = true })

local avatarUrl = "rbxthumb://type=AvatarHeadShot&id=" .. tostring(player.UserId) .. "&w=150&h=150"
HomeTab:Paragraph({
    Title = player.DisplayName .. "  •  @" .. player.Name,
    Desc = "Online\nUptime: " .. formatUptime(os.clock() - START_TIME) .. "\nInjector: " .. executorName,
    Image = avatarUrl,
    ImageSize = 44,
    Color = "White",
})

HomeTab:Paragraph({
    Title = "Runtime status",
    Desc = "Session is active.\nMenu: RightShift\nWindUI search: enabled",
    Image = ICON_ASSET,
    ImageSize = 34,
    Color = "White",
})

local RuntimeInfoParagraph = HomeTab:Paragraph({
    Title = "Live information",
    Desc = "Starting...",
    Image = "activity",
    ImageSize = 20,
    Color = "White",
})

task.spawn(function()
    while RuntimeInfoParagraph do
        pcall(function()
            RuntimeInfoParagraph:SetDesc(
                "Status: Online\n" ..
                "Uptime: " .. formatUptime(os.clock() - START_TIME) .. "\n" ..
                "Injector: " .. executorName .. "\n" ..
                "Place ID: " .. tostring(game.PlaceId)
            )
        end)
        task.wait(1)
    end
end)

HomeTab:Button({
    Title = "Test notification",
    Desc = "Checks UI notifications and logging",
    Icon = "bell",
    Callback = function()
        notify("UI", "Everything is responding.", "check")
    end,
})

HomeTab:Toggle({
    Title = "Rotating icon",
    Desc = "Small animated icon in the window",
    Value = settings.rotatingIcon,
    Callback = function(v)
        settings.rotatingIcon = v
        notify("UI", v and "Rotating icon enabled" or "Rotating icon disabled", v and "rotate-cw" or "pause")
    end,
})

HomeTab:Toggle({
    Title = "UI animations",
    Desc = "Lightweight hover/press transitions",
    Value = settings.uiAnimations,
    Callback = function(v)
        settings.uiAnimations = v
        notify("UI", v and "Animations enabled" or "Animations disabled", v and "sparkles" or "pause")
    end,
})

-- ========== LOGS TAB ==========
local LogsTab = Window:Tab({ Title = "Logs", Icon = "scroll-text" })
LogsTab:Section({ Title = "Runtime log", Opened = true })

LogsTab:Input({
    Title = "Log filter",
    Desc = "Optional text to find in the log",
    Placeholder = "type to search...",
    Callback = function(value)
        value = tostring(value or "")
        if value == "" then
            if LogsParagraph then pcall(function() LogsParagraph:SetDesc(table.concat(logBuffer, "\n")) end) end
            return
        end
        local filtered = {}
        for _, line in ipairs(logBuffer) do
            if line:lower():find(value:lower(), 1, true) then
                table.insert(filtered, line)
            end
        end
        if LogsParagraph then pcall(function() LogsParagraph:SetDesc(table.concat(filtered, "\n")) end) end
    end,
})

LogsParagraph = LogsTab:Paragraph({
    Title = "Live events",
    Desc = table.concat(logBuffer, "\n"),
    Image = "terminal",
    ImageSize = 20,
    Color = "White",
})

LogsTab:Button({
    Title = "Clear logs",
    Icon = "trash-2",
    Callback = function()
        table.clear(logBuffer)
        if LogsParagraph then
            pcall(function() LogsParagraph:SetDesc("Log cleared.") end)
        end
        print("[takcahub][SYSTEM] Log cleared")
    end,
})

LogsTab:Button({
    Title = "Copy logs",
    Icon = "copy",
    Callback = function()
        local payload = table.concat(logBuffer, "\n")
        if setclipboard then
            pcall(function() setclipboard(payload) end)
            notify("Logs", "Copied to clipboard.", "copy")
        else
            notify("Logs", "Clipboard API is unavailable.", "x")
        end
    end,
})

-- ========== AIM TAB ==========
local AimTab = Window:Tab({ Title = "Aim", Icon = "crosshair" })
AimTab:Section({ Title = "Aimbot" })

AimTab:Toggle({
    Title = "Enable Aim",
    Desc = "Главный выключатель",
    Value = settings.aimEnabled,
    Callback = function(v)
        settings.aimEnabled = v
        if not v then
            settings.toggleState = false
            settings.holdState = false
            circle.Visible = false
        end
    end,
})

AimTab:Toggle({
    Title = "Silent Aim",
    Desc = "ВНИМАНИЕ: может детектиться античитом",
    Value = settings.silentAim,
    Callback = function(v) settings.silentAim = v end,
})

AimTab:Toggle({
    Title = "Hard Lock",
    Value = settings.hardLock,
    Callback = function(v) settings.hardLock = v end,
})

AimTab:Toggle({
    Title = "Team Check",
    Value = settings.teamCheck,
    Callback = function(v) settings.teamCheck = v end,
})

AimTab:Toggle({
    Title = "Ignore Friends",
    Value = settings.ignoreFriends,
    Callback = function(v) settings.ignoreFriends = v end,
})

AimTab:Dropdown({
    Title = "Aim Part",
    Values = { "Head", "Chest", "Body", "Random" },
    Value = settings.aimPart,
    Callback = function(v) settings.aimPart = v end,
})

AimTab:Dropdown({
    Title = "Priority",
    Values = { "Crosshair", "Distance", "Health" },
    Value = settings.targetPriority,
    Callback = function(v) settings.targetPriority = v end,
})

AimTab:Dropdown({
    Title = "Mode",
    Values = { "Hold", "Toggle" },
    Value = settings.aimMode,
    Callback = function(v)
        settings.aimMode = v
        settings.toggleState = false
        settings.holdState = false
        circle.Visible = false
    end,
})

local bindMap = {
    R = Enum.KeyCode.R, E = Enum.KeyCode.E, F = Enum.KeyCode.F,
    Q = Enum.KeyCode.Q, C = Enum.KeyCode.C, V = Enum.KeyCode.V,
    Shift = Enum.KeyCode.LeftShift, ["L-Ctrl"] = Enum.KeyCode.LeftControl,
}

local curBind = "E"
for n, k in pairs(bindMap) do
    if k == settings.currentBind then curBind = n end
end

AimTab:Dropdown({
    Title = "Bind Key",
    Values = { "R", "E", "F", "Q", "C", "V", "Shift", "L-Ctrl" },
    Value = curBind,
    Callback = function(v) if bindMap[v] then settings.currentBind = bindMap[v] end end,
})

AimTab:Slider({
    Title = "Prediction",
    Min = 0, Max = 100, Step = 1,
    Value = { Min = 0, Max = 100, Default = settings.prediction * 100 },
    Callback = function(v) settings.prediction = v / 100 end,
})

AimTab:Section({ Title = "Trigger Bot" })

AimTab:Toggle({
    Title = "Enable Trigger",
    Value = settings.triggerBot,
    Callback = function(v) settings.triggerBot = v end,
})

AimTab:Slider({
    Title = "Trigger Delay (ms)",
    Min = 1, Max = 200, Step = 1,
    Value = { Min = 1, Max = 200, Default = settings.triggerDelay * 1000 },
    Callback = function(v) settings.triggerDelay = v / 1000 end,
})

-- ========== VISUALS TAB ==========
local VisualsTab = Window:Tab({ Title = "Visuals", Icon = "eye" })
VisualsTab:Section({ Title = "FOV" })

VisualsTab:Toggle({
    Title = "Show FOV",
    Value = settings.fovVisible,
    Callback = function(v)
        settings.fovVisible = v
        circle.Visible = v and (settings.toggleState or settings.holdState)
    end,
})

VisualsTab:Slider({
    Title = "FOV Radius",
    Min = 30, Max = 600, Step = 10,
    Value = { Min = 30, Max = 600, Default = settings.radius },
    Callback = function(v)
        settings.radius = v
        circle.Radius = v
    end,
})

VisualsTab:Slider({
    Title = "Smoothness",
    Min = 0, Max = 100, Step = 1,
    Value = { Min = 0, Max = 100, Default = settings.smoothness * 100 },
    Callback = function(v) settings.smoothness = v / 100 end,
})

local colorMap = {
    White = Color3.fromRGB(255, 255, 255),
    Red = Color3.fromRGB(255, 0, 0),
    Green = Color3.fromRGB(0, 255, 0),
    Blue = Color3.fromRGB(0, 0, 255),
    Purple = Color3.fromRGB(124, 92, 255),
    Cyan = Color3.fromRGB(34, 224, 212),
    Pink = Color3.fromRGB(255, 95, 174),
    Orange = Color3.fromRGB(255, 140, 0),
}

local ccName = "Purple"
for n, c in pairs(colorMap) do if c == settings.circleColor then ccName = n end end

VisualsTab:Dropdown({
    Title = "Circle Color",
    Values = { "White", "Red", "Green", "Blue", "Purple", "Cyan", "Pink", "Orange" },
    Value = ccName,
    Callback = function(v) settings.circleColor = colorMap[v] or Color3.new(1, 1, 1) end,
})

VisualsTab:Toggle({
    Title = "Random Circle Color",
    Value = settings.randomCircleColor,
    Callback = function(v) settings.randomCircleColor = v end,
})

VisualsTab:Section({ Title = "World" })

VisualsTab:Toggle({
    Title = "Fullbright",
    Desc = "Убирает темноту",
    Value = settings.fullbright,
    Callback = function(v)
        settings.fullbright = v
        if v then
            Lighting.Brightness = 3
            Lighting.ClockTime = 14
            Lighting.GlobalShadows = false
            Lighting.FogEnd = 1e6
        else
            Lighting.Brightness = 1
            Lighting.ClockTime = 12
            Lighting.GlobalShadows = true
            Lighting.FogEnd = 100000
        end
    end,
})

-- ========== PLAYER TAB ==========
local PlayerTab = Window:Tab({ Title = "Player", Icon = "user" })
PlayerTab:Section({ Title = "Движение" })

PlayerTab:Slider({
    Title = "WalkSpeed",
    Min = 16, Max = 200, Step = 1,
    Value = { Min = 16, Max = 200, Default = settings.walkSpeed },
    Callback = function(v)
        settings.walkSpeed = v
        if player.Character then
            local h = player.Character:FindFirstChildOfClass("Humanoid")
            if h then h.WalkSpeed = v end
        end
    end,
})

PlayerTab:Slider({
    Title = "JumpPower",
    Min = 50, Max = 500, Step = 5,
    Value = { Min = 50, Max = 500, Default = settings.jumpPower },
    Callback = function(v)
        settings.jumpPower = v
        if player.Character then
            local h = player.Character:FindFirstChildOfClass("Humanoid")
            if h then h.JumpPower = v; h.UseJumpPower = true end
        end
    end,
})

PlayerTab:Toggle({
    Title = "Infinite Jump",
    Value = settings.infJump,
    Callback = function(v) settings.infJump = v end,
})

PlayerTab:Toggle({
    Title = "Noclip",
    Desc = "Проходить сквозь стены",
    Value = settings.noclip,
    Callback = function(v) settings.noclip = v end,
})

PlayerTab:Section({ Title = "Fly" })

PlayerTab:Toggle({
    Title = "Enable Fly",
    Value = settings.flyEnabled,
    Callback = function(v) settings.flyEnabled = v end,
})

PlayerTab:Slider({
    Title = "Fly Speed",
    Min = 10, Max = 300, Step = 5,
    Value = { Min = 10, Max = 300, Default = settings.flySpeed },
    Callback = function(v) settings.flySpeed = v end,
})

-- ========== CFRAME MOVEMENT ==========
PlayerTab:Section({ Title = "CFrame Movement" })

PlayerTab:Toggle({
    Title = "CFrame Speed",
    Desc = "Move using Humanoid.MoveDirection + CFrame",
    Value = settings.cframeSpeedEnabled,
    Callback = function(v)
        settings.cframeSpeedEnabled = v
        if v then
            settings.flyEnabled = false
            notify("CFrame Speed", "Enabled", "move")
        else
            notify("CFrame Speed", "Disabled", "pause")
        end
    end,
})

PlayerTab:Slider({
    Title = "CFrame Speed",
    Min = 1, Max = 150, Step = 1,
    Value = { Min = 1, Max = 150, Default = settings.cframeSpeed },
    Callback = function(v)
        settings.cframeSpeed = v
    end,
})

PlayerTab:Toggle({
    Title = "CFrame Jump",
    Desc = "CFrame-based vertical jump while Space is held",
    Value = settings.cframeJumpEnabled,
    Callback = function(v)
        settings.cframeJumpEnabled = v
        notify("CFrame Jump", v and "Enabled" or "Disabled", v and "arrow-up" or "pause")
    end,
})

PlayerTab:Slider({
    Title = "Jump Step",
    Min = 0.5, Max = 15, Step = 0.5,
    Value = { Min = 0.5, Max = 15, Default = settings.cframeJumpHeight },
    Callback = function(v)
        settings.cframeJumpHeight = v
    end,
})

PlayerTab:Toggle({
    Title = "CFrame Fly",
    Desc = "WASD + Space/Shift, without BodyVelocity",
    Value = settings.cframeFlyEnabled,
    Callback = function(v)
        settings.cframeFlyEnabled = v
        if v then
            settings.cframeSpeedEnabled = false
            settings.flyEnabled = false
            notify("CFrame Fly", "Enabled", "plane")
        else
            notify("CFrame Fly", "Disabled", "pause")
        end
    end,
})

PlayerTab:Slider({
    Title = "CFrame Fly Speed",
    Min = 10, Max = 300, Step = 5,
    Value = { Min = 10, Max = 300, Default = settings.cframeFlySpeed },
    Callback = function(v)
        settings.cframeFlySpeed = v
    end,
})

PlayerTab:Toggle({
    Title = "CFrame Air Walk",
    Desc = "Hold Space to keep a controlled vertical offset",
    Value = settings.cframeAirWalk,
    Callback = function(v) settings.cframeAirWalk = v end,
})

PlayerTab:Toggle({
    Title = "Click Teleport",
    Desc = "Left click moves the character to mouse.Hit",
    Value = settings.cframeClickTP,
    Callback = function(v)
        settings.cframeClickTP = v
        notify("Click Teleport", v and "Enabled" or "Disabled", v and "mouse-pointer-2" or "pause")
    end,
})

PlayerTab:Slider({
    Title = "Forward Teleport Step",
    Min = 2, Max = 60, Step = 1,
    Value = { Min = 2, Max = 60, Default = settings.cframeTeleportStep },
    Callback = function(v) settings.cframeTeleportStep = v end,
})

PlayerTab:Button({
    Title = "CFrame Step Forward",
    Desc = "Move forward by the selected distance",
    Icon = "arrow-right",
    Callback = function()
        pcall(function()
            local char = player.Character
            local hrp = char and char:FindFirstChild("HumanoidRootPart")
            if hrp then
                hrp.CFrame = hrp.CFrame + hrp.CFrame.LookVector * settings.cframeTeleportStep
                notify("CFrame", "Moved forward " .. settings.cframeTeleportStep, "move")
            end
        end)
    end,
})

-- ========== THEMES TAB ==========
local ThemesTab = Window:Tab({ Title = "Themes", Icon = "palette" })
ThemesTab:Section({ Title = "16 тем WindUI" })

local availableThemes = {
    "Dark", "Light", "Rose", "Plant", "Red", "Indigo",
    "Sky", "Violet", "Amber", "Emerald", "Midnight",
    "Crimson", "MonokaiPro", "CottonCandy", "Mellowsi", "Rainbow"
}
pcall(function()
    for themeName in pairs(WindUI:GetThemes()) do
        if table.find(availableThemes, themeName) == nil then
            table.insert(availableThemes, themeName)
        end
    end
end)
table.sort(availableThemes)

ThemesTab:Dropdown({
    Title = "Theme",
    Desc = "Смена темы",
    Values = availableThemes,
    Value = settings.currentTheme,
    SearchBarEnabled = true,
    MenuWidth = 280,
    Callback = function(v)
        settings.currentTheme = v
        pcall(function() WindUI:SetTheme(v) end)
        notify("Theme", "Установлена: " .. v, "palette")
    end,
})

local fontMap = {
    Gotham = Enum.Font.Gotham,
    GothamBold = Enum.Font.GothamBold,
    SourceSans = Enum.Font.SourceSans,
    SourceSansBold = Enum.Font.SourceSansBold,
    Roboto = Enum.Font.Roboto,
    RobotoMono = Enum.Font.RobotoMono,
    Code = Enum.Font.Code,
    Arcade = Enum.Font.Arcade,
    Fantasy = Enum.Font.Fantasy,
    SciFi = Enum.Font.SciFi,
    Ubuntu = Enum.Font.Ubuntu,
}

local function applyFont(name)
    local font = fontMap[name] or Enum.Font.Gotham
    settings.fontName = name
    pcall(function()
        local gui = WindUI.ScreenGui
        if not gui then return end
        for _, obj in ipairs(gui:GetDescendants()) do
            if obj:IsA("TextLabel") or obj:IsA("TextButton") or obj:IsA("TextBox") then
                obj.Font = font
            end
        end
    end)
end

ThemesTab:Dropdown({
    Title = "Interface font",
    Desc = "Changes visible UI text",
    Values = { "Gotham", "GothamBold", "SourceSans", "SourceSansBold", "Roboto", "RobotoMono", "Code", "Arcade", "Fantasy", "SciFi", "Ubuntu" },
    Value = settings.fontName,
    SearchBarEnabled = true,
    MenuWidth = 240,
    Callback = function(v)
        applyFont(v)
        notify("Font", "Selected: " .. v, "type")
    end,
})

ThemesTab:Toggle({
    Title = "Lightweight animations",
    Desc = "Hover/press UI tweens",
    Value = settings.uiAnimations,
    Callback = function(v)
        settings.uiAnimations = v
    end,
})

-- ========== MISC TAB (скрипты) ==========
local MiscTab = Window:Tab({ Title = "Misc", Icon = "wrench" })
MiscTab:Section({ Title = "Полезные скрипты" })

local function runScript(url, name)
    notify("Script", "Запуск: " .. name, "download")
    task.spawn(function()
        local ok, err = pcall(function()
            loadstring(game:HttpGet(url))()
        end)
        if not ok then
            notify("Script Error", tostring(err), "x")
        end
    end)
end

MiscTab:Button({
    Title = "Infinite Yield",
    Desc = "Админ-команды",
    Callback = function()
        runScript("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source", "Infinite Yield")
    end,
})

MiscTab:Button({
    Title = "Nameless Admin",
    Desc = "Мощный админ-скрипт",
    Callback = function()
        runScript("https://raw.githubusercontent.com/FilteringEnabled/NamelessAdmin/main/Source", "Nameless Admin")
    end,
})

MiscTab:Button({
    Title = "Dark Dex",
    Desc = "Просмотр дерева игры",
    Callback = function()
        runScript("https://raw.githubusercontent.com/Babyhamsta/RBLX_Scripts/main/Universal/Loadstring.lua", "Dark Dex")
    end,
})

MiscTab:Button({
    Title = "SimpleSpy",
    Desc = "Remote Spy",
    Callback = function()
        runScript("https://raw.githubusercontent.com/78n/SimpleSpy/main/SimpleSpy.lua", "SimpleSpy")
    end,
})

MiscTab:Button({
    Title = "Hydroxide",
    Desc = "Remote Spy / Debug",
    Callback = function()
        runScript("https://raw.githubusercontent.com/Upbolt/Hydroxide/master/src/hydroxide.lua", "Hydroxide")
    end,
})

MiscTab:Button({
    Title = "OWL Hub",
    Desc = "Универсальный чит-хаб",
    Callback = function()
        runScript("https://raw.githubusercontent.com/OWL-Hub/OWL-Hub/main/Loader.lua", "OWL Hub")
    end,
})

MiscTab:Button({
    Title = "IY Network (Rejoin)",
    Desc = "Переподключение",
    Callback = function()
        runScript("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source", "IY")
    end,
})

MiscTab:Section({ Title = "Утилиты" })

MiscTab:Button({
    Title = "Rejoin Server",
    Callback = function()
        pcall(function()
            game:GetService("TeleportService"):Teleport(game.PlaceId, player)
        end)
    end,
})

MiscTab:Button({
    Title = "Server Hop",
    Callback = function()
        local ok = pcall(function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"))()
        end)
    end,
})

MiscTab:Button({
    Title = "Reset Character",
    Callback = function()
        pcall(function()
            if player.Character then
                player.Character:BreakJoints()
            end
        end)
    end,
})

-- More Misc utilities
MiscTab:Section({ Title = "Extra utilities" })

MiscTab:Button({
    Title = "Anti AFK",
    Desc = "Prevents idle kick using a lightweight input pulse",
    Icon = "clock-3",
    Callback = function()
        local VU = game:GetService("VirtualUser")
        local conn
        conn = player.Idled:Connect(function()
            pcall(function()
                VU:Button2Down(Vector2.new(0, 0), camera.CFrame)
                task.wait(0.05)
                VU:Button2Up(Vector2.new(0, 0), camera.CFrame)
            end)
        end)
        pushLog("MISC", "Anti AFK handler attached")
        notify("Anti AFK", "Enabled for this session.", "check")
    end,
})

MiscTab:Button({
    Title = "Copy Place ID",
    Desc = "Copies the current PlaceId",
    Icon = "copy",
    Callback = function()
        local id = tostring(game.PlaceId)
        if setclipboard then
            pcall(function() setclipboard(id) end)
            notify("Place ID", id .. " copied.", "copy")
        else
            notify("Place ID", id, "hash")
        end
    end,
})

MiscTab:Button({
    Title = "Client FPS",
    Desc = "Shows a short FPS sample",
    Icon = "gauge",
    Callback = function()
        task.spawn(function()
            local frames = 0
            local start = os.clock()
            local connection
            connection = RunService.RenderStepped:Connect(function()
                frames += 1
                if os.clock() - start >= 1 then
                    connection:Disconnect()
                    notify("FPS", tostring(frames) .. " frames/sec sample", "gauge")
                end
            end)
        end)
    end,
})

MiscTab:Button({
    Title = "Rejoin",
    Desc = "Teleport back into the current PlaceId",
    Icon = "refresh-cw",
    Callback = function()
        pcall(function()
            TeleportService:Teleport(game.PlaceId, player)
        end)
    end,
})

MiscTab:Button({
    Title = "Leave Server",
    Desc = "Closes the local client session",
    Icon = "log-out",
    Callback = function()
        pcall(function()
            game:Shutdown()
        end)
    end,
})

MiscTab:Section({ Title = "Extra loaders" })

local extraLoaders = {
    { "CMD-X", "https://raw.githubusercontent.com/CMD-X/CMD-X/master/Source", "Command utility" },
    { "Hydroxide Bootstrap", "https://raw.githubusercontent.com/Upbolt/Hydroxide/master/src/init.lua", "Hydroxide bootstrap" },
    { "SimpleSpy Loader", "https://raw.githubusercontent.com/78n/SimpleSpy/main/SimpleSpy.lua", "Remote inspection" },
    { "Nameless Admin", "https://raw.githubusercontent.com/FilteringEnabled/NamelessAdmin/main/Source", "Admin-style commands" },
}

for _, item in ipairs(extraLoaders) do
    MiscTab:Button({
        Title = item[1],
        Desc = item[3],
        Icon = "play",
        Callback = function()
            runScript(item[2], item[1])
        end,
    })
end

-- ========== CONFIG TAB ==========
local ConfigTab = Window:Tab({ Title = "Config", Icon = "save" })
ConfigTab:Section({ Title = "Управление" })

ConfigTab:Button({
    Title = "Save Config",
    Callback = function()
        if saveConfig() then notify("Config", "Сохранено", "check")
        else notify("Config", "Ошибка", "x") end
    end,
})

ConfigTab:Button({
    Title = "Load Config",
    Callback = function()
        if loadConfig() then
            notify("Config", "Загружено", "check")
            circle.Radius = settings.radius
            circle.Color = settings.circleColor
            pcall(function() WindUI:SetTheme(settings.currentTheme) end)
        else
            notify("Config", "Ошибка", "x")
        end
    end,
})

ConfigTab:Button({
    Title = "Delete Config",
    Callback = function()
        if delfile and isfile and isfile(CONFIG_FILE) then
            delfile(CONFIG_FILE)
            notify("Config", "Удалено", "trash")
        end
    end,
})

ConfigTab:Button({
    Title = "Reset Defaults",
    Callback = function()
        settings.radius = 200
        settings.smoothness = 0.3
        settings.circleColor = Color3.fromRGB(124, 92, 255)
        settings.targetPriority = "Crosshair"
        settings.prediction = 0.0
        settings.aimPart = "Head"
        settings.aimMode = "Hold"
        settings.triggerDelay = 0.05
        settings.currentTheme = "Dark"
        settings.walkSpeed = 16
        settings.jumpPower = 50
        settings.flySpeed = 60
        circle.Radius = settings.radius
        circle.Color = settings.circleColor
        pcall(function() WindUI:SetTheme("Dark") end)
        notify("Config", "Сброшено", "refresh-cw")
    end,
})

-- ========== HOTKEYS ==========
UIS.InputBegan:Connect(function(input, gp)
    if gp then return end
    if settings.infJump and input.KeyCode == Enum.KeyCode.Space then
        if player.Character then
            local h = player.Character:FindFirstChildOfClass("Humanoid")
            if h then h:ChangeState(Enum.HumanoidStateType.Jumping) end
        end
    end
    if not settings.aimEnabled then return end
    if input.KeyCode == settings.currentBind then
        if settings.aimMode == "Toggle" then
            settings.toggleState = not settings.toggleState
            circle.Visible = settings.toggleState and settings.fovVisible
            if not settings.toggleState then settings.lockedTarget = nil end
        elseif settings.aimMode == "Hold" then
            settings.holdState = true
            circle.Visible = settings.fovVisible
        end
    end
end)

UIS.InputEnded:Connect(function(input)
    if not settings.aimEnabled then return end
    if input.KeyCode == settings.currentBind and settings.aimMode == "Hold" then
        settings.holdState = false
        circle.Visible = false
        settings.lockedTarget = nil
    end
end)

-- ========== SILENT AIM (опционально, только если включён) ==========
local silentHooked = false
local oldIndexRef = nil

local function applySilentHook()
    if silentHooked then return end
    local ok = pcall(function()
        local mt = getrawmetatable(game)
        if not mt then return end
        oldIndexRef = mt.__index
        setreadonly(mt, false)
        mt.__index = newcclosure(function(self, key)
            if settings.silentAim and settings.aimEnabled then
                local active = settings.toggleState or settings.holdState
                if active then
                    local isMouse = (self == mouse) or tostring(self) == "Mouse"
                    if isMouse and (key == "Hit" or key == "Target") then
                        local target = getTarget()
                        if target then
                            if key == "Hit" then return CFrame.new(target.Position)
                            elseif key == "Target" then return target end
                        end
                    end
                end
            end
            return oldIndexRef(self, key)
        end)
        setreadonly(mt, true)
        silentHooked = true
    end)
end

local function removeSilentHook()
    if not silentHooked then return end
    pcall(function()
        local mt = getrawmetatable(game)
        if mt and oldIndexRef then
            setreadonly(mt, false)
            mt.__index = oldIndexRef
            setreadonly(mt, true)
        end
    end)
    silentHooked = false
end

-- ========== MAIN LOOPS ==========
local hue = 0

RunService.RenderStepped:Connect(function(dt)
    if settings.randomCircleColor then
        hue = (hue + dt * 0.2) % 1
        circle.Color = Color3.fromHSV(hue, 1, 1)
    else
        circle.Color = settings.circleColor
    end

    if settings.silentAim and settings.aimEnabled and not silentHooked then
        applySilentHook()
    elseif not settings.silentAim and silentHooked then
        removeSilentHook()
    end

    if not settings.aimEnabled then
        circle.Visible = false
        return
    end

    local active = settings.toggleState or settings.holdState
    if not active then
        circle.Visible = false
        return
    end

    circle.Visible = settings.fovVisible
    circle.Position = getCenter()
    circle.Radius = settings.radius

    if not settings.silentAim then
        local target = getTarget()
        if target then smoothAim(target.Position) end
    end
end)

local lastTrigger = 0
RunService.RenderStepped:Connect(function()
    if not settings.triggerBot then return end
    local now = tick()
    if now - lastTrigger < settings.triggerDelay then return end
    local target = getTarget()
    if not target then return end
    local sp = camera:WorldToViewportPoint(target.Position)
    local dist = (Vector2.new(sp.X, sp.Y) - getCenter()).Magnitude
    if dist > 15 then return end
    lastTrigger = now
    if mouse1click then mouse1click() end
end)

-- Noclip
RunService.Stepped:Connect(function()
    if not settings.noclip then return end
    if not player.Character then return end
    for _, p in ipairs(player.Character:GetDescendants()) do
        if p:IsA("BasePart") and p.CanCollide then p.CanCollide = false end
    end
end)

-- Fly
local flyBodyVel, flyBodyGyro
RunService.RenderStepped:Connect(function(dt)
    if not player.Character then return end
    local hrp = player.Character:FindFirstChild("HumanoidRootPart")
    if not hrp then return end

    if settings.flyEnabled then
        local h = player.Character:FindFirstChildOfClass("Humanoid")
        if h then h.PlatformStand = true end
        if not flyBodyVel then
            flyBodyVel = Instance.new("BodyVelocity")
            flyBodyVel.MaxForce = Vector3.new(1e5, 1e5, 1e5)
            flyBodyVel.Velocity = Vector3.zero
            flyBodyVel.Parent = hrp
        end
        if not flyBodyGyro then
            flyBodyGyro = Instance.new("BodyGyro")
            flyBodyGyro.MaxTorque = Vector3.new(1e5, 1e5, 1e5)
            flyBodyGyro.P = 1e4
            flyBodyGyro.Parent = hrp
        end
        local move = Vector3.zero
        if UIS:IsKeyDown(Enum.KeyCode.W) then move += camera.CFrame.LookVector end
        if UIS:IsKeyDown(Enum.KeyCode.S) then move -= camera.CFrame.LookVector end
        if UIS:IsKeyDown(Enum.KeyCode.A) then move -= camera.CFrame.RightVector end
        if UIS:IsKeyDown(Enum.KeyCode.D) then move += camera.CFrame.RightVector end
        if UIS:IsKeyDown(Enum.KeyCode.Space) then move += Vector3.new(0, 1, 0) end
        if UIS:IsKeyDown(Enum.KeyCode.LeftShift) then move -= Vector3.new(0, 1, 0) end
        if move.Magnitude > 0 then move = move.Unit * settings.flySpeed end
        flyBodyVel.Velocity = move
        flyBodyGyro.CFrame = camera.CFrame
    else
        if flyBodyVel then flyBodyVel:Destroy() flyBodyVel = nil end
        if flyBodyGyro then flyBodyGyro:Destroy() flyBodyGyro = nil end
    end
end)

-- ========== CFRAME RUNTIME ==========
local cframeClickConnection = mouse.Button1Down:Connect(function()
    if not settings.cframeClickTP then return end
    pcall(function()
        local char = player.Character
        local hrp = char and char:FindFirstChild("HumanoidRootPart")
        if hrp and mouse.Hit then
            hrp.CFrame = CFrame.new(mouse.Hit.Position + Vector3.new(0, 3, 0))
            pushLog("CFRAME", "Click teleport")
        end
    end)
end)

RunService.RenderStepped:Connect(function(dt)
    local char = player.Character
    local hrp = char and char:FindFirstChild("HumanoidRootPart")
    local humanoid = char and char:FindFirstChildOfClass("Humanoid")
    if not hrp or not humanoid then return end

    pcall(function()
        if settings.cframeSpeedEnabled then
            local dir = humanoid.MoveDirection
            if dir.Magnitude > 0 then
                hrp.CFrame = hrp.CFrame + dir.Unit * settings.cframeSpeed * dt
            end
        end

        if settings.cframeFlyEnabled then
            local move = Vector3.zero
            if UIS:IsKeyDown(Enum.KeyCode.W) then move += camera.CFrame.LookVector end
            if UIS:IsKeyDown(Enum.KeyCode.S) then move -= camera.CFrame.LookVector end
            if UIS:IsKeyDown(Enum.KeyCode.A) then move -= camera.CFrame.RightVector end
            if UIS:IsKeyDown(Enum.KeyCode.D) then move += camera.CFrame.RightVector end
            if UIS:IsKeyDown(Enum.KeyCode.Space) then move += Vector3.yAxis end
            if UIS:IsKeyDown(Enum.KeyCode.LeftShift) then move -= Vector3.yAxis end
            if move.Magnitude > 0 then
                hrp.CFrame = hrp.CFrame + move.Unit * settings.cframeFlySpeed * dt
            end
        elseif settings.cframeJumpEnabled and UIS:IsKeyDown(Enum.KeyCode.Space) then
            hrp.CFrame = hrp.CFrame + Vector3.yAxis * settings.cframeJumpHeight * dt * 12
        elseif settings.cframeAirWalk and UIS:IsKeyDown(Enum.KeyCode.Space) then
            hrp.CFrame = hrp.CFrame + Vector3.yAxis * settings.cframeJumpHeight * dt * 8
        end
    end)
end)

-- Respавн: восстановление
player.CharacterAdded:Connect(function(char)
    task.wait(1)
    local h = char:WaitForChild("Humanoid", 5)
    if h then
        h.WalkSpeed = settings.walkSpeed
        h.JumpPower = settings.jumpPower
    end
end)

-- ========== LIGHT UI ANIMATIONS ==========
local function setupUIAnimations()
    if not settings.uiAnimations then return end
    pcall(function()
        local gui = WindUI.ScreenGui
        if not gui then return end

        for _, obj in ipairs(gui:GetDescendants()) do
            if (obj:IsA("TextButton") or obj:IsA("ImageButton")) and not obj:GetAttribute("TakcaAnimated") then
                obj:SetAttribute("TakcaAnimated", true)
                local baseSize = obj.Size
                local hoverSize = UDim2.new(
                    baseSize.X.Scale, baseSize.X.Offset + 2,
                    baseSize.Y.Scale, baseSize.Y.Offset + 2
                )

                obj.MouseEnter:Connect(function()
                    if not settings.uiAnimations then return end
                    pcall(function()
                        TweenService:Create(
                            obj,
                            TweenInfo.new(0.12, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                            { Size = hoverSize }
                        ):Play()
                    end)
                end)

                obj.MouseLeave:Connect(function()
                    pcall(function()
                        TweenService:Create(
                            obj,
                            TweenInfo.new(0.12, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                            { Size = baseSize }
                        ):Play()
                    end)
                end)
            end
        end
    end)
end

task.spawn(function()
    task.wait(1.8)
    applyFont(settings.fontName)
    setupUIAnimations()
end)

notify("takcahub", "RightShift — меню. Aim ВКЛ.", "check")
print("[takcahub] loaded. Menu: RightShift")
