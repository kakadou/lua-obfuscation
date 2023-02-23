-- Gab1tzu
local Whitelist_Table = {
    ['1'] = '280A5311-312C-4CBF-B59E-250F5BF2FD66',
    ['Tigger5535'] = 'C0C78D95-A5EA-4F74-A079-078C46ABAB7C', ----tic0056
    ['Nuggets2022'] = '93F9DB70-AC1D-45C9-8292-031037BA72AE',
    ['JamalNewman'] = '4512180D-EECD-404F-8D74-839F7EF8E5D6',
    ['sTWQCR1McAyyzwhUnuBorqFKNFIDWvz4'] = '1-5941EAD1-FBDF-49EA-AE3C-9350F527087E',
    ['5uXQJiqD8Re8Plwwo7zdU7TQaRANlfEK'] = '-7E8A48C1-F353-42B0-AFD2-823F35C31311',
    ['WmA4pzfNUQHzyUv7D78jr87vewJQxtXh'] = '-280A5311-312C-4CBF-B59E-250F5BF2FD66',
    ['BvdAP9GXBEGgukStKYthJqyDdEXa0pdS'] = '-8101BD7C-741B-4AA4-9718-527EA158F31A',
}

local HWID1 = game:GetService("RbxAnalyticsService"):GetClientId()
---setclipboard(HWID1)
local forez = "Ez"
for i,v in pairs(Whitelist_Table) do
    if forez == "Ez" then
        if _G.key == i then
            if v == HWID1 then

