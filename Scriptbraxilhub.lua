local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")
local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")

local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

local COLORS = {
    Background = Color3.fromRGB(10, 10, 10),
    Row = Color3.fromRGB(24, 24, 24),
    RowDark = Color3.fromRGB(18, 18, 18),
    Badge = Color3.fromRGB(38, 38, 38),
    TabBar = Color3.fromRGB(14, 14, 14),
    TabActive = Color3.fromRGB(30, 30, 30),
    White = Color3.fromRGB(255, 255, 255),
    TextDim = Color3.fromRGB(200, 200, 200),
    Stroke = Color3.fromRGB(235, 235, 235),
}

local function corner(parent, radius)
    local c = Instance.new("UICorner")
    c.CornerRadius = UDim.new(0, radius)
    c.Parent = parent
    return c
end

local function stroke(parent, thickness, color, transparency)
    local s = Instance.new("UIStroke")
    s.Thickness = thickness or 1
    s.Color = color or COLORS.Stroke
    s.Transparency = transparency or 0
    s.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
    s.Parent = parent
    return s
end

local function padding(parent, l, r, t, b)
    local p = Instance.new("UIPadding")
    p.PaddingLeft = UDim.new(0, l)
    p.PaddingRight = UDim.new(0, r)
    p.PaddingTop = UDim.new(0, t)
    p.PaddingBottom = UDim.new(0, b)
    p.Parent = parent
    return p
end

local screenGui = Instance.new("ScreenGui")
screenGui.Name = "BootswareUI"
screenGui.ResetOnSpawn = false
screenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
screenGui.Parent = playerGui

local main = Instance.new("Frame")
main.Name = "Main"
main.Size = UDim2.new(0, 400, 0, 545)
main.Position = UDim2.new(0.5, -200, 0.5, -272)
main.BackgroundColor3 = COLORS.Background
main.BackgroundTransparency = 0.25
main.BorderSizePixel = 0
main.Active = true
main.Draggable = true
main.Parent = screenGui
corner(main, 18)

local header = Instance.new("Frame")
header.Name = "Header"
header.Size = UDim2.new(1, 0, 0, 56)
header.BackgroundTransparency = 1
header.Parent = main

local logoHolder = Instance.new("Frame")
logoHolder.Size = UDim2.new(0, 40, 0, 32)
logoHolder.Position = UDim2.new(0, 16, 0, 12)
logoHolder.BackgroundColor3 = COLORS.Badge
logoHolder.BackgroundTransparency = 0.3
logoHolder.BorderSizePixel = 0
logoHolder.Parent = header
corner(logoHolder, 16)

local logo = Instance.new("Frame")
logo.Name = "Logo"
logo.AnchorPoint = Vector2.new(0.5, 0.5)
logo.Size = UDim2.new(0, 20, 0, 20)
logo.Position = UDim2.new(0.5, 0, 0.5, 0)
logo.BackgroundTransparency = 1
logo.Parent = logoHolder

local petalPositions = {
    UDim2.new(0.5, 0, 0, 1),   
    UDim2.new(0.5, 0, 1, -1),  
    UDim2.new(0, 1, 0.5, 0),   
    UDim2.new(1, -1, 0.5, 0),  
}
for _, pos in ipairs(petalPositions) do
    local petal = Instance.new("Frame")
    petal.AnchorPoint = Vector2.new(0.5, 0.5)
    petal.Size = UDim2.new(0, 11, 0, 11)
    petal.Position = pos
    petal.BackgroundColor3 = COLORS.Background
    petal.BackgroundTransparency = 1
    petal.BorderSizePixel = 0
    petal.Parent = logo
    corner(petal, 6)
    stroke(petal, 1.6, COLORS.White)
end

local centerDot = Instance.new("Frame")
centerDot.AnchorPoint = Vector2.new(0.5, 0.5)
centerDot.Size = UDim2.new(0, 6, 0, 6)
centerDot.Position = UDim2.new(0.5, 0, 0.5, 0)
centerDot.BackgroundColor3 = COLORS.White
centerDot.BorderSizePixel = 0
centerDot.Parent = logo
corner(centerDot, 3)

