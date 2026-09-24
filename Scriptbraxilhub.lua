--[[
    ██████╗ ██████╗  █████╗ ██╗  ██╗██╗██╗
    ██╔══██╗██╔══██╗██╔══██╗╚██╗██╔╝██║██║
    ██████╔╝██████╔╝███████║ ╚███╔╝ ██║██║
    ██╔══██╗██╔══██╗██╔══██║ ██╔██╗ ██║██║
    ██████╔╝██║  ██║██║  ██║██╔╝ ██╗██║███████╗
    ╚═════╝ ╚═╝  ╚═╝╚═╝  ╚═╝╚═╝  ╚═╝╚═╝╚══════╝
                BRAxIL HUB — GUI PANEL
]]

local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local UIS = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local HS = game:GetService("HttpService")
local LP = Players.LocalPlayer
local PlayerGui = LP:WaitForChild("PlayerGui")

-- ============================================================
-- WHITE MOVING SHADOW SYSTEM
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
            NumberSequenceKeypoint.new(0,   1.00),
            NumberSequenceKeypoint.new(0.5, 0.25),
            NumberSequenceKeypoint.new(1,   1.00),
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
            if not entry or not entry.bar or not entry.bar.Parent
               or not entry.target or not entry.target.Parent then
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
-- STATE
-- ============================================================
local NS,CS=59,29
local LAGGER_SPEED=30
local LAGGER_CARRY_SPEED=15
local carrySpeedActive = false
local laggerModeEnabled = false
local antiRagdollEnabled,infJumpEnabled=false,false
local medusaCounterEnabled,batCounterEnabled,unwalkEnabled=false,false,false
local BRAXIL={medusaReset=false,antiKick=false,brainrot=false,tpBat=false,batV2=false,tpConn=nil,v2Conn=nil,v2Rot=nil,hitCD=false,v2CD=false}
local autoLeftEnabled,autoRightEnabled=false,false
local autoLeftSetVisual,autoRightSetVisual=nil,nil
local autoBatEnabled=false
local autoSwingEnabled=true
local autoMoveSwingEnabled=false
local autoMoveSwingInterval=0.3
local autoBatSetVisual=nil
local antiLagEnabled=false
local stretchRezEnabled=false
local autoTPEnabled,autoTPHeight=false,20
local guiTransparencyEnabled,mobileButtonsEnabled=false,true
local mobileButtonsSize=80
local circleButtonsEnabled=false
local Steal={AutoStealEnabled=false,StealRadius=60,StealDuration=1.4,Data={}}
local currentSkyTheme="Night"
local animEnabled=false
local introSoundEnabled=true
local ragdollGuiEnabled=true
local lockUIEnabled=false
local unlockUIEnabled=false
local fovValue=80
local fovOptions={80,120,180}
local fovIndex=1

local SkyOrder={"Off","Night","Aurora","Sunset","Galaxy","Cyber","Sakura","Pink Night","Blood Moon","Emerald Dawn","Volcanic","Arctic","Midnight Ocean","Vaporwave","Toxic","Solar Eclipse","Hellscape","Heaven","Storm","Sunrise","Deep Space","Lavender Dream","Inferno","Mint Sky"}

-- ============================================================
-- PLACEHOLDERS
-- ============================================================
local function CandyApplyCustomSky(mode) end
local function applyFOV() local cam=workspace.CurrentCamera; if cam then cam.FieldOfView=fovValue end end
local function startAnimToggle() end
local function stopAnimToggle() end
local function enableAntiLag() end
local function disableAntiLag() end
local function enableStretchRez() end
local function disableStretchRez() end
local function startAntiRagdoll() end
local function stopAntiRagdoll() end
local function startHoldInfJump() end
local function stopHoldInfJump() end
local function startAutoSteal() end
local function stopAutoSteal() end
local function startBatCounter() end
local function stopBatCounter() end
local function setupMedusa() end
local function stopMedusaCounter() end
local function startAutoTP() end
local function stopAutoTP() end
local function startAutoLeft() end
local function stopAutoLeft() end
local function startAutoRight() end
local function stopAutoRight() end
local function runDrop() end
local function runTPFloor() end
local function cursedInstaReset() end
local function saveConfig() end
local doResetButtonPositions = function() end
local refreshSpeedModeLabel = function() end
local toggleCarryMode = function()
    carrySpeedActive = not carrySpeedActive
    refreshSpeedModeLabel()
end
local toggleLaggerMode = function()
    laggerModeEnabled = not laggerModeEnabled
    refreshSpeedModeLabel()
end
local mobBtnRefs = {}
local _SetLockUI, _SetUnlockUI

-- ============================================================
-- KEY LISTENER
-- ============================================================
local Keys={
    circle=Enum.KeyCode.E,
    speed=Enum.KeyCode.Q,
    carryMode=Enum.KeyCode.C,
    laggerToggle=Enum.KeyCode.K,
    guiHide=Enum.KeyCode.RightControl,
    dropBrainrot=Enum.KeyCode.H,
    tpDown=Enum.KeyCode.T,
    instaReset=Enum.KeyCode.B,
    autoLeft=Enum.KeyCode.J,
    autoRight=Enum.KeyCode.L,
}
_GuiKeys = Keys

local KEY_ALIASES={
    ButtonA="A",ButtonB="B",ButtonX="X",ButtonY="Y",ButtonR1="RB",ButtonR2="RT",ButtonL1="LB",ButtonL2="LT",
    DPadUp="D↑",DPadDown="D↓",DPadLeft="D←",DPadRight="D→",ButtonStart="▶",ButtonSelect="◀",
    LeftShift="LShift",RightShift="RShift",LeftControl="LCtrl",RightControl="RCtrl",LeftAlt="LAlt",RightAlt="RAlt",
    LeftSuper="LSuper",RightSuper="RSuper",Return="Enter",BackSpace="Backspace",Tab="Tab",CapsLock="CapsLock",
    Escape="Esc",Space="Space",PageUp="PgUp",PageDown="PgDn",End="End",Home="Home",Insert="Ins",Delete="Del",
    Up="↑",Down="↓",Left="←",Right="→",F1="F1",F2="F2",F3="F3",F4="F4",F5="F5",F6="F6",F7="F7",F8="F8",
    F9="F9",F10="F10",F11="F11",F12="F12",Print="PrtScn",ScrollLock="ScrLk",Pause="Pause",
    Minus="-",Equals="=",LeftBracket="[",RightBracket="]",BackSlash="\\",Semicolon=";",Quote="'",
    Comma=",",Period=".",Slash="/",Backquote="`"
}
local function prettyKey(kc) return KEY_ALIASES[kc.Name] or kc.Name end

-- ============================================================
-- COLORS
-- ============================================================
local C={
    bg=Color3.fromRGB(6,6,6), bgDark=Color3.fromRGB(3,3,3), row=Color3.fromRGB(16,16,16),
    input=Color3.fromRGB(16,16,16), blue=Color3.fromRGB(210,210,210), blueDim=Color3.fromRGB(70,70,70),
    blueDark=Color3.fromRGB(22,22,22), text=Color3.fromRGB(255,255,255), textDim=Color3.fromRGB(160,160,160),
    textMuted=Color3.fromRGB(100,100,100), white=Color3.fromRGB(255,255,255), divider=Color3.fromRGB(32,32,32),
    green=Color3.fromRGB(80,220,120),
}

