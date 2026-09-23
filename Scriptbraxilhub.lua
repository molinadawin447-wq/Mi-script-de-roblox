--[[
    ██████╗ ██████╗  █████╗ ██╗  ██╗██╗██╗
    ██╔══██╗██╔══██╗██╔══██╗╚██╗██╔╝██║██║
    ██████╔╝██████╔╝███████║ ╚███╔╝ ██║██║
    ██╔══██╗██╔══██╗██╔══██║ ██╔██╗ ██║██║
    ██████╔╝██║  ██║██║  ██║██╔╝ ██╗██║███████╗
    ╚═════╝ ╚═╝  ╚═╝╚═╝  ╚═╝╚═╝  ╚═╝╚═╝╚══════╝
                BRAxIL HUB — MOBILE EDITION (REDESIGNED GUI)
]]

local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local UIS = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local Lighting = game:GetService("Lighting")
local HS = game:GetService("HttpService")
local LocalPlayer = Players.LocalPlayer

-- ============================================================
-- SYSTEM: WHITE MOVING SHADOW (Sombra blanca deslizante)
-- ============================================================
local _whiteShadows = {}
local _shadowStartTime = tick()
local SHADOW_DURATION = 1.30
local SHADOW_BAR_HEIGHT = 18

local function registerWhiteShadow(target, cornerRadius)
    if not target then return end
    pcall(function()
        target.ClipsDescendants = true
        local bar = Instance.new("Frame")
        bar.Name = "__WhiteShadow"
        bar.Size = UDim2.new(1, 0, 0, SHADOW_BAR_HEIGHT)
        bar.Position = UDim2.new(0, 0, 0, -SHADOW_BAR_HEIGHT - 4)
        bar.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        bar.BackgroundTransparency = 0
        bar.BorderSizePixel = 0
        bar.ZIndex = (target.ZIndex or 1) + 50
        bar.Parent = target
        
        local grad = Instance.new("UIGradient", bar)
        grad.Rotation = 90
        grad.Transparency = NumberSequence.new({
            NumberSequenceKeypoint.new(0, 1.00),
            NumberSequenceKeypoint.new(0.5, 0.25),
            NumberSequenceKeypoint.new(1, 1.00),
        })
        local c = Instance.new("UICorner", bar)
        c.CornerRadius = UDim.new(0, cornerRadius or 10)
        table.insert(_whiteShadows, {bar = bar, target = target})
    end)
end

task.spawn(function()
    while true do
        local elapsed = tick() - _shadowStartTime
        local phase = (elapsed % SHADOW_DURATION) / SHADOW_DURATION
        for i = #_whiteShadows, 1, -1 do
            local entry = _whiteShadows[i]
            if not entry or not entry.bar or not entry.bar.Parent or not entry.target or not entry.target.Parent then
                if entry and entry.bar and entry.bar.Parent then
                    entry.bar:Destroy()
                end
                table.remove(_whiteShadows, i)
            else
                local t = entry.target
                local b = entry.bar
                local h = t.AbsoluteSize.Y
                if h <= 0 then h = 60 end
                local startY = -SHADOW_BAR_HEIGHT - 4
                local endY   = h + 4
                local currentY = startY + (endY - startY) * phase
                b.Position = UDim2.new(0, 0, 0, math.floor(currentY))
                b.Size = UDim2.new(1, 0, 0, SHADOW_BAR_HEIGHT)
            end
        end
        task.wait()
    end
end)

-- ============================================================
-- GLOBAL STATE & VARIABLES
-- ============================================================
local NS, CS = 59, 29
local LAGGER_SPEED = 30
local LAGGER_CARRY_SPEED = 15
local carrySpeedActive = false
local laggerModeEnabled = false

local antiRagdollEnabled, infJumpEnabled = false, false
local medusaCounterEnabled, batCounterEnabled, unwalkEnabled = false, false, false
local autoLeftEnabled, autoRightEnabled = false, false
local autoBatEnabled = false
local autoSwingEnabled = true
local autoMoveSwingEnabled = false
local autoMoveSwingInterval = 0.3
local antiLagEnabled, removeAccessoriesEnabled = false, false
local stretchRezEnabled = false
local autoTPEnabled, autoTPHeight = false, 20
local cursedResetRemote = nil
local BRAXIL_HUB_RESET_GUID = "f888ee6e-c86d-46e1-93d7-0639d6635d42"
local fovValue = 80
local currentSkyTheme = "Night"

local BRAXIL = {
    medusaReset = false,
    antiKick = false,
    brainrot = false,
    tpBat = false,
    batV2 = false,
    v2Conn = nil,
    v2Rot = nil,
    v2CD = false
}

-- ============================================================
-- MAIN GUI CREATION
-- ============================================================
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "BRAxILHub_ModernGUI"
ScreenGui.ResetOnSpawn = false
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

pcall(function()
    if syn and syn.protect_gui then
        syn.protect_gui(ScreenGui)
        ScreenGui.Parent = game:GetService("CoreGui")
    else
        ScreenGui.Parent = LocalPlayer:WaitForChild("PlayerGui")
    end
end)

