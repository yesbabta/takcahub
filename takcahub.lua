pcall(function()
for _, g in pairs(game:GetService(string.char(67,111,114,101,71,117,105)):GetChildren()) do
if g.Name:find(string.char(87,105,110,100,85,73)) then g:Destroy() end
end
if gethui then
for _, g in pairs(gethui():GetChildren()) do
if g.Name:find(string.char(87,105,110,100,85,73)) then g:Destroy() end
end
end
end)
task.wait(0.4)
local _0xA442 = loadstring(game:HttpGet(string.char(104,116,116,112,115,58,47,47,103,105,116,104,117,98,46,99,111,109,47,70,111,111,116,97,103,101,115,117,115,47,87,105,110,100,85,73,47,114,101,108,101,97,115,101,115,47,108,97,116,101,115,116,47,100,111,119,110,108,111,97,100,47,109,97,105,110,46,108,117,97)))()
if not _0xA442 then warn(string.char(91,116,97,107,99,97,104,117,98,93,32,87,105,110,100,85,73,32,208,189,208,181,32,208,183,208,176,208,179,209,128,209,131,208,182,208,181,208,189)) return end
local _0x6171 = game:GetService(string.char(80,108,97,121,101,114,115))
local _0x375C = game:GetService(string.char(85,115,101,114,73,110,112,117,116,83,101,114,118,105,99,101))
local _0x1263 = game:GetService(string.char(82,117,110,83,101,114,118,105,99,101))
local _0xF061 = game:GetService(string.char(87,111,114,107,115,112,97,99,101))
local _0x3761 = game:GetService(string.char(76,105,103,104,116,105,110,103))
local _0x31EE = game:GetService(string.char(72,116,116,112,83,101,114,118,105,99,101))
local _0x49C6 = game:GetService(string.char(84,119,101,101,110,83,101,114,118,105,99,101))
local _0x1ACD = game:GetService(string.char(84,101,108,101,112,111,114,116,83,101,114,118,105,99,101))
local _0x4AFC = os.clock()
local _0x6C02 =string.char(114,98,120,97,115,115,101,116,105,100,58,47,47,57,55,52,55,57,54,52,55,49,48,54,48,53,52)local _0x808F = _0x6171.LocalPlayer
local _0x0A39 = _0xF061.CurrentCamera
local _0xC5D8 = _0x808F:GetMouse()
local _0x62E6 = {
aimEnabled = true,
silentAim = false,
hardLock = false,
teamCheck = true,
ignoreFriends = true,
aimPart =string.char(72,101,97,100),
currentBind = Enum.KeyCode.E,
aimMode =string.char(72,111,108,100),
targetPriority =string.char(67,114,111,115,115,104,97,105,114),
prediction = 0.0,
radius = 200,
smoothness = 0.3,
circleColor = Color3.fromRGB(124, 92, 255),
fovVisible = true,
triggerBot = false,
triggerDelay = 0.05,
soundOnToggle = true,
randomCircleColor = false,
currentTheme =string.char(68,97,114,107),
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
lockedTarget = nil,cframeSpeedEnabled = false,
cframeSpeed = 28,
cframeJumpEnabled = false,
cframeJumpHeight = 3,
cframeFlyEnabled = false,
cframeFlySpeed = 65,
cframeClickTP = false,
cframeAirWalk = false,
cframeTeleportStep = 12,fontName =string.char(71,111,116,104,97,109),
uiAnimations = true,
rotatingIcon = true,
}
getgenv().takcahubConfig = _0x62E6
local _0x7102 =string.char(116,97,107,99,97,104,117,98,95,99,111,110,102,105,103,46,106,115,111,110)local function _0x8343()
if not writefile then return false end
local _0xE64D = pcall(function()
local _0x3549 = {}
for k, v in pairs(_0x62E6) do
if typeof(v) ==string.char(67,111,108,111,114,51)then
_0x3549[k] = {__t =string.char(67,51), r = v.R, g = v.G, _0xB135 = v.B}
elseif typeof(v) ==string.char(69,110,117,109,73,116,101,109)then
_0x3549[k] = {__t =string.char(69), et = tostring(v.EnumType), n = v.Name}
elseif k ~=string.char(108,111,99,107,101,100,84,97,114,103,101,116)and k ~=string.char(116,111,103,103,108,101,83,116,97,116,101)and k ~=string.char(104,111,108,100,83,116,97,116,101)then
_0x3549[k] = v
end
end
writefile(_0x7102, _0x31EE:JSONEncode(_0x3549))
end)
return _0xE64D
end
local function _0xD372()
if not isfile or not readfile then return false end
if not isfile(_0x7102) then return false end
local _0xE64D = pcall(function()
local _0x3549 = _0x31EE:JSONDecode(readfile(_0x7102))
for k, v in pairs(_0x3549) do
if _0x62E6[k] ~= nil then
if type(v) ==string.char(116,97,98,108,101)and v.__t ==string.char(67,51)then
_0x62E6[k] = Color3.new(v.r, v.g, v.b)
elseif type(v) ==string.char(116,97,98,108,101)and v.__t ==string.char(69)then
local _0x9E04 = Enum[v.et]
if _0x9E04 then _0x62E6[k] = _0x9E04[v.n] end
else
_0x62E6[k] = v
end
end
end
end)
return _0xE64D
end
local _0x6EB5 = Drawing.new(string.char(67,105,114,99,108,101))
_0x6EB5.Visible = false
_0x6EB5.Radius = _0x62E6.radius
_0x6EB5.Thickness = 1.5
_0x6EB5.Filled = false
_0x6EB5.Color = _0x62E6.circleColor
_0x6EB5.Transparency = 1
local function _0x2515(_0x4006)
local _0x0AD9 = _0x4006:FindFirstChildOfClass(string.char(72,117,109,97,110,111,105,100))
return _0x0AD9 and _0x0AD9.Health > 0
end
local function _0xF147()
return _0x0A39.ViewportSize / 2
end
local function _0x8692(_0xED55)
return (_0xF147() - Vector2.new(_0xED55.X, _0xED55.Y)).Magnitude <= _0x62E6.radius
end
local function _0x1A99(plr)
if not _0x62E6.teamCheck then return true end
if not plr.Team then return true end
if _0x808F.Team and plr.Team == _0x808F.Team then return false end
return true
end
local function _0x2B1F(plr)
if not _0x62E6.ignoreFriends then return false end
local _0xE64D, _0xE89F = pcall(function() return _0x808F:GetFriendsOnline() end)
if _0xE64D and _0xE89F then
for _, f in ipairs(_0xE89F) do
if f.VisitorId == plr.UserId or f.Username == plr.Name then return true end
end
end
return false
end
local function _0xA1F3(_0x4006)
local _0x4B50 = _0x62E6.aimPart
if _0x4B50 ==string.char(82,97,110,100,111,109)then
_0x4B50 = ({string.char(72,101,97,100),string.char(85,112,112,101,114,84,111,114,115,111),string.char(76,111,119,101,114,84,111,114,115,111),string.char(84,111,114,115,111)})[math.random(1, 4)]
elseif _0x4B50 ==string.char(67,104,101,115,116)then _0x4B50 =string.char(85,112,112,101,114,84,111,114,115,111)elseif _0x4B50 ==string.char(66,111,100,121)then _0x4B50 =string.char(76,111,119,101,114,84,111,114,115,111)end
local _0x9D22 = _0x4006:FindFirstChild(_0x4B50)
if not _0x9D22 then
_0x9D22 = _0x4006:FindFirstChild(string.char(84,111,114,115,111)) or _0x4006:FindFirstChild(string.char(72,117,109,97,110,111,105,100,82,111,111,116,80,97,114,116)) or _0x4006:FindFirstChild(string.char(72,101,97,100))
end
return _0x9D22
end
local function _0x930E()
if _0x62E6.hardLock and _0x62E6.lockedTarget then
local _0x9D22 = _0x62E6.lockedTarget
local _0x4006 = _0x9D22 and _0x9D22.Parent
if _0x4006 and _0x2515(_0x4006) then return _0x9D22 end
_0x62E6.lockedTarget = nil
end
local _0x9D04 = {}
for _, plr in ipairs(_0x6171:GetPlayers()) do
if plr ~= _0x808F and plr.Character then
local _0x4006 = plr.Character
local _0x9D22 = _0xA1F3(_0x4006)
if _0x9D22 and _0x2515(_0x4006) and _0x1A99(plr) and not _0x2B1F(plr) then
local _0xED55, _0xE36E = _0x0A39:WorldToViewportPoint(_0x9D22.Position)
if _0xE36E and _0x8692(_0xED55) then
table.insert(_0x9D04, {
_0x9D22 = _0x9D22,
screenDist = (Vector2.new(_0xED55.X, _0xED55.Y) - _0xF147()).Magnitude,
worldDist = (_0x0A39.CFrame.Position - _0x9D22.Position).Magnitude,
health = _0x4006:FindFirstChildOfClass(string.char(72,117,109,97,110,111,105,100)).Health,
})
end
end
end
end
if #_0x9D04 == 0 then return nil end
table.sort(_0x9D04, function(_0x3D5A, _0xB135)
if _0x62E6.targetPriority ==string.char(72,101,97,108,116,104)then return _0x3D5A.health < _0xB135.health
elseif _0x62E6.targetPriority ==string.char(67,114,111,115,115,104,97,105,114)then return _0x3D5A.screenDist < _0xB135.screenDist
else return _0x3D5A.worldDist < _0xB135.worldDist end
end)
local _0xFBB0 = _0x9D04[1].part
if _0xFBB0 and _0x62E6.hardLock then _0x62E6.lockedTarget = _0xFBB0 end
return _0xFBB0
end
local function _0x3F12(targetPos)
local _0xB883 = _0x0A39.CFrame
local _0x23F9 = CFrame.lookAt(_0xB883.Position, targetPos)
if _0x62E6.smoothness > 0 then
local _0x39BF = 1 - math.exp(-_0x62E6.smoothness * 0.5)
_0x0A39.CFrame = _0xB883:Lerp(_0x23F9, _0x39BF)
else
_0x0A39.CFrame = _0x23F9
end
end
local _0x0B1E = _0xA442:CreateWindow({
Title =string.char(116,97,107,99,97,104,117,98),
Icon = _0x6C02,
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
Folder =string.char(116,97,107,99,97,104,117,98),
User = { Enabled = true, Anonymous = false },
})local _0xEDAE =string.char(85,110,107,110,111,119,110)local function _0xD667()
local _0xE64D, _0xAC6E = pcall(function()
if type(identifyexecutor) ==string.char(102,117,110,99,116,105,111,110)then
local _0x3D5A, _0xB135 = identifyexecutor()
if _0x3D5A and tostring(_0x3D5A) ~=""then
if _0xB135 and tostring(_0xB135) ~=""then
return tostring(_0x3D5A) ..string.char(32).. tostring(_0xB135)
end
return tostring(_0x3D5A)
end
end
if type(getexecutorname) ==string.char(102,117,110,99,116,105,111,110)then
local _0x3D5A = getexecutorname()
if _0x3D5A and tostring(_0x3D5A) ~=""then return tostring(_0x3D5A) end
end
if syn then returnstring.char(83,121,110,97,112,115,101)end
if KRNL_LOADED then returnstring.char(75,82,78,76)end
if fluxus then returnstring.char(70,108,117,120,117,115)end
if is_sirhurt_closure then returnstring.char(83,105,114,72,117,114,116)end
returnstring.char(85,110,107,110,111,119,110)end)
if _0xE64D and _0xAC6E then return _0xAC6E end
returnstring.char(85,110,107,110,111,119,110)end
_0xEDAE = _0xD667()
local function _0x6425(seconds)
seconds = math.max(0, math.floor(seconds))
local _0xB5CF = math.floor(seconds / 86400)
seconds = seconds % 86400
local _0x7005 = math.floor(seconds / 3600)
seconds = seconds % 3600
local _0x986B = math.floor(seconds / 60)
local _0xEC66 = seconds % 60
if _0xB5CF > 0 then
return string.format(string.char(37,100,100,32,37,48,50,100,104,32,37,48,50,100,109,32,37,48,50,100,115), _0xB5CF, _0x7005, _0x986B, _0xEC66)
end
return string.format(string.char(37,48,50,100,104,32,37,48,50,100,109,32,37,48,50,100,115), _0x7005, _0x986B, _0xEC66)
end
local _0x9B44 = {}
local _0xF5F2 = 120
local _0x007E = nil
local function _0xF928(kind, message)
local _0xD065 = string.format(string.char(91,37,115,93,32,37,115), os.date(string.char(37,72,58,37,77,58,37,83)), tostring(message))
table.insert(_0x9B44, 1, _0xD065)
while #_0x9B44 > _0xF5F2 do table.remove(_0x9B44) end
print(string.char(91,116,97,107,99,97,104,117,98,93,91).. tostring(kind) ..string.char(93,32).. tostring(message))
if _0x007E then
pcall(function()
_0x007E:SetDesc(table.concat(_0x9B44,string.char(10)))
end)
end
end
local _0xDFF1 = _0x0B1E:Tag({
Title =string.char(79,110,108,105,110,101,32,226,128,162,32,48,48,104,32,48,48,109,32,48,48,115),
Icon =string.char(99,105,114,99,108,101),
Color = Color3.fromRGB(34, 224, 212),
})
local _0xB50B = _0x0B1E:Tag({
Title =string.char(73,110,106,101,99,116,111,114,32,226,128,162,32).. _0xEDAE,
Icon =string.char(99,112,117),
Color = Color3.fromRGB(124, 92, 255),
})
task.spawn(function()
while true do
if not _0xDFF1 then break end
pcall(function()
_0xDFF1:SetTitle(string.char(79,110,108,105,110,101,32,226,128,162,32).. _0x6425(os.clock() - _0x4AFC))
end)
task.wait(1)
end
end)task.spawn(function()
task.wait(1.25)
pcall(function()
local _0x1AF6 = _0xA442.ScreenGui
if not _0x1AF6 then return end
local _0x1A83 = _0x1AF6:FindFirstChild(string.char(87,105,110,100,111,119))
local _0x0544 = _0x1A83 and _0x1A83:GetChildren()[1]
local _0x7F90 = _0x0544 and _0x0544:FindFirstChild(string.char(66,97,99,107,103,114,111,117,110,100), true)
if not _0x7F90 then return end
local _0x47BA = Instance.new(string.char(73,109,97,103,101,76,97,98,101,108))
_0x47BA.Name =string.char(84,97,107,99,97,83,112,105,110,110,101,114)_0x47BA.BackgroundTransparency = 1
_0x47BA.Size = UDim2.fromOffset(34, 34)
_0x47BA.AnchorPoint = Vector2.new(1, 0)
_0x47BA.Position = UDim2.new(1, -18, 0, 18)
_0x47BA.Image = _0x6C02
_0x47BA.ImageTransparency = 0
_0x47BA.ZIndex = 50
_0x47BA.Parent = _0x7F90
local _0xFD63 = Instance.new(string.char(85,73,83,116,114,111,107,101))
_0xFD63.Thickness = 1
_0xFD63.Transparency = 0.45
_0xFD63.Parent = _0x47BA
task.spawn(function()
while _0x47BA.Parent do
if _0x62E6.rotatingIcon then
_0x47BA.Rotation = (_0x47BA.Rotation + 1.8) % 360
end
_0x1263.RenderStepped:Wait()
end
end)
end)
end)
_0xF928(string.char(83,89,83,84,69,77),string.char(85,73,32,108,111,97,100,101,100,32,226,128,162,32,69,120,101,99,117,116,111,114,58,32).. _0xEDAE)
task.spawn(function()
task.wait(0.9)
_0xF928(string.char(83,89,83,84,69,77),string.char(87,105,110,100,111,119,32,105,110,105,116,105,97,108,105,122,101,100))
end)
task.spawn(function()
task.wait(1.5)
pcall(function()
local _0x1AF6 = _0xA442.ScreenGui
if not _0x1AF6 then return end
local _0x03BD = _0x1AF6:FindFirstChild(string.char(87,105,110,100,111,119))
if not _0x03BD then return end
local _0xD89C = _0x03BD:GetChildren()[1]
if not _0xD89C then return end
local _0x6E34 = _0xD89C:FindFirstChild(string.char(66,97,99,107,103,114,111,117,110,100), true)
if not _0x6E34 then return end
local _0x7C57 = Instance.new(string.char(70,114,97,109,101))
_0x7C57.Name =string.char(82,97,121,115,67,111,110,116,97,105,110,101,114)_0x7C57.Size = UDim2.new(1, 0, 1, 0)
_0x7C57.BackgroundTransparency = 1
_0x7C57.ClipsDescendants = true
_0x7C57.ZIndex = 0
_0x7C57.Parent = _0x6E34
local _0xE299 = Instance.new(string.char(85,73,67,111,114,110,101,114))
_0xE299.CornerRadius = UDim.new(0, 16)
_0xE299.Parent = _0x7C57
for i = 1, 3 do
local _0xA2B5 = Instance.new(string.char(70,114,97,109,101))
_0xA2B5.Size = UDim2.new(0, 260, 0, 260)
_0xA2B5.Position = UDim2.new(0.5, -130, 0.5, -130)
_0xA2B5.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
_0xA2B5.BackgroundTransparency = 0.9
_0xA2B5.BorderSizePixel = 0
_0xA2B5.ZIndex = 0
_0xA2B5.Parent = _0x7C57
local _0x6ABF = Instance.new(string.char(85,73,67,111,114,110,101,114))
_0x6ABF.CornerRadius = UDim.new(0, 200)
_0x6ABF.Parent = _0xA2B5
local _0xD594 = Instance.new(string.char(85,73,71,114,97,100,105,101,110,116))
_0xD594.Color = ColorSequence.new({
ColorSequenceKeypoint.new(0, Color3.fromRGB(124, 92, 255)),
ColorSequenceKeypoint.new(0.5, Color3.fromRGB(34, 224, 212)),
ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 95, 174)),
})
_0xD594.Transparency = NumberSequence.new({
NumberSequenceKeypoint.new(0, 1),
NumberSequenceKeypoint.new(0.5, 0.75),
NumberSequenceKeypoint.new(1, 1),
})
_0xD594.Rotation = i * 60
_0xD594.Parent = _0xA2B5
end
end)
end)
local function _0x81A6(title, content, icon)
_0xF928(title, content)
pcall(function()
_0xA442:Notify({ Title = title, Content = content, Duration = 3, Icon = icon orstring.char(105,110,102,111)})
end)
endlocal _0xF8FF = _0x0B1E:Tab({ Title =string.char(72,111,109,101), Icon =string.char(104,111,117,115,101)})
_0xF8FF:Section({ Title =string.char(80,114,111,102,105,108,101,32,38,32,82,117,110,116,105,109,101), Opened = true })
local _0xA7DF =string.char(114,98,120,116,104,117,109,98,58,47,47,116,121,112,101,61,65,118,97,116,97,114,72,101,97,100,83,104,111,116,38,105,100,61).. tostring(_0x808F.UserId) ..string.char(38,119,61,49,53,48,38,104,61,49,53,48)_0xF8FF:Paragraph({
Title = _0x808F.DisplayName ..string.char(32,32,226,128,162,32,32,64).. _0x808F.Name,
Desc =string.char(79,110,108,105,110,101,10,85,112,116,105,109,101,58,32).. _0x6425(os.clock() - _0x4AFC) ..string.char(10,73,110,106,101,99,116,111,114,58,32).. _0xEDAE,
Image = _0xA7DF,
ImageSize = 44,
Color =string.char(87,104,105,116,101),
})
_0xF8FF:Paragraph({
Title =string.char(82,117,110,116,105,109,101,32,115,116,97,116,117,115),
Desc =string.char(83,101,115,115,105,111,110,32,105,115,32,97,99,116,105,118,101,46,10,77,101,110,117,58,32,82,105,103,104,116,83,104,105,102,116,10,87,105,110,100,85,73,32,115,101,97,114,99,104,58,32,101,110,97,98,108,101,100),
Image = _0x6C02,
ImageSize = 34,
Color =string.char(87,104,105,116,101),
})
local _0x1B8A = _0xF8FF:Paragraph({
Title =string.char(76,105,118,101,32,105,110,102,111,114,109,97,116,105,111,110),
Desc =string.char(83,116,97,114,116,105,110,103,46,46,46),
Image =string.char(97,99,116,105,118,105,116,121),
ImageSize = 20,
Color =string.char(87,104,105,116,101),
})
task.spawn(function()
while _0x1B8A do
pcall(function()
_0x1B8A:SetDesc(string.char(83,116,97,116,117,115,58,32,79,110,108,105,110,101,10)..string.char(85,112,116,105,109,101,58,32).. _0x6425(os.clock() - _0x4AFC) ..string.char(10)..string.char(73,110,106,101,99,116,111,114,58,32).. _0xEDAE ..string.char(10)..string.char(80,108,97,99,101,32,73,68,58,32).. tostring(game.PlaceId)
)
end)
task.wait(1)
end
end)
_0xF8FF:Button({
Title =string.char(84,101,115,116,32,110,111,116,105,102,105,99,97,116,105,111,110),
Desc =string.char(67,104,101,99,107,115,32,85,73,32,110,111,116,105,102,105,99,97,116,105,111,110,115,32,97,110,100,32,108,111,103,103,105,110,103),
Icon =string.char(98,101,108,108),
Callback = function()
_0x81A6(string.char(85,73),string.char(69,118,101,114,121,116,104,105,110,103,32,105,115,32,114,101,115,112,111,110,100,105,110,103,46),string.char(99,104,101,99,107))
end,
})
_0xF8FF:Toggle({
Title =string.char(82,111,116,97,116,105,110,103,32,105,99,111,110),
Desc =string.char(83,109,97,108,108,32,97,110,105,109,97,116,101,100,32,105,99,111,110,32,105,110,32,116,104,101,32,119,105,110,100,111,119),
Value = _0x62E6.rotatingIcon,
Callback = function(v)
_0x62E6.rotatingIcon = v
_0x81A6(string.char(85,73), v andstring.char(82,111,116,97,116,105,110,103,32,105,99,111,110,32,101,110,97,98,108,101,100)orstring.char(82,111,116,97,116,105,110,103,32,105,99,111,110,32,100,105,115,97,98,108,101,100), v andstring.char(114,111,116,97,116,101,45,99,119)orstring.char(112,97,117,115,101))
end,
})
_0xF8FF:Toggle({
Title =string.char(85,73,32,97,110,105,109,97,116,105,111,110,115),
Desc =string.char(76,105,103,104,116,119,101,105,103,104,116,32,104,111,118,101,114,47,112,114,101,115,115,32,116,114,97,110,115,105,116,105,111,110,115),
Value = _0x62E6.uiAnimations,
Callback = function(v)
_0x62E6.uiAnimations = v
_0x81A6(string.char(85,73), v andstring.char(65,110,105,109,97,116,105,111,110,115,32,101,110,97,98,108,101,100)orstring.char(65,110,105,109,97,116,105,111,110,115,32,100,105,115,97,98,108,101,100), v andstring.char(115,112,97,114,107,108,101,115)orstring.char(112,97,117,115,101))
end,
})local _0x1679 = _0x0B1E:Tab({ Title =string.char(76,111,103,115), Icon =string.char(115,99,114,111,108,108,45,116,101,120,116)})
_0x1679:Section({ Title =string.char(82,117,110,116,105,109,101,32,108,111,103), Opened = true })
_0x1679:Input({
Title =string.char(76,111,103,32,102,105,108,116,101,114),
Desc =string.char(79,112,116,105,111,110,97,108,32,116,101,120,116,32,116,111,32,102,105,110,100,32,105,110,32,116,104,101,32,108,111,103),
Placeholder =string.char(116,121,112,101,32,116,111,32,115,101,97,114,99,104,46,46,46),
Callback = function(value)
value = tostring(value or"")
if value ==""then
if _0x007E then pcall(function() _0x007E:SetDesc(table.concat(_0x9B44,string.char(10))) end) end
return
end
local _0x6F56 = {}
for _, _0xD065 in ipairs(_0x9B44) do
if _0xD065:lower():find(value:lower(), 1, true) then
table.insert(_0x6F56, _0xD065)
end
end
if _0x007E then pcall(function() _0x007E:SetDesc(table.concat(_0x6F56,string.char(10))) end) end
end,
})
_0x007E = _0x1679:Paragraph({
Title =string.char(76,105,118,101,32,101,118,101,110,116,115),
Desc = table.concat(_0x9B44,string.char(10)),
Image =string.char(116,101,114,109,105,110,97,108),
ImageSize = 20,
Color =string.char(87,104,105,116,101),
})
_0x1679:Button({
Title =string.char(67,108,101,97,114,32,108,111,103,115),
Icon =string.char(116,114,97,115,104,45,50),
Callback = function()
table.clear(_0x9B44)
if _0x007E then
pcall(function() _0x007E:SetDesc(string.char(76,111,103,32,99,108,101,97,114,101,100,46)) end)
end
print(string.char(91,116,97,107,99,97,104,117,98,93,91,83,89,83,84,69,77,93,32,76,111,103,32,99,108,101,97,114,101,100))
end,
})
_0x1679:Button({
Title =string.char(67,111,112,121,32,108,111,103,115),
Icon =string.char(99,111,112,121),
Callback = function()
local _0xCA11 = table.concat(_0x9B44,string.char(10))
if setclipboard then
pcall(function() setclipboard(_0xCA11) end)
_0x81A6(string.char(76,111,103,115),string.char(67,111,112,105,101,100,32,116,111,32,99,108,105,112,98,111,97,114,100,46),string.char(99,111,112,121))
else
_0x81A6(string.char(76,111,103,115),string.char(67,108,105,112,98,111,97,114,100,32,65,80,73,32,105,115,32,117,110,97,118,97,105,108,97,98,108,101,46),string.char(120))
end
end,
})local _0x5FF4 = _0x0B1E:Tab({ Title =string.char(65,105,109), Icon =string.char(99,114,111,115,115,104,97,105,114)})
_0x5FF4:Section({ Title =string.char(65,105,109,98,111,116)})
_0x5FF4:Toggle({
Title =string.char(69,110,97,98,108,101,32,65,105,109),
Desc =string.char(208,147,208,187,208,176,208,178,208,189,209,139,208,185,32,208,178,209,139,208,186,208,187,209,142,209,135,208,176,209,130,208,181,208,187,209,140),
Value = _0x62E6.aimEnabled,
Callback = function(v)
_0x62E6.aimEnabled = v
if not v then
_0x62E6.toggleState = false
_0x62E6.holdState = false
_0x6EB5.Visible = false
end
end,
})
_0x5FF4:Toggle({
Title =string.char(83,105,108,101,110,116,32,65,105,109),
Desc =string.char(208,146,208,157,208,152,208,156,208,144,208,157,208,152,208,149,58,32,208,188,208,190,208,182,208,181,209,130,32,208,180,208,181,209,130,208,181,208,186,209,130,208,184,209,130,209,140,209,129,209,143,32,208,176,208,189,209,130,208,184,209,135,208,184,209,130,208,190,208,188),
Value = _0x62E6.silentAim,
Callback = function(v) _0x62E6.silentAim = v end,
})
_0x5FF4:Toggle({
Title =string.char(72,97,114,100,32,76,111,99,107),
Value = _0x62E6.hardLock,
Callback = function(v) _0x62E6.hardLock = v end,
})
_0x5FF4:Toggle({
Title =string.char(84,101,97,109,32,67,104,101,99,107),
Value = _0x62E6.teamCheck,
Callback = function(v) _0x62E6.teamCheck = v end,
})
_0x5FF4:Toggle({
Title =string.char(73,103,110,111,114,101,32,70,114,105,101,110,100,115),
Value = _0x62E6.ignoreFriends,
Callback = function(v) _0x62E6.ignoreFriends = v end,
})
_0x5FF4:Dropdown({
Title =string.char(65,105,109,32,80,97,114,116),
Values = {string.char(72,101,97,100),string.char(67,104,101,115,116),string.char(66,111,100,121),string.char(82,97,110,100,111,109)},
Value = _0x62E6.aimPart,
Callback = function(v) _0x62E6.aimPart = v end,
})
_0x5FF4:Dropdown({
Title =string.char(80,114,105,111,114,105,116,121),
Values = {string.char(67,114,111,115,115,104,97,105,114),string.char(68,105,115,116,97,110,99,101),string.char(72,101,97,108,116,104)},
Value = _0x62E6.targetPriority,
Callback = function(v) _0x62E6.targetPriority = v end,
})
_0x5FF4:Dropdown({
Title =string.char(77,111,100,101),
Values = {string.char(72,111,108,100),string.char(84,111,103,103,108,101)},
Value = _0x62E6.aimMode,
Callback = function(v)
_0x62E6.aimMode = v
_0x62E6.toggleState = false
_0x62E6.holdState = false
_0x6EB5.Visible = false
end,
})
local _0xAF6E = {
R = Enum.KeyCode.R, E = Enum.KeyCode.E, F = Enum.KeyCode.F,
Q = Enum.KeyCode.Q, C = Enum.KeyCode.C, V = Enum.KeyCode.V,
Shift = Enum.KeyCode.LeftShift, [string.char(76,45,67,116,114,108)] = Enum.KeyCode.LeftControl,
}
local _0x5474 =string.char(69)for n, k in pairs(_0xAF6E) do
if k == _0x62E6.currentBind then _0x5474 = n end
end
_0x5FF4:Dropdown({
Title =string.char(66,105,110,100,32,75,101,121),
Values = {string.char(82),string.char(69),string.char(70),string.char(81),string.char(67),string.char(86),string.char(83,104,105,102,116),string.char(76,45,67,116,114,108)},
Value = _0x5474,
Callback = function(v) if _0xAF6E[v] then _0x62E6.currentBind = _0xAF6E[v] end end,
})
_0x5FF4:Slider({
Title =string.char(80,114,101,100,105,99,116,105,111,110),
Min = 0, Max = 100, Step = 1,
Value = { Min = 0, Max = 100, Default = _0x62E6.prediction * 100 },
Callback = function(v) _0x62E6.prediction = v / 100 end,
})
_0x5FF4:Section({ Title =string.char(84,114,105,103,103,101,114,32,66,111,116)})
_0x5FF4:Toggle({
Title =string.char(69,110,97,98,108,101,32,84,114,105,103,103,101,114),
Value = _0x62E6.triggerBot,
Callback = function(v) _0x62E6.triggerBot = v end,
})
_0x5FF4:Slider({
Title =string.char(84,114,105,103,103,101,114,32,68,101,108,97,121,32,40,109,115,41),
Min = 1, Max = 200, Step = 1,
Value = { Min = 1, Max = 200, Default = _0x62E6.triggerDelay * 1000 },
Callback = function(v) _0x62E6.triggerDelay = v / 1000 end,
})local _0x5EE4 = _0x0B1E:Tab({ Title =string.char(86,105,115,117,97,108,115), Icon =string.char(101,121,101)})
_0x5EE4:Section({ Title =string.char(70,79,86)})
_0x5EE4:Toggle({
Title =string.char(83,104,111,119,32,70,79,86),
Value = _0x62E6.fovVisible,
Callback = function(v)
_0x62E6.fovVisible = v
_0x6EB5.Visible = v and (_0x62E6.toggleState or _0x62E6.holdState)
end,
})
_0x5EE4:Slider({
Title =string.char(70,79,86,32,82,97,100,105,117,115),
Min = 30, Max = 600, Step = 10,
Value = { Min = 30, Max = 600, Default = _0x62E6.radius },
Callback = function(v)
_0x62E6.radius = v
_0x6EB5.Radius = v
end,
})
_0x5EE4:Slider({
Title =string.char(83,109,111,111,116,104,110,101,115,115),
Min = 0, Max = 100, Step = 1,
Value = { Min = 0, Max = 100, Default = _0x62E6.smoothness * 100 },
Callback = function(v) _0x62E6.smoothness = v / 100 end,
})
local _0x5D4E = {
White = Color3.fromRGB(255, 255, 255),
Red = Color3.fromRGB(255, 0, 0),
Green = Color3.fromRGB(0, 255, 0),
Blue = Color3.fromRGB(0, 0, 255),
Purple = Color3.fromRGB(124, 92, 255),
Cyan = Color3.fromRGB(34, 224, 212),
Pink = Color3.fromRGB(255, 95, 174),
Orange = Color3.fromRGB(255, 140, 0),
}
local _0xD6C3 =string.char(80,117,114,112,108,101)for n, c in pairs(_0x5D4E) do if c == _0x62E6.circleColor then _0xD6C3 = n end end
_0x5EE4:Dropdown({
Title =string.char(67,105,114,99,108,101,32,67,111,108,111,114),
Values = {string.char(87,104,105,116,101),string.char(82,101,100),string.char(71,114,101,101,110),string.char(66,108,117,101),string.char(80,117,114,112,108,101),string.char(67,121,97,110),string.char(80,105,110,107),string.char(79,114,97,110,103,101)},
Value = _0xD6C3,
Callback = function(v) _0x62E6.circleColor = _0x5D4E[v] or Color3.new(1, 1, 1) end,
})
_0x5EE4:Toggle({
Title =string.char(82,97,110,100,111,109,32,67,105,114,99,108,101,32,67,111,108,111,114),
Value = _0x62E6.randomCircleColor,
Callback = function(v) _0x62E6.randomCircleColor = v end,
})
_0x5EE4:Section({ Title =string.char(87,111,114,108,100)})
_0x5EE4:Toggle({
Title =string.char(70,117,108,108,98,114,105,103,104,116),
Desc =string.char(208,163,208,177,208,184,209,128,208,176,208,181,209,130,32,209,130,208,181,208,188,208,189,208,190,209,130,209,131),
Value = _0x62E6.fullbright,
Callback = function(v)
_0x62E6.fullbright = v
if v then
_0x3761.Brightness = 3
_0x3761.ClockTime = 14
_0x3761.GlobalShadows = false
_0x3761.FogEnd = 1e6
else
_0x3761.Brightness = 1
_0x3761.ClockTime = 12
_0x3761.GlobalShadows = true
_0x3761.FogEnd = 100000
end
end,
})local _0x08E0 = _0x0B1E:Tab({ Title =string.char(80,108,97,121,101,114), Icon =string.char(117,115,101,114)})
_0x08E0:Section({ Title =string.char(208,148,208,178,208,184,208,182,208,181,208,189,208,184,208,181)})
_0x08E0:Slider({
Title =string.char(87,97,108,107,83,112,101,101,100),
Min = 16, Max = 200, Step = 1,
Value = { Min = 16, Max = 200, Default = _0x62E6.walkSpeed },
Callback = function(v)
_0x62E6.walkSpeed = v
if _0x808F.Character then
local _0x7005 = _0x808F.Character:FindFirstChildOfClass(string.char(72,117,109,97,110,111,105,100))
if _0x7005 then _0x7005.WalkSpeed = v end
end
end,
})
_0x08E0:Slider({
Title =string.char(74,117,109,112,80,111,119,101,114),
Min = 50, Max = 500, Step = 5,
Value = { Min = 50, Max = 500, Default = _0x62E6.jumpPower },
Callback = function(v)
_0x62E6.jumpPower = v
if _0x808F.Character then
local _0x7005 = _0x808F.Character:FindFirstChildOfClass(string.char(72,117,109,97,110,111,105,100))
if _0x7005 then _0x7005.JumpPower = v; _0x7005.UseJumpPower = true end
end
end,
})
_0x08E0:Toggle({
Title =string.char(73,110,102,105,110,105,116,101,32,74,117,109,112),
Value = _0x62E6.infJump,
Callback = function(v) _0x62E6.infJump = v end,
})
_0x08E0:Toggle({
Title =string.char(78,111,99,108,105,112),
Desc =string.char(208,159,209,128,208,190,209,133,208,190,208,180,208,184,209,130,209,140,32,209,129,208,186,208,178,208,190,208,183,209,140,32,209,129,209,130,208,181,208,189,209,139),
Value = _0x62E6.noclip,
Callback = function(v) _0x62E6.noclip = v end,
})
_0x08E0:Section({ Title =string.char(70,108,121)})
_0x08E0:Toggle({
Title =string.char(69,110,97,98,108,101,32,70,108,121),
Value = _0x62E6.flyEnabled,
Callback = function(v) _0x62E6.flyEnabled = v end,
})
_0x08E0:Slider({
Title =string.char(70,108,121,32,83,112,101,101,100),
Min = 10, Max = 300, Step = 5,
Value = { Min = 10, Max = 300, Default = _0x62E6.flySpeed },
Callback = function(v) _0x62E6.flySpeed = v end,
})_0x08E0:Section({ Title =string.char(67,70,114,97,109,101,32,77,111,118,101,109,101,110,116)})
_0x08E0:Toggle({
Title =string.char(67,70,114,97,109,101,32,83,112,101,101,100),
Desc =string.char(77,111,118,101,32,117,115,105,110,103,32,72,117,109,97,110,111,105,100,46,77,111,118,101,68,105,114,101,99,116,105,111,110,32,43,32,67,70,114,97,109,101),
Value = _0x62E6.cframeSpeedEnabled,
Callback = function(v)
_0x62E6.cframeSpeedEnabled = v
if v then
_0x62E6.flyEnabled = false
_0x81A6(string.char(67,70,114,97,109,101,32,83,112,101,101,100),string.char(69,110,97,98,108,101,100),string.char(109,111,118,101))
else
_0x81A6(string.char(67,70,114,97,109,101,32,83,112,101,101,100),string.char(68,105,115,97,98,108,101,100),string.char(112,97,117,115,101))
end
end,
})
_0x08E0:Slider({
Title =string.char(67,70,114,97,109,101,32,83,112,101,101,100),
Min = 1, Max = 150, Step = 1,
Value = { Min = 1, Max = 150, Default = _0x62E6.cframeSpeed },
Callback = function(v)
_0x62E6.cframeSpeed = v
end,
})
_0x08E0:Toggle({
Title =string.char(67,70,114,97,109,101,32,74,117,109,112),
Desc =string.char(67,70,114,97,109,101,45,98,97,115,101,100,32,118,101,114,116,105,99,97,108,32,106,117,109,112,32,119,104,105,108,101,32,83,112,97,99,101,32,105,115,32,104,101,108,100),
Value = _0x62E6.cframeJumpEnabled,
Callback = function(v)
_0x62E6.cframeJumpEnabled = v
_0x81A6(string.char(67,70,114,97,109,101,32,74,117,109,112), v andstring.char(69,110,97,98,108,101,100)orstring.char(68,105,115,97,98,108,101,100), v andstring.char(97,114,114,111,119,45,117,112)orstring.char(112,97,117,115,101))
end,
})
_0x08E0:Slider({
Title =string.char(74,117,109,112,32,83,116,101,112),
Min = 0.5, Max = 15, Step = 0.5,
Value = { Min = 0.5, Max = 15, Default = _0x62E6.cframeJumpHeight },
Callback = function(v)
_0x62E6.cframeJumpHeight = v
end,
})
_0x08E0:Toggle({
Title =string.char(67,70,114,97,109,101,32,70,108,121),
Desc =string.char(87,65,83,68,32,43,32,83,112,97,99,101,47,83,104,105,102,116,44,32,119,105,116,104,111,117,116,32,66,111,100,121,86,101,108,111,99,105,116,121),
Value = _0x62E6.cframeFlyEnabled,
Callback = function(v)
_0x62E6.cframeFlyEnabled = v
if v then
_0x62E6.cframeSpeedEnabled = false
_0x62E6.flyEnabled = false
_0x81A6(string.char(67,70,114,97,109,101,32,70,108,121),string.char(69,110,97,98,108,101,100),string.char(112,108,97,110,101))
else
_0x81A6(string.char(67,70,114,97,109,101,32,70,108,121),string.char(68,105,115,97,98,108,101,100),string.char(112,97,117,115,101))
end
end,
})
_0x08E0:Slider({
Title =string.char(67,70,114,97,109,101,32,70,108,121,32,83,112,101,101,100),
Min = 10, Max = 300, Step = 5,
Value = { Min = 10, Max = 300, Default = _0x62E6.cframeFlySpeed },
Callback = function(v)
_0x62E6.cframeFlySpeed = v
end,
})
_0x08E0:Toggle({
Title =string.char(67,70,114,97,109,101,32,65,105,114,32,87,97,108,107),
Desc =string.char(72,111,108,100,32,83,112,97,99,101,32,116,111,32,107,101,101,112,32,97,32,99,111,110,116,114,111,108,108,101,100,32,118,101,114,116,105,99,97,108,32,111,102,102,115,101,116),
Value = _0x62E6.cframeAirWalk,
Callback = function(v) _0x62E6.cframeAirWalk = v end,
})
_0x08E0:Toggle({
Title =string.char(67,108,105,99,107,32,84,101,108,101,112,111,114,116),
Desc =string.char(76,101,102,116,32,99,108,105,99,107,32,109,111,118,101,115,32,116,104,101,32,99,104,97,114,97,99,116,101,114,32,116,111,32,109,111,117,115,101,46,72,105,116),
Value = _0x62E6.cframeClickTP,
Callback = function(v)
_0x62E6.cframeClickTP = v
_0x81A6(string.char(67,108,105,99,107,32,84,101,108,101,112,111,114,116), v andstring.char(69,110,97,98,108,101,100)orstring.char(68,105,115,97,98,108,101,100), v andstring.char(109,111,117,115,101,45,112,111,105,110,116,101,114,45,50)orstring.char(112,97,117,115,101))
end,
})
_0x08E0:Slider({
Title =string.char(70,111,114,119,97,114,100,32,84,101,108,101,112,111,114,116,32,83,116,101,112),
Min = 2, Max = 60, Step = 1,
Value = { Min = 2, Max = 60, Default = _0x62E6.cframeTeleportStep },
Callback = function(v) _0x62E6.cframeTeleportStep = v end,
})
_0x08E0:Button({
Title =string.char(67,70,114,97,109,101,32,83,116,101,112,32,70,111,114,119,97,114,100),
Desc =string.char(77,111,118,101,32,102,111,114,119,97,114,100,32,98,121,32,116,104,101,32,115,101,108,101,99,116,101,100,32,100,105,115,116,97,110,99,101),
Icon =string.char(97,114,114,111,119,45,114,105,103,104,116),
Callback = function()
pcall(function()
local _0x4006 = _0x808F.Character
local _0xA3AB = _0x4006 and _0x4006:FindFirstChild(string.char(72,117,109,97,110,111,105,100,82,111,111,116,80,97,114,116))
if _0xA3AB then
_0xA3AB.CFrame = _0xA3AB.CFrame + _0xA3AB.CFrame.LookVector * _0x62E6.cframeTeleportStep
_0x81A6(string.char(67,70,114,97,109,101),string.char(77,111,118,101,100,32,102,111,114,119,97,114,100,32).. _0x62E6.cframeTeleportStep,string.char(109,111,118,101))
end
end)
end,
})local _0x322D = _0x0B1E:Tab({ Title =string.char(84,104,101,109,101,115), Icon =string.char(112,97,108,101,116,116,101)})
_0x322D:Section({ Title =string.char(49,54,32,209,130,208,181,208,188,32,87,105,110,100,85,73)})
local _0x7104 = {string.char(68,97,114,107),string.char(76,105,103,104,116),string.char(82,111,115,101),string.char(80,108,97,110,116),string.char(82,101,100),string.char(73,110,100,105,103,111),string.char(83,107,121),string.char(86,105,111,108,101,116),string.char(65,109,98,101,114),string.char(69,109,101,114,97,108,100),string.char(77,105,100,110,105,103,104,116),string.char(67,114,105,109,115,111,110),string.char(77,111,110,111,107,97,105,80,114,111),string.char(67,111,116,116,111,110,67,97,110,100,121),string.char(77,101,108,108,111,119,115,105),string.char(82,97,105,110,98,111,119)}
pcall(function()
for themeName in pairs(_0xA442:GetThemes()) do
if table.find(_0x7104, themeName) == nil then
table.insert(_0x7104, themeName)
end
end
end)
table.sort(_0x7104)
_0x322D:Dropdown({
Title =string.char(84,104,101,109,101),
Desc =string.char(208,161,208,188,208,181,208,189,208,176,32,209,130,208,181,208,188,209,139),
Values = _0x7104,
Value = _0x62E6.currentTheme,
SearchBarEnabled = true,
MenuWidth = 280,
Callback = function(v)
_0x62E6.currentTheme = v
pcall(function() _0xA442:SetTheme(v) end)
_0x81A6(string.char(84,104,101,109,101),string.char(208,163,209,129,209,130,208,176,208,189,208,190,208,178,208,187,208,181,208,189,208,176,58,32).. v,string.char(112,97,108,101,116,116,101))
end,
})
local _0x30C3 = {
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
local function _0xC7E0(name)
local _0x00EA = _0x30C3[name] or Enum.Font.Gotham
_0x62E6.fontName = name
pcall(function()
local _0x1AF6 = _0xA442.ScreenGui
if not _0x1AF6 then return end
for _, obj in ipairs(_0x1AF6:GetDescendants()) do
if obj:IsA(string.char(84,101,120,116,76,97,98,101,108)) or obj:IsA(string.char(84,101,120,116,66,117,116,116,111,110)) or obj:IsA(string.char(84,101,120,116,66,111,120)) then
obj.Font = _0x00EA
end
end
end)
end
_0x322D:Dropdown({
Title =string.char(73,110,116,101,114,102,97,99,101,32,102,111,110,116),
Desc =string.char(67,104,97,110,103,101,115,32,118,105,115,105,98,108,101,32,85,73,32,116,101,120,116),
Values = {string.char(71,111,116,104,97,109),string.char(71,111,116,104,97,109,66,111,108,100),string.char(83,111,117,114,99,101,83,97,110,115),string.char(83,111,117,114,99,101,83,97,110,115,66,111,108,100),string.char(82,111,98,111,116,111),string.char(82,111,98,111,116,111,77,111,110,111),string.char(67,111,100,101),string.char(65,114,99,97,100,101),string.char(70,97,110,116,97,115,121),string.char(83,99,105,70,105),string.char(85,98,117,110,116,117)},
Value = _0x62E6.fontName,
SearchBarEnabled = true,
MenuWidth = 240,
Callback = function(v)
_0xC7E0(v)
_0x81A6(string.char(70,111,110,116),string.char(83,101,108,101,99,116,101,100,58,32).. v,string.char(116,121,112,101))
end,
})
_0x322D:Toggle({
Title =string.char(76,105,103,104,116,119,101,105,103,104,116,32,97,110,105,109,97,116,105,111,110,115),
Desc =string.char(72,111,118,101,114,47,112,114,101,115,115,32,85,73,32,116,119,101,101,110,115),
Value = _0x62E6.uiAnimations,
Callback = function(v)
_0x62E6.uiAnimations = v
end,
})local _0x441E = _0x0B1E:Tab({ Title =string.char(77,105,115,99), Icon =string.char(119,114,101,110,99,104)})
_0x441E:Section({ Title =string.char(208,159,208,190,208,187,208,181,208,183,208,189,209,139,208,181,32,209,129,208,186,209,128,208,184,208,191,209,130,209,139)})
local function _0x1A4C(url, name)
_0x81A6(string.char(83,99,114,105,112,116),string.char(208,151,208,176,208,191,209,131,209,129,208,186,58,32).. name,string.char(100,111,119,110,108,111,97,100))
task.spawn(function()
local _0xE64D, _0xAB01 = pcall(function()
loadstring(game:HttpGet(url))()
end)
if not _0xE64D then
_0x81A6(string.char(83,99,114,105,112,116,32,69,114,114,111,114), tostring(_0xAB01),string.char(120))
end
end)
end
_0x441E:Button({
Title =string.char(73,110,102,105,110,105,116,101,32,89,105,101,108,100),
Desc =string.char(208,144,208,180,208,188,208,184,208,189,45,208,186,208,190,208,188,208,176,208,189,208,180,209,139),
Callback = function()
_0x1A4C(string.char(104,116,116,112,115,58,47,47,114,97,119,46,103,105,116,104,117,98,117,115,101,114,99,111,110,116,101,110,116,46,99,111,109,47,69,100,103,101,73,89,47,105,110,102,105,110,105,116,101,121,105,101,108,100,47,109,97,115,116,101,114,47,115,111,117,114,99,101),string.char(73,110,102,105,110,105,116,101,32,89,105,101,108,100))
end,
})
_0x441E:Button({
Title =string.char(78,97,109,101,108,101,115,115,32,65,100,109,105,110),
Desc =string.char(208,156,208,190,209,137,208,189,209,139,208,185,32,208,176,208,180,208,188,208,184,208,189,45,209,129,208,186,209,128,208,184,208,191,209,130),
Callback = function()
_0x1A4C(string.char(104,116,116,112,115,58,47,47,114,97,119,46,103,105,116,104,117,98,117,115,101,114,99,111,110,116,101,110,116,46,99,111,109,47,70,105,108,116,101,114,105,110,103,69,110,97,98,108,101,100,47,78,97,109,101,108,101,115,115,65,100,109,105,110,47,109,97,105,110,47,83,111,117,114,99,101),string.char(78,97,109,101,108,101,115,115,32,65,100,109,105,110))
end,
})
_0x441E:Button({
Title =string.char(68,97,114,107,32,68,101,120),
Desc =string.char(208,159,209,128,208,190,209,129,208,188,208,190,209,130,209,128,32,208,180,208,181,209,128,208,181,208,178,208,176,32,208,184,208,179,209,128,209,139),
Callback = function()
_0x1A4C(string.char(104,116,116,112,115,58,47,47,114,97,119,46,103,105,116,104,117,98,117,115,101,114,99,111,110,116,101,110,116,46,99,111,109,47,66,97,98,121,104,97,109,115,116,97,47,82,66,76,88,95,83,99,114,105,112,116,115,47,109,97,105,110,47,85,110,105,118,101,114,115,97,108,47,76,111,97,100,115,116,114,105,110,103,46,108,117,97),string.char(68,97,114,107,32,68,101,120))
end,
})
_0x441E:Button({
Title =string.char(83,105,109,112,108,101,83,112,121),
Desc =string.char(82,101,109,111,116,101,32,83,112,121),
Callback = function()
_0x1A4C(string.char(104,116,116,112,115,58,47,47,114,97,119,46,103,105,116,104,117,98,117,115,101,114,99,111,110,116,101,110,116,46,99,111,109,47,55,56,110,47,83,105,109,112,108,101,83,112,121,47,109,97,105,110,47,83,105,109,112,108,101,83,112,121,46,108,117,97),string.char(83,105,109,112,108,101,83,112,121))
end,
})
_0x441E:Button({
Title =string.char(72,121,100,114,111,120,105,100,101),
Desc =string.char(82,101,109,111,116,101,32,83,112,121,32,47,32,68,101,98,117,103),
Callback = function()
_0x1A4C(string.char(104,116,116,112,115,58,47,47,114,97,119,46,103,105,116,104,117,98,117,115,101,114,99,111,110,116,101,110,116,46,99,111,109,47,85,112,98,111,108,116,47,72,121,100,114,111,120,105,100,101,47,109,97,115,116,101,114,47,115,114,99,47,104,121,100,114,111,120,105,100,101,46,108,117,97),string.char(72,121,100,114,111,120,105,100,101))
end,
})
_0x441E:Button({
Title =string.char(79,87,76,32,72,117,98),
Desc =string.char(208,163,208,189,208,184,208,178,208,181,209,128,209,129,208,176,208,187,209,140,208,189,209,139,208,185,32,209,135,208,184,209,130,45,209,133,208,176,208,177),
Callback = function()
_0x1A4C(string.char(104,116,116,112,115,58,47,47,114,97,119,46,103,105,116,104,117,98,117,115,101,114,99,111,110,116,101,110,116,46,99,111,109,47,79,87,76,45,72,117,98,47,79,87,76,45,72,117,98,47,109,97,105,110,47,76,111,97,100,101,114,46,108,117,97),string.char(79,87,76,32,72,117,98))
end,
})
_0x441E:Button({
Title =string.char(73,89,32,78,101,116,119,111,114,107,32,40,82,101,106,111,105,110,41),
Desc =string.char(208,159,208,181,209,128,208,181,208,191,208,190,208,180,208,186,208,187,209,142,209,135,208,181,208,189,208,184,208,181),
Callback = function()
_0x1A4C(string.char(104,116,116,112,115,58,47,47,114,97,119,46,103,105,116,104,117,98,117,115,101,114,99,111,110,116,101,110,116,46,99,111,109,47,69,100,103,101,73,89,47,105,110,102,105,110,105,116,101,121,105,101,108,100,47,109,97,115,116,101,114,47,115,111,117,114,99,101),string.char(73,89))
end,
})
_0x441E:Section({ Title =string.char(208,163,209,130,208,184,208,187,208,184,209,130,209,139)})
_0x441E:Button({
Title =string.char(82,101,106,111,105,110,32,83,101,114,118,101,114),
Callback = function()
pcall(function()
game:GetService(string.char(84,101,108,101,112,111,114,116,83,101,114,118,105,99,101)):Teleport(game.PlaceId, _0x808F)
end)
end,
})
_0x441E:Button({
Title =string.char(83,101,114,118,101,114,32,72,111,112),
Callback = function()
local _0xE64D = pcall(function()
loadstring(game:HttpGet(string.char(104,116,116,112,115,58,47,47,114,97,119,46,103,105,116,104,117,98,117,115,101,114,99,111,110,116,101,110,116,46,99,111,109,47,69,100,103,101,73,89,47,105,110,102,105,110,105,116,101,121,105,101,108,100,47,109,97,115,116,101,114,47,115,111,117,114,99,101)))()
end)
end,
})
_0x441E:Button({
Title =string.char(82,101,115,101,116,32,67,104,97,114,97,99,116,101,114),
Callback = function()
pcall(function()
if _0x808F.Character then
_0x808F.Character:BreakJoints()
end
end)
end,
})_0x441E:Section({ Title =string.char(69,120,116,114,97,32,117,116,105,108,105,116,105,101,115)})
_0x441E:Button({
Title =string.char(65,110,116,105,32,65,70,75),
Desc =string.char(80,114,101,118,101,110,116,115,32,105,100,108,101,32,107,105,99,107,32,117,115,105,110,103,32,97,32,108,105,103,104,116,119,101,105,103,104,116,32,105,110,112,117,116,32,112,117,108,115,101),
Icon =string.char(99,108,111,99,107,45,51),
Callback = function()
local _0x57B8 = game:GetService(string.char(86,105,114,116,117,97,108,85,115,101,114))
local _0x1F1C
_0x1F1C = _0x808F.Idled:Connect(function()
pcall(function()
_0x57B8:Button2Down(Vector2.new(0, 0), _0x0A39.CFrame)
task.wait(0.05)
_0x57B8:Button2Up(Vector2.new(0, 0), _0x0A39.CFrame)
end)
end)
_0xF928(string.char(77,73,83,67),string.char(65,110,116,105,32,65,70,75,32,104,97,110,100,108,101,114,32,97,116,116,97,99,104,101,100))
_0x81A6(string.char(65,110,116,105,32,65,70,75),string.char(69,110,97,98,108,101,100,32,102,111,114,32,116,104,105,115,32,115,101,115,115,105,111,110,46),string.char(99,104,101,99,107))
end,
})
_0x441E:Button({
Title =string.char(67,111,112,121,32,80,108,97,99,101,32,73,68),
Desc =string.char(67,111,112,105,101,115,32,116,104,101,32,99,117,114,114,101,110,116,32,80,108,97,99,101,73,100),
Icon =string.char(99,111,112,121),
Callback = function()
local _0x34BF = tostring(game.PlaceId)
if setclipboard then
pcall(function() setclipboard(_0x34BF) end)
_0x81A6(string.char(80,108,97,99,101,32,73,68), _0x34BF ..string.char(32,99,111,112,105,101,100,46),string.char(99,111,112,121))
else
_0x81A6(string.char(80,108,97,99,101,32,73,68), _0x34BF,string.char(104,97,115,104))
end
end,
})
_0x441E:Button({
Title =string.char(67,108,105,101,110,116,32,70,80,83),
Desc =string.char(83,104,111,119,115,32,97,32,115,104,111,114,116,32,70,80,83,32,115,97,109,112,108,101),
Icon =string.char(103,97,117,103,101),
Callback = function()
task.spawn(function()
local _0xB91F = 0
local _0x1DA3 = os.clock()
local _0x9323
_0x9323 = _0x1263.RenderStepped:Connect(function()
_0xB91F += 1
if os.clock() - _0x1DA3 >= 1 then
_0x9323:Disconnect()
_0x81A6(string.char(70,80,83), tostring(_0xB91F) ..string.char(32,102,114,97,109,101,115,47,115,101,99,32,115,97,109,112,108,101),string.char(103,97,117,103,101))
end
end)
end)
end,
})
_0x441E:Button({
Title =string.char(82,101,106,111,105,110),
Desc =string.char(84,101,108,101,112,111,114,116,32,98,97,99,107,32,105,110,116,111,32,116,104,101,32,99,117,114,114,101,110,116,32,80,108,97,99,101,73,100),
Icon =string.char(114,101,102,114,101,115,104,45,99,119),
Callback = function()
pcall(function()
_0x1ACD:Teleport(game.PlaceId, _0x808F)
end)
end,
})
_0x441E:Button({
Title =string.char(76,101,97,118,101,32,83,101,114,118,101,114),
Desc =string.char(67,108,111,115,101,115,32,116,104,101,32,108,111,99,97,108,32,99,108,105,101,110,116,32,115,101,115,115,105,111,110),
Icon =string.char(108,111,103,45,111,117,116),
Callback = function()
pcall(function()
game:Shutdown()
end)
end,
})
_0x441E:Section({ Title =string.char(69,120,116,114,97,32,108,111,97,100,101,114,115)})
local _0xBB7E = {
{string.char(67,77,68,45,88),string.char(104,116,116,112,115,58,47,47,114,97,119,46,103,105,116,104,117,98,117,115,101,114,99,111,110,116,101,110,116,46,99,111,109,47,67,77,68,45,88,47,67,77,68,45,88,47,109,97,115,116,101,114,47,83,111,117,114,99,101),string.char(67,111,109,109,97,110,100,32,117,116,105,108,105,116,121)},
{string.char(72,121,100,114,111,120,105,100,101,32,66,111,111,116,115,116,114,97,112),string.char(104,116,116,112,115,58,47,47,114,97,119,46,103,105,116,104,117,98,117,115,101,114,99,111,110,116,101,110,116,46,99,111,109,47,85,112,98,111,108,116,47,72,121,100,114,111,120,105,100,101,47,109,97,115,116,101,114,47,115,114,99,47,105,110,105,116,46,108,117,97),string.char(72,121,100,114,111,120,105,100,101,32,98,111,111,116,115,116,114,97,112)},
{string.char(83,105,109,112,108,101,83,112,121,32,76,111,97,100,101,114),string.char(104,116,116,112,115,58,47,47,114,97,119,46,103,105,116,104,117,98,117,115,101,114,99,111,110,116,101,110,116,46,99,111,109,47,55,56,110,47,83,105,109,112,108,101,83,112,121,47,109,97,105,110,47,83,105,109,112,108,101,83,112,121,46,108,117,97),string.char(82,101,109,111,116,101,32,105,110,115,112,101,99,116,105,111,110)},
{string.char(78,97,109,101,108,101,115,115,32,65,100,109,105,110),string.char(104,116,116,112,115,58,47,47,114,97,119,46,103,105,116,104,117,98,117,115,101,114,99,111,110,116,101,110,116,46,99,111,109,47,70,105,108,116,101,114,105,110,103,69,110,97,98,108,101,100,47,78,97,109,101,108,101,115,115,65,100,109,105,110,47,109,97,105,110,47,83,111,117,114,99,101),string.char(65,100,109,105,110,45,115,116,121,108,101,32,99,111,109,109,97,110,100,115)},
}
for _, item in ipairs(_0xBB7E) do
_0x441E:Button({
Title = item[1],
Desc = item[3],
Icon =string.char(112,108,97,121),
Callback = function()
_0x1A4C(item[2], item[1])
end,
})
endlocal _0x4C3C = _0x0B1E:Tab({ Title =string.char(67,111,110,102,105,103), Icon =string.char(115,97,118,101)})
_0x4C3C:Section({ Title =string.char(208,163,208,191,209,128,208,176,208,178,208,187,208,181,208,189,208,184,208,181)})
_0x4C3C:Button({
Title =string.char(83,97,118,101,32,67,111,110,102,105,103),
Callback = function()
if _0x8343() then _0x81A6(string.char(67,111,110,102,105,103),string.char(208,161,208,190,209,133,209,128,208,176,208,189,208,181,208,189,208,190),string.char(99,104,101,99,107))
else _0x81A6(string.char(67,111,110,102,105,103),string.char(208,158,209,136,208,184,208,177,208,186,208,176),string.char(120)) end
end,
})
_0x4C3C:Button({
Title =string.char(76,111,97,100,32,67,111,110,102,105,103),
Callback = function()
if _0xD372() then
_0x81A6(string.char(67,111,110,102,105,103),string.char(208,151,208,176,208,179,209,128,209,131,208,182,208,181,208,189,208,190),string.char(99,104,101,99,107))
_0x6EB5.Radius = _0x62E6.radius
_0x6EB5.Color = _0x62E6.circleColor
pcall(function() _0xA442:SetTheme(_0x62E6.currentTheme) end)
else
_0x81A6(string.char(67,111,110,102,105,103),string.char(208,158,209,136,208,184,208,177,208,186,208,176),string.char(120))
end
end,
})
_0x4C3C:Button({
Title =string.char(68,101,108,101,116,101,32,67,111,110,102,105,103),
Callback = function()
if delfile and isfile and isfile(_0x7102) then
delfile(_0x7102)
_0x81A6(string.char(67,111,110,102,105,103),string.char(208,163,208,180,208,176,208,187,208,181,208,189,208,190),string.char(116,114,97,115,104))
end
end,
})
_0x4C3C:Button({
Title =string.char(82,101,115,101,116,32,68,101,102,97,117,108,116,115),
Callback = function()
_0x62E6.radius = 200
_0x62E6.smoothness = 0.3
_0x62E6.circleColor = Color3.fromRGB(124, 92, 255)
_0x62E6.targetPriority =string.char(67,114,111,115,115,104,97,105,114)_0x62E6.prediction = 0.0
_0x62E6.aimPart =string.char(72,101,97,100)_0x62E6.aimMode =string.char(72,111,108,100)_0x62E6.triggerDelay = 0.05
_0x62E6.currentTheme =string.char(68,97,114,107)_0x62E6.walkSpeed = 16
_0x62E6.jumpPower = 50
_0x62E6.flySpeed = 60
_0x6EB5.Radius = _0x62E6.radius
_0x6EB5.Color = _0x62E6.circleColor
pcall(function() _0xA442:SetTheme(string.char(68,97,114,107)) end)
_0x81A6(string.char(67,111,110,102,105,103),string.char(208,161,208,177,209,128,208,190,209,136,208,181,208,189,208,190),string.char(114,101,102,114,101,115,104,45,99,119))
end,
})_0x375C.InputBegan:Connect(function(input, gp)
if gp then return end
if _0x62E6.infJump and input.KeyCode == Enum.KeyCode.Space then
if _0x808F.Character then
local _0x7005 = _0x808F.Character:FindFirstChildOfClass(string.char(72,117,109,97,110,111,105,100))
if _0x7005 then _0x7005:ChangeState(Enum.HumanoidStateType.Jumping) end
end
end
if not _0x62E6.aimEnabled then return end
if input.KeyCode == _0x62E6.currentBind then
if _0x62E6.aimMode ==string.char(84,111,103,103,108,101)then
_0x62E6.toggleState = not _0x62E6.toggleState
_0x6EB5.Visible = _0x62E6.toggleState and _0x62E6.fovVisible
if not _0x62E6.toggleState then _0x62E6.lockedTarget = nil end
elseif _0x62E6.aimMode ==string.char(72,111,108,100)then
_0x62E6.holdState = true
_0x6EB5.Visible = _0x62E6.fovVisible
end
end
end)
_0x375C.InputEnded:Connect(function(input)
if not _0x62E6.aimEnabled then return end
if input.KeyCode == _0x62E6.currentBind and _0x62E6.aimMode ==string.char(72,111,108,100)then
_0x62E6.holdState = false
_0x6EB5.Visible = false
_0x62E6.lockedTarget = nil
end
end)local _0x2BAE = false
local _0x4B35 = nil
local function _0xF907()
if _0x2BAE then return end
local _0xE64D = pcall(function()
local _0x2225 = getrawmetatable(game)
if not _0x2225 then return end
_0x4B35 = _0x2225.__index
setreadonly(_0x2225, false)
_0x2225.__index = newcclosure(function(self, key)
if _0x62E6.silentAim and _0x62E6.aimEnabled then
local _0x5E16 = _0x62E6.toggleState or _0x62E6.holdState
if _0x5E16 then
local _0x4AAC = (self == _0xC5D8) or tostring(self) ==string.char(77,111,117,115,101)if _0x4AAC and (key ==string.char(72,105,116)or key ==string.char(84,97,114,103,101,116)) then
local _0xC0B4 = _0x930E()
if _0xC0B4 then
if key ==string.char(72,105,116)then return CFrame.new(_0xC0B4.Position)
elseif key ==string.char(84,97,114,103,101,116)then return _0xC0B4 end
end
end
end
end
return _0x4B35(self, key)
end)
setreadonly(_0x2225, true)
_0x2BAE = true
end)
end
local function _0x6E96()
if not _0x2BAE then return end
pcall(function()
local _0x2225 = getrawmetatable(game)
if _0x2225 and _0x4B35 then
setreadonly(_0x2225, false)
_0x2225.__index = _0x4B35
setreadonly(_0x2225, true)
end
end)
_0x2BAE = false
endlocal _0xF629 = 0
_0x1263.RenderStepped:Connect(function(dt)
if _0x62E6.randomCircleColor then
_0xF629 = (_0xF629 + dt * 0.2) % 1
_0x6EB5.Color = Color3.fromHSV(_0xF629, 1, 1)
else
_0x6EB5.Color = _0x62E6.circleColor
end
if _0x62E6.silentAim and _0x62E6.aimEnabled and not _0x2BAE then
_0xF907()
elseif not _0x62E6.silentAim and _0x2BAE then
_0x6E96()
end
if not _0x62E6.aimEnabled then
_0x6EB5.Visible = false
return
end
local _0x5E16 = _0x62E6.toggleState or _0x62E6.holdState
if not _0x5E16 then
_0x6EB5.Visible = false
return
end
_0x6EB5.Visible = _0x62E6.fovVisible
_0x6EB5.Position = _0xF147()
_0x6EB5.Radius = _0x62E6.radius
if not _0x62E6.silentAim then
local _0xC0B4 = _0x930E()
if _0xC0B4 then _0x3F12(_0xC0B4.Position) end
end
end)
local _0x65F7 = 0
_0x1263.RenderStepped:Connect(function()
if not _0x62E6.triggerBot then return end
local _0xCC2B = tick()
if _0xCC2B - _0x65F7 < _0x62E6.triggerDelay then return end
local _0xC0B4 = _0x930E()
if not _0xC0B4 then return end
local _0xED55 = _0x0A39:WorldToViewportPoint(_0xC0B4.Position)
local _0xBA7B = (Vector2.new(_0xED55.X, _0xED55.Y) - _0xF147()).Magnitude
if _0xBA7B > 15 then return end
_0x65F7 = _0xCC2B
if mouse1click then mouse1click() end
end)_0x1263.Stepped:Connect(function()
if not _0x62E6.noclip then return end
if not _0x808F.Character then return end
for _, p in ipairs(_0x808F.Character:GetDescendants()) do
if p:IsA(string.char(66,97,115,101,80,97,114,116)) and p.CanCollide then p.CanCollide = false end
end
end)local _0xF829, _0x7E41
_0x1263.RenderStepped:Connect(function(dt)
if not _0x808F.Character then return end
local _0xA3AB = _0x808F.Character:FindFirstChild(string.char(72,117,109,97,110,111,105,100,82,111,111,116,80,97,114,116))
if not _0xA3AB then return end
if _0x62E6.flyEnabled then
local _0x7005 = _0x808F.Character:FindFirstChildOfClass(string.char(72,117,109,97,110,111,105,100))
if _0x7005 then _0x7005.PlatformStand = true end
if not _0xF829 then
_0xF829 = Instance.new(string.char(66,111,100,121,86,101,108,111,99,105,116,121))
_0xF829.MaxForce = Vector3.new(1e5, 1e5, 1e5)
_0xF829.Velocity = Vector3.zero
_0xF829.Parent = _0xA3AB
end
if not _0x7E41 then
_0x7E41 = Instance.new(string.char(66,111,100,121,71,121,114,111))
_0x7E41.MaxTorque = Vector3.new(1e5, 1e5, 1e5)
_0x7E41.P = 1e4
_0x7E41.Parent = _0xA3AB
end
local _0x4AFB = Vector3.zero
if _0x375C:IsKeyDown(Enum.KeyCode.W) then _0x4AFB += _0x0A39.CFrame.LookVector end
if _0x375C:IsKeyDown(Enum.KeyCode.S) then _0x4AFB -= _0x0A39.CFrame.LookVector end
if _0x375C:IsKeyDown(Enum.KeyCode.A) then _0x4AFB -= _0x0A39.CFrame.RightVector end
if _0x375C:IsKeyDown(Enum.KeyCode.D) then _0x4AFB += _0x0A39.CFrame.RightVector end
if _0x375C:IsKeyDown(Enum.KeyCode.Space) then _0x4AFB += Vector3.new(0, 1, 0) end
if _0x375C:IsKeyDown(Enum.KeyCode.LeftShift) then _0x4AFB -= Vector3.new(0, 1, 0) end
if _0x4AFB.Magnitude > 0 then _0x4AFB = _0x4AFB.Unit * _0x62E6.flySpeed end
_0xF829.Velocity = _0x4AFB
_0x7E41.CFrame = _0x0A39.CFrame
else
if _0xF829 then _0xF829:Destroy() _0xF829 = nil end
if _0x7E41 then _0x7E41:Destroy() _0x7E41 = nil end
end
end)local _0xC405 = _0xC5D8.Button1Down:Connect(function()
if not _0x62E6.cframeClickTP then return end
pcall(function()
local _0x4006 = _0x808F.Character
local _0xA3AB = _0x4006 and _0x4006:FindFirstChild(string.char(72,117,109,97,110,111,105,100,82,111,111,116,80,97,114,116))
if _0xA3AB and _0xC5D8.Hit then
_0xA3AB.CFrame = CFrame.new(_0xC5D8.Hit.Position + Vector3.new(0, 3, 0))
_0xF928(string.char(67,70,82,65,77,69),string.char(67,108,105,99,107,32,116,101,108,101,112,111,114,116))
end
end)
end)
_0x1263.RenderStepped:Connect(function(dt)
local _0x4006 = _0x808F.Character
local _0xA3AB = _0x4006 and _0x4006:FindFirstChild(string.char(72,117,109,97,110,111,105,100,82,111,111,116,80,97,114,116))
local _0xABB1 = _0x4006 and _0x4006:FindFirstChildOfClass(string.char(72,117,109,97,110,111,105,100))
if not _0xA3AB or not _0xABB1 then return end
pcall(function()
if _0x62E6.cframeSpeedEnabled then
local _0x7A3F = _0xABB1.MoveDirection
if _0x7A3F.Magnitude > 0 then
_0xA3AB.CFrame = _0xA3AB.CFrame + _0x7A3F.Unit * _0x62E6.cframeSpeed * dt
end
end
if _0x62E6.cframeFlyEnabled then
local _0x4AFB = Vector3.zero
if _0x375C:IsKeyDown(Enum.KeyCode.W) then _0x4AFB += _0x0A39.CFrame.LookVector end
if _0x375C:IsKeyDown(Enum.KeyCode.S) then _0x4AFB -= _0x0A39.CFrame.LookVector end
if _0x375C:IsKeyDown(Enum.KeyCode.A) then _0x4AFB -= _0x0A39.CFrame.RightVector end
if _0x375C:IsKeyDown(Enum.KeyCode.D) then _0x4AFB += _0x0A39.CFrame.RightVector end
if _0x375C:IsKeyDown(Enum.KeyCode.Space) then _0x4AFB += Vector3.yAxis end
if _0x375C:IsKeyDown(Enum.KeyCode.LeftShift) then _0x4AFB -= Vector3.yAxis end
if _0x4AFB.Magnitude > 0 then
_0xA3AB.CFrame = _0xA3AB.CFrame + _0x4AFB.Unit * _0x62E6.cframeFlySpeed * dt
end
elseif _0x62E6.cframeJumpEnabled and _0x375C:IsKeyDown(Enum.KeyCode.Space) then
_0xA3AB.CFrame = _0xA3AB.CFrame + Vector3.yAxis * _0x62E6.cframeJumpHeight * dt * 12
elseif _0x62E6.cframeAirWalk and _0x375C:IsKeyDown(Enum.KeyCode.Space) then
_0xA3AB.CFrame = _0xA3AB.CFrame + Vector3.yAxis * _0x62E6.cframeJumpHeight * dt * 8
end
end)
end)_0x808F.CharacterAdded:Connect(function(_0x4006)
task.wait(1)
local _0x7005 = _0x4006:WaitForChild(string.char(72,117,109,97,110,111,105,100), 5)
if _0x7005 then
_0x7005.WalkSpeed = _0x62E6.walkSpeed
_0x7005.JumpPower = _0x62E6.jumpPower
end
end)local function _0xF678()
if not _0x62E6.uiAnimations then return end
pcall(function()
local _0x1AF6 = _0xA442.ScreenGui
if not _0x1AF6 then return end
for _, obj in ipairs(_0x1AF6:GetDescendants()) do
if (obj:IsA(string.char(84,101,120,116,66,117,116,116,111,110)) or obj:IsA(string.char(73,109,97,103,101,66,117,116,116,111,110))) and not obj:GetAttribute(string.char(84,97,107,99,97,65,110,105,109,97,116,101,100)) then
obj:SetAttribute(string.char(84,97,107,99,97,65,110,105,109,97,116,101,100), true)
local _0x8BB5 = obj.Size
local _0x7BD6 = UDim2.new(
_0x8BB5.X.Scale, _0x8BB5.X.Offset + 2,
_0x8BB5.Y.Scale, _0x8BB5.Y.Offset + 2
)
obj.MouseEnter:Connect(function()
if not _0x62E6.uiAnimations then return end
pcall(function()
_0x49C6:Create(
obj,
TweenInfo.new(0.12, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
{ Size = _0x7BD6 }
):Play()
end)
end)
obj.MouseLeave:Connect(function()
pcall(function()
_0x49C6:Create(
obj,
TweenInfo.new(0.12, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
{ Size = _0x8BB5 }
):Play()
end)
end)
end
end
end)
end
task.spawn(function()
task.wait(1.8)
_0xC7E0(_0x62E6.fontName)
_0xF678()
end)
_0x81A6(string.char(116,97,107,99,97,104,117,98),string.char(82,105,103,104,116,83,104,105,102,116,32,226,128,148,32,208,188,208,181,208,189,209,142,46,32,65,105,109,32,208,146,208,154,208,155,46),string.char(99,104,101,99,107))
print(string.char(91,116,97,107,99,97,104,117,98,93,32,108,111,97,100,101,100,46,32,77,101,110,117,58,32,82,105,103,104,116,83,104,105,102,116))