RunService.RenderStepped:Connect(function(dt)
    logo.Rotation = (logo.Rotation + dt * 120) % 360
end)

local title = Instance.new("TextLabel")
title.Text = "BOOTSWARE"
title.Font = Enum.Font.GothamBlack
title.TextSize = 16
title.TextColor3 = COLORS.White
title.BackgroundTransparency = 1
title.Size = UDim2.new(0, 140, 0, 20)
title.Position = UDim2.new(0, 66, 0, 16)
title.TextXAlignment = Enum.TextXAlignment.Left
title.Parent = header

local lineTrack = Instance.new("Frame")
lineTrack.Name = "LineTrack"
lineTrack.Size = UDim2.new(1, -32, 0, 2)
lineTrack.Position = UDim2.new(0, 16, 0, 50)
lineTrack.BackgroundColor3 = COLORS.White
lineTrack.BackgroundTransparency = 0.88
lineTrack.BorderSizePixel = 0
lineTrack.ClipsDescendants = true
lineTrack.Parent = header
corner(lineTrack, 1)

local movingLine = Instance.new("Frame")
movingLine.Name = "MovingLine"
movingLine.Size = UDim2.new(0, 90, 1, 0)
movingLine.Position = UDim2.new(0, -90, 0, 0)
movingLine.BackgroundColor3 = COLORS.White
movingLine.BorderSizePixel = 0
movingLine.Parent = lineTrack
corner(movingLine, 1)

local lineGrad = Instance.new("UIGradient")
lineGrad.Transparency = NumberSequence.new({
    NumberSequenceKeypoint.new(0, 1),
    NumberSequenceKeypoint.new(0.5, 0.3),
    NumberSequenceKeypoint.new(1, 0),
})
lineGrad.Parent = movingLine

task.spawn(function()
    local speed = 150
    local x = -90
    RunService.RenderStepped:Connect(function(dt)
        x += speed * dt
        local trackWidth = lineTrack.AbsoluteSize.X
        if x > trackWidth then
            x = -90
        end
        movingLine.Position = UDim2.new(0, x, 0, 0)
    end)
end)

local content = Instance.new("ScrollingFrame")
content.Name = "Content"
content.Size = UDim2.new(1, -32, 1, -62 - 76)
content.Position = UDim2.new(0, 16, 0, 62)
content.BackgroundTransparency = 1
content.BorderSizePixel = 0
content.ScrollBarThickness = 3
content.ScrollBarImageColor3 = COLORS.Badge
content.CanvasSize = UDim2.new(0, 0, 0, 0)
content.AutomaticCanvasSize = Enum.AutomaticSize.Y
content.Parent = main

local listLayout = Instance.new("UIListLayout")
listLayout.SortOrder = Enum.SortOrder.LayoutOrder
listLayout.Padding = UDim.new(0, 10)
listLayout.Parent = content

local order = 0
local function nextOrder()
    order += 1
    return order
end

local function sectionLabel(parent, text)
    local lbl = Instance.new("TextLabel")
    lbl.Text = string.upper(text)
    lbl.Font = Enum.Font.GothamBlack
    lbl.TextSize = 11
    lbl.TextColor3 = COLORS.White
    lbl.BackgroundTransparency = 1
    lbl.Size = UDim2.new(1, 0, 0, 18)
    lbl.TextXAlignment = Enum.TextXAlignment.Left
    lbl.LayoutOrder = nextOrder()
    lbl.Parent = parent
    return lbl
end