local function guiCorner(p,r) local c=Instance.new("UICorner");c.CornerRadius=UDim.new(0,r or 10);c.Parent=p;return c end
local function guiStroke(p,col,t) local s=Instance.new("UIStroke");s.Color=col or Color3.fromRGB(60,60,70);s.Thickness=t or 1;s.Parent=p;return s end
local function tw(obj,props,ti) TweenService:Create(obj,ti or TweenInfo.new(0.12),props):Play() end

local function makeDraggable_cyber(dragTarget, moveTarget)
    moveTarget = moveTarget or dragTarget
    local dragging, dragInput, dragStart, startPos = false
    dragTarget.InputBegan:Connect(function(input)
        if input.UserInputType==Enum.UserInputType.MouseButton1 or input.UserInputType==Enum.UserInputType.Touch then
            dragging=true; dragStart=input.Position; startPos=moveTarget.Position
            input.Changed:Connect(function() if input.UserInputState==Enum.UserInputState.End then dragging=false end end)
        end
    end)
    dragTarget.InputChanged:Connect(function(input)
        if input.UserInputType==Enum.UserInputType.MouseMovement or input.UserInputType==Enum.UserInputType.Touch then dragInput=input end
    end)
    UIS.InputChanged:Connect(function(input)
        if input==dragInput and dragging then
            local delta=input.Position-dragStart
            moveTarget.Position=UDim2.new(startPos.X.Scale,startPos.X.Offset+delta.X,startPos.Y.Scale,startPos.Y.Offset+delta.Y)
        end
    end)
end

-- ============================================================
-- KEY LISTEN SYSTEM
-- ============================================================
local KeyListen={cb=nil,label=nil,active=false}
local function cancelKL()
    if KeyListen.label then KeyListen.label.BackgroundColor3=C.blue; KeyListen.label.BackgroundTransparency=0.5 end
    KeyListen.cb=nil; KeyListen.label=nil; KeyListen.active=false
end
local function startKL(lbl,onSet)
    cancelKL(); KeyListen.cb=onSet; KeyListen.label=lbl; KeyListen.active=true
    lbl.Text="..."; lbl.BackgroundColor3=Color3.fromRGB(80,220,120); lbl.BackgroundTransparency=0.3
    local cap=lbl; task.delay(8,function() if KeyListen.label==cap and KeyListen.active then cancelKL(); if lbl and lbl.Parent then lbl.Text=prettyKey(Keys.guiHide); lbl.BackgroundColor3=C.blue; lbl.BackgroundTransparency=0.5 end end end)
end
UIS.InputBegan:Connect(function(inp,gp)
    if not KeyListen.active then return end; if gp then return end
    local ut=inp.UserInputType
    if ut~=Enum.UserInputType.Keyboard and ut~=Enum.UserInputType.Gamepad1 then return end
    local k=inp.KeyCode
    if k==Enum.KeyCode.Unknown then return end
    if k==Enum.KeyCode.Escape then cancelKL(); return end
    local cb=KeyListen.cb; local lb=KeyListen.label; cancelKL()
    if lb and lb.Parent then lb.Text=prettyKey(k); lb.BackgroundColor3=C.blue; lb.BackgroundTransparency=0.5 end
    if cb then task.spawn(cb,k) end
end)

-- ============================================================
-- BUILDERS
-- ============================================================
local GuiToggleSetters={}
local GuiRefs={}

local function addSectLbl(parent,text,order)
    local w=Instance.new("Frame",parent); w.Size=UDim2.new(1,0,0,22); w.BackgroundTransparency=1; w.LayoutOrder=order
    local L=Instance.new("TextLabel",w); L.Size=UDim2.new(1,0,0,16); L.BackgroundTransparency=1
    L.Text=text; L.TextColor3=C.textDim; L.TextSize=10; L.Font=Enum.Font.GothamBold; L.TextXAlignment=Enum.TextXAlignment.Left
    return L
end
local function addInputRow(parent,label,value,order,cb)
    local Row=Instance.new("Frame",parent); Row.Size=UDim2.new(1,0,0,36); Row.BackgroundColor3=C.row
    Row.BackgroundTransparency=0.5; Row.BorderSizePixel=0; Row.LayoutOrder=order; guiCorner(Row,10); guiStroke(Row,C.divider,1)
    local Lb=Instance.new("TextLabel",Row); Lb.Size=UDim2.new(0.6,0,0,16); Lb.Position=UDim2.new(0,12,0,6)
    Lb.BackgroundTransparency=1; Lb.Text=label; Lb.TextColor3=C.text; Lb.TextSize=11; Lb.Font=Enum.Font.GothamBold; Lb.TextXAlignment=Enum.TextXAlignment.Left
    local BC=Instance.new("Frame",Row); BC.ZIndex=6; BC.Position=UDim2.new(1,-58,0.5,-10); BC.Size=UDim2.new(0,48,0,20)
    BC.BackgroundColor3=C.input; BC.BackgroundTransparency=0.5; BC.BorderSizePixel=0; guiCorner(BC,6); guiStroke(BC,Color3.fromRGB(55,55,60),1)
    local Box=Instance.new("TextBox",BC); Box.ZIndex=7; Box.Size=UDim2.new(1,0,1,0); Box.BackgroundTransparency=1
    Box.Text=tostring(value); Box.TextColor3=C.text; Box.TextSize=11; Box.Font=Enum.Font.GothamBold; Box.ClearTextOnFocus=false
    Box.FocusLost:Connect(function() local n=tonumber(Box.Text); if n and n>0 then cb(n) else Box.Text=tostring(value) end end)
    local hov=Instance.new("TextButton",Row); hov.Size=UDim2.new(1,0,1,0); hov.BackgroundTransparency=1; hov.Text=""; hov.ZIndex=0
    hov.MouseEnter:Connect(function() tw(Row,{BackgroundTransparency=0.3}) end); hov.MouseLeave:Connect(function() tw(Row,{BackgroundTransparency=0.5}) end)
    return Row,Box