-- Frame Principal
local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.Size = UDim2.new(0, 520, 0, 360)
MainFrame.Position = UDim2.new(0.5, -260, 0.5, -180)
MainFrame.BackgroundColor3 = Color3.fromRGB(15, 15, 20)
MainFrame.BorderSizePixel = 0
MainFrame.Active = true
MainFrame.Draggable = true
MainFrame.Parent = ScreenGui

local MainCorner = Instance.new("UICorner", MainFrame)
MainCorner.CornerRadius = UDim.new(0, 12)

local MainStroke = Instance.new("UIStroke", MainFrame)
MainStroke.Color = Color3.fromRGB(255, 255, 255)
MainStroke.Thickness = 1.5
MainStroke.Transparency = 0.2

-- Registro de Sombra Blanca en el Marco Principal
registerWhiteShadow(MainFrame, 12)

-- Topbar (Barra superior)
local TopBar = Instance.new("Frame", MainFrame)
TopBar.Name = "TopBar"
TopBar.Size = UDim2.new(1, 0, 0, 40)
TopBar.BackgroundColor3 = Color3.fromRGB(22, 22, 30)
TopBar.BorderSizePixel = 0

local TopCorner = Instance.new("UICorner", TopBar)
TopCorner.CornerRadius = UDim.new(0, 12)

local Title = Instance.new("TextLabel", TopBar)
Title.Size = UDim2.new(1, -50, 1, 0)
Title.Position = UDim2.new(0, 15, 0, 0)
Title.BackgroundTransparency = 1
Title.Text = "BRAxIL HUB — MOBILE EDITION"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.Font = Enum.Font.GothamBold
Title.TextSize = 14
Title.TextXAlignment = Enum.TextXAlignment.Left

local CloseBtn = Instance.new("TextButton", TopBar)
CloseBtn.Size = UDim2.new(0, 30, 0, 30)
CloseBtn.Position = UDim2.new(1, -35, 0.5, -15)
CloseBtn.BackgroundColor3 = Color3.fromRGB(200, 40, 40)
CloseBtn.Text = "X"
CloseBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
CloseBtn.Font = Enum.Font.GothamBold
CloseBtn.TextSize = 14

local CloseCorner = Instance.new("UICorner", CloseBtn)
CloseCorner.CornerRadius = UDim.new(0, 6)

CloseBtn.MouseButton1Click:Connect(function()
    ScreenGui.Enabled = not ScreenGui.Enabled
end)

-- Sidebar (Navegación Lateral)
local Sidebar = Instance.new("Frame", MainFrame)
Sidebar.Name = "Sidebar"
Sidebar.Size = UDim2.new(0, 130, 1, -40)
Sidebar.Position = UDim2.new(0, 0, 0, 40)
Sidebar.BackgroundColor3 = Color3.fromRGB(18, 18, 24)
Sidebar.BorderSizePixel = 0

local SideList = Instance.new("UIListLayout", Sidebar)
SideList.SortOrder = Enum.SortOrder.LayoutOrder
SideList.Padding = UDim.new(0, 6)

local SidePadding = Instance.new("UIPadding", Sidebar)
SidePadding.PaddingTop = UDim.new(0, 10)
SidePadding.PaddingLeft = UDim.new(0, 8)
SidePadding.PaddingRight = UDim.new(0, 8)

-- Area de Contenido
local Container = Instance.new("Frame", MainFrame)
Container.Name = "Container"
Container.Size = UDim2.new(1, -135, 1, -45)
Container.Position = UDim2.new(0, 132, 0, 42)
Container.BackgroundTransparency = 1

local Pages = {}

local function createPage(name)
    local page = Instance.new("ScrollingFrame")
    page.Name = name .. "Page"
    page.Size = UDim2.new(1, -10, 1, -10)
    page.Position = UDim2.new(0, 5, 0, 5)
    page.BackgroundTransparency = 1
    page.ScrollBarThickness = 3
    page.Visible = false
    page.Parent = Container
    
    local layout = Instance.new("UIListLayout", page)
    layout.SortOrder = Enum.SortOrder.LayoutOrder
    layout.Padding = UDim.new(0, 8)
    
    Pages[name] = page
    return page
end

local function addTab(name)
    local btn = Instance.new("TextButton", Sidebar)
    btn.Size = UDim2.new(1, 0, 0, 32)
    btn.BackgroundColor3 = Color3.fromRGB(25, 25, 35)
    btn.Text = name
    btn.TextColor3 = Color3.fromRGB(180, 180, 180)
    btn.Font = Enum.Font.GothamSemibold
    btn.TextSize = 12
    
    local corner = Instance.new("UICorner", btn)
    corner.CornerRadius = UDim.new(0, 6)
    
    local page = createPage(name)
    
    btn.MouseButton1Click:Connect(function()
        for pageName, pFrame in pairs(Pages) do
            pFrame.Visible = false
        end
        page.Visible = true
        for _, child in ipairs(Sidebar:GetChildren()) do
            if child:IsA("TextButton") then
                child.BackgroundColor3 = Color3.fromRGB(25, 25, 35)
                child.TextColor3 = Color3.fromRGB(180, 180, 180)
            end
        end
        btn.BackgroundColor3 = Color3.fromRGB(45, 45, 65)
        btn.TextColor3 = Color3.fromRGB(255, 255, 255)
    end)
    
    return page