local Players = game:GetService("Players");
local LocalPlayer = Players.LocalPlayer;
local Mouse = LocalPlayer:GetMouse();
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local SoundService = game:GetService("SoundService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Camera = workspace.CurrentCamera
local Cameras = game:GetService("Workspace").Camera;
local CurrentCamera = game:GetService("Workspace").CurrentCamera
local worldToViewportPoint = CurrentCamera.worldToViewportPoint
local gmt = getrawmetatable(game)
setreadonly(gmt, false)
local oldindex = gmt.__index
local ViewportSize_ = Camera.ViewportSize / 2
local Axis_X, Axis_Y = ViewportSize_.X, ViewportSize_.Y

local HorizontalLine = Drawing.new("Line")
local VerticalLine = Drawing.new("Line")

_G.ToMouse = true

_G.CrosshairVisible = false
_G.CrosshairSize = 10
_G.CrosshairThickness = 1
_G.CrosshairColor = Color3.fromRGB(255, 0, 0)
_G.CrosshairTransparency = 1

RunService.RenderStepped:Connect(function()
    local Real_Size = _G.CrosshairSize / 2

    HorizontalLine.Color = _G.CrosshairColor
    HorizontalLine.Thickness = _G.CrosshairThickness
    HorizontalLine.Visible = _G.CrosshairVisible
    HorizontalLine.Transparency = _G.CrosshairTransparency
    
    VerticalLine.Color = _G.CrosshairColor
    VerticalLine.Thickness = _G.CrosshairThickness
    VerticalLine.Visible = _G.CrosshairVisible
    VerticalLine.Transparency = _G.CrosshairTransparency
    
    if _G.ToMouse == true then
        HorizontalLine.From = Vector2.new(UserInputService:GetMouseLocation().X - Real_Size, UserInputService:GetMouseLocation().Y)
        HorizontalLine.To = Vector2.new(UserInputService:GetMouseLocation().X + Real_Size, UserInputService:GetMouseLocation().Y)
        
        VerticalLine.From = Vector2.new(UserInputService:GetMouseLocation().X, UserInputService:GetMouseLocation().Y - Real_Size)
        VerticalLine.To = Vector2.new(UserInputService:GetMouseLocation().X, UserInputService:GetMouseLocation().Y + Real_Size)
    elseif _G.ToMouse == false then
        HorizontalLine.From = Vector2.new(Axis_X - Real_Size, Axis_Y)
        HorizontalLine.To = Vector2.new(Axis_X + Real_Size, Axis_Y)
    
        VerticalLine.From = Vector2.new(Axis_X, Axis_Y - Real_Size)
        VerticalLine.To = Vector2.new(Axis_X, Axis_Y + Real_Size)
    end
end)

UserInputService.TextBoxFocused:Connect(function()
    Typing = true
end)

UserInputService.TextBoxFocusReleased:Connect(function()
    Typing = false
end)


--[Main Variables]

local plrs = game["Players"]
local rs = game["RunService"]

local plr = plrs.LocalPlayer
local mouse = plr:GetMouse()
local camera = workspace.CurrentCamera
local worldToViewportPoint = camera.worldToViewportPoint

--[Optimisation Variables]

local Drawingnew = Drawing.new
local Color3fromRGB = Color3.fromRGB
local Vector3new = Vector3.new
local Vector2new = Vector2.new
local mathfloor = math.floor
local mathceil = math.ceil

--[Setup Table]

local esp = {
    players = {},
    objects = {},
    enabled = true,
    teamcheck = false,
    fontsize = 13,
    font = 2,
    maxdist = 0,
    settings = {
        name = {enabled = true, outline = true, displaynames = true, color = Color3fromRGB(255, 255, 255)},
        box = {enabled = true, outline = true, color = Color3fromRGB(255, 255, 255)},
        filledbox = {enabled = false, outline = true, transparency = 0.5, color = Color3fromRGB(255, 255, 255)},
        healthbar = {enabled = true, size = 3, outline = true},
        healthtext = {enabled = true, outline = true, color = Color3fromRGB(255, 255, 255)},
        distance = {enabled = true, outline = true, color = Color3fromRGB(255, 255, 255)},
        viewangle = {enabled = true, size = 10, color = Color3fromRGB(255, 255, 255)},
        weapon = {enabled = true, outline = true, color = Color3fromRGB(255, 255, 255)}
    },
    settings_chams = {
        enabled = false,
        teamcheck = false,
        outline = false,
        fill_color = Color3fromRGB(255, 255, 255),
        outline_color = Color3fromRGB(0, 0, 0), 
        fill_transparency = 0,
        outline_transparency = 0,
        autocolor = false,
        visible_Color = Color3fromRGB(0, 255, 0),
        invisible_Color = Color3fromRGB(255, 0, 0),
    }
}

esp.NewDrawing = function(type, properties)
    local newDrawing = Drawingnew(type)

    for i,v in next, properties or {} do
        newDrawing[i] = v
    end

    return newDrawing
end

esp.NewCham = function(properties)
    local newCham = Instance.new("Highlight", game.CoreGui)

    for i,v in next, properties or {} do
        newCham[i] = v
    end

    return newCham
end

esp.WallCheck = function(v)
    local ray = Ray.new(camera.CFrame.p, (v.Position - camera.CFrame.p).Unit * 300)
    local part, position = game:GetService("Workspace"):FindPartOnRayWithIgnoreList(ray, {plr.Character, camera}, false, true)
    if part then
        local hum = part.Parent:FindFirstChildOfClass("Humanoid")
        if not hum then
            hum = part.Parent.Parent:FindFirstChildOfClass("Humanoid")
        end
        if hum and v and hum.Parent == v.Parent then
            local Vector, Visible = camera:WorldToScreenPoint(v.Position)
            if Visible then
                return true
            end
        end
    end
end

esp.TeamCheck = function(v)
    if plr.TeamColor == v.TeamColor then
        return false
    end

    return true
end

esp.GetEquippedTool = function(v)
    return (v.Character:FindFirstChildOfClass("Tool") and tostring(v.Character:FindFirstChildOfClass("Tool"))) or "Hands"
end

esp.NewPlayer = function(v)
    esp.players[v] = {
        name = esp.NewDrawing("Text", {Color = Color3fromRGB(255, 255, 255), Outline = true, Center = true, Size = 13, Font = 2}),
        filledbox = esp.NewDrawing("Square", {Color = Color3fromRGB(255, 255, 255), Thickness = 1, Filled = true}),
        boxOutline = esp.NewDrawing("Square", {Color = Color3fromRGB(0, 0, 0), Thickness = 3}),
        box = esp.NewDrawing("Square", {Color = Color3fromRGB(255, 255, 255), Thickness = 1}),
        healthBarOutline = esp.NewDrawing("Line", {Color = Color3fromRGB(0, 0, 0), Thickness = 3}),
        healthBar = esp.NewDrawing("Line", {Color = Color3fromRGB(255, 255, 255), Thickness = 1}),
        healthText = esp.NewDrawing("Text", {Color = Color3fromRGB(255, 255, 255), Outline = true, Center = true, Size = 13, Font = 2}),
        distance = esp.NewDrawing("Text", {Color = Color3fromRGB(255, 255, 255), Outline = true, Center = true, Size = 13, Font = 2}),
        viewAngle = esp.NewDrawing("Line", {Color = Color3fromRGB(255, 255, 255), Thickness = 1}),
        weapon = esp.NewDrawing("Text", {Color = Color3fromRGB(255, 255, 255), Outline = true, Center = true, Size = 13, Font = 2}),
        cham = esp.NewCham({FillColor = esp.settings_chams.fill_color, OutlineColor = esp.settings_chams.outline_color, FillTransparency = esp.settings_chams.fill_transparency, OutlineTransparency = esp.settings_chams.outline_transparency})
    }
end

for _,v in ipairs(plrs:GetPlayers()) do
    if v ~= plr then
        esp.NewPlayer(v)
    end
end

plrs.ChildAdded:Connect(function(v)
    esp.NewPlayer(v)
end)

plrs.PlayerRemoving:Connect(function(v)
    for i2,v2 in pairs(esp.players[v]) do
        pcall(function()
            v2:Remove()
            v2:Destroy()
        end)
    end

    esp.players[v] = nil
end)

local ESP_Loop
ESP_Loop = rs.RenderStepped:Connect(function()
    for i,v in pairs(esp.players) do
        if i.Character and i.Character:FindFirstChild("Humanoid") and i.Character:FindFirstChild("HumanoidRootPart") and i.Character:FindFirstChild("Head") and i.Character:FindFirstChild("Humanoid").Health > 0 and (esp.maxdist == 0 or (i.Character.HumanoidRootPart.Position - plr.Character.HumanoidRootPart.Position).Magnitude < esp.maxdist) then
            local hum = i.Character.Humanoid
            local hrp = i.Character.HumanoidRootPart
            local head = i.Character.Head

            local Vector, onScreen = camera:WorldToViewportPoint(i.Character.HumanoidRootPart.Position)
    
            local Size = (camera:WorldToViewportPoint(hrp.Position - Vector3new(0, 3, 0)).Y - camera:WorldToViewportPoint(hrp.Position + Vector3new(0, 2.6, 0)).Y) / 2
            local BoxSize = Vector2new(mathfloor(Size * 1.5), mathfloor(Size * 1.9))
            local BoxPos = Vector2new(mathfloor(Vector.X - Size * 1.5 / 2), mathfloor(Vector.Y - Size * 1.6 / 2))
    
            local BottomOffset = BoxSize.Y + BoxPos.Y + 1

            if onScreen and esp.settings_chams.enabled then
                v.cham.Adornee = i.Character
                v.cham.Enabled = esp.settings_chams.enabled
                v.cham.OutlineTransparency = esp.settings_chams.outline and esp.settings_chams.outline_transparency or 1
                v.cham.OutlineColor = esp.settings_chams.autocolor and esp.settings_chams.autocolor_outline and esp.WallCheck(i.Character.Head) and esp.settings_chams.visible_Color or esp.settings_chams.autocolor and esp.settings_chams.autocolor_outline and not esp.WallCheck(i.Character.Head) and esp.settings_chams.invisible_Color or esp.settings_chams.outline_color
                v.cham.FillColor = esp.settings_chams.autocolor and esp.WallCheck(i.Character.Head) and esp.settings_chams.visible_Color or esp.settings_chams.autocolor and not esp.WallCheck(i.Character.Head) and esp.settings_chams.invisible_Color or esp.settings_chams.fill_color
                v.cham.FillTransparency = esp.settings_chams.fill_transparency

                if esp.settings_chams.teamcheck then
                    if not esp.TeamCheck(i) then
                        v.cham.Enabled = false
                    end
                end
            else
                v.cham.Enabled = false
            end

            if onScreen and esp.enabled then
                if esp.settings.name.enabled then
                    v.name.Position = Vector2new(BoxSize.X / 2 + BoxPos.X, BoxPos.Y - 16)
                    v.name.Outline = esp.settings.name.outline
                    v.name.Color = esp.settings.name.color

                    v.name.Font = esp.font
                    v.name.Size = esp.fontsize

                    if esp.settings.name.displaynames then
                        v.name.Text = i.DisplayName
                    else
                        v.name.Text = i.Name
                    end

                    v.name.Visible = true
                else
                    v.name.Visible = false
                end

                if esp.settings.distance.enabled and plr.Character and plr.Character:FindFirstChild("HumanoidRootPart") then
                    v.distance.Position = Vector2new(BoxSize.X / 2 + BoxPos.X, BottomOffset)
                    v.distance.Outline = esp.settings.distance.outline
                    v.distance.Text = "[" .. mathfloor((hrp.Position - plr.Character.HumanoidRootPart.Position).Magnitude) .. "m]"
                    v.distance.Color = esp.settings.distance.color
                    BottomOffset = BottomOffset + 15

                    v.distance.Font = esp.font
                    v.distance.Size = esp.fontsize

                    v.distance.Visible = true
                else
                    v.distance.Visible = false
                end

                if esp.settings.filledbox.enabled then
                    v.filledbox.Size = BoxSize + Vector2.new(-2, -2)
                    v.filledbox.Position = BoxPos + Vector2.new(1, 1)
                    v.filledbox.Color = esp.settings.filledbox.color
                    v.filledbox.Transparency = esp.settings.filledbox.transparency
                    v.filledbox.Visible = true
                else
                    v.filledbox.Visible = false
                end

                if esp.settings.box.enabled then
                    v.boxOutline.Size = BoxSize
                    v.boxOutline.Position = BoxPos
                    v.boxOutline.Visible = esp.settings.box.outline
    
                    v.box.Size = BoxSize
                    v.box.Position = BoxPos
                    v.box.Color = esp.settings.box.color
                    v.box.Visible = true
                else
                    v.boxOutline.Visible = false
                    v.box.Visible = false
                end

                if esp.settings.healthbar.enabled then
                    v.healthBar.From = Vector2new((BoxPos.X - 5), BoxPos.Y + BoxSize.Y)
                    v.healthBar.To = Vector2new(v.healthBar.From.X, v.healthBar.From.Y - (hum.Health / hum.MaxHealth) * BoxSize.Y)
                    v.healthBar.Color = Color3fromRGB(255 - 255 / (hum["MaxHealth"] / hum["Health"]), 255 / (hum["MaxHealth"] / hum["Health"]), 0)
                    v.healthBar.Visible = true
                    v.healthBar.Thickness = esp.settings.healthbar.size

                    v.healthBarOutline.From = Vector2new(v.healthBar.From.X, BoxPos.Y + BoxSize.Y + 1)
                    v.healthBarOutline.To = Vector2new(v.healthBar.From.X, (v.healthBar.From.Y - 1 * BoxSize.Y) -1)
                    v.healthBarOutline.Visible = esp.settings.healthbar.outline
                    v.healthBarOutline.Thickness = esp.settings.healthbar.size + 2
                else
                    v.healthBarOutline.Visible = false
                    v.healthBar.Visible = false
                end

                if esp.settings.healthtext.enabled then
                    v.healthText.Text = tostring(mathfloor(hum.Health))
                    v.healthText.Position = Vector2new((BoxPos.X - 20), (BoxPos.Y + BoxSize.Y - 1 * BoxSize.Y) -1)
                    v.healthText.Color = esp.settings.healthtext.color
                    v.healthText.Outline = esp.settings.healthtext.outline

                    v.healthText.Font = esp.font
                    v.healthText.Size = esp.fontsize

                    v.healthText.Visible = true
                else
                    v.healthText.Visible = false
                end

                if esp.settings.viewangle.enabled and head and head.CFrame then
                    v.viewAngle.From = Vector2new(camera:worldToViewportPoint(head.CFrame.p).X, camera:worldToViewportPoint(head.CFrame.p).Y)
                    v.viewAngle.To = Vector2new(camera:worldToViewportPoint((head.CFrame + (head.CFrame.lookVector * esp.settings.viewangle.size)).p).X, camera:worldToViewportPoint((head.CFrame + (head.CFrame.lookVector * esp.settings.viewangle.size)).p).Y)
                    v.viewAngle.Color = esp.settings.viewangle.color
                    v.viewAngle.Visible = true
                else
                    v.viewAngle.Visible = false
                end

                if esp.settings.weapon.enabled then
                    v.weapon.Visible = true
                    v.weapon.Position = Vector2new(BoxSize.X + BoxPos.X + v.weapon.TextBounds.X / 2 + 3, BoxPos.Y - 3)
                    v.weapon.Outline = esp.settings.name.outline
                    v.weapon.Color = esp.settings.name.color

                    v.weapon.Font = esp.font
                    v.weapon.Size = esp.fontsize

                    v.weapon.Text = esp.GetEquippedTool(i)
                else
                    v.weapon.Visible = false
                end

                if esp.teamcheck then
                    if esp.TeamCheck(i) then
                        v.name.Visible = esp.settings.name.enabled
                        v.box.Visible = esp.settings.box.enabled
                        v.filledbox.Visible = esp.settings.box.enabled
                        v.healthBar.Visible = esp.settings.healthbar.enabled
                        v.healthText.Visible = esp.settings.healthtext.enabled
                        v.distance.Visible = esp.settings.distance.enabled
                        v.viewAngle.Visible = esp.settings.viewangle.enabled
                        v.weapon.Visible = esp.settings.weapon.enabled
                    else
                        v.name.Visible = false
                        v.boxOutline.Visible = false
                        v.box.Visible = false
                        v.filledbox.Visible = false
                        v.healthBarOutline.Visible = false
                        v.healthBar.Visible = false
                        v.healthText.Visible = false
                        v.distance.Visible = false
                        v.viewAngle.Visible = false
                        v.weapon.Visible = false
                    end
                end
            else
                v.name.Visible = false
                v.boxOutline.Visible = false
                v.box.Visible = false
                v.filledbox.Visible = false
                v.healthBarOutline.Visible = false
                v.healthBar.Visible = false
                v.healthText.Visible = false
                v.distance.Visible = false
                v.viewAngle.Visible = false
                v.weapon.Visible = false
            end
        else
            v.name.Visible = false
            v.boxOutline.Visible = false
            v.box.Visible = false
            v.filledbox.Visible = false
            v.healthBarOutline.Visible = false
            v.healthBar.Visible = false
            v.healthText.Visible = false
            v.distance.Visible = false
            v.viewAngle.Visible = false
            v.cham.Enabled = false
            v.weapon.Visible = false
        end
    end
end)

esp.Unload = function()
    ESP_Loop:Disconnect()
    ESP_Loop = nil
    
    for i,v in pairs(esp.players) do
        for i2, v2 in pairs(v) do
            if v2 == "cham" then
                v2:Destroy()
            else
                v2:Remove()
            end
        end
    end

    table.clear(esp)
    esp = nil
end

getgenv().esp = esp

--// Utility
local utility = {
    services = {
        players = game:GetService("Players"),
        workspace = game:GetService("Workspace"),
        userinputservice = game:GetService("UserInputService"),
        runservice = game:GetService("RunService"),
        httpservice = game:GetService("HttpService"),
        coregui = game:GetService("CoreGui"),
        guiservice = game:GetService("GuiService"),
        replicatedstorage = game:GetService("ReplicatedStorage")
    },
    functions = {},
}

--// Variables
local localplayer = utility.services.players.LocalPlayer
local camera = utility.services.workspace.CurrentCamera
local mouse = localplayer:GetMouse()

--// Localisation
local drawing_new = Drawing.new
local color3_new, color3_fromrgb = Color3.new, Color3.fromRGB
local vector3_new, vector2_new = Vector3.new, Vector2.new
local math_huge, math_floor, math_ceil = math.huge, math.floor, math.ceil
local getguiinset = utility.services.guiservice.GetGuiInset
local ray_new = Ray.new


--loadstring(game:HttpGet('https://raw.githubusercontent.com/LemonProgramfile/1/main/Protected%20(1).lua'))()

local iteminfo = require(game.ReplicatedStorage.Items)

_G.nobagtimer = false
_G.candupe = false
_G.u17 = { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ,0, 0, 0, 0, 0, 0 };
_G.u18 = { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 , 0, 0, 0, 0, 0, 0 };
_G.u19 = {[1] = "",	[2] = "",	[3] = "",	[4] = "",	[5] = "",	[6] = "",	[7] = "",	[8] = "",	[9] = "",	[10] = "",	[11] = "",	[12] = "",	[13] = "",	[14] = "",	[15] = "",	[16] = "",	[17] = "",	[18] = "",	[19] = "",	[20] = "",	[21] = "",	[22] = "",	[23] = "",	[24] = "",	[25] = "",	[26] = "",	[27] = "",	[28] = "",	[29] = "",	[30] = "",	[31] = "", [32] = "",	[33] = "",	[34] = "",	[35] = "",	[36] = ""};

local gmt = getrawmetatable(game)
local faketable = {}
setreadonly(gmt, false)
local oldNamecall = gmt.__namecall

gmt.__namecall = newcclosure(function(Self, ...)
	local Args = {...}
	local method = getnamecallmethod()
	if tostring(method) == "FireServer" or tostring(method) == "InvokeServer" then
		if tostring(Self) == "SendInfo" then
			_G.u17 = Args[1]
			_G.u18 = Args[2]
			_G.u19 = Args[3]
			_G.candupe = true
		end
	end
	return oldNamecall(Self, ...)
end)

 game:GetService("RunService").RenderStepped:Connect(function()
        if _G.nobagtimer then
        for i,v in pairs(game.Players.LocalPlayer.PlayerGui.Inventory.Death.BagFrame:GetChildren()) do
      for h,j in pairs(v:GetChildren()) do
           if j.Name == "Cooldown" then
               
                   j.Visible = false
 
         end
         end
        end
end
    end)
----

local repo = 'https://raw.githubusercontent.com/wally-rblx/LinoriaLib/main/'

local Library = loadstring(game:HttpGet(repo .. 'Library.lua'))()
local ThemeManager = loadstring(game:HttpGet(repo .. 'addons/ThemeManager.lua'))()
local SaveManager = loadstring(game:HttpGet(repo .. 'addons/SaveManager.lua'))()
--local ESPLibrary = loadstring(game:HttpGet("https://raw.githubusercontent.com/DemoExists/Oblivity-2.0/main/Modules/ESP.lua"))()




local utility = {
    services = {
        players = game:GetService("Players"),
        workspace = game:GetService("Workspace"),
        userinputservice = game:GetService("UserInputService"),
        runservice = game:GetService("RunService"),
        httpservice = game:GetService("HttpService"),
        coregui = game:GetService("CoreGui"),
        guiservice = game:GetService("GuiService"),
        replicatedstorage = game:GetService("ReplicatedStorage")
    },
    functions = {},
}

--// Variables
local localplayer = utility.services.players.LocalPlayer
local camera = utility.services.workspace.CurrentCamera
local mouse = localplayer:GetMouse()
local Players = game:GetService("Players");

local LocalPlayer = Players.LocalPlayer;
local Mouse = LocalPlayer:GetMouse();
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local SoundService = game:GetService("SoundService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Camera = workspace.CurrentCamera
local Cameras = game:GetService("Workspace").Camera;
local CurrentCamera = game:GetService("Workspace").CurrentCamera
local worldToViewportPoint = CurrentCamera.worldToViewportPoint
local gmt = getrawmetatable(game)
setreadonly(gmt, false)
local oldindex = gmt.__index

local _Character = getrenv()._G.Character;

local LeavesRemoverOn = false
local HomeRayOn = false
local ZoomOn = false
local AimbotOn = false
local HRTransp = 0.6

local fovcircle = Drawing.new("Circle")
fovcircle.Visible = false
fovcircle.Radius = 120
fovcircle.Color = Color3.fromRGB(255,255,255)
fovcircle.Thickness = 1
fovcircle.Filled = false
fovcircle.Transparency = 1

fovcircle.Position = Vector2.new(CurrentCamera.ViewportSize.X / 2, CurrentCamera.ViewportSize.Y / 2)

--Aim
getgenv()._Aimbot = {
    Enabled = false,
    AimSmooth = 1,
    X_Offset = 0,
    Y_Offset = 0
}

getgenv().ASSettings = {
    AimType = "To Cursor",
    AimDis = 300,
    AimSleepers = false,
    VisibleCheck = false
}
--All Global Settings
local AllSettings = {
    FovNow = 70
}

-- GetClosestPlayerToPlayer
--function getClosestPlayerToPlayer()
--    local closestPlayer = nil;
--    local shortestDistance = ASSettings["AimDis"];
--	for i, v in pairs(workspace:GetChildren()) do
--		if v:IsA("Model") and v:FindFirstChild("Humanoid") and v.Name then
--			if v.Humanoid.Health ~= 0 and v.PrimaryPart ~= nil and v:FindFirstChild("Head") then
--				local pos = Cameras.WorldToViewportPoint(Cameras, v.PrimaryPart.Position)
--				local magnitude = (_Character.character.Middle.Position - v.PrimaryPart.Position).magnitude
--				local fovmagnitude = (Vector2.new(pos.X, pos.Y) - Vector2.new(Mouse.X, Mouse.Y)).magnitude
--				
--				if magnitude < shortestDistance then
--				    if fovmagnitude < 120 then
--				        closestPlayer = v
--					    shortestDistance = magnitude
--				    end
--				end
--			end
--		end
--	end
--	return closestPlayer
---end
--

local Window = Library:CreateWindow({

    Title = '🌚Moon |Fallen|🌚',
    Center = true, 
    AutoShow = true,
})


local Tabs = {
    Visuals = Window:AddTab('Visuals'), 
    Misc = Window:AddTab('Misc'),
    Combat = Window:AddTab('Combat'),
    Settings = Window:AddTab('Settings'),
}

local LeftGroupBox = Tabs.Visuals:AddLeftTabbox('Crosshair')

local Dupe = Tabs.Misc:AddRightGroupbox('Dupe')

local DupeButton = Dupe:AddButton('Dupe', function()
    if _G.candupe then
		game:GetService("ReplicatedStorage").Remotes.HandleDowning:FireServer(_G.u17, _G.u18, _G.u19)
    end
    
end)

Dupe:AddToggle('DupeTime', {
    Text = 'DupeTimer',
    Default = false, -- Default value (true / false)
    Tooltip = 'This is a tooltip', 
})


Toggles.DupeTime:OnChanged(function(DupeTimer1)

    _G.nobagtimer = DupeTimer1	
end)
local DupeInf = Tabs.Misc:AddLeftGroupbox('How to dupe?')
DupeInf:AddLabel('1.Put all your stuff in chest\n2.ResetCharacter.\n3.Click on - DupeTime \n4.Click on Dupe\nDone', true)


local CrosshairSt = LeftGroupBox:AddTab('Crosshair EN')
local CrosshairEN = LeftGroupBox:AddTab("Crosshair ST")


getgenv().CrosshairSettings = {
    Color = Color3.fromRGB(255,0,0),
    RainbowColor = false,
    Opacity = 1,
    Length = 10,
    Thickness = 2,
    Offset = 3,
    FollowCursor = false,
    HideMouseIcon = true,
    HideGameCrosshair = false,
}

--

--
local rightGroupBox = Tabs.Visuals:AddRightGroupbox('LocalPlayer')
-----------
local rightGroupBox2 = Tabs.Visuals:AddRightGroupbox('World')


local MyButton = rightGroupBox2:AddButton('FullBright', function()

if not _G.FullBrightExecuted then

	_G.FullBrightEnabled = false

	_G.NormalLightingSettings = {
		Brightness = game:GetService("Lighting").Brightness,
		ClockTime = game:GetService("Lighting").ClockTime,
		FogEnd = game:GetService("Lighting").FogEnd,
		GlobalShadows = game:GetService("Lighting").GlobalShadows,
		Ambient = game:GetService("Lighting").Ambient
	}

	game:GetService("Lighting"):GetPropertyChangedSignal("Brightness"):Connect(function()
		if game:GetService("Lighting").Brightness ~= 1 and game:GetService("Lighting").Brightness ~= _G.NormalLightingSettings.Brightness then
			_G.NormalLightingSettings.Brightness = game:GetService("Lighting").Brightness
			if not _G.FullBrightEnabled then
				repeat
					wait()
				until _G.FullBrightEnabled
			end
			game:GetService("Lighting").Brightness = 1
		end
	end)

	game:GetService("Lighting"):GetPropertyChangedSignal("ClockTime"):Connect(function()
		if game:GetService("Lighting").ClockTime ~= 12 and game:GetService("Lighting").ClockTime ~= _G.NormalLightingSettings.ClockTime then
			_G.NormalLightingSettings.ClockTime = game:GetService("Lighting").ClockTime
			if not _G.FullBrightEnabled then
				repeat
					wait()
				until _G.FullBrightEnabled
			end
			game:GetService("Lighting").ClockTime = 12
		end
	end)

	game:GetService("Lighting"):GetPropertyChangedSignal("FogEnd"):Connect(function()
		if game:GetService("Lighting").FogEnd ~= 786543 and game:GetService("Lighting").FogEnd ~= _G.NormalLightingSettings.FogEnd then
			_G.NormalLightingSettings.FogEnd = game:GetService("Lighting").FogEnd
			if not _G.FullBrightEnabled then
				repeat
					wait()
				until _G.FullBrightEnabled
			end
			game:GetService("Lighting").FogEnd = 786543
		end
	end)

	game:GetService("Lighting"):GetPropertyChangedSignal("GlobalShadows"):Connect(function()
		if game:GetService("Lighting").GlobalShadows ~= false and game:GetService("Lighting").GlobalShadows ~= _G.NormalLightingSettings.GlobalShadows then
			_G.NormalLightingSettings.GlobalShadows = game:GetService("Lighting").GlobalShadows
			if not _G.FullBrightEnabled then
				repeat
					wait()
				until _G.FullBrightEnabled
			end
			game:GetService("Lighting").GlobalShadows = false
		end
	end)

	game:GetService("Lighting"):GetPropertyChangedSignal("Ambient"):Connect(function()
		if game:GetService("Lighting").Ambient ~= Color3.fromRGB(178, 178, 178) and game:GetService("Lighting").Ambient ~= _G.NormalLightingSettings.Ambient then
			_G.NormalLightingSettings.Ambient = game:GetService("Lighting").Ambient
			if not _G.FullBrightEnabled then
				repeat
					wait()
				until _G.FullBrightEnabled
			end
			game:GetService("Lighting").Ambient = Color3.fromRGB(178, 178, 178)
		end
	end)

	game:GetService("Lighting").Brightness = 1
	game:GetService("Lighting").ClockTime = 12
	game:GetService("Lighting").FogEnd = 786543
	game:GetService("Lighting").GlobalShadows = false
	game:GetService("Lighting").Ambient = Color3.fromRGB(178, 178, 178)

	local LatestValue = true
	spawn(function()
		repeat
			wait()
		until _G.FullBrightEnabled
		while wait() do
			if _G.FullBrightEnabled ~= LatestValue then
				if not _G.FullBrightEnabled then
					game:GetService("Lighting").Brightness = _G.NormalLightingSettings.Brightness
					game:GetService("Lighting").ClockTime = _G.NormalLightingSettings.ClockTime
					game:GetService("Lighting").FogEnd = _G.NormalLightingSettings.FogEnd
					game:GetService("Lighting").GlobalShadows = _G.NormalLightingSettings.GlobalShadows
					game:GetService("Lighting").Ambient = _G.NormalLightingSettings.Ambient
				else
					game:GetService("Lighting").Brightness = 1
					game:GetService("Lighting").ClockTime = 12
					game:GetService("Lighting").FogEnd = 786543
					game:GetService("Lighting").GlobalShadows = false
					game:GetService("Lighting").Ambient = Color3.fromRGB(178, 178, 178)
				end
				LatestValue = not LatestValue
			end
		end
	end)
end

_G.FullBrightExecuted = true
_G.FullBrightEnabled = not _G.FullBrightEnabled
end)

rightGroupBox2:AddToggle('Gr', {
    Text = 'Grass',
    Default = true,
    Tooltip = 'Off/on grass',
})
Toggles.Gr:OnChanged(function(GrassRemove)
    sethiddenproperty(game.Workspace.Terrain, "Decoration", GrassRemove)
end)
-- Color Grass
local Terrain = game:GetService("Workspace").Terrain
local GCEN = Color3.fromRGB(93, 111, 55)
local GRCEND = false
rightGroupBox2:AddToggle('CLRG',{
    Text = 'Color Grass',
    Default = true,
    Tooltip = "Off/On",
})
Toggles.CLRG:OnChanged(function(T)
    if T == true then
        GRCEND = true
        local SetColor = Terrain:SetMaterialColor(Enum.Material.Grass,GCEN)
    elseif T == false then
        GRCEND = false
        local SetColor = Terrain:SetMaterialColor(Enum.Material.Grass,Color3.fromRGB(93, 111, 55))
    end
end)

rightGroupBox2:AddLabel('Colorgrass'):AddColorPicker('ColorGrass', {
    Default = Color3.fromRGB(93, 111, 55),
    Title = 'Changer Color Grass', 
})
Options.ColorGrass:OnChanged(function(Grass1)
    if GRCEND == true then
        GCEN = Grass1
        local SetColor = Terrain:SetMaterialColor(Enum.Material.Grass, Grass1) 
    else
        
    end
end)
--

CrosshairSt:AddToggle('Enabled', {
    Text = 'Enabled',
    Default = false, -- Default value (true / false)
    Tooltip = 'This is a tooltip', 
})


Toggles.Enabled:OnChanged(function(CrosshairVisible)
     _G.CrosshairVisible = CrosshairVisible
end)


Toggles.Enabled:SetValue(false)

CrosshairSt:AddToggle('FollowCursor', {
    Text = 'Follow Cursor',
    Default = false, -- Default value (true / false)
    Tooltip = 'This is a tooltip', 
})


Toggles.FollowCursor:OnChanged(function(CrosshairToMouse)
    _G.ToMouse = CrosshairToMouse
end)


CrosshairSt:AddLabel('Color'):AddColorPicker('Chc', {
    Default = Color3.fromRGB(255,255,255),
    Title = 'Color',
})
Options.Chc:OnChanged(function(CrosshairColor)
    _G.CrosshairColor = CrosshairColor
end)

CrosshairSt:AddSlider('Chs', {
    Text = 'Size',
    Default = 15,
    Min = 0,
    Max = 100,
    Rounding = 0,
    Compact = false,
})
Options.Chs:OnChanged(function(CrosshairSize)
    _G.CrosshairSize = CrosshairSize
end)

CrosshairSt:AddSlider('chtr', {
    Text = 'Transparency',
    Default = 1,
    Min = 0,
    Max = 1,
    Rounding = 1,
    Compact = false,
})
Options.chtr:OnChanged(function(CrshTrans)
    _G.CrosshairTransparency = CrshTrans
end)
---

CrosshairEN:AddSlider('Offset', {
    Text = 'Offset',

    Default = 0,
    Min = 0,
    Max = 100,
    Rounding = 1,

    Compact = false, 
})



local Number = Options.Offset.Value
Options.Offset:OnChanged(function(oSS)
    getgenv().CrosshairSettings.Offset = oSS
end)




--LeftGroupBox1:AddLabel('This is a label')
--LeftGroupBox1:AddLabel('This is a label\n\nwhich wraps its text!', true)


---LeftGroupBox1:AddDivider()
local gmt = getrawmetatable(game)
setreadonly(gmt, false)
local oldindex = gmt.__index
local Cameras = game:GetService("Workspace").Camera
rightGroupBox:AddSlider('SPFVVV', { Text = 'Fov', Default = 70, Min = 0, Max = 120, Rounding = 1, Compact = false, }) 
Options.SPFVVV:OnChanged(function(t) 
    gmt.__index = newcclosure(function(self,b) 
        if b == "FieldOfView" then 
            return t 
        end 
            return oldindex(self,b) 
        end) 
end) 


Options.SPFVVV:SetValue(70)

rightGroupBox:AddLabel('Zoom'):AddKeyPicker('ZoomPick', {
    Default = 'X', 
    SyncToggleState = false, 
    Mode = 'Toggle',
    Text = 'Zoom',
    NoUI = false,
})

Options.ZoomPick:OnClick(function()
    if ZoomOn == false then
        ZoomOn = true
        gmt.__index = newcclosure(function(self,b)
            if b == "FieldOfView" then
                return 1
            end
            return oldindex(self,b)
        end)
    elseif ZoomOn == true then
        ZoomOn = false
        gmt.__index = newcclosure(function(self,b)
            if b == "FieldOfView" then
                return 70
            end
            return oldindex(self,b)
        end)
    end
end)


---left esp


    local ESPGroupbox = Tabs.Visuals:AddLeftTabbox("Player ESP")
        local PlayerEspTab = ESPGroupbox:AddTab('Player ESP')
        local ObjectEspTab = ESPGroupbox:AddTab('Object ESP')

        PlayerEspTab:AddToggle('PlayerESP_Toggle', {
            Text = 'Toggle',
            Default = false,
        }):OnChanged(function(Toggle)
            esp.enabled = Toggles.PlayerESP_Toggle.Value
        end)
        
        
        
        PlayerEspTab:AddToggle('PlayerESP_BoxToggle', {
            Text = 'Box',
            Default = false,
        }):OnChanged(function(Toggle)
            esp.settings.box.enabled = Toggles.PlayerESP_BoxToggle.Value
        end)

        PlayerEspTab:AddToggle('PlayerESP_NameToggle', {
            Text = 'Name',
            Default = false
        }):OnChanged(function(State3)
           esp.settings.name.enabled = Toggles.PlayerESP_NameToggle.Value
        end)

        PlayerEspTab:AddToggle('PlayerESP_HealthBarToggle', {
            Text = 'Healthbar',
            Default = false,
        }):OnChanged(function(Toggle)
            esp.settings.healthbar.enabled = Toggles.PlayerESP_HealthBarToggle.Value
        end)

        PlayerEspTab:AddToggle('PlayerESP_HealthTextToggle', {
            Text = 'Health text',
            Default = false,
        }):OnChanged(function(Toggle)
            esp.settings.healthtext.enabled = Toggles.PlayerESP_HealthTextToggle.Value
        end)
--------
--------

        
        PlayerEspTab:AddToggle('ChamesESPToggle', {
            Text = 'Chames',
            Default = false
        }):OnChanged(function(State2)
            print("Not work Chames")
        end)
            



---Misc



-------6
local AimlockSector = Tabs.Combat:AddLeftGroupbox('Aimlock')
AimlockSector:AddLabel('Keybind'):AddKeyPicker('AIMKBK', {
    Default = 'V', 
    SyncToggleState = false, 
    Mode = 'Toggle',
    Text = 'Aimlock,SRY updating',
    NoUI = false,
})
Options.AIMKBK:OnClick(function(Value)
 --   local Target;
--	if AimbotOn == false then
--        AimbotOn = true
--		while AimbotOn == true do
--			Target = getClosestPlayerToPlayer();
--			if Target then
--				local Head = Target:FindFirstChild("Head");
--				if Head then
--					local pos, _ = Cameras:WorldToScreenPoint(Head.Position)
--					mousemoverel((pos.X - (Mouse.X))/_Aimbot["AimSmooth"], (pos.Y - (Mouse.Y))/_Aimbot["AimSmooth"])
--				end
--			end
--			wait(0.01)
--		end
--	else
--		AimbotOn = false
	--end
end)

AimlockSector:AddToggle('vftt', {
    Text = 'Visible Fov',
    Default = false,
    Tooltip = 'Off/On Visible Fov',
})
Toggles.vftt:OnChanged(function(J)
    fovcircle.Visible = J
end)


AimlockSector:AddLabel('Color'):AddColorPicker('CCFF', {
    Default = Color3.new(1, 0, 0),
    Title = 'Fov Color',
})
Options.CCFF:OnChanged(function(KKK)
   fovcircle.Color = KKK
end)

AimlockSector:AddSlider('ADSSS', {
    Text = 'Aim ditance',
    Default = 650,
    Min = 300,
    Max = 1200,
    Rounding = 0,
    Compact = false,
})
Options.ADSSS:OnChanged(function(t)
    ASSettings["AimDis"] = t
end)

AimlockSector:AddSlider('frsss', {
    Text = 'Fov radius',
    Default = 70,
    Min = 0,
    Max = 600,
    Rounding = 0,
    Compact = false,
})
Options.frsss:OnChanged(function(t)
    fovcircle.Radius = t
end)

AimlockSector:AddSlider('ASSSS', {
    Text = 'Aim Smoothnes',
    Default = 20,
    Min = 0,
    Max = 100,
    Rounding = 0,
    Compact = false,
})
Options.ASSSS:OnChanged(function(t)
    _Aimbot["AimSmooth"] = t/10
end)
--aimbot
Library:SetWatermark('🌚Moon V0.0.1 🌚 ')

Library.KeybindFrame.Visible = true; 

Library:OnUnload(function()
    print('Unloaded!')
    Library.Unloaded = true
end)

local MenuGroup = Tabs['Settings']:AddLeftGroupbox('Menu')


MenuGroup:AddButton('Unload', function() Library:Unload() end)
MenuGroup:AddLabel('Menu bind'):AddKeyPicker('MenuKeybind', { Default = 'End', NoUI = true, Text = 'Menu keybind' }) 

Library.ToggleKeybind = Options.MenuKeybind


ThemeManager:SetLibrary(Library)
SaveManager:SetLibrary(Library)


SaveManager:IgnoreThemeSettings() 


SaveManager:SetIgnoreIndexes({ 'MenuKeybind' }) 


ThemeManager:SetFolder('MyScriptHub')
SaveManager:SetFolder('MyScriptHub/specific-game')


SaveManager:BuildConfigSection(Tabs['Settings']) 


ThemeManager:ApplyToTab(Tabs['Settings'])

            else
                
            end
        else
            
        end
    else

    end
end 