end
local function addToggleRow(parent,label,enabled,order,kbKey,onToggle)
    local hasKB=kbKey~=nil
    local Row=Instance.new("Frame",parent); Row.Size=UDim2.new(1,0,0,hasKB and 50 or 38); Row.BackgroundColor3=C.row
    Row.BackgroundTransparency=0.5; Row.BorderSizePixel=0; Row.LayoutOrder=order; guiCorner(Row,10); guiStroke(Row,C.divider,1)
    local Lb=Instance.new("TextLabel",Row); Lb.Size=UDim2.new(0.6,0,0,16); Lb.Position=UDim2.new(0,12,0,6)
    Lb.BackgroundTransparency=1; Lb.Text=label; Lb.TextColor3=C.text; Lb.TextSize=11; Lb.Font=Enum.Font.GothamBold; Lb.TextXAlignment=Enum.TextXAlignment.Left
    if hasKB and Keys[kbKey] then
        local KB2=Instance.new("TextButton",Row); KB2.Size=UDim2.new(0,35,0,16); KB2.Position=UDim2.new(0,12,1,-20)
        KB2.BackgroundColor3=C.blue; KB2.BackgroundTransparency=0.5; KB2.BorderSizePixel=0; KB2.Text=prettyKey(Keys[kbKey])
        KB2.TextColor3=C.white; KB2.TextSize=9; KB2.Font=Enum.Font.GothamBold; guiCorner(KB2,5)
        KB2.MouseButton1Click:Connect(function() startKL(KB2,function(nk) Keys[kbKey]=nk; KB2.Text=prettyKey(nk); saveConfig() end) end)
    end
    local Track=Instance.new("Frame",Row); Track.Size=UDim2.new(0,36,0,18); Track.Position=UDim2.new(1,-46,0,10)
    Track.BackgroundColor3=C.blueDark; Track.BackgroundTransparency=0.5; Track.BorderSizePixel=0; guiCorner(Track,10); guiStroke(Track,C.blueDim,1)
    local Knob=Instance.new("Frame",Track); Knob.Size=UDim2.new(0,14,0,14)
    Knob.Position=enabled and UDim2.new(0.5,2,0.5,-7) or UDim2.new(0,2,0.5,-7)
    Knob.BackgroundColor3=C.blue; Knob.BackgroundTransparency=enabled and 0.3 or 0.5; Knob.BorderSizePixel=0; guiCorner(Knob,7)
    local st=enabled
    local function setV(on) st=on; tw(Knob,{Position=on and UDim2.new(0.5,2,0.5,-7) or UDim2.new(0,2,0.5,-7)}); tw(Knob,{BackgroundTransparency=on and 0.3 or 0.5}) end
    local Btn=Instance.new("TextButton",Row); Btn.Size=UDim2.new(0,36,0,18); Btn.Position=UDim2.new(1,-46,0,10); Btn.BackgroundTransparency=1; Btn.Text=""
    Btn.MouseButton1Click:Connect(function() st=not st; setV(st); if onToggle then onToggle(st) end end)
    local hov=Instance.new("TextButton",Row); hov.Size=UDim2.new(1,0,1,0); hov.BackgroundTransparency=1; hov.Text=""; hov.ZIndex=0
    hov.MouseEnter:Connect(function() tw(Row,{BackgroundTransparency=0.3}) end); hov.MouseLeave:Connect(function() tw(Row,{BackgroundTransparency=0.5}) end)
    if kbKey then GuiToggleSetters[kbKey]=setV end
    return Row,setV
end
local function addActionRow(parent,label,kbKey,onAction,order)
    local Row=Instance.new("Frame",parent); Row.Size=UDim2.new(1,0,0,42); Row.BackgroundColor3=C.row
    Row.BackgroundTransparency=0.5; Row.BorderSizePixel=0; Row.LayoutOrder=order; guiCorner(Row,10); guiStroke(Row,C.divider,1)
    local Lb=Instance.new("TextLabel",Row); Lb.Size=UDim2.new(0.55,0,0,16); Lb.Position=UDim2.new(0,12,0,8)
    Lb.BackgroundTransparency=1; Lb.Text=label; Lb.TextColor3=C.text; Lb.TextSize=11; Lb.Font=Enum.Font.GothamBold; Lb.TextXAlignment=Enum.TextXAlignment.Left
    if kbKey and Keys[kbKey] then
        local KB2=Instance.new("TextButton",Row); KB2.Size=UDim2.new(0,40,0,22); KB2.Position=UDim2.new(1,-48,0.5,-11)
        KB2.BackgroundColor3=C.blue; KB2.BackgroundTransparency=0.5; KB2.BorderSizePixel=0; KB2.Text=prettyKey(Keys[kbKey])
        KB2.TextColor3=C.white; KB2.TextSize=9; KB2.Font=Enum.Font.GothamBold; guiCorner(KB2,5)
        KB2.MouseButton1Click:Connect(function() startKL(KB2,function(nk) Keys[kbKey]=nk; KB2.Text=prettyKey(nk); saveConfig() end) end)
    end
    local AB=Instance.new("TextButton",Row); AB.Size=UDim2.new(0.55,0,1,0); AB.BackgroundTransparency=1; AB.Text=""; AB.MouseButton1Click:Connect(onAction)
    local hov=Instance.new("TextButton",Row); hov.Size=UDim2.new(1,0,1,0); hov.BackgroundTransparency=1; hov.Text=""; hov.ZIndex=0
    hov.MouseEnter:Connect(function() tw(Row,{BackgroundTransparency=0.3}) end); hov.MouseLeave:Connect(function() tw(Row,{BackgroundTransparency=0.5}) end)
    return Row
end

-- ============================================================
-- BUILD GUI (función que crea el nuevo panel GUI)
-- ============================================================
local GuiHub, Outer, MiniBtn -- Referencias globales para poder abrir/cerrar