local function rowBase(parent, labelText, accent)
    local row = Instance.new("Frame")
    row.Size = UDim2.new(1, 0, 0, 46)
    row.BackgroundColor3 = COLORS.Row
    row.BackgroundTransparency = 0.2
    row.BorderSizePixel = 0
    row.LayoutOrder = nextOrder()
    row.Parent = parent
    corner(row, 12)

    if accent then
        local bar = Instance.new("Frame")
        bar.Size = UDim2.new(0, 3, 0, 22)
        bar.Position = UDim2.new(0, 0, 0.5, -11)
        bar.BackgroundColor3 = COLORS.White
        bar.BorderSizePixel = 0
        bar.Parent = row
        corner(bar, 2)
    end

    local lbl = Instance.new("TextLabel")
    lbl.Text = labelText
    lbl.Font = Enum.Font.GothamMedium
    lbl.TextSize = 13
    lbl.TextColor3 = COLORS.White
    lbl.BackgroundTransparency = 1
    lbl.Size = UDim2.new(0.6, 0, 1, 0)
    lbl.Position = UDim2.new(0, 16, 0, 0)
    lbl.TextXAlignment = Enum.TextXAlignment.Left
    lbl.Parent = row

    return row
end

local function badge(parent, text, offsetX, width)
    local b = Instance.new("TextLabel")
    b.Text = text
    b.Font = Enum.Font.GothamBold
    b.TextSize = 12
    b.TextColor3 = COLORS.White
    b.BackgroundColor3 = COLORS.Badge
    b.BackgroundTransparency = 0.15
    b.BorderSizePixel = 0
    b.Size = UDim2.new(0, width or 34, 0, 26)
    b.Position = UDim2.new(1, offsetX, 0.5, -13)
    b.Parent = parent
    corner(b, 8)
    return b
end

local function keybindBadge(parent, initialText, offsetX, width)
    local btn = Instance.new("TextButton")
    btn.Text = tostring(initialText)
    btn.Font = Enum.Font.GothamBold
    btn.TextSize = 12
    btn.TextColor3 = COLORS.White
    btn.BackgroundColor3 = COLORS.Badge
    btn.BackgroundTransparency = 0.15
    btn.BorderSizePixel = 0
    btn.Size = UDim2.new(0, width or 34, 0, 26)
    btn.Position = UDim2.new(1, offsetX, 0.5, -13)
    btn.AutoButtonColor = false
    btn.Parent = parent
    corner(btn, 8)

    local listening = false
    local currentValue = tostring(initialText)

    btn.MouseButton1Click:Connect(function()
        if listening then return end
        listening = true
        btn.Text = "..."
        btn.BackgroundColor3 = COLORS.White
        btn.TextColor3 = COLORS.Background

        local conn
        conn = UserInputService.InputBegan:Connect(function(input, gp)
            if gp then return end
            if input.UserInputType == Enum.UserInputType.Keyboard then
                local key = input.KeyCode.Name
                if key == "Escape" then
                    btn.Text = currentValue
                else
                    currentValue = key
                    btn.Text = key
                end
                listening = false
                btn.BackgroundColor3 = COLORS.Badge
                btn.TextColor3 = COLORS.White
                conn:Disconnect()
            end
        end)
    end)

    return btn, function() return currentValue end
end

local function numberBadge(parent, initialValue, offsetX, width)
    local btn = Instance.new("TextButton")
    btn.Text = tostring(initialValue)
    btn.Font = Enum.Font.GothamBold
    btn.TextSize = 12
    btn.TextColor3 = COLORS.White
    btn.BackgroundColor3 = COLORS.Badge
    btn.BackgroundTransparency = 0.15
    btn.BorderSizePixel = 0
    btn.Size = UDim2.new(0, width or 44, 0, 26)
    btn.Position = UDim2.new(1, offsetX, 0.5, -13)
    btn.AutoButtonColor = false
    btn.Parent = parent
    corner(btn, 8)

    local currentValue = tostring(initialValue)

    btn.MouseButton1Click:Connect(function()
        local box = Instance.new("TextBox")
        box.Text = currentValue
        box.Font = Enum.Font.GothamBold
        box.TextSize = 12
        box.TextColor3 = COLORS.White
        box.BackgroundColor3 = COLORS.Badge
        box.BackgroundTransparency = 0.15
        box.BorderSizePixel = 0
        box.Size = btn.Size
        box.Position = btn.Position
        box.ClearTextOnFocus = false
        box.TextXAlignment = Enum.TextXAlignment.Center
        box.Parent = parent
        corner(box, 8)
        btn.Visible = false
        box:CaptureFocus()
        box.CursorPosition = #box.Text + 1

        local function finish()
            local num = tonumber(box.Text)
            if num then
                currentValue = tostring(math.floor(num))
            end
            btn.Text = currentValue
            box:Destroy()
            btn.Visible = true
        end

        box.FocusLost:Connect(function()
            finish()
        end)
    end)

    return btn, function() return currentValue end
