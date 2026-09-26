"-- A previous copy could set this flag and then stop while waiting for a
-- game-specific object. Clear that stale state so a fixed copy can start.
if _G.YoutRunning then
    warn("[Y-out] Instancia previa detectada. Se recomienda rejoin si hay comportamiento errÃ¡tico.")
end
_G.YoutRunning = false
_G.__YoutMainOriginalPos = nil

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UIS = game:GetService("UserInputService")
local TS = game:GetService("TweenService")
local Lighting = game:GetService("Lighting")
local HS = game:GetService("HttpService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Workspace = game:GetService("Workspace")

local LP = Players.LocalPlayer
if not LP then
    local _lpConn
    _lpConn = Players.PlayerAdded:Connect(function(p) LP = p end)
    local _t0 = tick()
    while not LP and tick() - _t0 < 15 do task.wait(0.1) end
    if _lpConn then _lpConn:Disconnect() end
end
if not LP then
    warn("[Y-out] LocalPlayer no disponible en 15s. Abortando.")
    return
end

local pgui = LP:WaitForChild("PlayerGui", 20)
if not pgui then
    warn("[Y-out] PlayerGui no cargÃ³ en 20s. Abortando.")
    return
end

local camera = Workspace.CurrentCamera

_G.YoutRunning = true
_G.YoutSession = (_G.YoutSession or 0) + 1
local _mySession = _G.YoutSession

local YOUT_LANGUAGE = "en"

local YOUT_TRANSLATIONS = {
    es = { ["RESET ALL SETTINGS"]="RESTABLECER TODO", ["SETTINGS RESET"]="AJUSTES RESTABLECIDOS", ["CONFIRM?"]="Â¿CONFIRMAR?", ["ERROR"]="ERROR", ["Reset All Keybinds"]="RESTABLECER TECLAS", ["RESET"]="RESTABLECER", ["Keybinds"]="TECLAS", ["Carry Mode"]="MODO CARGAR", ["Lagger Mode"]="MODO LAG", ["Auto Left"]="AUTO IZQUIERDA", ["Auto Right"]="AUTO DERECHA", ["Auto Bat"]="AUTO BATE", ["TP BAT"]="TP BATE", ["Insta Reset"]="REINICIO RÃPIDO", ["TP Down"]="TP ABAJO", ["Drop Brainrot"]="SOLTAR BRAINROT", ["Hide GUI"]="OCULTAR MENÃš", ["Normal Speed"]="VELOCIDAD NORMAL", ["Carry Speed"]="VELOCIDAD CARGAR", ["Current Mode"]="MODO ACTUAL", ["ACTIVATE"]="ACTIVAR" },
    pt = { ["RESET ALL SETTINGS"]="REDEFINIR TUDO", ["SETTINGS RESET"]="CONFIGURAÃ‡Ã•ES REDEFINIDAS", ["CONFIRM?"]="CONFIRMAR?", ["ERROR"]="ERRO", ["Reset All Keybinds"]="REDEFINIR TECLAS", ["RESET"]="REDEFINIR", ["Keybinds"]="TECLAS", ["Carry Mode"]="MODO CARREGAR", ["Auto Left"]="AUTO ESQUERDA", ["Auto Right"]="AUTO DIREITA", ["Hide GUI"]="OCULTAR MENU", ["Normal Speed"]="VELOCIDADE NORMAL", ["Carry Speed"]="VELOCIDADE CARREGAR", ["ACTIVATE"]="ATIVAR" },
    fr = { ["RESET ALL SETTINGS"]="RÃ‰INITIALISER", ["SETTINGS RESET"]="PARAMÃˆTRES RÃ‰INITIALISÃ‰S", ["CONFIRM?"]="CONFIRMER ?", ["ERROR"]="ERREUR", ["Reset All Keybinds"]="RÃ‰INITIALISER LES TOUCHES", ["RESET"]="RÃ‰INITIALISER", ["Keybinds"]="RACCOURCIS", ["Carry Mode"]="MODE PORTER", ["Auto Left"]="AUTO GAUCHE", ["Auto Right"]="AUTO DROITE", ["Hide GUI"]="MASQUER LE MENU", ["Normal Speed"]="VITESSE NORMALE", ["Carry Speed"]="VITESSE PORTER", ["ACTIVATE"]="ACTIVER" },
    de = { ["RESET ALL SETTINGS"]="ALLES ZURÃœCKSETZEN", ["SETTINGS RESET"]="EINSTELLUNGEN ZURÃœCKGESETZT", ["CONFIRM?"]="BESTÃ„TIGEN?", ["ERROR"]="FEHLER", ["Reset All Keybinds"]="TASTEN ZURÃœCKSETZEN", ["RESET"]="ZURÃœCKSETZEN", ["Keybinds"]="TASTEN", ["Carry Mode"]="TRAGEMODUS", ["Auto Left"]="AUTO LINKS", ["Auto Right"]="AUTO RECHTS", ["Hide GUI"]="MENÃœ AUSBLENDEN", ["Normal Speed"]="NORMALE GESCHWINDIGKEIT", ["Carry Speed"]="TRAGEGESCHWINDIGKEIT", ["ACTIVATE"]="AKTIVIEREN" },
}

local function localizeYoutInterface(root)
    local dictionary = YOUT_TRANSLATIONS[YOUT_LANGUAGE]
    if not dictionary or not root then return end
    for _, object in ipairs(root:GetDescendants()) do
        if object:IsA("TextLabel") or object:IsA("TextButton") then
            local source = object:GetAttribute("YoutSourceText") or object.Text
            object:SetAttribute("YoutSourceText", source)
            local translated = dictionary[source]
            if translated then object.Text = translated end
        end
    end
end

local function youtTranslate(source)
    local dictionary = YOUT_TRANSLATIONS[YOUT_LANGUAGE]
    return (dictionary and dictionary[source]) or source
end

local _tick          = tick
local _clamp         = math.clamp
local _floor         = math.floor
local _abs           = math.abs
local _huge          = math.huge
local _sqrt          = math.sqrt
local _V3new         = Vector3.new
local _V3zero        = Vector3.zero
local _CFnew         = CFrame.new
local _CFlookAt      = CFrame.lookAt
local _RayParams_new = RaycastParams.new

local _GetPlayersCached
do
    local cache, cacheTime = nil, 0
    _GetPlayersCached = function()
        local now = _tick()
        if cache and now - cacheTime < 0.03 then return cache end
        cache = Players:GetPlayers()
        cacheTime = now
        return cache
    end
end

local function waitForCharReady(char, timeout)
    timeout = timeout or 5
    local deadline = _tick() + timeout
    while (not char) or (not char.Parent)
          or (not char:FindFirstChild("HumanoidRootPart"))
          or (not char:FindFirstChildOfClass("Humanoid")) do
        if _tick() > deadline then return false end
        task.wait(0.05)
    end
    return true
end

NS = 60
CS = 29
LAGGER_SPEED = 15
LAGGER_CARRY_SPEED = 24.5
MEDUSA_COOLDOWN = 25
BAT_AIMBOT_SPEED = 58
BYPASS_AIMBOT_SPEED = 60
CONFIG_FILE = "Yout_" .. tostring(LP.UserId) .. ".json"
BAT_V2_HIT_DIST = 4.5
_isDraggingButton = false

backgroundIndex = 3
backgroundImages = {
    "77738409157822",
    "77762385200979",
    "90755720348427",
    "114788319178517",
    "102432951232679",
}

backgroundImageTransparency = 0
backgroundMode = "Background 1"
backgroundSelectorLabel = nil
floatingButtonScale = 1
_floatingUIScales = {}

function applyBackgroundMode(mode)
    backgroundMode = mode == "None" and "None" or "Background 1"
    if main then
        main.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
        main.BackgroundTransparency = backgroundMode == "None" and 0 or 1
        local bgImage = main:FindFirstChild("BackgroundImage")
        if bgImage then
            bgImage.Image = "rbxassetid://" .. backgroundImages[backgroundIndex]
            bgImage.ImageTransparency = backgroundMode == "None" and 1 or backgroundImageTransparency
        end
    end
    if backgroundSelectorLabel then backgroundSelectorLabel.Text = backgroundMode end
end

local COLOR_THEMES = {
    ["Gray"] = Color3.fromRGB(180, 180, 190),
    ["Purple"] = Color3.fromRGB(160, 100, 220),
    ["Blue"] = Color3.fromRGB(80, 150, 255),
    ["Pink"] = Color3.fromRGB(255, 120, 180),
    ["Green"] = Color3.fromRGB(80, 220, 120),
    ["Vanilla"] = Color3.fromRGB(212, 180, 135),
}

currentColorTheme = "Pink"
selectedColor = COLOR_THEMES["Pink"]

function getThemeColor() return selectedColor end

function youtGradient(c)
    return ColorSequence.new({
        ColorSequenceKeypoint.new(0.00, c:Lerp(Color3.new(1,1,1), 0.55)),
        ColorSequenceKeypoint.new(0.45, c),
        ColorSequenceKeypoint.new(1.00, c:Lerp(Color3.new(0,0,0), 0.35)),
    })
end

function youtGradientSoft(c)
    return ColorSequence.new({
        ColorSequenceKeypoint.new(0.00, c:Lerp(Color3.new(1,1,1), 0.75)),
        ColorSequenceKeypoint.new(0.50, c:Lerp(Color3.new(1,1,1), 0.25)),
        ColorSequenceKeypoint.new(1.00, c:Lerp(Color3.new(0,0,0), 0.15)),
    })
end

function youtGradientDark(c)
    return ColorSequence.new({
        ColorSequenceKeypoint.new(0.00, c:Lerp(Color3.fromRGB(0,0,0), 0.35)),
        ColorSequenceKeypoint.new(0.55, c:Lerp(Color3.fromRGB(0,0,0), 0.65)),
        ColorSequenceKeypoint.new(1.00, c:Lerp(Color3.fromRGB(0,0,0), 0.80)),
    })
end

function applyYoutGradientToLabel(label, c)
    if not label then return end
    local grad = label:FindFirstChildOfClass("UIGradient")
    if not grad then
        grad = Instance.new("UIGradient", label)
    end
    grad.Rotation = 0
    grad.Color = youtGradient(c)
end

local _lastThemeUpdate = 0
local _lastThemeColor = nil

function applyColorTheme(themeName)
    local color = COLOR_THEMES[themeName]
    if not color then return end
    currentColorTheme = themeName
    selectedColor = color
    updateAllUIThemeColors(color)
    saveAllSettings()
end

_uicStroke = nil
_uicAvatarStroke = nil
_uicHandle = nil
_uicLine = nil

function updateAllUIThemeColors(color)
    local now = _tick()
    if color == _lastThemeColor and now - _lastThemeUpdate < 0.1 then return end
    _lastThemeUpdate = now
    _lastThemeColor = color

    if progressFill then
        progressFill.BackgroundColor3 = color
        local grad = progressFill:FindFirstChildOfClass("UIGradient")
        if grad then
            grad.Color = youtGradient(color)
            grad.Rotation = 0
        end
    end
    if pbFrame then
        local border = pbFrame:FindFirstChild("OuterStroke") or pbFrame:FindFirstChildOfClass("UIStroke")
        if border then border.Color = color end
        local fpsNeon = pbFrame:FindFirstChild("FPSNeon", true)
        if fpsNeon then fpsNeon.TextColor3 = color end
        local pingNeon = pbFrame:FindFirstChild("PingNeon", true)
        if pingNeon then pingNeon.TextColor3 = color end
        local divider = pbFrame:FindFirstChild("Divider", true)
        if divider and divider:IsA("Frame") then divider.BackgroundColor3 = color end
    end

    if _uicStroke then _uicStroke.Color = color end
    if _uicAvatarStroke then _uicAvatarStroke.Color = color end
    if _uicHandle then _uicHandle.TextColor3 = color end
    if _uicLine then _uicLine.BackgroundColor3 = color end

    local function searchAndUpdateText(parent)
        for _, child in ipairs(parent:GetDescendants()) do
            if child:IsA("TextLabel") then
                if child.Name == "DiscordText" or child.Name == "SpeedLabel" then
                    child.TextColor3 = color
                end
            end
            if child:IsA("UIStroke") then
                if child.Color == Color3.fromRGB(180, 180, 190) then child.Color = color end
            end
        end
    end
    if gui then searchAndUpdateText(gui) end
    if tpBatFloatingButton then
        paintFloatingBtn(tpBatFloatingButton:FindFirstChild("Frame"), batDesyncTpEnabled)
    end
    for _, tab in ipairs(tabButtons or {}) do
        local isActive = tab:FindFirstChild("Underline") and tab.Underline.Visible
        if isActive then
            tab.TextColor3 = Color3.fromRGB(245, 245, 255)
            tab.BackgroundColor3 = color
            tab.BackgroundTransparency = 0.15
            local tg = tab:FindFirstChild("TabBgGrad")
            if tg then tg.Color = youtGradient(color) end
        else
            tab.TextColor3 = Color3.fromRGB(150, 150, 165)
            tab.BackgroundColor3 = Color3.fromRGB(26, 26, 34)
            tab.BackgroundTransparency = 1
        end
        local ul = tab:FindFirstChild("Underline")
        if ul then ul.BackgroundColor3 = color end
        local s = tab:FindFirstChild("TabStroke")
        if s then s.Color = color end
    end
    if _G.__YoutRefreshESPTheme then pcall(_G.__YoutRefreshESPTheme, color) end
    if main then
        local titleFrame = main:FindFirstChild("Frame")
        if titleFrame then
            for _, child in ipairs(titleFrame:GetDescendants()) do
                if child:IsA("UIStroke") and child.Color == Color3.fromRGB(180, 180, 190) then
                    child.Color = color
                end
            end
        end
    end
    if colorSelectorLabel then
        colorSelectorLabel.Text = currentColorTheme
        colorSelectorLabel.TextColor3 = color
    end

    if _G._youtStealSlide then
        _G._youtStealSlide.BackgroundColor3 = color
        local sg = _G._youtStealSlide:FindFirstChildOfClass("UIGradient")
        if sg then sg.Color = youtGradient(color) end
        local ss = _G._youtStealSlide:FindFirstChildOfClass("UIStroke")
        if ss then ss.Color = color end
    end

    if miniBtn then
        local stroke = miniBtn:FindFirstChildOfClass("UIStroke")
        if stroke then stroke.Color = color end
    end

    if MobilePanel then
        for _, btn in ipairs(MobilePanel:GetChildren()) do
            if btn:IsA("TextButton") and btn:FindFirstChild("BtnGrad") then
                paintFloatingBtn(btn, btn:GetAttribute("MobActive") == true)
            end
        end
    end
end

local HOMERO_CFG = {
    body = { 10725826963, 86500008, 86500054, 86500036, 86500064, 86500078 },
    aplicarCuerpo = true,
    items = {
        { id = 103227869700418, offset = _CFnew(0,0,0) },
        { id = 84952305140948,   offset = _CFnew(0,0,0) },
        { id = 122465238537030,  offset = _CFnew(0,0,0) },
    },
    shirt = nil,
    pants = "rbxassetid://78591690208112",
    skinColor = Color3.fromRGB(234,184,146),
    headColor = Color3.fromRGB(0,0,0),
}

local TAG = "LocalOutfit_"

local function loadObjects(id)
    local ok, res = pcall(function()
        return game:GetObjects("rbxassetid://" .. tostring(id))
    end)
    if ok and typeof(res) == "table" and #res > 0 then return res end
    ok, res = pcall(function()
        return game:GetService("InsertService"):LoadAsset(id)
    end)
    if ok and res then return { res } end
    return nil
end

local function collectParts(objs)
    local out = {}
    for _, o in ipairs(objs) do
        if o:IsA("BasePart") then out[#out + 1] = o end
        for _, d in ipairs(o:GetDescendants()) do
            if d:IsA("BasePart") then out[#out + 1] = d end
        end
    end
    return out
end

local function findAtt(char, name)
    for _, p in ipairs(char:GetDescendants()) do
        if p:IsA("Attachment") and p.Name == name and p.Parent:IsA("BasePart") then
            return p
        end
    end
end

local function applyBody(char)
    local total = 0
    for _, id in ipairs(HOMERO_CFG.body) do
        local objs = loadObjects(id)
        if objs then
            for _, mp in ipairs(collectParts(objs)) do
                local orig = char:FindFirstChild(mp.Name)
                if orig and orig:IsA("BasePart") then
                    local c = mp:Clone()
                    c.Name = TAG .. "body_" .. mp.Name
                    c.CanCollide = false
                    c.Anchored = false
                    c.Massless = true
                    c.Size = orig.Size
                    c.CFrame = orig.CFrame
                    c.Parent = char
                    local w = Instance.new("WeldConstraint")
                    w.Part0 = orig
                    w.Part1 = c
                    w.Parent = c
                    if orig:GetAttribute("YoutOutfitOriginalTransparency") == nil then
                        orig:SetAttribute("YoutOutfitOriginalTransparency", orig.Transparency)
                    end
                    orig.Transparency = 1
                    total = total + 1
                end
            end
            for _, o in ipairs(objs) do pcall(function() o:Destroy() end) end
        end
    end
    return total
end

local function attachItem(char, entry)
    local objs = loadObjects(entry.id)
    if not objs then return false end

    local handle
    for _, p in ipairs(collectParts(objs)) do
        if p.Name == "Handle" then handle = p; break end
        if not handle then handle = p end
    end
    if not handle then
        for _, o in ipairs(objs) do pcall(function() o:Destroy() end) end
        return false
    end

    local H = handle:Clone()
    for _, o in ipairs(objs) do pcall(function() o:Destroy() end) end

    H.Name = TAG .. "item_" .. tostring(entry.id)
    H.CanCollide = false
    H.Anchored = false
    H.Massless = true

    local wrap = H:FindFirstChildWhichIsA("WrapLayer")
    local target, c0, c1

    if wrap then
        target = char:FindFirstChild("UpperTorso")
              or char:FindFirstChild("Torso")
              or char:FindFirstChild("HumanoidRootPart")
        c0 = entry.offset or _CFnew()
        c1 = _CFnew()
    else
        local hAtt = H:FindFirstChildOfClass("Attachment")
        local bAtt = hAtt and findAtt(char, hAtt.Name)
        if bAtt then
            target = bAtt.Parent
            c0 = bAtt.CFrame * (entry.offset or _CFnew())
            c1 = hAtt.CFrame
        else
            target = char:FindFirstChild("Head")
            c0 = entry.offset or _CFnew(0, 1.4, 0)
            c1 = _CFnew()
        end
    end

    if not target then H:Destroy(); return false end

    H.CFrame = target.CFrame * c0 * c1:Inverse()
    H.Parent = char

    local w = Instance.new("Weld")
    w.Part0 = target
    w.Part1 = H
    w.C0 = c0
    w.C1 = c1
    w.Parent = H
    return true
end

function applyHomeroOutfit(char)
    if not char then char = LP.Character end
    if not char then return end
    char:WaitForChild("Humanoid", 10)
    char:WaitForChild("Head", 10)
    task.wait(0.4)

    for _, d in ipairs(char:GetChildren()) do
        if d.Name:sub(1, #TAG) == TAG then pcall(function() d:Destroy() end) end
    end

    if HOMERO_CFG.skinColor then
        local bc = char:FindFirstChildWhichIsA("BodyColors") or Instance.new("BodyColors")
        bc.HeadColor3 = HOMERO_CFG.headColor or HOMERO_CFG.skinColor
        bc.TorsoColor3 = HOMERO_CFG.skinColor
        bc.LeftArmColor3, bc.RightArmColor3 = HOMERO_CFG.skinColor, HOMERO_CFG.skinColor
        bc.LeftLegColor3, bc.RightLegColor3 = HOMERO_CFG.skinColor, HOMERO_CFG.skinColor
        bc.Parent = char
    end

    for _, a in ipairs(char:GetChildren()) do
        if a:IsA("Accessory") then
            local h = a:FindFirstChild("Handle")
            if h then h.Transparency = 1 end
        end
    end

    if HOMERO_CFG.shirt then
        local s = char:FindFirstChildWhichIsA("Shirt") or Instance.new("Shirt")
        s.Name = "Shirt"
        s.ShirtTemplate = HOMERO_CFG.shirt
        s.Parent = char
    end
    if HOMERO_CFG.pants then
        local p = char:FindFirstChildWhichIsA("Pants") or Instance.new("Pants")
        p.Name = "Pants"
        p.PantsTemplate = HOMERO_CFG.pants
        p.Parent = char
    end
    if HOMERO_CFG.aplicarCuerpo then applyBody(char) end
    for _, e in ipairs(HOMERO_CFG.items) do attachItem(char, e) end
end

local _originalAppearance = nil

local function captureOriginalAppearance(char)
    if not char or _originalAppearance then return end
    local data = {
        bodyColors = nil,
        shirt = nil,
        pants = nil,
        headMesh = nil,
        headTexture = nil,
    }
    local bc = char:FindFirstChildWhichIsA("BodyColors")
    if bc then
        data.bodyColors = {
            head = bc.HeadColor3,
            torso = bc.TorsoColor3,
            leftArm = bc.LeftArmColor3,
            rightArm = bc.RightArmColor3,
            leftLeg = bc.LeftLegColor3,
            rightLeg = bc.RightLegColor3,
        }
    end
    local sh = char:FindFirstChildWhichIsA("Shirt")
    if sh then data.shirt = sh.ShirtTemplate end
    local pa = char:FindFirstChildWhichIsA("Pants")
    if pa then data.pants = pa.PantsTemplate end
    local head = char:FindFirstChild("Head")
    if head then
        local sm = head:FindFirstChildWhichIsA("SpecialMesh")
        if sm and sm.MeshType == Enum.MeshType.FileMesh then
            data.headMesh = sm.MeshId
            data.headTexture = sm.TextureId
        end
    end
    _originalAppearance = data
end

local function clearPreviousOutfitAssets(char)
    if not char then return end
    for _, child in ipairs(char:GetChildren()) do
        if child.Name:sub(1, #TAG) == TAG
        or child.Name == "AuFfitAccessory"
        or child.Name == "Korblox_RightLeg" then
            pcall(function() child:Destroy() end)
        elseif child:IsA("CharacterMesh") and child.BodyPart == Enum.BodyPart.Head then
            pcall(function() child:Destroy() end)
        end
    end
    for _, part in ipairs(char:GetDescendants()) do
        if part:IsA("BasePart") then
            local originalTransparency = part:GetAttribute("YoutOutfitOriginalTransparency")
            if originalTransparency ~= nil then
                part.Transparency = originalTransparency
                part:SetAttribute("YoutOutfitOriginalTransparency", nil)
            end
            local originalLocalTransparency = part:GetAttribute("YoutOutfitOriginalLocalTransparency")
            if originalLocalTransparency ~= nil then
                part.LocalTransparencyModifier = originalLocalTransparency
                part:SetAttribute("YoutOutfitOriginalLocalTransparency", nil)
            end
        end
    end
    if _originalAppearance and _originalAppearance.bodyColors then
        local bc = char:FindFirstChildWhichIsA("BodyColors") or Instance.new("BodyColors")
        local o = _originalAppearance.bodyColors
        bc.HeadColor3, bc.TorsoColor3 = o.head, o.torso
        bc.LeftArmColor3, bc.RightArmColor3 = o.leftArm, o.rightArm
        bc.LeftLegColor3, bc.RightLegColor3 = o.leftLeg, o.rightLeg
        bc.Parent = char
    end
    local head = char:FindFirstChild("Head")
    if head and head:IsA("MeshPart") and head:GetAttribute("YoutOutfitModifiedMeshPart") then
        pcall(function()
            head.MeshId = head:GetAttribute("YoutOutfitOriginalMeshId") or ""
            head.TextureID = head:GetAttribute("YoutOutfitOriginalTextureId") or ""
        end)
        head:SetAttribute("YoutOutfitModifiedMeshPart", nil)
        head:SetAttribute("YoutOutfitOriginalMeshId", nil)
        head:SetAttribute("YoutOutfitOriginalTextureId", nil)
    elseif head then
        local specialMesh = head:FindFirstChildWhichIsA("SpecialMesh")
        if specialMesh and specialMesh:GetAttribute("YoutOutfitCreatedMesh") then
            specialMesh:Destroy()
        elseif specialMesh and specialMesh:GetAttribute("YoutOutfitModifiedMesh") then
            specialMesh.MeshId = specialMesh:GetAttribute("YoutOutfitOriginalMeshId") or ""
            specialMesh.TextureId = specialMesh:GetAttribute("YoutOutfitOriginalTextureId") or ""
            specialMesh:SetAttribute("YoutOutfitModifiedMesh", nil)
            specialMesh:SetAttribute("YoutOutfitOriginalMeshId", nil)
            specialMesh:SetAttribute("YoutOutfitOriginalTextureId", nil)
        end
    end
end

local function applyNoOutfit(char)
    if not char then char = LP.Character end
    if not char then return end
    for _, d in ipairs(char:GetChildren()) do
        if d.Name:sub(1, #TAG) == TAG then pcall(function() d:Destroy() end) end
    end
    local oldAcc = char:FindFirstChild("AuFfitAccessory")
    if oldAcc then pcall(function() oldAcc:Destroy() end) end
    local oldKorblox = char:FindFirstChild("Korblox_RightLeg")
    if oldKorblox then pcall(function() oldKorblox:Destroy() end) end
    for _, d in ipairs(char:GetChildren()) do
        if d:IsA("CharacterMesh") and d.BodyPart == Enum.BodyPart.Head then
            pcall(function() d:Destroy() end)
        end
    end
    local head = char:FindFirstChild("Head")
    if head then
        head.Transparency = 0
        head.CanCollide = true
        head.LocalTransparencyModifier = 0
        local face = head:FindFirstChild("face")
        if face then face.Transparency = 0 end
        local sm = head:FindFirstChildWhichIsA("SpecialMesh")
        if sm then
            if _originalAppearance and _originalAppearance.headMesh then
                sm.MeshId = _originalAppearance.headMesh
                sm.TextureId = _originalAppearance.headTexture or ""
            else
                pcall(function() sm:Destroy() end)
            end
        end
    end
    pcall(function()
        local neck = char:FindFirstChild("Neck")
        if neck then neck.Enabled = true end
    end)
    for _, partName in ipairs({"RightUpperLeg", "RightLowerLeg", "RightFoot"}) do
        local limb = char:FindFirstChild(partName)
        if limb then limb.Transparency = 0 end
    end
    if _originalAppearance and _originalAppearance.bodyColors then
        local bc = char:FindFirstChildWhichIsA("BodyColors") or Instance.new("BodyColors")
        local o = _originalAppearance.bodyColors
        bc.HeadColor3 = o.head
        bc.TorsoColor3 = o.torso
        bc.LeftArmColor3 = o.leftArm
        bc.RightArmColor3 = o.rightArm
        bc.LeftLegColor3 = o.leftLeg
        bc.RightLegColor3 = o.rightLeg
        bc.Parent = char
    end
    if _originalAppearance and _originalAppearance.shirt then
        local s = char:FindFirstChildWhichIsA("Shirt") or Instance.new("Shirt")
        s.ShirtTemplate = _originalAppearance.shirt
        s.Parent = char
    end
    if _originalAppearance and _originalAppearance.pants then
        local p = char:FindFirstChildWhichIsA("Pants") or Instance.new("Pants")
        p.PantsTemplate = _originalAppearance.pants
        p.Parent = char
    end
    for _, a in ipairs(char:GetChildren()) do
        if a:IsA("Accessory") then
            local h = a:FindFirstChild("Handle")
            if h then h.Transparency = 0 end
        end
    end
end

local OUTFITS = {
    { label = "OFF", customApply = applyNoOutfit },
    { accessory = 10159600649, offset = _V3new(0, 1, -0.2), shirt = "http://www.roblox.com/asset/?id=9683332638", pants = "http://www.roblox.com/asset/?id=93182020184041", headMesh = "http://www.roblox.com/asset/?id=134079402", headTexture = "http://www.roblox.com/asset/?id=133940918 ", korblox = "none", label = "Outfit 1", headlessKorblox = true },
    { accessory = 1744060292, offset = _V3new(0, 1.3, -0.2), shirt = "http://www.roblox.com/asset/?id=9683332638", pants = "http://www.roblox.com/asset/?id=93182020184041", headMesh = "http://www.roblox.com/asset/?id=134079402", headTexture = "http://www.roblox.com/asset/?id=133940918 ", korblox = "none", label = "Outfit 2", headlessKorblox = true },
    { accessory = 8349240186, offset = _V3new(0, 0.9, 0), shirt = "http://www.roblox.com/asset/?id=11926549070", pants = "http://www.roblox.com/asset/?id=13189494471", headMesh = "https://assetdelivery.roblox.com/v1/asset/?id=16673245747", headTexture = nil, korblox = "none", label = "Outfit 3", headlessKorblox = true },
    { accessory = 121097973925756, offset = _V3new(0, 0.9, 0), shirt = "http://www.roblox.com/asset/?id=123181702116947", pants = "http://www.roblox.com/asset/?id=93330291631062", headMesh = "http://www.roblox.com/asset/?id=134079402", headTexture = "http://www.roblox.com/asset/?id=133940918 ", korblox = "none", label = "Outfit 4", headlessKorblox = true },
    { label = "Homero Chino", customApply = applyHomeroOutfit },
}
local currentOutfitIndex = 1
local outfitSelectorLabel = nil

local function loadObjectsStd(id)
    local ok, res = pcall(function() return game:GetObjects("rbxassetid://" .. tostring(id)) end)
    if ok and typeof(res) == "table" and #res > 0 then return res end
    ok, res = pcall(function() return game:GetService("InsertService"):LoadAsset(id) end)
    if ok and res then return {res} end
    return nil
end

local function applyHeadlessKorblox(char)
    if not char then return end
    pcall(function() LP.CharacterAvatarType = Enum.AvatarType.R6 end)
    local head = char:FindFirstChild("Head")
    if head then
        if head:GetAttribute("YoutOutfitOriginalTransparency") == nil then
            head:SetAttribute("YoutOutfitOriginalTransparency", head.Transparency)
            head:SetAttribute("YoutOutfitOriginalLocalTransparency", head.LocalTransparencyModifier)
        end
        head.Transparency = 1
        head.CanCollide = false
        head.LocalTransparencyModifier = 1
        local face = head:FindFirstChild("face")
        if face then face.Transparency = 1 end
    end
    pcall(function()
        local neck = char:FindFirstChild("Neck")
        if neck then neck.Enabled = false end
    end)
    for _, v in pairs(char:GetChildren()) do
        if v:IsA("Accessory") then
            local w = v:FindFirstChildWhichIsA("Weld") or v:FindFirstChildWhichIsA("WeldConstraint") or v:FindFirstChildWhichIsA("Motor6D")
            if w then
                local p0, p1 = w.Part0, w.Part1
                if (p0 and p0.Name == "Head") or (p1 and p1.Name == "Head") then
                    for _, part in ipairs(v:GetDescendants()) do
                        if part:IsA("BasePart") then
                            if part:GetAttribute("YoutOutfitOriginalTransparency") == nil then
                                part:SetAttribute("YoutOutfitOriginalTransparency", part.Transparency)
                                part:SetAttribute("YoutOutfitOriginalLocalTransparency", part.LocalTransparencyModifier)
                            end
                            part.Transparency = 1
                            part.LocalTransparencyModifier = 1
                        end
                    end
                end
            end
        end
    end
    local rightLegConfig = { id = "rbxassetid://139607718", targetBodyPart = "RightUpperLeg", partsToHide = {"RightUpperLeg", "RightLowerLeg", "RightFoot"}, scale = _V3new(1, 1, 1), offset = _CFnew(0, 0, 0) }
    local targetPart = char:FindFirstChild(rightLegConfig.targetBodyPart)
    if targetPart then
        local oldAsset = char:FindFirstChild("Korblox_RightLeg")
        if oldAsset then oldAsset:Destroy() end
        for _, partName in ipairs(rightLegConfig.partsToHide) do
            local limb = char:FindFirstChild(partName)
            if limb and limb:IsA("BasePart") then
                if limb:GetAttribute("YoutOutfitOriginalTransparency") == nil then
                    limb:SetAttribute("YoutOutfitOriginalTransparency", limb.Transparency)
                end
                limb.Transparency = 1
            end
        end
        local success, objects = pcall(function() return game:GetObjects(rightLegConfig.id) end)
        if success and objects and #objects > 0 then
            local assetModel = objects[1]
            assetModel.Name = "Korblox_RightLeg"
            local mainMesh = assetModel:IsA("BasePart") and assetModel or assetModel:FindFirstChildWhichIsA("BasePart", true)
            if mainMesh then
                mainMesh.Size = mainMesh.Size * rightLegConfig.scale
                mainMesh.CanCollide = false
                mainMesh.CFrame = targetPart.CFrame * rightLegConfig.offset
                local weld = Instance.new("WeldConstraint")
                weld.Part0 = targetPart
                weld.Part1 = mainMesh
                weld.Parent = mainMesh
                assetModel.Parent = char
            end
        end
    end
end

function applyOutfitByIndex(index)
    local cfg = OUTFITS[index]
    if not cfg then return end
    local char = LP.Character
    if not char then return end
    clearPreviousOutfitAssets(char)
    if cfg.customApply then
        cfg.customApply(char)
        if outfitSelectorLabel then outfitSelectorLabel.Text = cfg.label end
        return
    end
    char:WaitForChild("Head", 5)
    local head = char:FindFirstChild("Head")
    if not head then return end
    for _, d in ipairs(char:GetChildren()) do
        if d:IsA("CharacterMesh") and d.BodyPart == Enum.BodyPart.Head then
            pcall(function() d:Destroy() end)
        end
    end
    local done = false
    if head:IsA("MeshPart") then
        done = pcall(function()
            if not head:GetAttribute("YoutOutfitModifiedMeshPart") then
                head:SetAttribute("YoutOutfitOriginalMeshId", head.MeshId)
                head:SetAttribute("YoutOutfitOriginalTextureId", head.TextureID)
                head:SetAttribute("YoutOutfitModifiedMeshPart", true)
            end
            head.MeshId = cfg.headMesh
            head.TextureID = cfg.headTexture or ""
        end)
    end
    if not done then
        local sm = head:FindFirstChildWhichIsA("SpecialMesh")
        if not sm then
            sm = Instance.new("SpecialMesh")
            sm:SetAttribute("YoutOutfitCreatedMesh", true)
        elseif not sm:GetAttribute("YoutOutfitModifiedMesh") then
            sm:SetAttribute("YoutOutfitOriginalMeshId", sm.MeshId)
            sm:SetAttribute("YoutOutfitOriginalTextureId", sm.TextureId)
            sm:SetAttribute("YoutOutfitModifiedMesh", true)
        end
        sm.Parent = head
        sm.MeshType = Enum.MeshType.FileMesh
        sm.MeshId = cfg.headMesh
        sm.TextureId = cfg.headTexture or ""
    end
    if cfg.shirt then
        local s = char:FindFirstChildWhichIsA("Shirt") or Instance.new("Shirt")
        s.Name = "Shirt"
        s.ShirtTemplate = cfg.shirt
        s.Parent = char
    end
    if cfg.pants then
        local p = char:FindFirstChildWhichIsA("Pants") or Instance.new("Pants")
        p.Name = "Pants"
        p.PantsTemplate = cfg.pants
        p.Parent = char
    end
    local old = char:FindFirstChild("AuFfitAccessory")
    if old then old:Destroy() end
    if cfg.accessory and head then
        local objs = loadObjectsStd(cfg.accessory)
        if objs then
            local handle
            for _, o in ipairs(objs) do
                if o:IsA("BasePart") then handle = o; break end
                local f = o:FindFirstChildWhichIsA("BasePart", true)
                if f then handle = f; break end
            end
            if handle then
                local h = handle:Clone()
                h.Name = "AuFfitAccessory"
                h.CanCollide = false
                h.Anchored = false
                h.Massless = true
                h.Parent = char
                local weld = Instance.new("Weld")
                weld.Part0 = head
                weld.Part1 = h
                weld.C0 = _CFnew(cfg.offset)
                weld.Parent = h
            end
            for _, o in ipairs(objs) do pcall(function() o:Destroy() end) end
        end
    end
    if cfg.headlessKorblox then
        applyHeadlessKorblox(char)
    else
        if char then
            local head2 = char:FindFirstChild("Head")
            if head2 then
                head2.Transparency = 0
                head2.CanCollide = true
                head2.LocalTransparencyModifier = 0
                local face2 = head2:FindFirstChild("face")
                if face2 then face2.Transparency = 0 end
            end
            pcall(function()
                local neck = char:FindFirstChild("Neck")
                if neck then neck.Enabled = true end
            end)
            for _, partName in ipairs({"RightUpperLeg", "RightLowerLeg", "RightFoot"}) do
                local limb = char:FindFirstChild(partName)
                if limb then limb.Transparency = 0 end
            end
            local oldKorblox = char:FindFirstChild("Korblox_RightLeg")
            if oldKorblox then oldKorblox:Destroy() end
        end
    end
    if outfitSelectorLabel then outfitSelectorLabel.Text = cfg.label end
end

selectedStealMode = "V1"

speedMode = false
antiRagdollMode = "off"
antiDieEnabled = false
antiBatEnabled = false
antiFlingEnabled = false
jumpEnabled = false
laggerToggled = false
laggerCarryToggled = false
medusaCounterEnabled = false
batCounterEnabled = false
unwalkEnabled = false
autoLeftEnabled = false
autoRightEnabled = false
autoBatEnabled = false
dropMode = 1
antiLagEnabled = false
removeAccessoriesEnabled = false
stretchEnabled = false
stretchFOV = 120
uiLocked = false
mobileButtonsLocked = false
uiScaleValue = 78
espEnabled = false
espLineEnabled = false

vividGraphicsEnabled = false
_vividEffects = {}
setVividVisual = nil

hideButtonsEnabled = false
setHideButtonsVisual = nil

bodyLockEnabled = false
bodyLockRange = 20
bodyLockRangeBox = nil
_bodyLockConn = nil
_blSuppressCount = 0
_blWasEnabled = false
_blRestoreTimer = nil
_blSmoothRestore = false

savedProgressBarPos = nil
savedButtonPositions = {}
savedMobilePanelPos = nil
tpBatFloatingPos = nil
instaResetFloatingPos = nil
instaResetFloatingButton = nil

neonWeatherEnabled = false
skyTheme = "Off"
skySelectorLabel = nil
_originalLighting = nil
setNeonWeatherVisual = nil

currentAnimPack = "Off"
originalTryardAnims = nil
tryardHeartbeatConn = nil
animSelectorLabel = nil

lastMoveDir = _V3zero

local CoreGui = game:GetService("CoreGui")

local InfiniteJump = { enabled = false, jumpPower = 55, minVelocity = 35, fallClamp = -120, jumpConn = nil, heartbeatConn = nil }

local function applyJump(root)
    if not root then return end
    pcall(function()
        root.Velocity = _V3new(root.Velocity.X, InfiniteJump.jumpPower, root.Velocity.Z)
    end)
end

local function onJumpRequest()
    if not InfiniteJump.enabled then return end
    local char = LP.Character
    if not char then return end
    local root = char:FindFirstChild("HumanoidRootPart")
    if root then applyJump(root) end
end

local function onHeartbeat()
    if not InfiniteJump.enabled then return end
    local char = LP.Character
    if not char then return end
    local root = char:FindFirstChild("HumanoidRootPart")
    if not root then return end
    local hum = char:FindFirstChildOfClass("Humanoid")
    if not hum then return end
    local jumpHeld = UIS:IsKeyDown(Enum.KeyCode.Space) or (hum.Jump == true)
    if jumpHeld and root.Velocity.Y < InfiniteJump.minVelocity then
        applyJump(root)
    end
    if root.Velocity.Y < InfiniteJump.fallClamp then
        root.Velocity = _V3new(root.Velocity.X, InfiniteJump.fallClamp, root.Velocity.Z)
    end
end

local function connectEvents()
    if InfiniteJump.jumpConn then InfiniteJump.jumpConn:Disconnect() end
    if InfiniteJump.heartbeatConn then InfiniteJump.heartbeatConn:Disconnect() end
    InfiniteJump.jumpConn = UIS.JumpRequest:Connect(onJumpRequest)
    InfiniteJump.heartbeatConn = RunService.Heartbeat:Connect(onHeartbeat)
end

function InfiniteJump.start()
    if InfiniteJump.enabled then return end
    InfiniteJump.enabled = true
    connectEvents()
end

function InfiniteJump.stop()
    InfiniteJump.enabled = false
    if InfiniteJump.jumpConn then InfiniteJump.jumpConn:Disconnect(); InfiniteJump.jumpConn = nil end
    if InfiniteJump.heartbeatConn then InfiniteJump.heartbeatConn:Disconnect(); InfiniteJump.heartbeatConn = nil end
end

function InfiniteJump.setJumpPower(power)
    power = tonumber(power) or 55
    InfiniteJump.jumpPower = _clamp(power, 10, 200)
end

function InfiniteJump.isRunning() return InfiniteJump.enabled == true end

pcall(InfiniteJump.start)

function getActiveMoveSpeed()
    if laggerCarryToggled then return LAGGER_CARRY_SPEED
    elseif laggerToggled then return LAGGER_SPEED
    elseif speedMode then return CS
    else return NS end
end

function getSpeedModeName()
    if laggerToggled or laggerCarryToggled then return "LAGGER"
    elseif speedMode then return "CARRY"
    else return "NORMAL" end
end

-- =====================================================================
-- [FIX SPEED VIOLETTE] VELOCITY HOOK
-- Ahora instala DOS hooks sobre el metatable de game:
--   __index:    devuelve _s2VelState.v (velocidad fake) a contexto externo
--   __newindex: captura escrituras externas sin aplicarlas
-- AdemÃ¡s usa un storage compartido en _s2VelState.v para el valor visible.
-- =====================================================================
local _s2VelState = _G.__YoutSpeedHookState
if type(_s2VelState) ~= "table" then
    _s2VelState = {
        hooked = false,
        velChecked = setmetatable({}, { __mode = "k" }),
        root = nil,
        v = _V3zero,
    }
    _G.__YoutSpeedHookState = _s2VelState
end
local _velChecked = _s2VelState.velChecked
local _hookedVelParts = {}

local _hookVelSupported = nil
local function _hookVelHRP(hrp)
    if not hrp then return end
    _s2VelState.root = hrp
    _velChecked[hrp] = true
    if _s2VelState.hooked then return end
    if type(getrawmetatable) ~= "function" or type(setreadonly) ~= "function"
       or type(newcclosure) ~= "function" or type(checkcaller) ~= "function" then
        return
    end
    local ok = pcall(function()
        local mt = getrawmetatable(game)
        if not mt then return end

        setreadonly(mt, false)

        local originalIndex = rawget(mt, "__index")
        local originalNewIndex = rawget(mt, "__newindex")

        local function isOurRoot(t, k)
            local tk = tostring(k)
            if tk ~= "AssemblyLinearVelocity" and tk ~= "Velocity" then return false end
            if typeof(t) ~= "Instance" or not t:IsA("BasePart") then return false end
            local tn = t.Name
            if tn ~= "HumanoidRootPart" and tn ~= "Torso" and tn ~= "UpperTorso" then return false end
            local char = LP.Character
            return char ~= nil and t:IsDescendantOf(char)
        end

        if type(originalIndex) == "function" or type(originalIndex) == "table" then
            local replacementIndex = newcclosure(function(self, key)
                if not checkcaller() then
                    local good, mine = pcall(isOurRoot, self, key)
                    if good and mine then return _s2VelState.v end
                end
                if type(originalIndex) == "function" then
                    return originalIndex(self, key)
                else
                    return originalIndex[key]
                end
            end)
            mt.__index = replacementIndex
        end

        if type(originalNewIndex) == "function" then
            local replacementNewIndex = newcclosure(function(self, key, value)
                if not checkcaller() then
                    local good, mine = pcall(isOurRoot, self, key)
                    if good and mine then
                        _s2VelState.v = value
                        return
                    end
                end
                return originalNewIndex(self, key, value)
            end)
            mt.__newindex = replacementNewIndex
        end

        setreadonly(mt, true)
        _s2VelState.hooked = true
    end)
    if not ok then _s2VelState.hooked = false end
end

local function _setupVelChecked(char)
    _velChecked = setmetatable({}, { __mode = "k" })
    _s2VelState.velChecked = _velChecked
    if not char then _s2VelState.root = nil; return nil end
    local hrp = char:WaitForChild("HumanoidRootPart", 5)
    if hrp then
        _s2VelState.root = hrp
        _velChecked[hrp] = true
    end
    return hrp
end

if LP.Character then
    local _hrp0 = _setupVelChecked(LP.Character)
    _hookVelHRP(_hrp0)
end

local function _isRagdollState(hum)
    if not hum then return true end
    local st = hum:GetState()
    return hum.PlatformStand
        or st == Enum.HumanoidStateType.Physics
        or st == Enum.HumanoidStateType.Ragdoll
        or st == Enum.HumanoidStateType.FallingDown
end

-- [FIX SPEED VIOLETTE] aplica velocidad con jitter + oculta la real al juego.
-- El juego verÃ¡ _s2VelState.v = 16 (fake). Nosotros aplicamos la real en
-- AssemblyLinearVelocity directamente (checkcaller bypass).
local _youtVelRng = Random.new()

local function _applyVelocitySpeed(dir, speed, hrp)
    if not hrp or not hrp.Parent then return end
    if batDesyncTpEnabled or autoBatEnabled then return end
    if type(speed) ~= "number" or speed ~= speed or speed <= 0 or speed == math.huge then return end

    local verticalVelocity = hrp.AssemblyLinearVelocity.Y

    if dir and dir.Magnitude > 0.05 then
        pcall(function()
            if hrp.SetNetworkOwner then hrp:SetNetworkOwner(LP) end
        end)
        local unit = dir.Unit
        local jx = _youtVelRng:NextNumber(-0.003, 0.003)
        local jz = _youtVelRng:NextNumber(-0.003, 0.003)

        -- Velocidad falsa que el juego verÃ¡ cuando consulte desde cÃ³digo externo
        _s2VelState.v = _V3new(unit.X * 16 + jx, verticalVelocity, unit.Z * 16 + jz)

        -- Velocidad real aplicada directamente al root (checkcaller=true)
        hrp.AssemblyLinearVelocity = _V3new(unit.X * speed + jx, verticalVelocity, unit.Z * speed + jz)
        -- Marca de "live speed" para que el Anti Fling no cancele nuestra propia velocidad
        _G.__YoutLiveSpeed = { t = os.clock(), v = speed }
    else
        _s2VelState.v = _V3new(0, verticalVelocity, 0)
        hrp.AssemblyLinearVelocity = _V3new(0, verticalVelocity, 0)
    end
end

function getAutoPathSpeed()
    if laggerCarryToggled or laggerToggled then return LAGGER_SPEED end
    return NS
end

ANIM_PACKS = {
    ["Zombie"] = { idle1="rbxassetid://616158929", idle2="rbxassetid://616160636", walk="rbxassetid://616168032", run="rbxassetid://616163682", jump="rbxassetid://616161997", fall="rbxassetid://616157476", climb="rbxassetid://616156119", swim="rbxassetid://616165109", swimidle="rbxassetid://616166655" },
    ["Ninja"] = { idle1="rbxassetid://656117400", idle2="rbxassetid://656117400", walk="rbxassetid://656121766", run="rbxassetid://656118852", jump="rbxassetid://656117878", fall="rbxassetid://656115606", climb="rbxassetid://656114359", swim="rbxassetid://656117400", swimidle="rbxassetid://656117400" },
    ["Knight"] = { idle1="rbxassetid://657595757", idle2="rbxassetid://657595757", walk="rbxassetid://657552124", run="rbxassetid://657564596", jump="rbxassetid://658409194", fall="rbxassetid://657600338", climb="rbxassetid://658360781", swim="rbxassetid://657595757", swimidle="rbxassetid://657595757" },
    ["Elder"] = { idle1="rbxassetid://845397899", idle2="rbxassetid://845397899", walk="rbxassetid://845403856", run="rbxassetid://845386501", jump="rbxassetid://845398858", fall="rbxassetid://845397673", climb="rbxassetid://845392038", swim="rbxassetid://845397899", swimidle="rbxassetid://845397899" },
    ["Levitate"] = { idle1="rbxassetid://616006778", idle2="rbxassetid://616006778", walk="rbxassetid://616013216", run="rbxassetid://616013216", jump="rbxassetid://616008936", fall="rbxassetid://616005863", climb="rbxassetid://616003713", swim="rbxassetid://616006778", swimidle="rbxassetid://616006778" },
    ["Astronaut"] = { idle1="rbxassetid://891621366", idle2="rbxassetid://891621366", walk="rbxassetid://891636393", run="rbxassetid://891636393", jump="rbxassetid://891627522", fall="rbxassetid://891617961", climb="rbxassetid://891609353", swim="rbxassetid://891621366", swimidle="rbxassetid://891621366" },
    ["Pirate"] = { idle1="rbxassetid://750781874", idle2="rbxassetid://750781874", walk="rbxassetid://750785693", run="rbxassetid://750783738", jump="rbxassetid://750782230", fall="rbxassetid://750780242", climb="rbxassetid://750779899", swim="rbxassetid://750781874", swimidle="rbxassetid://750781874" },
    ["Toy"] = { idle1="rbxassetid://782841498", idle2="rbxassetid://782841498", walk="rbxassetid://782843345", run="rbxassetid://782842708", jump="rbxassetid://782847020", fall="rbxassetid://782846423", climb="rbxassetid://782843869", swim="rbxassetid://782841498", swimidle="rbxassetid://782841498" },
    ["Vampire"] = { idle1="rbxassetid://1083445855", idle2="rbxassetid://1083445855", walk="rbxassetid://1083473930", run="rbxassetid://1083462077", jump="rbxassetid://1083455352", fall="rbxassetid://1083443587", climb="rbxassetid://1083439238", swim="rbxassetid://1083445855", swimidle="rbxassetid://1083445855" },
    ["Werewolf"] = { idle1="rbxassetid://1083195517", idle2="rbxassetid://1083195517", walk="rbxassetid://1083178339", run="rbxassetid://1083216690", jump="rbxassetid://1083218792", fall="rbxassetid://1083189019", climb="rbxassetid://1083182000", swim="rbxassetid://1083195517", swimidle="rbxassetid://1083195517" },
    ["Rthro"] = { idle1="rbxassetid://2510196951", idle2="rbxassetid://2510196951", walk="rbxassetid://2510202577", run="rbxassetid://2510198475", jump="rbxassetid://2510197830", fall="rbxassetid://2510195892", climb="rbxassetid://2510192778", swim="rbxassetid://2510196951", swimidle="rbxassetid://2510196951" },
    ["Stylish"] = { idle1="rbxassetid://616136790", idle2="rbxassetid://616136790", walk="rbxassetid://616146177", run="rbxassetid://616140816", jump="rbxassetid://616139451", fall="rbxassetid://616134815", climb="rbxassetid://616133594", swim="rbxassetid://616136790", swimidle="rbxassetid://616136790" },
}

ANIM_PACK_ORDER = {{"Off", "Off"}, {"Zombie", "Zombie"}, {"Ninja", "Ninja"}, {"Knight", "Knight"}, {"Elder", "Elder"}, {"Levitate", "Levitate"}, {"Astronaut", "Astronaut"}, {"Pirate", "Pirate"}, {"Toy", "Toy"}, {"Vampire", "Vampire"}, {"Werewolf", "Werewolf"}, {"Rthro", "Rthro"}, {"Stylish", "Stylish"}}

local function isPackAnim(id)
    for _, pack in pairs(ANIM_PACKS) do
        for _, v in pairs(pack) do
            if v == id then return true end
        end
    end
    return false
end

local function saveOriginalAnims(char)
    local animate = char:FindFirstChild("Animate")
    if not animate then return end
    local function g(obj) return obj and obj.AnimationId or nil end
    local ids = {
        idle1 = g(animate.idle and animate.idle.Animation1),
        idle2 = g(animate.idle and animate.idle.Animation2),
        walk  = g(animate.walk and animate.walk.WalkAnim),
        run   = g(animate.run  and animate.run.RunAnim),
        jump  = g(animate.jump and animate.jump.JumpAnim),
        fall  = g(animate.fall and animate.fall.FallAnim),
        climb = g(animate.climb and animate.climb.ClimbAnim),
        swim  = g(animate.swim and animate.swim.Swim),
        swimidle = g(animate.swimidle and animate.swimidle.SwimIdle),
    }
    if not isPackAnim(ids.walk) then originalTryardAnims = ids end
end

local function applyAnimPack(packName)
    currentAnimPack = packName
    if animSelectorLabel then animSelectorLabel.Text = packName end
    if packName == "Off" then
        if originalTryardAnims and LP.Character then
            local animate = LP.Character:FindFirstChild("Animate")
            if animate then
                local function s(obj,id) if obj then obj.AnimationId = id end end
                s(animate.idle and animate.idle.Animation1, originalTryardAnims.idle1)
                s(animate.idle and animate.idle.Animation2, originalTryardAnims.idle2)
                s(animate.walk and animate.walk.WalkAnim, originalTryardAnims.walk)
                s(animate.run  and animate.run.RunAnim,   originalTryardAnims.run)
                s(animate.jump and animate.jump.JumpAnim, originalTryardAnims.jump)
                s(animate.fall and animate.fall.FallAnim, originalTryardAnims.fall)
                s(animate.climb and animate.climb.ClimbAnim, originalTryardAnims.climb)
                s(animate.swim and animate.swim.Swim, originalTryardAnims.swim)
                s(animate.swimidle and animate.swimidle.SwimIdle, originalTryardAnims.swimidle)
            end
        end
        if tryardHeartbeatConn then tryardHeartbeatConn:Disconnect(); tryardHeartbeatConn = nil end
        return
    end
    local pack = ANIM_PACKS[packName]
    if not pack then return end
    if tryardHeartbeatConn then tryardHeartbeatConn:Disconnect() end
    tryardHeartbeatConn = RunService.Heartbeat:Connect(function()
        local c = LP.Character
        if not c then return end
        local animate = c:FindFirstChild("Animate")
        if not animate then return end
        local function s(obj,id) if obj then obj.AnimationId = id end end
        s(animate.idle and animate.idle.Animation1, pack.idle1)
        s(animate.idle and animate.idle.Animation2, pack.idle2)
        s(animate.walk and animate.walk.WalkAnim, pack.walk)
        s(animate.run  and animate.run.RunAnim,   pack.run)
        s(animate.jump and animate.jump.JumpAnim, pack.jump)
        s(animate.fall and animate.fall.FallAnim, pack.fall)
        s(animate.climb and animate.climb.ClimbAnim, pack.climb)
        s(animate.swim and animate.swim.Swim, pack.swim)
        s(animate.swimidle and animate.swimidle.SwimIdle, pack.swimidle)
    end)
end

local function startAnimPack(packName)
    local char = LP.Character
    if char then
        saveOriginalAnims(char)
        applyAnimPack(packName)
        local hum = char:FindFirstChildOfClass("Humanoid")
        if hum then
            for _, track in ipairs(hum:GetPlayingAnimationTracks()) do track:Stop(0) end
            hum:ChangeState(Enum.HumanoidStateType.Running)
        end
    else
        applyAnimPack(packName)
    end
    currentAnimPack = packName
end

local function stopAnimPack()
    currentAnimPack = "Off"
    if animSelectorLabel then animSelectorLabel.Text = "Off" end
    applyAnimPack("Off")
end

DEFAULT_KB = {
    DropBrainrot = {kb = Enum.KeyCode.X, gp = nil},
    AutoLeft     = {kb = Enum.KeyCode.Z, gp = nil},
    AutoRight    = {kb = Enum.KeyCode.C, gp = nil},
    AutoBat      = {kb = Enum.KeyCode.E, gp = nil},
    TPFloor      = {kb = Enum.KeyCode.F, gp = nil},
    GuiHide      = {kb = Enum.KeyCode.LeftControl, gp = nil},
    CarryToggle  = {kb = Enum.KeyCode.Q, gp = nil},
    LaggerMode   = {kb = Enum.KeyCode.R, gp = nil},
    TPBat        = {kb = Enum.KeyCode.V, gp = nil},
    InstaReset   = {kb = Enum.KeyCode.H, gp = nil},
}

KB = {
    DropBrainrot = {kb = DEFAULT_KB.DropBrainrot.kb, gp = DEFAULT_KB.DropBrainrot.gp},
    AutoLeft     = {kb = DEFAULT_KB.AutoLeft.kb, gp = DEFAULT_KB.AutoLeft.gp},
    AutoRight    = {kb = DEFAULT_KB.AutoRight.kb, gp = DEFAULT_KB.AutoRight.gp},
    AutoBat      = {kb = DEFAULT_KB.AutoBat.kb, gp = DEFAULT_KB.AutoBat.gp},
    TPFloor      = {kb = DEFAULT_KB.TPFloor.kb, gp = DEFAULT_KB.TPFloor.gp},
    GuiHide      = {kb = DEFAULT_KB.GuiHide.kb, gp = DEFAULT_KB.GuiHide.gp},
    CarryToggle  = {kb = DEFAULT_KB.CarryToggle.kb, gp = DEFAULT_KB.CarryToggle.gp},
    LaggerMode   = {kb = DEFAULT_KB.LaggerMode.kb, gp = DEFAULT_KB.LaggerMode.gp},
    TPBat        = {kb = DEFAULT_KB.TPBat.kb, gp = DEFAULT_KB.TPBat.gp},
    InstaReset   = {kb = DEFAULT_KB.InstaReset.kb, gp = DEFAULT_KB.InstaReset.gp},
}

_isResetting = false
_lastSavedJSON = nil
_isLoading = false

CONFIG = { AUTO_STEAL_ENABLED = false, STEAL_RANGE = 61 }

local plots = Workspace:FindFirstChild("Plots")
local stealConnection = nil

local Steal = { AutoStealEnabled = false, StealRadius = CONFIG.STEAL_RANGE, StealDuration = 1.3, StealDelay = 0.25, Data = {} }

local isStealing = false
local autoGrabSetDelayRadius = 9
local autoGrabStopTime = 0.96
local autoGrabStopEnabled = true

local _plotsCache = nil
local _plotsCacheTime = 0
local function getPlotsRoot()
    local now = _tick()
    if _plotsCache and now - _plotsCacheTime < 2 and _plotsCache.Parent then
        return _plotsCache
    end
    _plotsCache = workspace:FindFirstChild("Plots")
    _plotsCacheTime = now
    return _plotsCache
end

local function isMyPlotByName(plotName)
    local plotsRoot = getPlotsRoot()
    if not plotsRoot then return false end
    local plot = plotsRoot:FindFirstChild(plotName)
    if not plot then return false end
    local sign = plot:FindFirstChild("PlotSign")
    if sign then
        local yb = sign:FindFirstChild("YourBase")
        if yb and yb:IsA("BillboardGui") then
            return yb.Enabled == true
        end
    end
    return false
end

local function findNearestPrompt()
    local char = LP.Character
    if not char then return nil, nil end
    local root = char:FindFirstChild("HumanoidRootPart")
    if not root then return nil, nil end
    local plotsRoot = getPlotsRoot()
    if not plotsRoot then return nil, nil end
    local nearestPrompt, nearestDist, nearestName = nil, _huge, nil
    local rpos = root.Position
    for _, plot in ipairs(plotsRoot:GetChildren()) do
        if isMyPlotByName(plot.Name) then continue end
        local pods = plot:FindFirstChild("AnimalPodiums")
        if not pods then continue end
        for _, pod in ipairs(pods:GetChildren()) do
            pcall(function()
                local base = pod:FindFirstChild("Base")
                local spawn = base and base:FindFirstChild("Spawn")
                if spawn then
                    local sp = spawn.Position
                    local dx = sp.X - rpos.X
                    local dy = sp.Y - rpos.Y
                    local dz = sp.Z - rpos.Z
                    local dist = _sqrt(dx*dx + dy*dy + dz*dz)
                    if dist < nearestDist and dist <= Steal.StealRadius then
                        local att = spawn:FindFirstChild("PromptAttachment")
                        if att then
                            for _, child in ipairs(att:GetChildren()) do
                                if child:IsA("ProximityPrompt") and child.ActionText and child.ActionText:find("Steal") then
                                    nearestPrompt = child
                                    nearestDist = dist
                                    nearestName = pod.Name
                                    break
                                end
                            end
                        end
                    end
                end
            end)
        end
    end
    return nearestPrompt, nearestName
end

local function executeSteal(prompt, podName)
    if isStealing then return end
    if math.random(30) == 1 then
        for p in pairs(Steal.Data) do
            if not p.Parent then Steal.Data[p] = nil end
        end
    end
    if not Steal.Data[prompt] then
        Steal.Data[prompt] = { hold = {}, trigger = {}, ready = true }
        pcall(function()
            if getconnections then
                for _, c in ipairs(getconnections(prompt.PromptButtonHoldBegan)) do
                    if c.Function then table.insert(Steal.Data[prompt].hold, c.Function) end
                end
                for _, c in ipairs(getconnections(prompt.Triggered)) do
                    if c.Function then table.insert(Steal.Data[prompt].trigger, c.Function) end
                end
            end
        end)
    end
    local data = Steal.Data[prompt]
    if not data.ready then return end
    data.ready = false
    isStealing = true

    if progressFill then progressFill.Size = UDim2.new(0, 0, 1, 0) end
    if progressPct then progressPct.Text = "0%" end

    task.spawn(function()
        for _, f in ipairs(data.hold) do task.spawn(f) end

        local startTime = _tick()
        local duration = Steal.StealDuration
        local promptFired = false

        if autoGrabStopEnabled then
            while isStealing and Steal.AutoStealEnabled do
                local elapsed = _tick() - startTime
                if elapsed >= autoGrabStopTime then break end
                local progress = _clamp(elapsed / duration, 0, 1)
                if progressFill then progressFill.Size = UDim2.new(progress, 0, 1, 0) end
                if progressPct then progressPct.Text = _floor(progress * 100) .. "%" end
                if not prompt.Parent or not prompt.Parent.Parent then break end
                local char = LP.Character
                local hrp = char and char:FindFirstChild("HumanoidRootPart")
                if hrp and (hrp.Position - prompt.Parent.Parent.Position).Magnitude > Steal.StealRadius then
                    break
                end
                task.wait()
            end

            local stopProgress = _clamp(autoGrabStopTime / duration, 0, 1)
            if progressFill then progressFill.Size = UDim2.new(stopProgress, 0, 1, 0) end
            if progressPct then progressPct.Text = _floor(stopProgress * 100) .. "%" end

            local phase2Timeout = math.max(2.99 - autoGrabStopTime - math.max(duration - autoGrabStopTime, 0), 0.05)
            local phase2Start = _tick()

            while isStealing and Steal.AutoStealEnabled do
                if _tick() - phase2Start >= phase2Timeout then
                    if progressFill then progressFill.Size = UDim2.new(0, 0, 1, 0) end
                    if progressPct then progressPct.Text = "0%" end
                    data.ready = true
                    isStealing = false
                    task.wait()
                    local newPrompt, newName = findNearestPrompt()
                    if newPrompt then executeSteal(newPrompt, newName) end
                    return
                end
                if not prompt.Parent or not prompt.Parent.Parent then
                    isStealing = false
                    if progressFill then progressFill.Size = UDim2.new(0, 0, 1, 0) end
                    if progressPct then progressPct.Text = "0%" end
                    data.ready = true
                    return
                end
                local char = LP.Character
                local hrp = char and char:FindFirstChild("HumanoidRootPart")
                if hrp then
                    local dist = (hrp.Position - prompt.Parent.Parent.Position).Magnitude
                    if dist <= autoGrabSetDelayRadius then
                        break
                    elseif dist > Steal.StealRadius then
                        isStealing = false
                        if progressFill then progressFill.Size = UDim2.new(0, 0, 1, 0) end
                        if progressPct then progressPct.Text = "0%" end
                        data.ready = true
                        return
                    end
                end
                task.wait()
            end

            if isStealing and Steal.AutoStealEnabled then
                local fillStart = _tick()
                local fillDuration = math.max(duration - autoGrabStopTime, 0.05)
                while true do
                    local fp = _clamp((_tick() - fillStart) / fillDuration, 0, 1)
                    local totalProgress = stopProgress + fp * (1 - stopProgress)
                    if progressFill then progressFill.Size = UDim2.new(totalProgress, 0, 1, 0) end
                    if progressPct then progressPct.Text = _floor(totalProgress * 100) .. "%" end
                    if fp >= 1 and not promptFired then
                        promptFired = true
                        pcall(function()
                            if #data.trigger > 0 then
                                for _, f in ipairs(data.trigger) do task.spawn(f) end
                            else
                                local remote = ReplicatedStorage:FindFirstChild("StealAnimal")
                                if remote and podName then remote:FireServer(podName) end
                            end
                        end)
                        break
                    end
                    task.wait()
                end
            end
        else
            while isStealing and Steal.AutoStealEnabled do
                local elapsed = _tick() - startTime
                local progress = _clamp(elapsed / duration, 0, 1)
                if progressFill then progressFill.Size = UDim2.new(progress, 0, 1, 0) end
                if progressPct then progressPct.Text = _floor(progress * 100) .. "%" end
                if not prompt.Parent or not prompt.Parent.Parent then break end
                local char = LP.Character
                local hrp = char and char:FindFirstChild("HumanoidRootPart")
                if hrp and (hrp.Position - prompt.Parent.Parent.Position).Magnitude > Steal.StealRadius then break end
                if elapsed >= duration and not promptFired then
                    promptFired = true
                    pcall(function()
                        if #data.trigger > 0 then
                            for _, f in ipairs(data.trigger) do task.spawn(f) end
                        else
                            local remote = ReplicatedStorage:FindFirstChild("StealAnimal")
                            if remote and podName then remote:FireServer(podName) end
                        end
                    end)
                    break
                end
                task.wait()
            end
        end

        if progressFill then progressFill.Size = UDim2.new(0, 0, 1, 0) end
        if progressPct then progressPct.Text = "0%" end
        data.ready = true
        isStealing = false
    end)
end

-- =====================================================================
-- AUTO STEAL V2
-- =====================================================================
_G.YoutV2Steal = _G.YoutV2Steal or {
    enabled = false, radius = 10, primeRange = 80, holdMin = 1.3, holdMax = 2.6,
    entryDelay = 0.25, cooldown = 0.05,
    animals = {}, promptCache = {}, internalCache = {},
    state = {active = false, startTime = 0, phase = "idle", label = "", lastResult = "", lastResultTime = 0},
    plotSync = {caches = {}, connections = {}}, plots = nil, syncReady = false,
    scanThread = nil, conn = nil, lastScan = 0,
    animalsData = nil, channelFolder = nil, routeRemote = nil, requestData = nil
}

local function _yv2Root()
    local c = LP.Character
    return c and (c:FindFirstChild("HumanoidRootPart") or c:FindFirstChild("UpperTorso")) or nil
end

local function _yv2SplitPath(path)
    if typeof(path) == "table" then return path end
    local out = {}
    for p in string.gmatch(tostring(path), "[^%.]+") do table.insert(out, tonumber(p) or p) end
    return out
end

local function _yv2ResolvePath(path, root)
    local cur, par, key = root, nil, nil
    for _, p in ipairs(_yv2SplitPath(path)) do
        par = cur; key = p; cur = cur and cur[p] or nil
    end
    return cur, par, key
end

local function _yv2ApplyDiff(channelName, packet)
    local cache = _G.YoutV2Steal.plotSync.caches[channelName]
    if typeof(cache) ~= "table" then return end
    local path, action, a, b = packet[1], packet[2], packet[3], packet[4]
    local cur, par, key = _yv2ResolvePath(path, cache)
    if action == "Changed" then
        if par then par[key] = a end
    elseif action == "ArrayInsert" then
        if cur then table.insert(cur, b, a) end
    elseif action == "ArrayRemoved" then
        if cur then table.remove(cur, b) end
    elseif action == "DictionaryInsert" then
        if cur then cur[b] = a end
    elseif action == "DictionaryRemoved" then
        if cur then cur[b] = nil end
    end
end

local function _yv2AttachChannel(remote, plots, requestData)
    local A = _G.YoutV2Steal
    if A.plotSync.connections[remote] then return end
    local channelName = tostring(remote.Name)
    if not plots:FindFirstChild(channelName) then return end
    if requestData and A.plotSync.caches[channelName] == nil then
        local ok, data = pcall(function() return requestData:InvokeServer(channelName) end)
        A.plotSync.caches[channelName] = (ok and typeof(data) == "table") and data or {}
    elseif A.plotSync.caches[channelName] == nil then
        A.plotSync.caches[channelName] = {}
    end
    A.plotSync.connections[remote] = remote.OnClientEvent:Connect(function(queue)
        for _, packet in ipairs(queue) do _yv2ApplyDiff(channelName, packet) end
    end)
end

local function _yv2EnsureSync()
    local A = _G.YoutV2Steal
    if A.syncReady then return true end
    local ok = pcall(function()
        A.plots = workspace:WaitForChild("Plots", 8)
        local rs = game:GetService("ReplicatedStorage")
        local pkgs = rs:FindFirstChild("Packages")
        local datas = rs:FindFirstChild("Datas")
        if not (pkgs and datas and A.plots) then return end
        A.animalsData = require(datas:WaitForChild("Animals", 10))
        local sync = pkgs:FindFirstChild("Synchronizer") or pkgs:WaitForChild("Synchronizer", 10)
        if not sync then return end
        A.channelFolder = sync:FindFirstChild("Channel") or sync:WaitForChild("Channel", 10)
        A.routeRemote = sync:FindFirstChild("CommunicationRoute") or sync:WaitForChild("CommunicationRoute", 10)
        A.requestData = sync:FindFirstChild("RequestData")
        if A.channelFolder then
            for _, child in ipairs(A.channelFolder:GetChildren()) do
                if child:IsA("RemoteEvent") then _yv2AttachChannel(child, A.plots, A.requestData) end
            end
            A.channelFolder.ChildAdded:Connect(function(child)
                if child:IsA("RemoteEvent") then _yv2AttachChannel(child, A.plots, A.requestData) end
            end)
        end
        if A.routeRemote then
            A.routeRemote.OnClientEvent:Connect(function(actions)
                for _, action in ipairs(actions) do
                    local kind, cn = action[1], tostring(action[2])
                    if A.plots and A.plots:FindFirstChild(cn) then
                        if kind == "ListenerAdded" then
                            local r = A.channelFolder and A.channelFolder:FindFirstChild(cn)
                            if r and r:IsA("RemoteEvent") then _yv2AttachChannel(r, A.plots, A.requestData) end
                        elseif kind == "ListenerRemoved" then
                            for remote, conn in pairs(A.plotSync.connections) do
                                if tostring(remote.Name) == cn then
                                    pcall(function() conn:Disconnect() end)
                                    A.plotSync.connections[remote] = nil
                                    A.plotSync.caches[cn] = nil
                                    break
                                end
                            end
                        end
                    end
                end
            end)
        end
        A.syncReady = true
    end)
    return ok and A.syncReady == true
end

local function _yv2PlotOwner(plot)
    local sign = plot and plot:FindFirstChild("PlotSign")
    local frame = sign and sign:FindFirstChild("SurfaceGui") and sign.SurfaceGui:FindFirstChild("Frame")
    local label = frame and frame:FindFirstChild("TextLabel")
    if not label or label.Text == "Empty Base" then return nil end
    return label.Text:gsub("'s [Bb]ase$", ""):gsub("%s+$", "")
end

local function _yv2IsMyBase(animalData)
    local A = _G.YoutV2Steal
    if not animalData or not animalData.plot or not A.plots then return false end
    local plot = A.plots:FindFirstChild(animalData.plot)
    if not plot then return false end
    local owner = _yv2PlotOwner(plot)
    return owner == LP.DisplayName or owner == LP.Name
end

local function _yv2PodiumFor(animalData)
    local A = _G.YoutV2Steal
    local plot = A.plots and A.plots:FindFirstChild(animalData.plot)
    local pds = plot and plot:FindFirstChild("AnimalPodiums")
    return pds and pds:FindFirstChild(animalData.slot) or nil
end

local function _yv2AnimalPos(animalData)
    local pod = _yv2PodiumFor(animalData)
    return pod and pod:GetPivot().Position or nil
end

local function _yv2DistToAnimal(animalData)
    local root = _yv2Root()
    local pos = _yv2AnimalPos(animalData)
    return root and pos and (root.Position - pos).Magnitude or math.huge
end

local function _yv2FindPrompt(animalData)
    local A = _G.YoutV2Steal
    if not animalData then return nil end
    local cached = A.promptCache[animalData.uid]
    if cached and cached.Parent then return cached end
    local pod = _yv2PodiumFor(animalData)
    if not pod then return nil end
    for _, p in ipairs(pod:GetDescendants()) do
        if p:IsA("ProximityPrompt") then A.promptCache[animalData.uid] = p return p end
    end
    return nil
end

local function _yv2BuildCallbacks(prompt)
    local A = _G.YoutV2Steal
    if A.internalCache[prompt] then return end
    local data = {holdCallbacks = {}, triggerCallbacks = {}, ready = true}
    pcall(function()
        if getconnections then
            local holds = getconnections(prompt.PromptButtonHoldBegan) or getconnections(prompt.HoldBegan) or {}
            for _, c in ipairs(holds) do
                if type(c.Function) == "function" then table.insert(data.holdCallbacks, c.Function) end
            end
            local triggers = getconnections(prompt.Triggered) or {}
            for _, c in ipairs(triggers) do
                if type(c.Function) == "function" then table.insert(data.triggerCallbacks, c.Function) end
            end
        end
    end)
    A.internalCache[prompt] = data
end

local function _yv2SetBar(p)
    if progressFill then progressFill.Size = UDim2.new(math.clamp(p, 0, 1), 0, 1, 0) end
    if progressPct then progressPct.Text = _floor(math.clamp(p, 0, 1) * 100) .. "%" end
end

local function _yv2ResetBar()
    if progressFill then progressFill.Size = UDim2.new(0, 0, 1, 0) end
    if progressPct then progressPct.Text = "0%" end
end

local function _yv2Execute(prompt, animalData)
    local A = _G.YoutV2Steal
    if not prompt or not prompt.Parent or not animalData then return false end
    if A.state.active then return false end
    if _tick() - (A.state.lastResultTime or 0) < (A.cooldown or 0.05) then return false end
    _yv2BuildCallbacks(prompt)
    local data = A.internalCache[prompt]
    if not data or not data.ready then return false end
    data.ready = false
    A.state.active = true
    A.state.startTime = _tick()
    A.state.phase = "holding"
    A.state.label = animalData.name or "Animal"
    task.spawn(function()
        local t0 = A.state.startTime
        local stops = {0.70, 0.75, 0.80, 0.85, 0.90}
        local SEMI_STOP = stops[math.random(1, #stops)]
        if #data.holdCallbacks > 0 then
            for _, fn in ipairs(data.holdCallbacks) do task.spawn(function() pcall(fn) end) end
        else
            pcall(function() if prompt.InputHoldBegin then prompt:InputHoldBegin() end end)
        end
        while A.enabled and selectedStealMode == "V2" and CONFIG.AUTO_STEAL_ENABLED and _tick() - t0 < (A.holdMin or 1.3) do
            local rawP = (_tick() - t0) / (A.holdMax or 2.6)
            _yv2SetBar(math.min(rawP, SEMI_STOP))
            task.wait()
        end
        A.state.phase = "waitingRange"
        local alreadyInRange = _yv2DistToAnimal(animalData) <= (tonumber(A.radius) or 10)
        local fired = false
        while A.enabled and selectedStealMode == "V2" and CONFIG.AUTO_STEAL_ENABLED and prompt.Parent do
            local elapsed = _tick() - t0
            if elapsed > (A.holdMax or 2.6) then break end
            local rawP2 = elapsed / (A.holdMax or 2.6)
            _yv2SetBar(math.min(rawP2, SEMI_STOP))
            if _yv2DistToAnimal(animalData) <= (tonumber(A.radius) or 10) then
                if not alreadyInRange then task.wait(A.entryDelay or 0.25) end
                if A.enabled and selectedStealMode == "V2" and CONFIG.AUTO_STEAL_ENABLED then
                    if #data.triggerCallbacks > 0 then
                        for _, fn in ipairs(data.triggerCallbacks) do task.spawn(function() pcall(fn) end) end
                    else
                        pcall(function() if prompt.InputHoldEnd then prompt:InputHoldEnd() end end)
                    end
                    fired = true
                end
                break
            end
            task.wait()
        end
        A.state.lastResult = fired and ("Stole " .. tostring(A.state.label)) or "Missed"
        A.state.active = false
        A.state.phase = "idle"
        A.state.lastResultTime = _tick()
        if fired then _yv2SetBar(1) end
        task.wait(A.cooldown or 0.05)
        data.ready = true
        _yv2ResetBar()
    end)
    return true
end

local function _yv2ScanAllPlots()
    local A = _G.YoutV2Steal
    if not _yv2EnsureSync() then return 0 end
    local newCache = {}
    for _, plot in ipairs(A.plots:GetChildren()) do
        local cache = A.plotSync.caches[plot.Name]
        local animalList = cache and cache.AnimalList
        if typeof(animalList) == "table" then
            for slot, animalData in pairs(animalList) do
                if type(animalData) == "table" then
                    local animalName = animalData.Index
                    local info = A.animalsData and A.animalsData[animalName]
                    if info then
                        table.insert(newCache, {
                            name = info.DisplayName or animalName,
                            plot = plot.Name,
                            slot = tostring(slot),
                            uid = plot.Name .. "_" .. tostring(slot)
                        })
                    end
                end
            end
        end
    end
    A.animals = newCache
    return #newCache
end

local function _yv2PickClosest()
    local A = _G.YoutV2Steal
    local root = _yv2Root()
    if not root then return nil end
    local best, bestDist = nil, math.huge
    for _, data in ipairs(A.animals) do
        if not _yv2IsMyBase(data) then
            local pos = _yv2AnimalPos(data)
            local dist = pos and (root.Position - pos).Magnitude or math.huge
            if dist <= (A.primeRange or 80) and dist < bestDist then
                best, bestDist = data, dist
            end
        end
    end
    return best
end

local function _yv2EnsureScanThread()
    local A = _G.YoutV2Steal
    if A.scanThread then return end
    A.scanThread = task.spawn(function()
        while _G.YoutV2Steal do
            if A.enabled or selectedStealMode == "V2" then pcall(_yv2ScanAllPlots) end
            task.wait(5)
        end
    end)
end

function stopAutoStealV2()
    local A = _G.YoutV2Steal
    A.enabled = false
    if A.conn then A.conn:Disconnect() A.conn = nil end
    A.state.active = false
    A.state.phase = "idle"
    _yv2ResetBar()
end

function startAutoStealV2()
    local A = _G.YoutV2Steal
    A.radius = 10
    A.enabled = true
    pcall(_yv2EnsureSync)
    _yv2EnsureScanThread()
    pcall(_yv2ScanAllPlots)
    if A.conn then A.conn:Disconnect() A.conn = nil end
    A.conn = RunService.Heartbeat:Connect(function()
        if not A.enabled or not CONFIG.AUTO_STEAL_ENABLED or selectedStealMode ~= "V2" or A.state.active then return end
        local target = _yv2PickClosest()
        if not target then
            if _tick() - (A.lastScan or 0) > 1.2 then
                A.lastScan = _tick()
                pcall(_yv2ScanAllPlots)
            end
            return
        end
        local prompt = _yv2FindPrompt(target)
        if prompt then _yv2Execute(prompt, target) end
    end)
end

local function _startAutoStealV1()
    if stealConnection then
        local connected = false
        pcall(function() connected = stealConnection.Connected == true end)
        if connected then
            Steal.StealRadius = CONFIG.STEAL_RANGE
            Steal.AutoStealEnabled = true
            return true
        end
        pcall(function() stealConnection:Disconnect() end)
        stealConnection = nil
    end
    Steal.StealRadius = CONFIG.STEAL_RANGE
    Steal.AutoStealEnabled = true
    stealConnection = RunService.Heartbeat:Connect(function()
        if not Steal.AutoStealEnabled or isStealing then return end
        if selectedStealMode ~= "V1" then return end
        local p, n = findNearestPrompt()
        if p then executeSteal(p, n) end
    end)
    return true
end

local function _stopAutoStealV1()
    if stealConnection then
        stealConnection:Disconnect()
        stealConnection = nil
    end
    isStealing = false
    Steal.AutoStealEnabled = false
    if progressFill then
        TS:Create(progressFill, TweenInfo.new(0.2), { Size = UDim2.new(0, 0, 1, 0) }):Play()
    end
    if progressPct then progressPct.Text = "0%" end
end

function startAutoSteal()
    _stopAutoStealV1()
    stopAutoStealV2()
    CONFIG.AUTO_STEAL_ENABLED = true
    if selectedStealMode == "V2" then
        startAutoStealV2()
    else
        _startAutoStealV1()
    end
    return true
end

function stopAutoSteal()
    _stopAutoStealV1()
    stopAutoStealV2()
    CONFIG.AUTO_STEAL_ENABLED = false
    if progressFill then
        TS:Create(progressFill, TweenInfo.new(0.2), { Size = UDim2.new(0, 0, 1, 0) }):Play()
    end
    if progressPct then progressPct.Text = "0%" end
end

medusaDebounce = false
medusaLastUsed = 0
dropActive = false
lastDropTime = 0
lastMoveDir = _V3new(0,0,0)
origFOV = nil
fovEnabled = false
fovValue = 70
customFovConn = nil

_anyKeyListening = false
_aimbotConn = nil
_prevAutoRotate = nil
tpBatConn = nil
tpBatPrevAutoRotate = nil
tpBatHitCD = false
TP_BAT_SWING_CD = 0.08
tpBatFloatingButton = nil

enemySpeedConn = nil
movementLoop = nil
steppedConn = nil
alConn = nil
arConn = nil
infJumpConn = nil
stretchConn = nil
stretchFovConn = nil
antiLagDescConn = nil
medusaResetConns = {}
dropConnections = {}
enemySpeedLabels = {}
Conns = {autoSteal = nil, batCounter = nil, anchor = {}, progress = nil, autoLeft = nil, autoRight = nil}
keyButtonRefs = {}
progressFill = nil
progressPct = nil
pbFrame = nil
speedLabel = nil
modeValLbl = nil
normalBox, carryBox, laggerBox, lagger2Box, radInput, batSpeedBox, uiScaleBox = nil, nil, nil, nil, nil, nil, nil
modeSelectBtn, dropModeBtnRef = nil, nil
autoBatSetVisual, autoLeftSetVisual, autoRightSetVisual, setBatCounterVisual, setMedusaVisual = nil, nil, nil, nil, nil
setAntiRagVisual, setUnwalkVisual, setAntiLagVisual, setLockUIVisual, setInstaGrab = nil, nil, nil, nil, nil
setAntiDieVisual = nil
setAntiBatVisual = nil
setAntiFlingVisual = nil
setESPVIsual = nil
setESPLineVisual = nil
mobSetAutoBat, mobSetAutoLeft, mobSetAutoRight, mobSetDropBR, mobSetTpDown, mobSetCarry, mobSetLagger1, mobSetLagger2 = nil, nil, nil, nil, nil, nil, nil, nil
miniBtn, main, gui = nil, nil, nil
MobilePanel = nil
instaResetFloatingButton = nil
showGui = nil
hideGui = nil
mainUIScale = nil
animSelectorLabel = nil
pbScale = nil
tabButtons = nil
colorSelectorLabel = nil

GAMEPAD_KEYS = {
    [Enum.KeyCode.ButtonA] = true, [Enum.KeyCode.ButtonB] = true,
    [Enum.KeyCode.ButtonX] = true, [Enum.KeyCode.ButtonY] = true,
    [Enum.KeyCode.ButtonL1] = true, [Enum.KeyCode.ButtonR1] = true,
    [Enum.KeyCode.ButtonL2] = true, [Enum.KeyCode.ButtonR2] = true,
    [Enum.KeyCode.ButtonL3] = true, [Enum.KeyCode.ButtonR3] = true,
    [Enum.KeyCode.ButtonStart] = true, [Enum.KeyCode.ButtonSelect] = true,
    [Enum.KeyCode.DPadUp] = true, [Enum.KeyCode.DPadDown] = true,
    [Enum.KeyCode.DPadLeft] = true, [Enum.KeyCode.DPadRight] = true,
}

MOVE_KEYS = {
    [Enum.KeyCode.W] = true, [Enum.KeyCode.A] = true,
    [Enum.KeyCode.S] = true, [Enum.KeyCode.D] = true,
    [Enum.KeyCode.Up] = true, [Enum.KeyCode.Left] = true,
    [Enum.KeyCode.Down] = true, [Enum.KeyCode.Right] = true,
}

BAT_COUNTER_SLAP_LIST = {
    "Bat", "Slap", "Iron Slap", "Gold Slap", "Diamond Slap",
    "Emerald Slap", "Ruby Slap", "Dark Matter Slap", "Flame Slap",
    "Nuclear Slap", "Galaxy Slap", "Glitched Slap"
}

AP = {
    L1 = _V3new(-476.48, -6.28, 92.73),
    L2 = _V3new(-483.12, -4.95, 94.80),
    L_FACE = _V3new(-482.25, -4.96, 92.09),
    R1 = _V3new(-476.16, -6.52, 25.62),
    R2 = _V3new(-483.06, -5.03, 25.48),
    R_FACE = _V3new(-482.06, -6.93, 35.47),
}

function isGamepadInput(inp)
    return inp and inp.UserInputType and inp.UserInputType.Name:match("^Gamepad") ~= nil
end

function isBindableInput(inp)
    if not inp or inp.KeyCode == Enum.KeyCode.Unknown then return false end
    if inp.UserInputType == Enum.UserInputType.Keyboard then return true end
    return isGamepadInput(inp) and GAMEPAD_KEYS[inp.KeyCode] == true
end

function kbMatch(entry, kc)
    return kc and (kc == entry.kb or (entry.gp and kc == entry.gp))
end

function resetProgressBar()
    if progressPct then progressPct.Text = "0%" end
    if progressFill then progressFill.Size = UDim2.new(0, 0, 1, 0) end
end

-- =====================================================================
-- TP DOWN
-- =====================================================================
TP_DOWN_OFFSET = 0.1
_G._VynxTPDownMode = (_G._VynxTPDownMode == "half") and "half" or "full"
if _G._VynxAutoTPDownEnabled == nil then _G._VynxAutoTPDownEnabled = false end
_G._VynxAutoTPDownHeightTrigger = tonumber(_G._VynxAutoTPDownHeightTrigger) or 20

local function _tpIsCarryingBrainrot(char)
    if not char then return false end
    if LP:GetAttribute("Stealing") == true or char:GetAttribute("Stealing") == true then
        return true
    end
    for _, child in ipairs(char:GetChildren()) do
        if child:IsA("Tool") then
            local n = child.Name:lower()
            if not (n:find("bat") or n:find("slap")) then return true end
        end
    end
    return false
end

local function _runTPDownHalf()
    pcall(function()
        local c = LP.Character
        if not c then return end
        local hrp = c:FindFirstChild("HumanoidRootPart")
        if not hrp then return end
        local hum = c:FindFirstChildOfClass("Humanoid")
        if not hum then return end
        local rp = _RayParams_new()
        rp.FilterDescendantsInstances = {c}
        rp.FilterType = Enum.RaycastFilterType.Exclude
        local hit = workspace:Raycast(hrp.Position, _V3new(0, -500, 0), rp)
        if hit then
            hrp.AssemblyLinearVelocity = _V3zero
            hrp.AssemblyAngularVelocity = _V3zero
            local hh = hum.HipHeight or 2
            local hy = hrp.Size.Y / 2
            hrp.CFrame = _CFnew(hit.Position.X, hit.Position.Y + hh + hy + (TP_DOWN_OFFSET or 0.1), hit.Position.Z)
            hrp.AssemblyLinearVelocity = _V3zero
        end
    end)
end

local function _runTPDownFull()
    pcall(function()
        local c = LP.Character
        if not c then return end
        local hrp = c:FindFirstChild("HumanoidRootPart")
        if not hrp then return end
        local _, yaw = hrp.CFrame:ToEulerAnglesYXZ()
        hrp.CFrame = _CFnew(hrp.Position.X, -7.00, hrp.Position.Z) * CFrame.Angles(0, yaw, 0)
        hrp.AssemblyLinearVelocity = _V3zero
    end)
end

local function executeTPDown()
    if dropActive or _G.IsDropping then return end
    local char = LP.Character
    if not char then return end
    local hrp = char:FindFirstChild("HumanoidRootPart")
    if not hrp then return end
    local hum = char:FindFirstChildOfClass("Humanoid")
    if not hum or hum.Health <= 0 or hrp.Anchored or hum.Sit or hum.SeatPart then return end
    if _G._VynxTPDownMode == "half" then
        _runTPDownHalf()
    else
        _runTPDownFull()
    end
end

function doTpDown()
    executeTPDown()
end

local _tpAutoConn = RunService.Heartbeat:Connect(function()
    if _G._VynxAutoTPDownEnabled ~= true then return end
    local char = LP.Character
    if not char then return end
    if not _tpIsCarryingBrainrot(char) then return end
    local root = char:FindFirstChild("HumanoidRootPart")
    if not root then return end
    local rp = _RayParams_new()
    rp.FilterDescendantsInstances = {char}
    rp.FilterType = Enum.RaycastFilterType.Exclude
    local hit = workspace:Raycast(root.Position, _V3new(0, -2000, 0), rp)
    if not hit then return end
    local trigger = tonumber(_G._VynxAutoTPDownHeightTrigger) or 20
    if root.Position.Y - hit.Position.Y > trigger then
        executeTPDown()
    end
end)

_G._VynxRunTPDown = executeTPDown
_G._VynxSetTPDownMode = function(m)
    _G._VynxTPDownMode = (m == "half") and "half" or "full"
    return _G._VynxTPDownMode
end
_G._VynxTPDownIsAutoOn = function() return _G._VynxAutoTPDownEnabled == true end

local _tpDownTick = executeTPDown

local _tpDownHoldConn = nil
local function startTpDownHold()
    if _tpDownHoldConn then return end
    _tpDownHoldConn = RunService.Heartbeat:Connect(function()
        local entry = KB.TPFloor
        if not entry then return end
        local kc = entry.gp or entry.kb
        if not kc then return end
        if UIS:IsKeyDown(kc) then
            pcall(_tpDownTick)
        end
    end)
end
startTpDownHold()

-- =====================================================================
-- ANTI RAGDOLL
-- =====================================================================
local AntiRagdollV2 = {
    Enabled = false,
    Connection = nil,
    ResetCooldown = 0,
}

local function startAntiRagdollV2()
    if AntiRagdollV2.Connection then return end
    AntiRagdollV2.Enabled = true
    AntiRagdollV2.Connection = RunService.Heartbeat:Connect(function()
        if not AntiRagdollV2.Enabled then return end
        local char = LP.Character
        if not char then return end
        local hum = char:FindFirstChildOfClass("Humanoid")
        local root = char:FindFirstChild("HumanoidRootPart")
        if not hum or not root or hum.Health <= 0 then return end
        if dropActive or _G.IsDropping then return end
        local state = hum:GetState()
        local now = _tick()
        if state == Enum.HumanoidStateType.Physics or
           state == Enum.HumanoidStateType.Ragdoll or
           state == Enum.HumanoidStateType.FallingDown then
            if now - AntiRagdollV2.ResetCooldown > 0.15 then
                AntiRagdollV2.ResetCooldown = now
                pcall(function()
                    hum:ChangeState(Enum.HumanoidStateType.GettingUp)
                    root.Velocity = _V3zero
                    root.RotVelocity = _V3zero
                    root.AssemblyLinearVelocity = _V3zero
                    root.AssemblyAngularVelocity = _V3zero
                    for _, obj in ipairs(char:GetDescendants()) do
                        if obj:IsA("Motor6D") then obj.Enabled = true end
                        if obj:IsA("Constraint") then obj.Enabled = true end
                    end
                    workspace.CurrentCamera.CameraSubject = hum
                    local PM = LP.PlayerScripts:FindFirstChild("PlayerModule")
                    if PM then
                        local CM = require(PM:FindFirstChild("ControlModule"))
                        if CM then CM:Enable() end
                    end
                    hum.AutoRotate = true
                    hum.PlatformStand = false
                    hum.Sit = false
                end)
            end
        end
    end)
end

local function stopAntiRagdollV2()
    AntiRagdollV2.Enabled = false
    if AntiRagdollV2.Connection then
        AntiRagdollV2.Connection:Disconnect()
        AntiRagdollV2.Connection = nil
    end
    AntiRagdollV2.ResetCooldown = 0
end

LP.CharacterAdded:Connect(function()
    task.wait(0.5)
    if antiRagdollMode == "v2" then
        if AntiRagdollV2.Connection then
            AntiRagdollV2.Connection:Disconnect()
            AntiRagdollV2.Connection = nil
        end
        startAntiRagdollV2()
    end
end)

function setAntiRagdollMode(mode)
    if mode == "v2" then
        startAntiRagdollV2()
        antiRagdollMode = "v2"
    else
        stopAntiRagdollV2()
        antiRagdollMode = "off"
    end
    if setAntiRagVisual then setAntiRagVisual(antiRagdollMode == "v2") end
    saveAllSettings()
end

-- =====================================================================
-- [FIX ANTI DIE VIOLETTE v2]
-- =====================================================================
_antiDieEnabled = false
_antiDieStopped = false
_antiDieSources = { toggle = false, autobat = false }

_antiDie = {
    enabled = false, loop = nil, healthConn = nil, charConn = nil,
    lastHealTime = 0, invincibleUntil = 0,
    config = {
        healthThreshold = 50,
        invincibilityFrames = 0.75,
        fallDamageProtection = false,
        ragdollProtection = true,
        autoRevive = true,
    },
}

function _antiDie.SuperHeal(hum)
    if not hum or not hum.Parent then return end
    local maxHealth = hum.MaxHealth or 100
    if maxHealth <= 0 or maxHealth == math.huge then maxHealth = 100 end
    pcall(function()
        hum.Health = maxHealth
        if hum.MaxHealth < maxHealth then hum.MaxHealth = maxHealth end
    end)
    _antiDie.invincibleUntil = _tick() + _antiDie.config.invincibilityFrames
    _antiDie.lastHealTime = _tick()
    pcall(function()
        local char = hum.Parent
        if not char then return end
        for _, child in ipairs(char:GetChildren()) do
            if child:IsA("NumberValue") then
                local name = child.Name:lower()
                if name:find("health") or name:find("hp") or name:find("life") then
                    child.Value = maxHealth
                end
            end
            if child:IsA("BoolValue") and child.Name:lower():find("dead") then
                child.Value = false
            end
        end
    end)
end

function _antiDie.PreventDamage(root, hum)
    if not hum then return end
    if hum.Health < (hum.MaxHealth or 100) then _antiDie.SuperHeal(hum) end
    if _tick() < _antiDie.invincibleUntil then
        if hum.Health < (hum.MaxHealth or 100) then
            hum.Health = hum.MaxHealth or 100
        end
    end
    if _antiDie.config.ragdollProtection then
        local state = hum:GetState()
        if state == Enum.HumanoidStateType.Physics or
           state == Enum.HumanoidStateType.Ragdoll or
           state == Enum.HumanoidStateType.FallingDown or
           state == Enum.HumanoidStateType.Dead then
            pcall(function()
                hum:ChangeState(Enum.HumanoidStateType.GettingUp)
                hum:ChangeState(Enum.HumanoidStateType.Running)
            end)
            _antiDie.SuperHeal(hum)
            if root then
                pcall(function() root.AssemblyAngularVelocity = Vector3.zero end)
            end
        end
    end
    if hum.Health <= 0 then
        _antiDie.SuperHeal(hum)
        pcall(function()
            hum:ChangeState(Enum.HumanoidStateType.GettingUp)
            hum:ChangeState(Enum.HumanoidStateType.Running)
        end)
        if root then
            pcall(function()
                root.CFrame = CFrame.new(root.Position + Vector3.new(0, 2, 0))
                root.AssemblyLinearVelocity = Vector3.zero
            end)
        end
    end
end

function _antiDie.AutoRevive()
    if not _antiDie.config.autoRevive then return end
    local char = LP.Character
    if not char then return end
    local hum = char:FindFirstChildOfClass("Humanoid")
    local root = char:FindFirstChild("HumanoidRootPart")
    if not hum then return end
    if hum.Health <= 0 then
        _antiDie.SuperHeal(hum)
        pcall(function()
            hum:ChangeState(Enum.HumanoidStateType.GettingUp)
            hum:ChangeState(Enum.HumanoidStateType.Running)
        end)
        if root then
            pcall(function()
                root.CFrame = CFrame.new(root.Position + Vector3.new(0, 3, 0))
                root.AssemblyLinearVelocity = Vector3.zero
            end)
        end
    end
end

function _antiDie.AttachHealth(char)
    if _antiDie.healthConn then _antiDie.healthConn:Disconnect(); _antiDie.healthConn = nil end
    local hum = char and char:FindFirstChildOfClass("Humanoid")
    if not hum then hum = char and char:WaitForChild("Humanoid", 3) end
    if not hum then return end
    _antiDie.healthConn = hum:GetPropertyChangedSignal("Health"):Connect(function()
        if not _antiDie.enabled then return end
        if hum.Health < (hum.MaxHealth or 100) then _antiDie.SuperHeal(hum) end
        if hum.Health <= 0 then _antiDie.AutoRevive() end
    end)
    if hum.Health < (hum.MaxHealth or 100) then _antiDie.SuperHeal(hum) end
end

function _antiDie.StartEngine()
    if _antiDie.enabled and _antiDie.loop then return end
    _antiDie.enabled = true
    _antiDieEnabled = true
    antiDieEnabled = true
    if _antiDie.loop then _antiDie.loop:Disconnect(); _antiDie.loop = nil end
    if _antiDie.healthConn then _antiDie.healthConn:Disconnect(); _antiDie.healthConn = nil end
    _antiDie.loop = RunService.Heartbeat:Connect(function()
        if not _antiDie.enabled then return end
        local char = LP.Character
        if not char then return end
        local hum = char:FindFirstChildOfClass("Humanoid")
        local root = char:FindFirstChild("HumanoidRootPart")
        if not hum then return end
        if hum.Health <= 0 then _antiDie.AutoRevive()
        elseif hum.Health <= _antiDie.config.healthThreshold then _antiDie.SuperHeal(hum)
        elseif hum.Health < (hum.MaxHealth or 100) then _antiDie.SuperHeal(hum) end
        _antiDie.PreventDamage(root, hum)
    end)
    if LP.Character then _antiDie.AttachHealth(LP.Character) end
    if _antiDie.charConn then _antiDie.charConn:Disconnect(); _antiDie.charConn = nil end
    _antiDie.charConn = LP.CharacterAdded:Connect(function(char)
        if not _antiDie.enabled then return end
        task.wait(0.05)
        _antiDie.AttachHealth(char)
        local hum = char:FindFirstChildOfClass("Humanoid")
        if hum then _antiDie.SuperHeal(hum) end
    end)
end

function _antiDie.StopEngine()
    _antiDie.enabled = false
    _antiDieEnabled = false
    antiDieEnabled = false
    if _antiDie.loop then _antiDie.loop:Disconnect(); _antiDie.loop = nil end
    if _antiDie.healthConn then _antiDie.healthConn:Disconnect(); _antiDie.healthConn = nil end
    if _antiDie.charConn then _antiDie.charConn:Disconnect(); _antiDie.charConn = nil end
    pcall(function()
        local char = LP.Character
        local hum = char and char:FindFirstChildOfClass("Humanoid")
        if not hum then return end
        hum:SetStateEnabled(Enum.HumanoidStateType.Dead, true)
        hum:SetStateEnabled(Enum.HumanoidStateType.Ragdoll, true)
        hum:SetStateEnabled(Enum.HumanoidStateType.FallingDown, true)
        hum.BreakJointsOnDeath = true
        if hum.MaxHealth == math.huge or hum.MaxHealth <= 0 then
            hum.MaxHealth = 100
            hum.Health = math.min(hum.Health, 100)
        end
    end)
end

function _antiDieSetEnabled(enabled)
    enabled = enabled == true
    if enabled == _antiDieEnabled then return end
    if enabled then
        _antiDie.StartEngine()
    else
        _antiDie.StopEngine()
    end
end

function _antiDieRefresh()
    if _antiDieStopped then return end
    local manual = _antiDieSources.toggle
    _antiDieSetEnabled(manual or _antiDieSources.autobat)
end

_G.__CrystalAntiDieSource = function(source, enabled)
    if _antiDieStopped or _antiDieSources[source] == nil then return end
    _antiDieSources[source] = enabled == true
    _antiDieRefresh()
end

_G.__CrystalAntiDieSet = function(enabled)
    _G.__CrystalAntiDieSource("autobat", enabled)
end

_G.__CrystalAntiDieIsEnabled = function() return _antiDieEnabled end
_G.__CrystalAntiDieStop = function()
    _antiDieStopped = true
    _antiDieSources.toggle = false
    _antiDieSources.autobat = false
    _antiDieSetEnabled(false)
end

function activateOnCharacter(char)
    if not _antiDieEnabled then return end
    _antiDie.AttachHealth(char)
    local hum = char and char:FindFirstChildOfClass("Humanoid")
    if hum then _antiDie.SuperHeal(hum) end
end

AntiDieModule = {
    enabled = false,
    start = function()
        AntiDieModule.enabled = true
        antiDieEnabled = true
        _antiDieStopped = false
        _G.__CrystalAntiDieSource("toggle", true)
    end,
    stop = function()
        AntiDieModule.enabled = false
        antiDieEnabled = false
        _G.__CrystalAntiDieSource("toggle", false)
    end,
}
_G.AntiDie = AntiDieModule

-- =====================================================================
-- ANTI BAT (lÃ³gica portada desde Violette)
-- Reemplaza la versiÃ³n previa de Yout que usaba root.Velocity y que
-- tambiÃ©n recuperaba del ragdoll. Ahora sÃ³lo aplica el pulso de
-- AssemblyLinearVelocity (500, y, 500) y espera un RenderStepped para
-- restaurar el componente horizontal. La recuperaciÃ³n de ragdoll queda
-- exclusivamente a cargo del toggle "Anti Ragdoll".
-- =====================================================================
local AntiBat = { Connection = nil }

function stopAntiBat()
    antiBatEnabled = false
    if AntiBat.Connection then
        AntiBat.Connection:Disconnect()
        AntiBat.Connection = nil
    end
end

function startAntiBat()
    stopAntiBat()
    antiBatEnabled = true

    local char = LP.Character
    if not char then return end
    local root = char:FindFirstChild("HumanoidRootPart")
    if not root then return end

    AntiBat.Connection = RunService.Heartbeat:Connect(function()
        if not antiBatEnabled then return end

        if not root or not root.Parent then
            root = LP.Character and LP.Character:FindFirstChild("HumanoidRootPart")
            if not root then return end
        end

        local vel  = root.AssemblyLinearVelocity
        local flat = Vector3.new(vel.X, 0, vel.Z)

        root.AssemblyLinearVelocity = Vector3.new(500, vel.Y, 500)
        RunService.RenderStepped:Wait()
        if root and root.Parent then
            local y2 = root.AssemblyLinearVelocity.Y
            root.AssemblyLinearVelocity = Vector3.new(flat.X, y2, flat.Z)
        end
    end)
end

LP.CharacterAdded:Connect(function…"
 content://media/external/downloads/1000090985#:~:text=%2D%2D%20A%20previous%20copy,return%0A%20%20%20%20end%0Aend)