local function buildGUI()
    GuiHub=Instance.new("ScreenGui")
    GuiHub.Name="BRAxILHub"; GuiHub.ResetOnSpawn=false
    GuiHub.ZIndexBehavior=Enum.ZIndexBehavior.Sibling; GuiHub.Parent=PlayerGui
    GuiHub.Enabled = false -- Empieza oculto hasta que se abra con el botón izquierdo
    GuiRefs.hub=GuiHub

    Outer=Instance.new("Frame")
    Outer.Name="Outer"; Outer.Size=UDim2.new(0,340,0,495); Outer.Position=UDim2.new(0,200,0,54)
    Outer.BackgroundTransparency=1; Outer.BorderSizePixel=0; Outer.ClipsDescendants=false; Outer.Parent=GuiHub
    GuiRefs.outer=Outer
    local OuterScale=Instance.new("UIScale"); OuterScale.Scale=0.72; OuterScale.Parent=Outer

    local Inner=Instance.new("Frame")
    Inner.Name="Inner"; Inner.ClipsDescendants=false; Inner.Size=UDim2.new(1,0,1,0)
    Inner.BackgroundColor3=C.bg; Inner.BackgroundTransparency=0; Inner.BorderSizePixel=0; Inner.Parent=Outer
    guiCorner(Inner,24); guiStroke(Inner,Color3.fromRGB(45,45,45),1.5); GuiRefs.inner=Inner

    local BgCont=Instance.new("Frame")
    BgCont.Name="BackgroundContainer"; BgCont.Size=UDim2.new(1,0,1,0)
    BgCont.BackgroundTransparency=1; BgCont.ZIndex=0; BgCont.Parent=Inner

    local BgGrad=Instance.new("Frame")
    BgGrad.Name="BgGrad"; BgGrad.Size=UDim2.new(1,0,1,0); BgGrad.BackgroundColor3=C.bgDark
    BgGrad.BorderSizePixel=0; BgGrad.ZIndex=0; BgGrad.Parent=BgCont; guiCorner(BgGrad,24)
    local grad=Instance.new("UIGradient")
    grad.Color=ColorSequence.new({ColorSequenceKeypoint.new(0,Color3.fromRGB(4,4,4)),ColorSequenceKeypoint.new(0.5,Color3.fromRGB(7,7,7)),ColorSequenceKeypoint.new(1,Color3.fromRGB(4,4,4))})
    grad.Rotation=135; grad.Parent=BgGrad; GuiRefs.bgGrad=BgGrad

    local HF=Instance.new("Frame")
    HF.Name="HeaderFrame"; HF.Size=UDim2.new(1,0,0,62); HF.BackgroundTransparency=1
    HF.BorderSizePixel=0; HF.Parent=Inner; HF.ZIndex=2
    makeDraggable_cyber(HF, Outer)

    local TL=Instance.new("TextLabel")
    TL.Position=UDim2.new(0,14,0,8); TL.Size=UDim2.new(1,-90,0,22); TL.BackgroundTransparency=1
    TL.Text="BRAxIL HUB"; TL.TextColor3=Color3.fromRGB(90,90,90); TL.TextSize=17; TL.Font=Enum.Font.GothamBlack
    TL.TextXAlignment=Enum.TextXAlignment.Left; TL.Parent=HF; TL.ZIndex=3

    registerWhiteShadow(TL, 6)

    local ML=Instance.new("TextLabel")
    ML.Position=UDim2.new(0,14,0,32); ML.Size=UDim2.new(0,200,0,14); ML.BackgroundTransparency=1
    ML.Text="BRAxIL HUB • PREMIUM"; ML.TextColor3=C.textDim; ML.TextSize=10; ML.Font=Enum.Font.GothamBold
    ML.TextXAlignment=Enum.TextXAlignment.Left; ML.Parent=HF; ML.ZIndex=3

    local CloseBtn=Instance.new("TextButton")
    CloseBtn.Size=UDim2.new(0,28,0,28); CloseBtn.Position=UDim2.new(1,-38,0,8)
    CloseBtn.BackgroundColor3=C.bgDark; CloseBtn.BorderSizePixel=0
    CloseBtn.Text="-"; CloseBtn.TextColor3=C.textMuted; CloseBtn.Font=Enum.Font.GothamBlack; CloseBtn.TextSize=22
    CloseBtn.ZIndex=5; CloseBtn.Parent=HF
    guiCorner(CloseBtn,7); guiStroke(CloseBtn,Color3.fromRGB(45,45,45),1)
    CloseBtn.MouseEnter:Connect(function() tw(CloseBtn,{BackgroundColor3=Color3.fromRGB(28,28,28),TextColor3=C.text}) end)
    CloseBtn.MouseLeave:Connect(function() tw(CloseBtn,{BackgroundColor3=C.bgDark,TextColor3=C.textMuted}) end)

    MiniBtn=Instance.new("TextButton")
    MiniBtn.Size=UDim2.new(0,110,0,28); MiniBtn.Position=UDim2.new(0,15,0,65)
    MiniBtn.BackgroundColor3=C.bgDark; MiniBtn.BorderSizePixel=0
    MiniBtn.Text="BRAxIL HUB"; MiniBtn.TextColor3=Color3.fromRGB(90,90,90); MiniBtn.Font=Enum.Font.GothamBlack; MiniBtn.TextSize=11
    MiniBtn.ZIndex=20; MiniBtn.Visible=false; MiniBtn.Parent=GuiHub
    guiCorner(MiniBtn,8); guiStroke(MiniBtn,Color3.fromRGB(45,45,45),1.2)
    makeDraggable_cyber(MiniBtn, MiniBtn)
    MiniBtn.MouseEnter:Connect(function() tw(MiniBtn,{BackgroundColor3=Color3.fromRGB(22,22,22)}) end)
    MiniBtn.MouseLeave:Connect(function() tw(MiniBtn,{BackgroundColor3=C.bgDark}) end)
    registerWhiteShadow(MiniBtn, 8)

    local function showGui() Outer.Visible=true; MiniBtn.Visible=false end
    local function hideGui() Outer.Visible=false; MiniBtn.Visible=true end
    CloseBtn.MouseButton1Click:Connect(hideGui)
    MiniBtn.MouseButton1Click:Connect(showGui)

    local HSep=Instance.new("Frame")
    HSep.Position=UDim2.new(0,14,0,62); HSep.Size=UDim2.new(1,-28,0,1); HSep.BackgroundColor3=C.blue
    HSep.BackgroundTransparency=0.7; HSep.BorderSizePixel=0; HSep.Parent=Inner; HSep.ZIndex=2

    local LeftPanel=Instance.new("Frame")
    LeftPanel.Name="LeftPanel"; LeftPanel.Size=UDim2.new(0,85,1,-118); LeftPanel.Position=UDim2.new(1,-85,0,63)
    LeftPanel.BackgroundColor3=C.bgDark; LeftPanel.BackgroundTransparency=0.5; LeftPanel.BorderSizePixel=0
    LeftPanel.Parent=Inner; guiCorner(LeftPanel,12); LeftPanel.ZIndex=2

    local CatList=Instance.new("ScrollingFrame")
    CatList.Name="CategoryList"; CatList.Size=UDim2.new(1,0,1,0); CatList.BackgroundTransparency=1
    CatList.BorderSizePixel=0; CatList.ScrollBarThickness=2; CatList.ScrollBarImageColor3=C.blue
    CatList.CanvasSize=UDim2.new(0,0,0,0); CatList.AutomaticCanvasSize=Enum.AutomaticSize.Y; CatList.Active=true; CatList.Parent=LeftPanel
    local CatLay=Instance.new("UIListLayout"); CatLay.SortOrder=Enum.SortOrder.LayoutOrder; CatLay.Padding=UDim.new(0,4); CatLay.Parent=CatList
    CatLay:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function() CatList.CanvasSize = UDim2.new(0, 0, 0, CatLay.AbsoluteContentSize.Y + 25) end)
    local CatPad=Instance.new("UIPadding"); CatPad.PaddingLeft=UDim.new(0,6); CatPad.PaddingRight=UDim.new(0,6)
    CatPad.PaddingTop=UDim.new(0,10); CatPad.PaddingBottom=UDim.new(0,10); CatPad.Parent=CatList
    GuiRefs.categoryList=CatList

    local CF=Instance.new("ScrollingFrame")
    CF.Name="ContentFrame"; CF.Size=UDim2.new(1,-95,1,-118); CF.Position=UDim2.new(0,0,0,63)
    CF.BackgroundTransparency=1; CF.BorderSizePixel=0
    CF.ScrollBarThickness=8
    CF.ScrollBarImageColor3=Color3.fromRGB(255,255,255)
    CF.ScrollBarImageTransparency=0.3
    CF.CanvasSize=UDim2.new(0,0,0,0); CF.AutomaticCanvasSize=Enum.AutomaticSize.Y
    CF.ScrollingDirection=Enum.ScrollingDirection.Y; CF.ScrollingEnabled=true; CF.Active=true
    CF.ElasticBehavior=Enum.ElasticBehavior.Never; CF.Parent=Inner; GuiRefs.contentFrame=CF
    local CLay=Instance.new("UIListLayout"); CLay.SortOrder=Enum.SortOrder.LayoutOrder; CLay.Padding=UDim.new(0,6); CLay.Parent=CF
    CLay:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function() CF.CanvasSize = UDim2.new(0, 0, 0, CLay.AbsoluteContentSize.Y + 400) end)
    local CPad=Instance.new("UIPadding"); CPad.PaddingLeft=UDim.new(0,12); CPad.PaddingRight=UDim.new(0,12)
    CPad.PaddingTop=UDim.new(0,10); CPad.PaddingBottom=UDim.new(0,400); CPad.Parent=CF

    local BotSep=Instance.new("Frame")
    BotSep.Position=UDim2.new(0,8,1,-54); BotSep.Size=UDim2.new(1,-16,0,1); BotSep.BackgroundColor3=C.blue
    BotSep.BackgroundTransparency=0.65; BotSep.BorderSizePixel=0; BotSep.Parent=Inner; BotSep.ZIndex=2

    -- ============================================================
    -- CATEGORIES
    -- ============================================================
    local Categories={"Speed","Combat","Steal","Movement","Visual"}
    local CategoryRefs={contents={},btnsSide={},active="Speed"}
    for _,name in pairs(Categories) do
        local page=Instance.new("Frame"); page.Size=UDim2.new(1,0,1,0); page.BackgroundTransparency=1
        page.Visible=(name=="Speed"); page.Parent=CF; CategoryRefs.contents[name]=page
        local lay=Instance.new("UIListLayout"); lay.SortOrder=Enum.SortOrder.LayoutOrder; lay.Padding=UDim.new(0,6); lay.Parent=page
    end
    for i,name in ipairs(Categories) do
        local btn=Instance.new("TextButton"); btn.Size=UDim2.new(1,0,0,32); btn.BackgroundColor3=C.blueDark
        btn.BackgroundTransparency=0.3; btn.Text=name; btn.TextColor3=(name=="Speed") and C.white or C.textMuted
        btn.TextSize=10; btn.Font=Enum.Font.GothamBold; btn.BorderSizePixel=0; btn.LayoutOrder=i; btn.Parent=CatList; guiCorner(btn,6)
        local ind=Instance.new("Frame"); ind.Name="indicator"; ind.Size=UDim2.new(0,2,0,16); ind.Position=UDim2.new(1,-2,0.5,-8)
        ind.BackgroundColor3=C.blue; ind.BackgroundTransparency=(name=="Speed") and 0.3 or 1; ind.BorderSizePixel=0; ind.Parent=btn
        CategoryRefs.btnsSide[name]=btn
        btn.MouseButton1Click:Connect(function()
            for _,f in pairs(CategoryRefs.contents) do f.Visible=false end
            local selectedPage = CategoryRefs.contents[name]
            selectedPage.Visible=true; CategoryRefs.active=name
            for n,b in pairs(CategoryRefs.btnsSide) do
                local ac=(n==name); b.TextColor3=ac and C.white or C.textMuted; b.BackgroundTransparency=ac and 0.2 or 0.3
                local i2=b:FindFirstChild("indicator"); if i2 then i2.BackgroundTransparency=ac and 0.3 or 1 end
            end
            local lay = selectedPage:FindFirstChildOfClass("UIListLayout")
            if lay then CF.CanvasSize = UDim2.new(0, 0, 0, lay.AbsoluteContentSize.Y + 400) end
        end)
        btn.MouseEnter:Connect(function() if CategoryRefs.active~=name then btn.TextColor3=C.textDim; btn.BackgroundTransparency=0.25 end end)
        btn.MouseLeave:Connect(function() if CategoryRefs.active~=name then btn.TextColor3=C.textMuted; btn.BackgroundTransparency=0.3 end end)
    end

    -- SPEED
    do
        local sp=CategoryRefs.contents["Speed"]
        addSectLbl(sp,"SPEED CONFIGURATION",0)
        addInputRow(sp,"Normal Speed",NS,1,function(v) NS=v; saveConfig() end)
        addInputRow(sp,"Carry Speed",CS,2,function(v) CS=v; saveConfig() end)
        addSectLbl(sp,"LAGGER MODE",3)
        addInputRow(sp,"Lagger Normal",LAGGER_SPEED,4,function(v) LAGGER_SPEED=v; saveConfig() end)
        addInputRow(sp,"Lagger Carry",LAGGER_CARRY_SPEED,5,function(v) LAGGER_CARRY_SPEED=v; saveConfig() end)
        addSectLbl(sp,"CONTROLS",6)
        addToggleRow(sp,"Carry Mode",carrySpeedActive,7,"carryMode",function(on)
            carrySpeedActive = on
            refreshSpeedModeLabel()
            saveConfig()
        end)
        addToggleRow(sp,"Lagger Mode",laggerModeEnabled,8,"laggerToggle",function(on)
            laggerModeEnabled=on
            refreshSpeedModeLabel()
            saveConfig()
        end)
    end

    -- COMBAT
    do
        local cp=CategoryRefs.contents["Combat"]
        addSectLbl(cp,"BAT CONTROLS",0)
        local _,svAutoBat=addToggleRow(cp,"Bat Aimbot",autoBatEnabled,1,"circle",function(on)
            autoBatEnabled = on
            saveConfig()
        end)
        autoBatSetVisual=svAutoBat
        addToggleRow(cp,"Auto Swing",autoSwingEnabled,2,nil,function(on) autoSwingEnabled=on;saveConfig() end)
        addToggleRow(cp,"Bat Counter",batCounterEnabled,3,nil,function(on) batCounterEnabled=on;saveConfig() end)
        addSectLbl(cp,"RAGDOLL",4)
        addToggleRow(cp,"Anti Ragdoll",antiRagdollEnabled,5,nil,function(on) antiRagdollEnabled=on;saveConfig() end)
        addToggleRow(cp,"Medusa Counter",medusaCounterEnabled,6,nil,function(on) medusaCounterEnabled=on;saveConfig() end)
        addToggleRow(cp,"Unwalk",unwalkEnabled,7,nil,function(on) unwalkEnabled=on;saveConfig() end)
        addToggleRow(cp,"Medusa Reset",BRAXIL.medusaReset,8,nil,function(on)
            BRAXIL.medusaReset=on
            saveConfig()
        end)
        addSectLbl(cp,"PROTECTION",13)
        addToggleRow(cp,"Anti Kick",BRAXIL.antiKick,14,nil,function(on)
            BRAXIL.antiKick = on
            saveConfig()
        end)
        addSectLbl(cp,"BRAXIL HUB TP BAT / BAT V2",15)
        addToggleRow(cp,"TP Bat (BRAxIL HUB)",BRAXIL.tpBat,16,nil,function(on)
            BRAXIL.tpBat = on
        end)
        addToggleRow(cp,"Bat V2",BRAXIL.batV2,17,nil,function(on)
            BRAXIL.batV2 = on
        end)
        addSectLbl(cp,"ACTIONS",9)
        addActionRow(cp,"Drop Brainrot","dropBrainrot",function() runDrop() end,10)
        addActionRow(cp,"Insta Reset","instaReset",function() cursedInstaReset() end,11)
        addActionRow(cp,"TP Down","tpDown",function() runTPFloor() end,12)
    end

    -- STEAL
    do
        local st=CategoryRefs.contents["Steal"]
        addSectLbl(st,"AUTO STEAL",0)
        addToggleRow(st,"Auto Steal",Steal.AutoStealEnabled,1,nil,function(on)
            Steal.AutoStealEnabled=on
            saveConfig()
        end)
        addInputRow(st,"Steal Radius",Steal.StealRadius,2,function(v) Steal.StealRadius=tonumber(v) or 60; saveConfig() end)
        addInputRow(st,"Steal Duration",Steal.StealDuration,3,function(v) Steal.StealDuration=tonumber(v) or 1.4; saveConfig() end)
    end

    -- MOVEMENT
    do
        local mv=CategoryRefs.contents["Movement"]
        addSectLbl(mv,"AUTO PATHS",0)
        local _,svAutoLeft=addToggleRow(mv,"Auto Left",autoLeftEnabled,1,"autoLeft",function(on)
            autoLeftEnabled = on
            saveConfig()
        end)
        autoLeftSetVisual=svAutoLeft
        local _,svAutoRight=addToggleRow(mv,"Auto Right",autoRightEnabled,2,"autoRight",function(on)
            autoRightEnabled = on
            saveConfig()
        end)
        autoRightSetVisual=svAutoRight
        addSectLbl(mv,"SETTINGS",3)
        addToggleRow(mv,"Auto TP",autoTPEnabled,4,nil,function(on) autoTPEnabled=on;saveConfig() end)
        addInputRow(mv,"TP Height",autoTPHeight,5,function(v) if v>=0 and v<=500 then autoTPHeight=v end;saveConfig() end)
        addToggleRow(mv,"Infinite Jump",infJumpEnabled,6,nil,function(on)
            infJumpEnabled=on; saveConfig()
        end)
    end

    -- VISUAL
    do
        local vi=CategoryRefs.contents["Visual"]

        addSectLbl(vi,"VISUAL",0)
        addToggleRow(vi,"Zombie Anims (Rembembi)",animEnabled,1,nil,function(on)
            animEnabled=on; if on then startAnimToggle() else stopAnimToggle() end; saveConfig()
        end)
        addToggleRow(vi,"Intro Song",introSoundEnabled,2,nil,function(on)
            introSoundEnabled=on
            saveConfig()
        end)
        addToggleRow(vi,"Anti Lag",antiLagEnabled,3,nil,function(on) if on then enableAntiLag() else disableAntiLag() end;saveConfig() end)
        addToggleRow(vi,"Stretch Rez",stretchRezEnabled,4,nil,function(on) if on then enableStretchRez() else disableStretchRez() end;saveConfig() end)
        addToggleRow(vi,"Ragdoll GUI",ragdollGuiEnabled,5,nil,function(on) ragdollGuiEnabled=on;saveConfig() end)

        addSectLbl(vi,"SKY THEME",8)
        local skyIdx=1; for i,t in ipairs(SkyOrder) do if t==currentSkyTheme then skyIdx=i;break end end
        local skyRow=Instance.new("Frame"); skyRow.Size=UDim2.new(1,0,0,38); skyRow.BackgroundColor3=C.row
        skyRow.BackgroundTransparency=0.5; skyRow.BorderSizePixel=0; skyRow.LayoutOrder=9; skyRow.Parent=vi
        guiCorner(skyRow,10); guiStroke(skyRow,C.divider,1)
        local skyLbl=Instance.new("TextLabel",skyRow); skyLbl.Size=UDim2.new(0.45,0,0,16); skyLbl.Position=UDim2.new(0,12,0,6)
        skyLbl.BackgroundTransparency=1; skyLbl.Text="Sky Theme"; skyLbl.TextColor3=C.text; skyLbl.TextSize=11; skyLbl.Font=Enum.Font.GothamBold; skyLbl.TextXAlignment=Enum.TextXAlignment.Left
        local skyVal=Instance.new("TextLabel",skyRow); skyVal.Size=UDim2.new(0,80,0,16); skyVal.Position=UDim2.new(1,-130,0,6)
        skyVal.BackgroundTransparency=1; skyVal.Text=currentSkyTheme; skyVal.TextColor3=C.textDim; skyVal.TextSize=9; skyVal.Font=Enum.Font.GothamBold; skyVal.TextXAlignment=Enum.TextXAlignment.Right
        local skyBtn=Instance.new("TextButton",skyRow); skyBtn.Size=UDim2.new(0,44,0,22); skyBtn.Position=UDim2.new(1,-52,0.5,-11)
        skyBtn.BackgroundColor3=C.blue; skyBtn.BackgroundTransparency=0.5; skyBtn.BorderSizePixel=0; skyBtn.Text="Next"
        skyBtn.TextColor3=C.white; skyBtn.TextSize=9; skyBtn.Font=Enum.Font.GothamBold; guiCorner(skyBtn,5)
        skyBtn.MouseButton1Click:Connect(function()
            skyIdx=skyIdx%#SkyOrder+1; currentSkyTheme=SkyOrder[skyIdx]; skyVal.Text=currentSkyTheme
            CandyApplyCustomSky(currentSkyTheme); saveConfig()
        end)
        local hov2=Instance.new("TextButton",skyRow); hov2.Size=UDim2.new(1,0,1,0); hov2.BackgroundTransparency=1; hov2.Text=""; hov2.ZIndex=0
        hov2.MouseEnter:Connect(function() tw(skyRow,{BackgroundTransparency=0.3}) end); hov2.MouseLeave:Connect(function() tw(skyRow,{BackgroundTransparency=0.5}) end)

        addSectLbl(vi,"FOV",10)
        local fovRow=Instance.new("Frame"); fovRow.Size=UDim2.new(1,0,0,38); fovRow.BackgroundColor3=C.row
        fovRow.BackgroundTransparency=0.5; fovRow.BorderSizePixel=0; fovRow.LayoutOrder=11; fovRow.Parent=vi
        guiCorner(fovRow,10); guiStroke(fovRow,C.divider,1)
        local fovLbl=Instance.new("TextLabel",fovRow); fovLbl.Size=UDim2.new(0.5,0,0,16); fovLbl.Position=UDim2.new(0,12,0,6)
        fovLbl.BackgroundTransparency=1; fovLbl.Text="FOV"; fovLbl.TextColor3=C.text; fovLbl.TextSize=11; fovLbl.Font=Enum.Font.GothamBold; fovLbl.TextXAlignment=Enum.TextXAlignment.Left
        local fovBtn=Instance.new("TextButton",fovRow); fovBtn.Size=UDim2.new(0,52,0,22); fovBtn.Position=UDim2.new(1,-60,0.5,-11)
        fovBtn.BackgroundColor3=C.blue; fovBtn.BackgroundTransparency=0.5; fovBtn.BorderSizePixel=0
        fovBtn.Text=tostring(fovValue); fovBtn.TextColor3=C.white; fovBtn.TextSize=11; fovBtn.Font=Enum.Font.GothamBold; guiCorner(fovBtn,5)
        fovBtn.MouseButton1Click:Connect(function()
            fovIndex=fovIndex%#fovOptions+1; fovValue=fovOptions[fovIndex]; fovBtn.Text=tostring(fovValue); applyFOV(); saveConfig()
        end)
        local hov3=Instance.new("TextButton",fovRow); hov3.Size=UDim2.new(1,0,1,0); hov3.BackgroundTransparency=1; hov3.Text=""; hov3.ZIndex=0
        hov3.MouseEnter:Connect(function() tw(fovRow,{BackgroundTransparency=0.3}) end); hov3.MouseLeave:Connect(function() tw(fovRow,{BackgroundTransparency=0.5}) end)

        addSectLbl(vi,"GUI",12)
        local gRow=Instance.new("Frame"); gRow.Size=UDim2.new(1,0,0,42); gRow.BackgroundColor3=C.row
        gRow.BackgroundTransparency=0.5; gRow.BorderSizePixel=0; gRow.LayoutOrder=13; gRow.Parent=vi
        guiCorner(gRow,10); guiStroke(gRow,C.divider,1)
        local gLbl=Instance.new("TextLabel",gRow); gLbl.Size=UDim2.new(0.6,0,0,16); gLbl.Position=UDim2.new(0,12,0,8)
        gLbl.BackgroundTransparency=1; gLbl.Text="Hide GUI Key"; gLbl.TextColor3=C.text; gLbl.TextSize=11; gLbl.Font=Enum.Font.GothamBold; gLbl.TextXAlignment=Enum.TextXAlignment.Left
        local gKB=Instance.new("TextButton",gRow); gKB.Size=UDim2.new(0,45,0,22); gKB.Position=UDim2.new(1,-52,0.5,-11)
        gKB.BackgroundColor3=C.blue; gKB.BackgroundTransparency=0.5; gKB.BorderSizePixel=0; gKB.Text=prettyKey(Keys.guiHide)
        gKB.TextColor3=C.white; gKB.TextSize=9; gKB.Font=Enum.Font.GothamBold; guiCorner(gKB,5)
        gKB.MouseButton1Click:Connect(function() startKL(gKB,function(nk) Keys.guiHide=nk; gKB.Text=prettyKey(nk); saveConfig() end) end)

        local _,svLockUI = addToggleRow(vi, "Lock UI", lockUIEnabled, 20, nil, function(on)
            lockUIEnabled = on
            if on then
                unlockUIEnabled = false
                if _SetUnlockUI then _SetUnlockUI(false) end
            end
            saveConfig()
        end)
        local _,svUnlockUI = addToggleRow(vi, "Unlock UI", unlockUIEnabled, 21, nil, function(on)
            unlockUIEnabled = on
            if on then
                lockUIEnabled = false
                if _SetLockUI then _SetLockUI(false) end
            end
            saveConfig()
        end)
        _SetUnlockUI = function(v) svUnlockUI(v) end
        _SetLockUI = function(v) svLockUI(v) end

        local reset2Row = Instance.new("Frame",vi)
        reset2Row.Size = UDim2.new(1,0,0,38); reset2Row.BackgroundColor3 = C.row
        reset2Row.BackgroundTransparency = 0.5; reset2Row.BorderSizePixel = 0
        reset2Row.LayoutOrder = 22; guiCorner(reset2Row,10); guiStroke(reset2Row, C.divider, 1)
        local rlbl = Instance.new("TextLabel", reset2Row)
        rlbl.Size = UDim2.new(0.6,0,0,16); rlbl.Position = UDim2.new(0,12,0,6)
        rlbl.BackgroundTransparency = 1; rlbl.Text = "Button Position Reset"
        rlbl.TextColor3 = C.text; rlbl.TextSize = 11; rlbl.Font = Enum.Font.GothamBold
        rlbl.TextXAlignment = Enum.TextXAlignment.Left
        local resetBtn = Instance.new("TextButton", reset2Row)
        resetBtn.Size = UDim2.new(0,60,0,22); resetBtn.Position = UDim2.new(1,-72,0.5,-11)
        resetBtn.BackgroundColor3 = Color3.fromRGB(200,50,50)
        resetBtn.BackgroundTransparency = 0.2; resetBtn.BorderSizePixel = 0
        resetBtn.Text = "RESET"; resetBtn.TextColor3 = C.white
        resetBtn.TextSize = 9; resetBtn.Font = Enum.Font.GothamBold
        guiCorner(resetBtn,5)
        local _resetting = false
        resetBtn.MouseButton1Click:Connect(function()
            if _resetting then return end
            _resetting = true
            resetBtn.BackgroundColor3 = Color3.fromRGB(50,200,80)
            task.delay(0.30, function()
                resetBtn.BackgroundColor3 = Color3.fromRGB(200,50,50)
                _resetting = false
            end)
            if doResetButtonPositions then pcall(doResetButtonPositions) end
        end)
        local hov5 = Instance.new("TextButton", reset2Row)
        hov5.Size = UDim2.new(1,0,1,0); hov5.BackgroundTransparency = 1; hov5.Text = ""; hov5.ZIndex = 0
        hov5.MouseEnter:Connect(function() tw(reset2Row, {BackgroundTransparency=0.3}) end)
        hov5.MouseLeave:Connect(function() tw(reset2Row, {BackgroundTransparency=0.5}) end)

        addSectLbl(vi,"RESET",30)
        local resetRow=Instance.new("Frame"); resetRow.Size=UDim2.new(1,0,0,38); resetRow.BackgroundColor3=C.row
        resetRow.BackgroundTransparency=0.5; resetRow.BorderSizePixel=0; resetRow.LayoutOrder=31; resetRow.Parent=vi
        guiCorner(resetRow,10); guiStroke(resetRow,C.divider,1)
        local resetLbl=Instance.new("TextLabel",resetRow); resetLbl.Size=UDim2.new(0.55,0,0,16); resetLbl.Position=UDim2.new(0,12,0,6)
        resetLbl.BackgroundTransparency=1; resetLbl.Text="Reset Settings"; resetLbl.TextColor3=C.text; resetLbl.TextSize=11; resetLbl.Font=Enum.Font.GothamBold; resetLbl.TextXAlignment=Enum.TextXAlignment.Left
        local resetBtn2=Instance.new("TextButton",resetRow); resetBtn2.Size=UDim2.new(0,52,0,22); resetBtn2.Position=UDim2.new(1,-60,0.5,-11)
        resetBtn2.BackgroundColor3=Color3.fromRGB(150,30,40); resetBtn2.BackgroundTransparency=0.2; resetBtn2.BorderSizePixel=0
        resetBtn2.Text="RESET"; resetBtn2.TextColor3=C.white; resetBtn2.TextSize=9; resetBtn2.Font=Enum.Font.GothamBold; guiCorner(resetBtn2,5)
        resetBtn2.MouseButton1Click:Connect(function()
        end)
        local hov4=Instance.new("TextButton",resetRow); hov4.Size=UDim2.new(1,0,1,0); hov4.BackgroundTransparency=1; hov4.Text=""; hov4.ZIndex=0
        hov4.MouseEnter:Connect(function() tw(resetRow,{BackgroundTransparency=0.3}) end); hov4.MouseLeave:Connect(function() tw(resetRow,{BackgroundTransparency=0.5}) end)
    end

    -- KEYBINDS GLOBALES
    UIS.InputBegan:Connect(function(inp,gp)
        if gp then return end
        if UIS:GetFocusedTextBox() then return end
        if inp.KeyCode==Keys.guiHide then if Outer then GuiHub.Enabled = not GuiHub.Enabled end
        elseif inp.KeyCode==Keys.speed then saveConfig()
        elseif inp.KeyCode==Keys.carryMode then toggleCarryMode(); saveConfig()
        elseif inp.KeyCode==Keys.laggerToggle then toggleLaggerMode(); saveConfig()
        end
    end)