end

local function toggleRow(parent, labelText, defaultOn)
    local row = rowBase(parent, labelText, true)

    local track = Instance.new("TextButton")
    track.Text = ""
    track.AutoButtonColor = false
    track.Size = UDim2.new(0, 44, 0, 24)
    track.Position = UDim2.new(1, -60, 0.5, -12)
    track.BackgroundColor3 = defaultOn and COLORS.White or COLORS.Badge
    track.BorderSizePixel = 0
    track.Parent = row
    corner(track, 12)

    local knob = Instance.new("Frame")
    knob.Size = UDim2.new(0, 18, 0, 18)
    knob.Position = defaultOn and UDim2.new(1, -21, 0.5, -9) or UDim2.new(0, 3, 0.5, -9)
    knob.BackgroundColor3 = defaultOn and COLORS.Background or COLORS.White
    knob.BorderSizePixel = 0
    knob.Parent = track
    corner(knob, 9)

    local on = defaultOn
    track.MouseButton1Click:Connect(function()
        on = not on
        local info = TweenInfo.new(0.18, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
        TweenService:Create(knob, info, {
            Position = on and UDim2.new(1, -21, 0.5, -9) or UDim2.new(0, 3, 0.5, -9),
            BackgroundColor3 = on and COLORS.Background or COLORS.White,
        }):Play()
        TweenService:Create(track, info, {
            BackgroundColor3 = on and COLORS.White or COLORS.Badge,
        }):Play()
    end)

    return row
end

local function valueRow(parent, labelText, keybind, value)
    local row = rowBase(parent, labelText, false)
    local getKey, getVal
    if keybind then
        local _, getter = keybindBadge(row, keybind, -102, 34)
        getKey = getter
    end
    local _, getter = numberBadge(row, value, -60, 44)
    getVal = getter
    return row, getKey, getVal
end

local function textRow(parent, labelText, rightText)
    local row = rowBase(parent, labelText, false)
    local r = Instance.new("TextLabel")
    r.Text = rightText
    r.Font = Enum.Font.GothamBold
    r.TextSize = 12
    r.TextColor3 = COLORS.White
    r.BackgroundTransparency = 1
    r.Size = UDim2.new(0, 100, 1, 0)
    r.Position = UDim2.new(1, -116, 0, 0)
    r.TextXAlignment = Enum.TextXAlignment.Right
    r.Parent = row
    return row
end

local pages = {}

local function makePage(name)
    local page = Instance.new("Frame")
    page.Name = name
    page.Size = UDim2.new(1, 0, 0, 0)
    page.AutomaticSize = Enum.AutomaticSize.Y
    page.BackgroundTransparency = 1
    page.Visible = false
    page.Parent = content

    local layout = Instance.new("UIListLayout")
    layout.SortOrder = Enum.SortOrder.LayoutOrder
    layout.Padding = UDim.new(0, 10)
    layout.Parent = page

    pages[name] = page
    return page
end

local movement = makePage("Movement")
sectionLabel(movement, "Speed Configuration")
toggleRow(movement, "Auto Carry Mode", true)
valueRow(movement, "Normal Speed", "V", 85)
valueRow(movement, "Carry Speed", nil, 40)
valueRow(movement, "Lagger Speed", "R", 30)
valueRow(movement, "Lagger Carry", nil, 25)
sectionLabel(movement, "Mode")
textRow(movement, "Mode", "Normal")
sectionLabel(movement, "Teleport")
valueRow(movement, "TP Down", "E", "F")

for _, name in ipairs({ "Combat", "Misc", "Performance", "Settings" }) do
    local page = makePage(name)
    sectionLabel(page, name)
    textRow(page, name .. " Options", "Soon")
end

movement.Visible = true

local tabBar = Instance.new("Frame")
tabBar.Name = "TabBar"
tabBar.Size = UDim2.new(1, -20, 0, 58)
tabBar.Position = UDim2.new(0, 10, 1, -66)
tabBar.BackgroundColor3 = COLORS.TabBar
tabBar.BackgroundTransparency = 0.2
tabBar.BorderSizePixel = 0
tabBar.Parent = main
corner(tabBar, 14)
padding(tabBar, 6, 6, 6, 6)

local tabLayout = Instance.new("UIListLayout")
tabLayout.FillDirection = Enum.FillDirection.Horizontal
tabLayout.SortOrder = Enum.SortOrder.LayoutOrder
tabLayout.Padding = UDim.new(0, 5)
tabLayout.Parent = tabBar

local tabNames = { "Movement", "Combat", "Misc", "Performance", "Settings" }
local tabButtons = {}
local currentTab = "Movement"

local function selectTab(name)
    if currentTab == name then return end
    currentTab = name

    for tabName, data in pairs(tabButtons) do
        local active = tabName == name
        local info = TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
        TweenService:Create(data.button, info, {
            BackgroundColor3 = active and COLORS.TabActive or COLORS.RowDark,
            BackgroundTransparency = active and 0.1 or 0.4,
        }):Play()
        TweenService:Create(data.stroke, info, {
            Transparency = active and 0.15 or 0.55,
        }):Play()
        TweenService:Create(data.underline, info, {
            BackgroundTransparency = active and 0 or 1,
            Size = active and UDim2.new(0, 22, 0, 3) or UDim2.new(0, 0, 0, 3),
        }):Play()
        pages[tabName].Visible = active
    end
    content.CanvasPosition = Vector2.new(0, 0)
end

for i, name in ipairs(tabNames) do
    local btn = Instance.new("TextButton")
    btn.Name = name
    btn.Text = ""
    btn.AutoButtonColor = false
    btn.Size = UDim2.new(1 / #tabNames, -4, 1, 0)
    btn.BackgroundColor3 = (name == currentTab) and COLORS.TabActive or COLORS.RowDark
    btn.BackgroundTransparency = (name == currentTab) and 0.1 or 0.4
    btn.BorderSizePixel = 0
    btn.LayoutOrder = i
    btn.Parent = tabBar
    corner(btn, 10)

    local tabStroke = stroke(btn, 1.4, COLORS.Stroke, (name == currentTab) and 0.15 or 0.55)

    local lbl = Instance.new("TextLabel")
    lbl.Text = name
    lbl.Font = Enum.Font.GothamBold
    lbl.TextSize = 11
    lbl.TextColor3 = COLORS.White
    lbl.TextScaled = false
    lbl.BackgroundTransparency = 1
    lbl.Size = UDim2.new(1, 0, 0, 14)
    lbl.Position = UDim2.new(0, 0, 0, 11)
    lbl.Parent = btn

    local underline = Instance.new("Frame")
    underline.AnchorPoint = Vector2.new(0.5, 0)
    underline.Position = UDim2.new(0.5, 0, 0, 31)
    underline.Size = (name == currentTab) and UDim2.new(0, 22, 0, 3) or UDim2.new(0, 0, 0, 3)
    underline.BackgroundColor3 = COLORS.White
    underline.BackgroundTransparency = (name == currentTab) and 0 or 1
    underline.BorderSizePixel = 0
    underline.Parent = btn
    corner(underline, 2)

    tabButtons[name] = { button = btn, underline = underline, stroke = tabStroke }

    btn.MouseButton1Click:Connect(function()
        selectTab(name)
    end)
end