end

-- Creación de Pestañas
local MainTab = addTab("Combat")
local MovementTab = addTab("Movement")
local VisualsTab = addTab("Visuals")
local MiscTab = addTab("Misc")

-- Activar primera pestaña
Pages["Combat"].Visible = true

-- ============================================================
-- HELPER FUNCTIONS FOR GUI COMPONENTS
-- ============================================================
local function addToggle(page, text, defaultState, callback)
    local frame = Instance.new("Frame", page)
    frame.Size = UDim2.new(1, -8, 0, 36)
    frame.BackgroundColor3 = Color3.fromRGB(22, 22, 30)
    
    local c = Instance.new("UICorner", frame)
    c.CornerRadius = UDim.new(0, 6)
    
    local label = Instance.new("TextLabel", frame)
    label.Size = UDim2.new(0.7, 0, 1, 0)
    label.Position = UDim2.new(0, 10, 0, 0)
    label.BackgroundTransparency = 1
    label.Text = text
    label.TextColor3 = Color3.fromRGB(230, 230, 230)
    label.Font = Enum.Font.Gotham
    label.TextSize = 12
    label.TextXAlignment = Enum.TextXAlignment.Left
    
    local btn = Instance.new("TextButton", frame)
    btn.Size = UDim2.new(0, 44, 0, 22)
    btn.Position = UDim2.new(1, -50, 0.5, -11)
    btn.BackgroundColor3 = defaultState and Color3.fromRGB(60, 180, 100) or Color3.fromRGB(50, 50, 60)
    btn.Text = defaultState and "ON" or "OFF"
    btn.TextColor3 = Color3.fromRGB(255, 255, 255)
    btn.Font = Enum.Font.GothamBold
    btn.TextSize = 10
    
    local btnCorner = Instance.new("UICorner", btn)
    btnCorner.CornerRadius = UDim.new(0, 11)
    
    local state = defaultState
    btn.MouseButton1Click:Connect(function()
        state = not state
        btn.BackgroundColor3 = state and Color3.fromRGB(60, 180, 100) or Color3.fromRGB(50, 50, 60)
        btn.Text = state and "ON" or "OFF"
        callback(state)
    end)
end

local function addButton(page, text, callback)
    local btn = Instance.new("TextButton", page)
    btn.Size = UDim2.new(1, -8, 0, 36)
    btn.BackgroundColor3 = Color3.fromRGB(30, 30, 42)
    btn.Text = text
    btn.TextColor3 = Color3.fromRGB(255, 255, 255)
    btn.Font = Enum.Font.GothamBold
    btn.TextSize = 12
    
    local c = Instance.new("UICorner", btn)
    c.CornerRadius = UDim.new(0, 6)
    
    registerWhiteShadow(btn, 6)
    
    btn.MouseButton1Click:Connect(callback)
end

-- ============================================================
-- POPULATING TABS
-- ============================================================

-- Pestaña Combat
addToggle(MainTab, "Auto Bat / Aimbot", false, function(state)
    if state then
        autoBatEnabled = true
        queueAutoBatStart()
    else
        stopBatAimbot()
    end
end)

addToggle(MainTab, "TP Bat", false, function(state)
    if state then
        BRAXIL.startTPBat()
    else
        BRAXIL.stopTPBat()
    end
end)

addToggle(MainTab, "Medusa Counter", false, function(state)
    medusaCounterEnabled = state
end)

addToggle(MainTab, "Bat Counter", false, function(state)
    batCounterEnabled = state
    if state then startBatCounter() else stopBatCounter() end
end)

-- Pestaña Movement
addToggle(MovementTab, "Anti Ragdoll", false, function(state)
    antiRagdollEnabled = state
    if state then startAntiRagdoll() else stopAntiRagdoll() end
end)

addToggle(MovementTab, "Infinite Jump", false, function(state)
    infJumpEnabled = state
    if state then startHoldInfJump() else stopHoldInfJump() end
end)

addToggle(MovementTab, "Auto Left Path", false, function(state)
    autoLeftEnabled = state
    if state then startAutoLeft() else stopAutoLeft() end
end)

addToggle(MovementTab, "Auto Right Path", false, function(state)
    autoRightEnabled = state
    if state then startAutoRight() else stopAutoRight() end
end)

-- Pestaña Visuals
addToggle(VisualsTab, "Anti-Lag Mode", false, function(state)
    if state then enableAntiLag() else disableAntiLag() end
end)

addToggle(VisualsTab, "Stretch Resolution", false, function(state)
    if state then enableStretchRez() else disableStretchRez() end
end)

-- Pestaña Misc
addButton(MiscTab, "Instant Reset", function()
    cursedInstaReset()
end)

addToggle(MiscTab, "Anti-Kick Protection", false, function(state)
    if state then BRAXIL.enableAntiKick() else BRAXIL.disableAntiKick() end
end)

print("BRAxIL HUB — Creado y cargado exitosamente.")