end

-- ============================================================
-- MENÚ PRINCIPAL DERECHO (botones pequeños)
-- ============================================================
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "CustomMenuGui"
screenGui.ResetOnSpawn = false
screenGui.Parent = PlayerGui

local mainFrame = Instance.new("Frame")
mainFrame.Name = "MainFrame"
mainFrame.AnchorPoint = Vector2.new(1, 0) 
mainFrame.Position = UDim2.new(1, -10, 0, 10) 
mainFrame.Size = UDim2.new(0, 185, 0, 250)
mainFrame.BackgroundTransparency = 1
mainFrame.Parent = screenGui

local gridLayout = Instance.new("UIGridLayout")
gridLayout.Parent = mainFrame
gridLayout.CellSize = UDim2.new(0, 55, 0, 55)
gridLayout.CellPadding = UDim2.new(0, 6, 0, 6)
gridLayout.HorizontalAlignment = Enum.HorizontalAlignment.Right
gridLayout.VerticalAlignment = Enum.VerticalAlignment.Top
gridLayout.SortOrder = Enum.SortOrder.LayoutOrder

local buttonData = {
	{ text = "INSTA\nRESET", bType = "Flash" },
	{ text = "AUTO\nLEFT", bType = "Toggle" },
	{ text = "AUTO\nRIGHT", bType = "Toggle" },
	
	{ text = "BAT\nV2", bType = "Toggle" },
	{ text = "BAT\nAIMBOT", bType = "Toggle" },
	{ text = "LAGGER\nMODE", bType = "Toggle" },
	
	{ text = "", bType = "None" },
	{ text = "CARRY\nSPD", bType = "Toggle" },
	{ text = "DROP\nBR", bType = "Flash" },
	
	{ text = "", bType = "None" },
	{ text = "TP\nDOWN", bType = "Flash" },
	{ text = "TP\nBAT", bType = "Flash" }
}

for index, data in ipairs(buttonData) do
	if data.bType ~= "None" then
		local button = Instance.new("TextButton")
		button.Name = "Btn_" .. index
		button.Text = data.text
		button.TextColor3 = Color3.fromRGB(255, 255, 255)
		button.Font = Enum.Font.SourceSansBold
		button.TextSize = 10
		button.TextWrapped = true
		button.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
		button.BorderSizePixel = 0
		button.Parent = mainFrame

		local uiCorner = Instance.new("UICorner")
		uiCorner.CornerRadius = UDim.new(0, 10)
		uiCorner.Parent = button

		local isActive = false
		local timerThread = nil

		button.MouseButton1Click:Connect(function()
			if data.bType == "Toggle" then
				isActive = not isActive
				
				if isActive then
					button.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
					button.TextColor3 = Color3.fromRGB(0, 0, 0)
					
					timerThread = task.delay(2400, function()
						if isActive then
							isActive = false
							button.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
							button.TextColor3 = Color3.fromRGB(255, 255, 255)
						end
					end)
				else
					if timerThread then task.cancel(timerThread) end
					button.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
					button.TextColor3 = Color3.fromRGB(255, 255, 255)
				end
				
			elseif data.bType == "Flash" then
				button.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				button.TextColor3 = Color3.fromRGB(0, 0, 0)
				
				task.wait(0.30)
				
				button.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
				button.TextColor3 = Color3.fromRGB(255, 255, 255)
			end
		end)
	else
		local spacer = Instance.new("Frame")
		spacer.BackgroundTransparency = 1
		spacer.Parent = mainFrame
	end
end

-- ============================================================
-- BOTÓN IZQUIERDO "BRAxIL HUB" (ARRASTRABLE + ABRE EL NUEVO PANEL)
-- ============================================================
local leftButton = Instance.new("TextButton")
leftButton.Name = "LeftMenuButton"
leftButton.Text = "BRAxIL HUB"
leftButton.TextColor3 = Color3.fromRGB(255, 255, 255)
leftButton.Font = Enum.Font.SourceSansBold
leftButton.TextSize = 13
leftButton.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
leftButton.BorderSizePixel = 0
leftButton.AnchorPoint = Vector2.new(0, 0)
leftButton.Position = UDim2.new(0, 15, 0, 65)
leftButton.Size = UDim2.new(0, 130, 0, 35)
leftButton.Parent = screenGui

local leftCorner = Instance.new("UICorner")
leftCorner.CornerRadius = UDim.new(0, 8)
leftCorner.Parent = leftButton

-- Sistema de arrastre con detección de toque
local btnDragging = false
local btnDragInput = nil
local btnDragStart = nil
local btnStartPos = nil
local btnWasDragged = false

leftButton.InputBegan:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseButton1 
		or input.UserInputType == Enum.UserInputType.Touch then
		btnDragging = true
		btnWasDragged = false
		btnDragStart = input.Position
		btnStartPos = leftButton.Position

		input.Changed:Connect(function()
			if input.UserInputState == Enum.UserInputState.End then
				btnDragging = false
			end
		end)
	end
end)

leftButton.InputChanged:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseMovement 
		or input.UserInputType == Enum.UserInputType.Touch then
		btnDragInput = input
	end
end)

game:GetService("UserInputService").InputChanged:Connect(function(input)
	if btnDragging and input == btnDragInput then
		local delta = input.Position - btnDragStart
		if delta.Magnitude > 5 then
			btnWasDragged = true
		end
		leftButton.Position = UDim2.new(
			btnStartPos.X.Scale,
			btnStartPos.X.Offset + delta.X,
			btnStartPos.Y.Scale,
			btnStartPos.Y.Offset + delta.Y
		)
	end
end)

-- ============================================================
-- CONSTRUIR EL NUEVO PANEL GUI Y CONECTAR EL BOTÓN IZQUIERDO
-- ============================================================
buildGUI() -- Crea el nuevo panel (empieza oculto con Enabled = false)

-- Al soltar el botón izquierdo sin arrastrar: ABRIR el nuevo panel GUI
leftButton.InputEnded:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseButton1 
		or input.UserInputType == Enum.UserInputType.Touch then
		if not btnWasDragged then
			-- Abrir el nuevo panel GUI
			if GuiHub then
				GuiHub.Enabled = true
				if Outer then Outer.Visible = true end
				if MiniBtn then MiniBtn.Visible = false end
			end
		end
		btnWasDragged = false
	end
end)

print("BRAxIL HUB GUI LOADED")