"

-- NOXA DUELS â€” 7UP load method (instant boot, gameplay unchanged)

local Players          = game:GetService("Players")
local TweenService     = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local RunService       = game:GetService("RunService")
local LP               = Players.LocalPlayer
if not LP then LP = Players.PlayerAdded:Wait() end
-- Fast boot: short IsLoaded wait (max ~1.5s)
if not game:IsLoaded() then
    local t0 = os.clock()
    while not game:IsLoaded() and (os.clock() - t0) < 1.5 do
        task.wait(0.03)
    end
end
local PlayerGui = LP:FindFirstChild("PlayerGui") or LP:WaitForChild("PlayerGui", 3)
print("[Noxa] loading...")
_G._NoxaIntroHidingUI  = false
_G.NoxaHub_MainExecuted = false

pcall(function()
    if _G.K7NormalAutoStealStop then _G.K7NormalAutoStealStop() end
end)
pcall(function()
    if _G.K7SemiAutoStealStop then _G.K7SemiAutoStealStop() end
end)
pcall(function()
    for _, name in ipairs({"NoxaHub", "NoxaMobileButtons", "NoxaStealBar", "AutoGrab", "K7StealBarGui", "NoxaRitualStealBar", "NoxaBackgroundGalleryLayer", "NoxaKuRuSkin", "NoxaVx7Skin"}) do
        local old = PlayerGui:FindFirstChild(name)
        if old then old:Destroy() end
    end
end)
pcall(function()
    local cg = game:GetService("CoreGui")
    for _, name in ipairs({"K7StealBarGui", "NoxaStealBar", "NoxaRitualStealBar", "NoxaBackgroundGalleryLayer", "NoxaKuRuSkin", "NoxaVx7Skin"}) do
        local old = cg:FindFirstChild(name)
        if old then old:Destroy() end
    end
end)
_G.StealBar = nil
_G._K7AutoGrabGui = nil
_G._K7AutoGrabFrame = nil
_G._K7StealModeChip = nil

-- FPS FIX: disconnect previous run loops (prevents stacked Heartbeats on re-execute)
pcall(function()
    if type(_G._NoxaCleanup) == "function" then
        _G._NoxaCleanup()
    end
end)
_G._NoxaRSConns = {}
_G._NoxaTrackConn = function(conn)
    if not conn then return conn end
    _G._NoxaRSConns = _G._NoxaRSConns or {}
    table.insert(_G._NoxaRSConns, conn)
    return conn
end
_G._NoxaCleanup = function()
    for _, c in ipairs(_G._NoxaRSConns or {}) do
        pcall(function() c:Disconnect() end)
    end
    _G._NoxaRSConns = {}
    pcall(function()
        local ss = rawget(_G, "SpeedSystem") or nil
        -- SpeedSystem is local; clear known globals
        if _G.NoxaDisableNoPlayerCollision then _G.NoxaDisableNoPlayerCollision() end
    end)
    -- stop common feature loops stored on _G
    for _, key in ipairs({
        "_NoxaSpaceProgConn", "_NoxaBatConn", "_NoxaSpeedConn",
        "_NoxaAutoCarryConn", "_NoxaInfJumpConn", "_NoxaAntiRagConn",
        "_NoxaDropBRConn", "_NoxaTPBatConn", "_NoxaSafeModeConn",
        "_NoxaMobileSyncConn", "_NoxaFxPulseConn", "_NoxaAutoTpDownConn",
        "_NoxaRagTimerConn",
    }) do
        local c = _G[key]
        if c then
            pcall(function() c:Disconnect() end)
            _G[key] = nil
        end
    end
end

-- Touch device = mobile buttons (KeyboardEnabled can be true on some phones / emulators)
-- Touch or no keyboard = mobile; always allow mobile buttons (executor PC+touch included)
IS_MOBILE = (UserInputService.TouchEnabled == true)
_G.NoxaIsMobile = IS_MOBILE

if not fireproximityprompt then
    fireproximityprompt = function(prompt)
        pcall(function()
            prompt:InputHoldBegin()
            task.wait(0.05)
            prompt:InputHoldEnd()
        end)
    end
end

local SpeedSystem = {

    NoxaVisual = { stretchResEnabled = false },
    AutoPath   = { leftEnabled = false, rightEnabled = false, leftPhase = 1, rightPhase = 1 },
    NoxaChar   = { headlessEnabled = false, korbloxEnabled = false },

    fov = 70,
    skyTheme = "Noxa",

    bgImageTransparency = 0.05, -- more visible background



    bgImageEnabled = not IS_MOBILE,
    bgImageIndex = 1,
    stealBarStyle = "V3",
    uiSkin = "Noxa", -- blue only
    v3BarScale = 1,
    removeAccessoriesEnabled = false,

    antiDieEnabled = false,
    bodyLockEnabled = false,
    safeModeEnabled = false,
    noPlayerCollisionEnabled = false,
    antiFlingShieldEnabled = false,
    saturatedColorsEnabled = false,



    NS = 60,
    CS = 30,
    LAGGER_NORMAL = 15,
    LAGGER_CARRY = 24.5,






    speedMethod = "V1",
    laggerPhase = 0,


    carryActive = false,
    laggerActive = false,


    method = "Velocity Lerp",


    _bodyVel = nil,


    keybinds = {
        Carry = Enum.KeyCode.A,
        Lagger = Enum.KeyCode.V,
        AutoLeft = Enum.KeyCode.Z,
        AutoRight = Enum.KeyCode.C,
        BatAimbot = Enum.KeyCode.E,
        TPBat = Enum.KeyCode.T,
    },



    uiScale = 0.75,
    menuOpen = true,


    introEnabled = false,  -- instant boot (7UP)
    introColor = nil,
    introColorLocked = false,


    autoPlayMode = "2btn",
    autoPlayEnabled = false,


    mobileButtons = {
        locked = false,
        hidden = false,
        style = "squircle",
        scale = 0.85,
        positions = {},
    },


    autoCarryEnabled = false,
    autoTpDownEnabled = false,
    autoTpDownHeight = 12,
    _autoCarryActive = false,


    autoStealEnabled = false,
    stealRadius = 60,
    stealDuration = 1.3,
    stealMode = "V2 SEMI",
    tabPos = "Right",

    v2SemiRadius = 50,
    v2SemiHoldMin = 1.3,
    v2SemiHoldMax = 2.6,
    v2SemiEntryDelay = 0.3,
    v2SemiPrimeRange = 80,

    v3Radius = 62,
    v3Duration = 0.3,
    v3HalfFireRange = 10,
    v3HalfHoldMin = 1.3,
    v3HalfHoldMax = 2.6,
    v3HalfEntryDelay = 0.3,

    v4Threshold = 0.75,
    v4NearDist = 10,
    v4WaitNearMax = 4,
    v4ModeLevel = 1,
    _autoCarryReturnMode = nil,
    _autoCarryGraceUntil = 0,
    _autoCarryWatchUntil = 0,
    _autoCarryWaiting = false,


    infJumpEnabled = false,
    infJumpMode = "hold",
    _infJumpBoosting = false,
    _infJumpLastBoost = 0,
    INF_JUMP_BOOST_FORCE = 25,
    INF_JUMP_BOOST_FRAMES = 2,
    INF_JUMP_BOOST_COOLDOWN = 0.12,
    jumpHeld = false,
    _gamepadJumpHeld = false,
    _infJumpThread = nil,
    _holdInfJumpConn = nil,


    antiRagdollEnabled = false,
    antiRagdollMode = "Splatter",
    _antiRagdollConn = nil,
    _antiRagdollNoSplatterCooldown = 0,


    antiDesyncAutoSwingEnabled = false,

    animPack = "Tryard",
    _animApplying = false,


    autoDodgeEnabled = false,
    autoDodgeKeybind = Enum.KeyCode.H,
    _autoDodgeThread = nil,
    _autoDodgeTpUpDebounce = false,


    dropBrainrotEnabled = false,
    dropBrainrotKeybind = Enum.KeyCode.G,
    dropMode = 1, -- 1 = Fling, 2 = Jump Drop (Clean)
    DROP_ASCEND_DURATION = 0.2,
    DROP_ASCEND_SPEED = 160,
    _dropBrainrotActive = false,
    _dropBrainrotConn = nil,
    _dropLastTime = 0,
    _dropConnections = {},


    tpDownKeybind = Enum.KeyCode.F,
    _tpDownActive = false,


    instantResetKeybind = Enum.KeyCode.R,
    instaResetOnDeathEnabled = false,
    resetTpPos = CFrame.new(2000.5, 9911.9, 4000.2),
    _instantResetCooldown = false,
    _instantResetStop = false,
    _instantResetCamBound = false,
    _instantResetRespawnConn = nil,
    _instaResetOnDeathConn = nil,
    _instaResetOnDeathHealthConn = nil,


    antiDesyncAimbotEnabled = false,
    tpBatVersion            = "V1",
    tpBatHittingCooldown    = false,
    tpBatCurrentTarget      = nil,
    tpBatSwingCooldown      = 0.12,
    tpBatTeleportDistance   = 5.5,
    tpBatHoldDistance       = 4.2,
    tpBatVelocitySpeed      = 60,
    tpBatCameraLock         = false,
    tpBatAutoDisableOnHit   = false,
    _tpBatConn              = nil,
    _tpBatLastTP            = 0,
}

local PACKS = {

	["Hit Harder"] = {
		WalkAnim = 707897309,
		RunAnim  = 707861613,
		JumpAnim = 116936326516985,
		FallAnim = 116936326516985,
		SwimIdle = 116936326516985,
		Swim     = 116936326516985,
		ClimbAnim = 116936326516985,
		Animation1 = 133806214992291,
		Animation2 = 94970088341563,
	},
	["Tryard"] = {
		WalkAnim = 707897309,
		RunAnim  = 707861613,
		JumpAnim = 116936326516985,
		FallAnim = 116936326516985,
		SwimIdle = 116936326516985,
		Swim     = 116936326516985,
		ClimbAnim = 116936326516985,
		Animation1 = 133806214992291,
		Animation2 = 94970088341563,
	},
	["Adidas Sports"] = {
		WalkAnim = 18537392113,
		RunAnim  = 18537384940,
		JumpAnim = 18537380791,
		FallAnim = 18537367238,
		SwimIdle = 18537387180,
		Swim     = 18537389531,
		Animation1 = 18537376492,
		Animation2 = 18537371272,
		ClimbAnim = 18537363391,
	},
	["Adidas Community"] = {
		WalkAnim = 122150855457006,
		RunAnim  = 82598234841035,
		JumpAnim = 75290611992385,
		FallAnim = 98600215928904,
		SwimIdle = 109346520324160,
		Swim     = 133308483266208,
		Animation1 = 122257458498464,
		Animation2 = 102357151005774,
		ClimbAnim = 88763136693023,
	},
	["Adidas Aura"] = {
		WalkAnim = 83842218823011,
		RunAnim  = 118320322718866,
		JumpAnim = 109996626521204,
		FallAnim = 95603166884636,
		SwimIdle = 94922130551805,
		Swim     = 134530128383903,
		Animation1 = 110211186840347,
		Animation2 = 114191137265065,
		ClimbAnim = 97824616490448,
	},
	["Wicked Popular"] = {
		WalkAnim = 92072849924640,
		RunAnim = 72301599441680,
		JumpAnim = 104325245285198,
		FallAnim = 121152442762481,
		Animation1 = 118832222982049,
		ClimbAnim = 131326830509784,
		SwimIdle = 113199415118199,
		Swim = 99384245425157,
		Animation2 = 76049494037641,
	},
	Elder = {
		WalkAnim = 10921111375,
		RunAnim  = 10921104374,
		JumpAnim = 10921107367,
		FallAnim = 10921105765,
		SwimIdle = 10921110146,
		Swim     = 10921108971,
		ClimbAnim = 10921100400,
		Animation1 = 10921101664,
		Animation2 = 10921102574,
	},
	Zombie = {
		WalkAnim = 10921355261,
		RunAnim  = 616163682,
		JumpAnim = 10921351278,
		FallAnim = 10921350320,
		SwimIdle = 10921353442,
		Swim     = 10921352344,
		Animation1 = 10921344533,
		Animation2 = 10921345304,
		ClimbAnim = 10921343576,
	},
	Mage = {
		WalkAnim = 10921152678,
		RunAnim  = 10921148209,
		JumpAnim = 10921149743,
		FallAnim = 10921148939,
		SwimIdle = 10921151661,
		Swim     = 10921150788,
		ClimbAnim = 10921143404,
		Animation1 = 10921144709,
		Animation2 = 10921145797,
	},

	["Catwalk Glam"] = {
		WalkAnim = 109168724482748,
		RunAnim  = 81024476153754,
		JumpAnim = 116936326516985,
		FallAnim = 92294537340807,
		SwimIdle = 98854111361360,
		Swim     = 134591743181628,
		ClimbAnim = 119377220967554,
		Animation1 = 133806214992291,
		Animation2 = 94970088341563,
	},
	Astronaut = {
		WalkAnim = 10921046031,
		RunAnim  = 10921039308,
		JumpAnim = 10921042494,
		FallAnim = 10921040576,
		SwimIdle = 10921045006,
		Swim     = 10921044000,
		ClimbAnim = 10921032124,
		Animation1 = 10921034824,
		Animation2 = 10921036806,
	},
	['Wicked "Dancing Through Life"'] = {
		WalkAnim = 73718308412641,
		RunAnim  = 135515454877967,
		JumpAnim = 78508480717326,
		FallAnim = 78147885297412,
		SwimIdle = 129183123083281,
		Swim     = 110657013921774,
		ClimbAnim = 129447497744818,
		Animation1 = 92849173543269,
		Animation2 = 132238900951109,
	},
	Werewolf = {
		WalkAnim = 10921342074,
		RunAnim  = 10921336997,
		JumpAnim = nil,
		FallAnim = 10921337907,
		SwimIdle = 10921341319,
		Swim     = 10921340419,
		ClimbAnim = 10921329322,
		Animation1 = 10921330408,
		Animation2 = 10921333667,
	},
	Superhero = {
		WalkAnim = 10921298616,
		RunAnim  = 10921291831,
		JumpAnim = 10921294559,
		FallAnim = 10921293373,
		SwimIdle = 10921297391,
		Swim     = 10921295495,
		ClimbAnim = 10921286911,
		Animation1 = 10921288909,
		Animation2 = 10921290167,
	},
	Toy = {
		WalkAnim = 10921312010,
		RunAnim  = 10921306285,
		JumpAnim = 10921308158,
		FallAnim = 10921307241,
		SwimIdle = 10921310341,
		Swim     = 10921309319,
		ClimbAnim = 10921300839,
		Animation1 = 10921301576,
		Animation2 = nil,
	},
	["No Boundaries"] = {
		WalkAnim = 18747074203,
		RunAnim  = 18747070484,
		JumpAnim = 18747069148,
		FallAnim = 18747062535,
		SwimIdle = 18747071682,
		Swim     = 18747073181,
		ClimbAnim = 18747060903,
		Animation1 = 18747067405,
		Animation2 = 18747063918,
	},
	NFL = {
		WalkAnim = 110358958299415,
		RunAnim  = 117333533048078,
		JumpAnim = 119846112151352,
		FallAnim = 129773241321032,
		SwimIdle = 79090109939093,
		Swim     = 132697394189921,
		ClimbAnim = 134630013742019,
		Animation1 = 92080889861410,
		Animation2 = 74451233229259,
	},
	["Amazon Unboxed"] = {
		WalkAnim = 90478085024465,
		RunAnim  = 134824450619865,
		JumpAnim = 121454505477205,
		FallAnim = 94788218468396,
		SwimIdle = 129126268464847,
		Swim     = 105962919001086,
		ClimbAnim = 121145883950231,
		Animation1 = 98281136301627,
		Animation2 = nil,
	},
	Vampire = {
		WalkAnim = 10921326949,
		RunAnim  = 10921320299,
		JumpAnim = 10921322186,
		FallAnim = 10921321317,
		SwimIdle = 10921325443,
		Swim     = 10921324408,
		ClimbAnim = 10921314188,
		Animation1 = 10921315373,
		Animation2 = nil,
	},

	["Ninja"] = {
		Run=656118852, Walk=656121766, Jump=656117878, Fall=656115606,
		Swim=656119721, SwimIdle=656121397, Climb=656114359,
		Idle={656117400,656118341,886742569}
	},
	["Robot"] = {
		Run=616091570, Walk=616095330, Jump=616090535, Fall=616087089,
		Swim=616092998, SwimIdle=616094091, Climb=616086039,
		Idle={616088211,616089559,885531463}
	},
	["Levitation"] = {
		Run=616010382, Walk=616013216, Jump=616008936, Fall=616005863,
		Swim=616011509, SwimIdle=616012453, Climb=616003713,
		Idle={616006778,616008087,886862142}
	},
	["Stylish"] = {
		Run=616140816, Walk=616146177, Jump=616139451, Fall=616134815,
		Swim=616143378, SwimIdle=616144772, Climb=616133594,
		Idle={616136790,616138447,886888594}
	},
	["Bubbly"] = {
		Run=910025107, Walk=910034870, Jump=910016857, Fall=910001910,
		Swim=910028158, SwimIdle=910030921, Climb=909997997,
		Idle={910004836,910009958,1018536639}
	},
	["Cartoon"] = {
		Run=742638842, Walk=742640026, Jump=742637942, Fall=742637151,
		Swim=742639220, SwimIdle=742639812, Climb=742636889,
		Idle={742637544,742638445,885477856}
	},
}

local AnimPack = {}
function AnimPack.waitForAnimate(char)
	for _ = 1, 8 do
		local a = char:FindFirstChild("Animate")
		if a and a:FindFirstChild("idle") and a:FindFirstChild("run") and a:FindFirstChild("walk") then
			return a
		end
		task.wait(0.03)
	end
	return char and char:FindFirstChild("Animate")
end

function AnimPack.setAnim(animObj, id)
	if animObj and id then
		animObj.AnimationId = "rbxassetid://" .. tostring(id)
	end
end

function AnimPack.stopAllTracks(hum)
	if not hum then return end
	for _, t in ipairs(hum:GetPlayingAnimationTracks()) do
		pcall(function() t:Stop(0) end)
	end
end

function AnimPack.ensureAnim(folder, name)
	if not folder then return nil end
	local a = folder:FindFirstChild(name)
	if not a then
		a = Instance.new("Animation")
		a.Name = name
		a.Parent = folder
	end
	return a
end

function AnimPack.ensureIdleSlots(idleFolder, n)
	if not idleFolder then return end
	n = n or 2
	for i=1,n do
		AnimPack.ensureAnim(idleFolder, "Animation" .. i)
	end
end

function AnimPack.pick(pack, ...)
	for i = 1, select("#", ...) do
		local k = select(i, ...)
		local v = pack[k]
		if v ~= nil then return v end
	end
	return nil
end

ATTR_LAST = "AnimPack_Last"
local applying = false

function AnimPack.applyPack(packName)
	if applying then return false end
	applying = true

	local pack = PACKS[packName]
	if not pack then
		applying = false
		return false
	end

	local char = LP.Character or LP.CharacterAdded:Wait()
	local animate = AnimPack.waitForAnimate(char)
	if not animate then
		applying = false
		return false
	end

	local hum = char:FindFirstChildOfClass("Humanoid")
	AnimPack.stopAllTracks(hum)


	local runObj   = AnimPack.ensureAnim(animate:FindFirstChild("run"),   "RunAnim")
	local walkObj  = AnimPack.ensureAnim(animate:FindFirstChild("walk"),  "WalkAnim")
	local jumpObj  = AnimPack.ensureAnim(animate:FindFirstChild("jump"),  "JumpAnim")
	local fallObj  = AnimPack.ensureAnim(animate:FindFirstChild("fall"),  "FallAnim")
	local climbObj = AnimPack.ensureAnim(animate:FindFirstChild("climb"), "ClimbAnim")
	local swimObj  = AnimPack.ensureAnim(animate:FindFirstChild("swim"),     "Swim")
	local swimIdleObj = AnimPack.ensureAnim(animate:FindFirstChild("swimidle"), "SwimIdle")
	local idleFolder = animate:FindFirstChild("idle")


	AnimPack.setAnim(walkObj,  AnimPack.pick(pack, "WalkAnim", "Walk"))
	AnimPack.setAnim(runObj,   AnimPack.pick(pack, "RunAnim", "Run"))
	AnimPack.setAnim(jumpObj,  AnimPack.pick(pack, "JumpAnim", "Jump"))
	AnimPack.setAnim(fallObj,  AnimPack.pick(pack, "FallAnim", "Fall"))
	AnimPack.setAnim(climbObj, AnimPack.pick(pack, "ClimbAnim", "Climb"))

	AnimPack.setAnim(swimObj,      AnimPack.pick(pack, "Swim"))
	AnimPack.setAnim(swimIdleObj,  AnimPack.pick(pack, "SwimIdle") or AnimPack.pick(pack, "Swim"))


	if idleFolder then
		local a1 = AnimPack.pick(pack, "Animation1")
		local a2 = AnimPack.pick(pack, "Animation2")

		if a1 or a2 then
			AnimPack.ensureIdleSlots(idleFolder, 2)
			local id1 = a1 or a2
			local id2 = a2 or a1 or id1
			AnimPack.setAnim(idleFolder:FindFirstChild("Animation1"), id1)
			AnimPack.setAnim(idleFolder:FindFirstChild("Animation2"), id2)
		elseif pack.Idle and #pack.Idle > 0 then
			AnimPack.ensureIdleSlots(idleFolder, math.max(2, #pack.Idle))
			AnimPack.setAnim(idleFolder:FindFirstChild("Animation1"), pack.Idle[1])
			AnimPack.setAnim(idleFolder:FindFirstChild("Animation2"), pack.Idle[2] or pack.Idle[1])
			for i = 3, #pack.Idle do
				local a = idleFolder:FindFirstChild("Animation" .. i)
				if a then AnimPack.setAnim(a, pack.Idle[i]) end
			end
		end
	end


	animate.Disabled = true
	task.wait(0.02)
	animate.Disabled = false

	if hum then
		pcall(function()
			hum:ChangeState(Enum.HumanoidStateType.Running)
		end)
	end

	pcall(function() LP:SetAttribute(ATTR_LAST, packName) end)

	applying = false
	return true
end

LP.CharacterAdded:Connect(function(char)
    task.wait(0.2)
    local saved = LP:GetAttribute("AnimPack_Last")
    if type(saved) ~= "string" or saved == "" or not PACKS[saved] then
        saved = SpeedSystem.animPack or "Tryard"
    end
    if type(saved) == "string" and saved ~= "" and saved ~= "OFF" and PACKS[saved] then
        AnimPack.applyPack(saved)
    end
end)

function SpeedSystem:getActiveSpeed(humanoid)

    if self.autoCarryEnabled and humanoid then
        local isCarry = humanoid.WalkSpeed < 25
        if self.laggerActive then
            return isCarry and self.LAGGER_CARRY or self.LAGGER_NORMAL
        else
            return isCarry and self.CS or self.NS
        end
    end

    if self.laggerActive then
        if self.carryActive then
            return self.LAGGER_CARRY
        else
            return self.LAGGER_NORMAL
        end
    else
        if self.carryActive then
            return self.CS
        else
            return self.NS
        end
    end
end

function SpeedSystem:getCurrentMode(humanoid)
    if self.autoCarryEnabled and humanoid then
        local isCarry = humanoid.WalkSpeed < 25
        if self.laggerActive then
            return isCarry and "LAGGER_CARRY" or "LAGGER_NORMAL"
        else
            return isCarry and "CARRY" or "NORMAL"
        end
    end
    if self.laggerActive and self.carryActive then
        return "LAGGER_CARRY"
    elseif self.laggerActive then
        return "LAGGER_NORMAL"
    elseif self.carryActive then
        return "CARRY"
    else
        return "NORMAL"
    end
end

function SpeedSystem:getModeLabel(humanoid)
    local m = self:getCurrentMode(humanoid)
    if m == "LAGGER_CARRY" then return "LAGGER CARRY"
    elseif m == "LAGGER_NORMAL" then return "LAGGER"
    elseif m == "CARRY" then return "CARRY"
    else return "NORMAL" end
end

function SpeedSystem:toggleCarry()
    if self.speedMethod == "V2" then

        self.laggerActive = false
        self.laggerPhase = 0
        self.carryActive = not self.carryActive
    else



        self.carryActive = not self.carryActive
        if self.laggerActive then
            self.laggerPhase = self.carryActive and 2 or 1
        end
    end
    self:updateUI()
    return self.carryActive
end

function SpeedSystem:toggleLagger()
    if self.speedMethod == "V2" then
        if not self.laggerActive then
            self.laggerActive = true
            self.carryActive = false
            self.laggerPhase = 1
        else
            self.carryActive = not self.carryActive
            self.laggerPhase = self.carryActive and 2 or 1
        end
    else



        self.laggerActive = not self.laggerActive
        if self.laggerActive then
            self.laggerPhase = self.carryActive and 2 or 1
        else
            self.laggerPhase = 0
        end
    end
    self:updateUI()
    return self.laggerActive
end

function SpeedSystem:setCarry(on)
    on = on and true or false
    if self.speedMethod == "V2" then
        self.laggerActive = false
        self.laggerPhase = 0
        self.carryActive = on
        self:updateUI()
        return
    end
    self.carryActive = on
    if self.laggerActive then
        self.laggerPhase = on and 2 or 1
    end
    self:updateUI()
end

function SpeedSystem:setLagger(on)
    on = on and true or false
    if self.speedMethod == "V2" then
        if on then
            self.laggerActive = true
            self.carryActive = false
            self.laggerPhase = 1
        else
            self.laggerActive = false
            self.laggerPhase = 0
        end
        self:updateUI()
        return
    end
    self.laggerActive = on
    self.laggerPhase = on and (self.carryActive and 2 or 1) or 0
    self:updateUI()
end

function SpeedSystem:setSpeedMode(mode)
    mode = mode or "NORMAL"
    if mode == "CARRY" then
        self.carryActive = true
        self.laggerActive = false
        self.laggerPhase = 0
    elseif mode == "LAGGER_NORMAL" or mode == "LAGGER" then
        self.laggerActive = true
        self.carryActive = false
        self.laggerPhase = 1
    elseif mode == "LAGGER_CARRY" then
        self.laggerActive = true
        self.carryActive = true
        self.laggerPhase = 2
    else
        self.carryActive = false
        self.laggerActive = false
        self.laggerPhase = 0
    end
    self:updateUI()
end

function SpeedSystem:updateUI()
    if self.onUIUpdate then
        self.onUIUpdate()
    end
end

function SpeedSystem:applySpeed(hrp, hum, dir, spd, dt)
    if not hrp or not hum then return end
    local flat = Vector3.new(dir.X, 0, dir.Z)
    if flat.Magnitude < 0.05 then
        hrp.AssemblyLinearVelocity = Vector3.new(0, hrp.AssemblyLinearVelocity.Y, 0)
        return
    end
    flat = flat.Unit
    pcall(function()
        if hrp.SetNetworkOwner then hrp:SetNetworkOwner(LP) end
    end)
    hrp.AssemblyLinearVelocity = Vector3.new(flat.X * spd, hrp.AssemblyLinearVelocity.Y, flat.Z * spd)
end

function SpeedSystem:destroySpeedObjects()
    if self._bodyVel then
        pcall(function() self._bodyVel:Destroy() end)
        self._bodyVel = nil
    end
end

function SpeedSystem:isCarryingBrainrot(char)
    if not char then return false end

    local okA, vA = pcall(function() return LP:GetAttribute("Stealing") end)
    if okA and vA == true then return true end
    local okC, vC = pcall(function() return char:GetAttribute("Stealing") end)
    if okC and vC == true then return true end

    local hum = char:FindFirstChildOfClass("Humanoid")
    if hum and hum.WalkSpeed > 0 and hum.WalkSpeed < 25 then

    end
    local keywords = {
        "brainrot", "brain rot", "animal", "pet", "carry", "grab", "steal",
        "hold", "item", "cash", "money", "trophy", "cup", "bag"
    }
    local function nameMatch(n)
        n = tostring(n or ""):lower()
        for _, k in ipairs(keywords) do
            if n:find(k, 1, true) then return true end
        end
        return false
    end

    for _, child in ipairs(char:GetChildren()) do
        if child:IsA("Tool") and nameMatch(child.Name) then return true end
        if child:IsA("Model") and child:FindFirstChildWhichIsA("BasePart", true) and nameMatch(child.Name) then
            return true
        end

        if child:IsA("BasePart") and nameMatch(child.Name) then return true end
    end

    local bp = LP:FindFirstChild("Backpack")

    for _, v in ipairs(char:GetChildren()) do
        if v:IsA("BoolValue") and v.Value and nameMatch(v.Name) then return true end
        if v:IsA("ObjectValue") and v.Value and nameMatch(v.Name) then return true end
        if v:IsA("StringValue") and v.Value ~= "" and nameMatch(v.Name) then return true end
    end

    local hrp = char:FindFirstChild("HumanoidRootPart")
    if hrp then
        for _, d in ipairs(char:GetDescendants()) do
            if d:IsA("Weld") or d:IsA("WeldConstraint") or d:IsA("Motor6D") then
                local p0, p1 = d.Part0, d.Part1
                local other = (p0 == hrp and p1) or (p1 == hrp and p0)
                if other and other.Parent and other.Parent ~= char then
                    if nameMatch(other.Parent.Name) or nameMatch(other.Name) then
                        return true
                    end
                end
            end
        end
    end
    return false
end

function SpeedSystem:isHoldingBrainrot()
    if _G.NoxaSafeModeHoldingBrainrot then
        local ok, r = pcall(_G.NoxaSafeModeHoldingBrainrot)
        if ok and r then return true end
    end
    return self:isCarryingBrainrot(LP.Character) == true
end

function SpeedSystem:isActionBlocked(kind)

    if not self.safeModeEnabled then return false, nil end
    if kind ~= "aimbot" and kind ~= "tpbat" and kind ~= "autoplay" and kind ~= "path" then
        return false, nil
    end
    if _G.NoxaSafeModeIsLocked then
        local ok, locked = pcall(_G.NoxaSafeModeIsLocked)
        if ok and locked then
            return true, "Safe Mode"
        end
    end
    if self:isHoldingBrainrot() then
        return true, "Safe Mode Â· brainrot"
    end
    return false, nil
end


do
    _G.NoxaNoPlayerCollisionState = _G.NoxaNoPlayerCollisionState or { connections = {}, running = false }

    function _G.NoxaSetOtherPlayerCollision(state)
        for _, plr in ipairs(Players:GetPlayers()) do
            if plr ~= LP and plr.Character then
                for _, part in ipairs(plr.Character:GetDescendants()) do
                    if part:IsA("BasePart") then
                        pcall(function() part.CanCollide = state end)
                    end
                end
            end
        end
    end

    function _G.NoxaEnableNoPlayerCollision()
        local st = _G.NoxaNoPlayerCollisionState
        if st.running then return end
        SpeedSystem.noPlayerCollisionEnabled = true
        st.running = true
        for _, conn in ipairs(st.connections or {}) do
            pcall(function() conn:Disconnect() end)
        end
        st.connections = {}
        _G.NoxaSetOtherPlayerCollision(false)
        table.insert(st.connections, LP.CharacterAdded:Connect(function()
            task.wait(0.5)
            if SpeedSystem.noPlayerCollisionEnabled then
                _G.NoxaSetOtherPlayerCollision(false)
            end
        end))
        table.insert(st.connections, Players.PlayerAdded:Connect(function(plr)
            local c = plr.CharacterAdded:Connect(function()
                task.wait(0.5)
                if SpeedSystem.noPlayerCollisionEnabled then
                    _G.NoxaSetOtherPlayerCollision(false)
                end
            end)
            table.insert(st.connections, c)
        end))
        local collisionScanElapsed = 0
        table.insert(st.connections, RunService.Heartbeat:Connect(function(dt)
            if not SpeedSystem.noPlayerCollisionEnabled then return end
            collisionScanElapsed = collisionScanElapsed + (dt or 0)
            if collisionScanElapsed < 0.5 then return end
            collisionScanElapsed = 0
            for _, plr in ipairs(Players:GetPlayers()) do
                if plr ~= LP and plr.Character then
                    for _, part in ipairs(plr.Character:GetDescendants()) do
                        if part:IsA("BasePart") and part.CanCollide == true then
                            pcall(function() part.CanCollide = false end)
                        end
                    end
                end
            end
        end))
    end

    function _G.NoxaDisableNoPlayerCollision()
        local st = _G.NoxaNoPlayerCollisionState
        if not st.running then
            SpeedSystem.noPlayerCollisionEnabled = false
            return
        end
        SpeedSystem.noPlayerCollisionEnabled = false
        st.running = false
        for _, conn in ipairs(st.connections or {}) do
            pcall(function() conn:Disconnect() end)
        end
        st.connections = {}
        _G.NoxaSetOtherPlayerCollision(true)
    end
end

function SpeedSystem:softFaceTarget(root, targetPos, targetVel)
    if not root or not targetPos then return end
    local myPos = root.Position
    targetVel = targetVel or Vector3.zero
    local speed3 = targetVel.Magnitude
    local predictTime = math.clamp(speed3 / 150, 0.05, 0.2)
    local predictedPos = targetPos + targetVel * predictTime
    local flatTarget = Vector3.new(predictedPos.X, myPos.Y, predictedPos.Z)
    if (flatTarget - myPos).Magnitude < 0.1 then return end
    local goalCF = CFrame.lookAt(myPos, flatTarget)
    local _, ry, _ = (root.CFrame:Inverse() * goalCF):ToEulerAnglesXYZ()
    ry = math.clamp(ry, -2.5, 2.5)
    root.AssemblyAngularVelocity = root.CFrame:VectorToWorldSpace(Vector3.new(0, ry * 42, 0))
end

function SpeedSystem:_tpBatGetMeleeTool()
    local char = LP.Character
    if not char then return nil end
    for _, tool in ipairs(char:GetChildren()) do
        if tool:IsA("Tool") then
            local n = tool.Name:lower()
            if n:find("bat") or n:find("sword") or n:find("knife")
            or n:find("blade") or n:find("mace") then
                return tool
            end
            if tool:FindFirstChildWhichIsA("RemoteEvent")
            or tool:FindFirstChild("Activate") then
                return tool
            end
        end
    end

    local bp = LP:FindFirstChild("Backpack")
    if bp then
        for _, tool in ipairs(bp:GetChildren()) do
            if tool:IsA("Tool") then
                local n = tool.Name:lower()
                if n:find("bat") or n:find("sword") or n:find("knife")
                or n:find("blade") or n:find("mace") then
                    local hum = char:FindFirstChildOfClass("Humanoid")
                    if hum then pcall(function() hum:EquipTool(tool) end) end
                    return tool
                end
            end
        end
    end
    return nil
end

function SpeedSystem:_tpBatTryHit()
    if self.tpBatHittingCooldown then return end
    self.tpBatHittingCooldown = true
    pcall(function()
        local tool = self:_tpBatGetMeleeTool()
        if tool then
            pcall(function()
                if tool.Parent ~= LP.Character then
                    local hum = LP.Character and LP.Character:FindFirstChildOfClass("Humanoid")
                    if hum then hum:EquipTool(tool) end
                end
            end)

            if self.antiDesyncAutoSwingEnabled then
                pcall(function() tool:Activate() end)
                local ev = tool:FindFirstChildWhichIsA("RemoteEvent")
                if ev then pcall(function() ev:FireServer() end) end
            end
        end

    end)
    task.delay(self.tpBatSwingCooldown or 0.08, function()
        self.tpBatHittingCooldown = false
    end)
end

function SpeedSystem:_tpBatGetClosestPlayer(hrp)
    if not hrp then return nil, nil end
    local bestPlr, bestHrp, bestDist = nil, nil, 1e9
    for _, plr in ipairs(Players:GetPlayers()) do
        if plr ~= LP then
            local c = plr.Character
            if c then
                local th = c:FindFirstChild("HumanoidRootPart")
                local hum = c:FindFirstChildOfClass("Humanoid")
                if th and hum and hum.Health > 0 then
                    local d = (th.Position - hrp.Position).Magnitude
                    if d < bestDist then
                        bestDist = d
                        bestPlr = plr
                        bestHrp = th
                    end
                end
            end
        end
    end
    return bestPlr, bestHrp
end

function SpeedSystem:_tpBatTryHitBubble()
    if not self.antiDesyncAutoSwingEnabled and not self.tpBatAutoDisableOnHit then

    end
    if self.tpBatHittingCooldown then return end
    if not self.antiDesyncAutoSwingEnabled then return end
    self.tpBatHittingCooldown = true
    pcall(function()
        local tool = self:_tpBatGetMeleeTool()
        if tool then
            tool:Activate()
            local ev = tool:FindFirstChildWhichIsA("RemoteEvent")
            if ev then pcall(function() ev:FireServer() end) end
        end
    end)
    task.delay(self.tpBatSwingCooldown or 0.12, function()
        self.tpBatHittingCooldown = false
    end)
end

function SpeedSystem:startAntiDesyncAimbotV2()
    local blocked, reason = self:isActionBlocked("tpbat")
    if blocked then
        self.antiDesyncAimbotEnabled = false
        pcall(function() if notify then notify("Blocked Â· " .. tostring(reason or "Safe Mode"), 1.6) end end)
        return
    end
    self:stopAntiDesyncAimbot()
    self.antiDesyncAimbotEnabled = true
    pcall(function()
        local BA = rawget(_G, "NoxaBatAimbot") or (NoxaMods and NoxaMods.BatAimbotRef)
        if BA and BA.enabled then
            BA.enabled = false
            local stopFn = (NoxaMods and NoxaMods._batAimbotStop) or _G._batStop
            if type(stopFn) == "function" then stopFn() end
        end
    end)
    self._tpBatConn = RunService.Heartbeat:Connect(function()
        if not self.antiDesyncAimbotEnabled then return end
        if self.safeModeEnabled and self:isHoldingBrainrot() then
            self.antiDesyncAimbotEnabled = false
            task.defer(function()
                pcall(function() self:stopAntiDesyncAimbot() end)
                if notify then notify("Blocked Â· Safe Mode Â· brainrot", 1.5) end
            end)
            return
        end
        local char = LP.Character
        if not char then return end
        local hrp = char:FindFirstChild("HumanoidRootPart")
        local hum = char:FindFirstChildOfClass("Humanoid")
        if not hrp or not hum or hum.Health <= 0 then return end
        local targetPlr, targetHrp = self:_tpBatGetClosestPlayer(hrp)
        self.tpBatCurrentTarget = targetPlr
        if not targetHrp then return end
        local tr = targetHrp
        local tvel = tr.AssemblyLinearVelocity
        local predict = Vector3.new(tvel.X, 0, tvel.Z) * 0.05
        local targetPos = tr.Position + Vector3.new(0, 0.9, 0) + predict
        if targetPos.Y < -20 then
            targetPos = Vector3.new(targetPos.X, hrp.Position.Y, targetPos.Z)
        end
        local facing = Vector3.new(tr.CFrame.LookVector.X, 0, tr.CFrame.LookVector.Z)
        if facing.Magnitude < 0.01 then
            local flat = Vector3.new(tr.Position.X - hrp.Position.X, 0, tr.Position.Z - hrp.Position.Z)
            facing = flat.Magnitude > 0.01 and flat.Unit or Vector3.new(0, 0, -1)
        else
            facing = facing.Unit
        end
        local engCF = CFrame.lookAt(targetPos, targetPos + facing)
        pcall(function()
            hrp.CFrame = engCF
            hrp.AssemblyLinearVelocity = Vector3.new(tvel.X, 0, tvel.Z)
            hrp.AssemblyAngularVelocity = Vector3.zero

            local lv = hrp:FindFirstChild("NoxaSpeedLV")
            if lv then lv.Enabled = false; lv.PlaneVelocity = Vector2.zero end
        end)
        if sethiddenproperty then
            pcall(function() sethiddenproperty(hrp, "PhysicsRepRootPart", tr) end)
        end
        if self.tpBatCameraLock then
            local cam = workspace.CurrentCamera
            if cam then pcall(function() cam.CFrame = CFrame.new(cam.CFrame.Position, tr.Position) end) end
        end

        if self.antiDesyncAutoSwingEnabled or self.tpBatAutoDisableOnHit then
            self:_tpBatTryHit()
        end
    end)
end

-- TP Bat V1 = EXIST style (PhysicsRepRootPart + CFrame to target + swing)
function SpeedSystem:startAntiDesyncAimbotV1()
    local blocked, reason = self:isActionBlocked("tpbat")
    if blocked then
        self.antiDesyncAimbotEnabled = false
        pcall(function() if notify then notify("Blocked Â· " .. tostring(reason or "Safe Mode"), 1.6) end end)
        return
    end
    self:stopAntiDesyncAimbot()
    self.antiDesyncAimbotEnabled = true
    self.tpBatHittingCooldown = false
    pcall(function()
        local BA = rawget(_G, "NoxaBatAimbot") or (NoxaMods and NoxaMods.BatAimbotRef)
        if BA and BA.enabled then
            BA.enabled = false
            local stopFn = (NoxaMods and NoxaMods._batAimbotStop) or _G._batStop
            if type(stopFn) == "function" then stopFn() end
        end
    end)

    local function existGetBat(char)
        if not char then return nil end
        local tool = char:FindFirstChild("Bat")
        if tool and tool:IsA("Tool") then return tool end
        for _, t in ipairs(char:GetChildren()) do
            if t:IsA("Tool") then
                local n = string.lower(t.Name)
                if n:find("bat", 1, true) or n:find("slap", 1, true) then return t end
            end
        end
        local bp = LP:FindFirstChild("Backpack")
        if bp then
            tool = bp:FindFirstChild("Bat")
            if tool and tool:IsA("Tool") then
                pcall(function() tool.Parent = char end)
                return tool
            end
            for _, t in ipairs(bp:GetChildren()) do
                if t:IsA("Tool") then
                    local n = string.lower(t.Name)
                    if n:find("bat", 1, true) or n:find("slap", 1, true) then
                        pcall(function() t.Parent = char end)
                        return t
                    end
                end
            end
        end
        return nil
    end

    local function existTryHit(char)
        if self.tpBatHittingCooldown then return end
        self.tpBatHittingCooldown = true
        pcall(function()
            local bat = existGetBat(char)
            if bat then
                bat:Activate()
                local ev = bat:FindFirstChildWhichIsA("RemoteEvent")
                if ev then pcall(function() ev:FireServer() end) end
            end
        end)
        task.delay(0.08, function() self.tpBatHittingCooldown = false end)
    end

    self._tpBatConn = RunService.Heartbeat:Connect(function()
        if not self.antiDesyncAimbotEnabled then return end
        if self.safeModeEnabled and self:isHoldingBrainrot() then
            self.antiDesyncAimbotEnabled = false
            task.defer(function()
                pcall(function() self:stopAntiDesyncAimbot() end)
                if notify then notify("Blocked Â· Safe Mode Â· brainrot", 1.5) end
            end)
            return
        end
        local char = LP.Character
        if not char then return end
        local hrp = char:FindFirstChild("HumanoidRootPart")
        local hum = char:FindFirstChildOfClass("Humanoid")
        if not hrp or not hum or hum.Health <= 0 then return end

        local targetPlr, tr = self:_tpBatGetClosestPlayer(hrp)
        self.tpBatCurrentTarget = targetPlr
        if not tr then return end

        -- EXIST core: bind physics rep root + snap near target
        pcall(function()
            local lv = hrp:FindFirstChild("NoxaSpeedLV")
            if lv then lv.Enabled = false; lv.PlaneVelocity = Vector2.zero end
        end)
        if sethiddenproperty then
            pcall(function() sethiddenproperty(hrp, "PhysicsRepRootPart", tr) end)
        end
        local targetPos = tr.Position + Vector3.new(0, 0.9, 0)
        if (hrp.Position - targetPos).Magnitude > 8 then
            pcall(function()
                hrp.CFrame = CFrame.new(targetPos)
            end)
        end
        -- camera always locks toward target (EXIST default)
        local cam = workspace.CurrentCamera
        if cam then
            pcall(function()
                cam.CFrame = CFrame.new(cam.CFrame.Position, tr.Position)
            end)
        end
        existTryHit(char)
    end)
end

function SpeedSystem:startAntiDesyncAimbot()
    local ver = tostring(self.tpBatVersion or "V1")
    if ver == "V2" then
        return self:startAntiDesyncAimbotV2()
    end
    return self:startAntiDesyncAimbotV1()
end

function SpeedSystem:stopAntiDesyncAimbot()
    if self._tpBatConn then
        self._tpBatConn:Disconnect()
        self._tpBatConn = nil
    end
    self.antiDesyncAimbotEnabled = false
    self.tpBatCurrentTarget = nil
    self.tpBatHittingCooldown = false
    self._tpBatLastTP = 0
end

function SpeedSystem:enableAutoCarry()
    if not self.autoCarryEnabled then return end
    if self._autoCarryActive then return end
    self._autoCarryReturnMode = self:getCurrentMode()
    self._autoCarryActive = true
    self._autoCarryGraceUntil = tick() + 0.75
    self:setLagger(false)
    self:setCarry(true)
    self:updateUI()
end

function SpeedSystem:disableAutoCarry()
    if not self._autoCarryActive then return end
    self._autoCarryActive = false
    self._autoCarryWaiting = false
    self._autoCarryWatchUntil = 0
    self._autoCarryGraceUntil = 0
    local returnMode = self._autoCarryReturnMode or "NORMAL"
    self._autoCarryReturnMode = nil
    if returnMode == "LAGGER" then
        self:setCarry(false); self:setLagger(true)
    elseif returnMode == "LAGGER_CARRY" then
        self:setCarry(true); self:setLagger(true)
    elseif returnMode == "CARRY" then
        self:setCarry(true); self:setLagger(false)
    else
        self:setCarry(false); self:setLagger(false)
    end
    self:updateUI()
end

function SpeedSystem:watchPickup(seconds)
    if not self.autoCarryEnabled then return end
    self._autoCarryWaiting = true
    self._autoCarryWatchUntil = tick() + (seconds or 1.25)
end

function SpeedSystem:startAutoCarryMonitor()
    if self._autoCarryMonitor then return end
    self._autoCarryMonitor = RunService.Heartbeat:Connect(function()
        if not self.autoCarryEnabled then
            if self._autoCarryActive then self:disableAutoCarry() end
            return
        end
        local char = LP.Character
        local hum = char and char:FindFirstChildOfClass("Humanoid")
        local root = char and char:FindFirstChild("HumanoidRootPart")
        if not char or not hum or not root then
            self:disableAutoCarry()
            return
        end
        local st = hum:GetState()
        local gotHit = st == Enum.HumanoidStateType.Physics or st == Enum.HumanoidStateType.Ragdoll or st == Enum.HumanoidStateType.FallingDown
        local stealingAttr = LP:GetAttribute("Stealing") == true
        local carrying = self:isCarryingBrainrot(char)

        if self._autoCarryWaiting then
            if gotHit or tick() > (self._autoCarryWatchUntil or 0) then
                self._autoCarryWaiting = false
                self._autoCarryWatchUntil = 0
            elseif carrying then
                self:enableAutoCarry()
            end
        end
        if carrying and not self._autoCarryActive then
            self:enableAutoCarry()
        end
        if self._autoCarryActive then
            local graceDone = tick() > (self._autoCarryGraceUntil or 0)
            if gotHit or (graceDone and not carrying and not stealingAttr) then
                self:disableAutoCarry()
            end
        end
        if stealingAttr and not self._autoCarryActive then
            self:enableAutoCarry()
        end
    end)
end

function SpeedSystem:stopAutoCarryMonitor()
    if self._autoCarryMonitor then
        self._autoCarryMonitor:Disconnect()
        self._autoCarryMonitor = nil
    end
end

-- Infinite Jump = Clean Hub (LinearVelocity impulse Â· manual + hold)
do
    local _lastInfJump = 0
    local _gamepadBtnHeld = false
    local _activeTouches = {}
    local _lastTouchStart = nil
    local _holdTouch = nil

    local function applyImpulse(root, hum, yVel)
        if not root then return end
        local attachment = root:FindFirstChild("InfJumpAttachment")
        if not attachment then
            attachment = Instance.new("Attachment")
            attachment.Name = "InfJumpAttachment"
            attachment.Parent = root
        end
        local currentX = root.AssemblyLinearVelocity.X
        local currentZ = root.AssemblyLinearVelocity.Z
        local targetY = yVel or 50
        local lv = Instance.new("LinearVelocity")
        lv.Name = "InfJumpVelocity"
        lv.MaxForce = 999999
        lv.VectorVelocity = Vector3.new(currentX, targetY, currentZ)
        lv.RelativeTo = Enum.ActuatorRelativeTo.World
        lv.Attachment0 = attachment
        lv.Parent = root
        task.delay(0.08, function()
            if lv then pcall(function() lv:Destroy() end) end
            -- keep attachment for reuse; destroy if root gone
            if attachment and attachment.Parent == nil then
                pcall(function() attachment:Destroy() end)
            end
        end)
    end

    local function doInfJump(yVel)
        local now = os.clock()
        if now - _lastInfJump < 0.1 then return end
        _lastInfJump = now
        local c = LP.Character
        if not c then return end
        local hum = c:FindFirstChildOfClass("Humanoid")
        if not hum or hum.Health <= 0 then return end
        local root = c:FindFirstChild("HumanoidRootPart")
        if not root then return end
        hum.Jump = true
        applyImpulse(root, hum, yVel)
    end

    function SpeedSystem:applyInfJumpBoost(root)
        -- compat wrapper
        local hum = LP.Character and LP.Character:FindFirstChildOfClass("Humanoid")
        applyImpulse(root, hum, 50)
    end

    function SpeedSystem:startManualInfJumpLoop()
        -- Clean manual uses JumpRequest / gamepad; no continuous loop needed
        if self._infJumpThread then
            pcall(function() self._infJumpThread:Disconnect() end)
            self._infJumpThread = nil
        end
    end

    function SpeedSystem:stopManualInfJumpLoop()
        if self._infJumpThread then
            pcall(function() self._infJumpThread:Disconnect() end)
            self._infJumpThread = nil
        end
        self.jumpHeld = false
        self._infJumpBoosting = false
    end

    function SpeedSystem:startHoldInfJump()
        if self._holdInfJumpConn then
            pcall(function() self._holdInfJumpConn:Disconnect() end)
            self._holdInfJumpConn = nil
        end
        self._holdInfJumpConn = RunService.Heartbeat:Connect(function()
            if not self.infJumpEnabled or self.infJumpMode ~= "hold" then return end
            local c = LP.Character
            if not c then return end
            local root = c:FindFirstChild("HumanoidRootPart")
            local hum = c:FindFirstChildOfClass("Humanoid")
            if not root or not hum or hum.Health <= 0 then return end
            local jumpHeld = UserInputService:IsKeyDown(Enum.KeyCode.Space)
                or _gamepadBtnHeld
                or self.jumpHeld == true
                or (_holdTouch ~= nil)
            if jumpHeld and root.AssemblyLinearVelocity.Y < 30 then
                hum.Jump = true
                applyImpulse(root, hum, 52)
            end
            if root.AssemblyLinearVelocity.Y < -120 then
                applyImpulse(root, hum, -120)
            end
        end)
        pcall(function()
            if _G._NoxaTrackConn then _G._NoxaTrackConn(self._holdInfJumpConn) end
        end)
    end

    function SpeedSystem:stopHoldInfJump()
        if self._holdInfJumpConn then
            pcall(function() self._holdInfJumpConn:Disconnect() end)
            self._holdInfJumpConn = nil
        end
    end

    function SpeedSystem:setInfJumpMode(mode)
        mode = string.lower(tostring(mode or "hold"))
        if mode == "tap" or mode == "manual" then
            self.infJumpMode = "manual"
        else
            self.infJumpMode = "hold"
        end
        self:stopManualInfJumpLoop()
        self:stopHoldInfJump()
        if self.infJumpEnabled then
            if self.infJumpMode == "hold" then
                self:startHoldInfJump()
            end
            -- manual: event-driven only
        end
        pcall(function()
            if _G.NoxaSetInfJumpModeUI then
                _G.NoxaSetInfJumpModeUI(self.infJumpMode)
            end
        end)
    end

    function SpeedSystem:setInfJumpEnabled(on)
        self.infJumpEnabled = on == true
        self:stopManualInfJumpLoop()
        self:stopHoldInfJump()
        if self.infJumpEnabled then
            if self.infJumpMode == "hold" then
                self:startHoldInfJump()
            end
        else
            self.jumpHeld = false
            self._gamepadJumpHeld = false
            self._infJumpBoosting = false
            _gamepadBtnHeld = false
            _holdTouch = nil
        end
    end

    local function isGamepadType(uit)
        return uit == Enum.UserInputType.Gamepad1
            or uit == Enum.UserInputType.Gamepad2
            or uit == Enum.UserInputType.Gamepad3
            or uit == Enum.UserInputType.Gamepad4
            or uit == Enum.UserInputType.Gamepad5
            or uit == Enum.UserInputType.Gamepad6
            or uit == Enum.UserInputType.Gamepad7
            or uit == Enum.UserInputType.Gamepad8
    end

    -- Clean: JumpRequest â†’ manual fires impulse; hold only tracks touch
    UserInputService.JumpRequest:Connect(function()
        if not SpeedSystem.infJumpEnabled then return end
        if SpeedSystem.infJumpMode == "hold" then
            if _holdTouch == nil and _lastTouchStart ~= nil and _activeTouches[_lastTouchStart] then
                _holdTouch = _lastTouchStart
            end
            return
        end
        -- manual
        doInfJump(50)
    end)

    UserInputService.InputBegan:Connect(function(inp)
        if not SpeedSystem.infJumpEnabled then return end
        if inp.UserInputType == Enum.UserInputType.Keyboard and inp.KeyCode == Enum.KeyCode.Space then
            SpeedSystem.jumpHeld = true
            if SpeedSystem.infJumpMode == "manual" then
                doInfJump(50)
            end
            return
        end
        if inp.KeyCode == Enum.KeyCode.ButtonA and isGamepadType(inp.UserInputType) then
            _gamepadBtnHeld = true
            SpeedSystem._gamepadJumpHeld = true
            SpeedSystem.jumpHeld = true
            if SpeedSystem.infJumpMode == "manual" then
                doInfJump(50)
            end
        end
    end)

    UserInputService.InputEnded:Connect(function(inp)
        if inp.UserInputType == Enum.UserInputType.Keyboard and inp.KeyCode == Enum.KeyCode.Space then
            SpeedSystem.jumpHeld = false
            return
        end
        if inp.KeyCode == Enum.KeyCode.ButtonA then
            _gamepadBtnHeld = false
            SpeedSystem._gamepadJumpHeld = false
            if not UserInputService:IsKeyDown(Enum.KeyCode.Space) then
                SpeedSystem.jumpHeld = false
            end
        end
    end)

    UserInputService.TouchStarted:Connect(function(touch)
        if not SpeedSystem.infJumpEnabled or SpeedSystem.infJumpMode ~= "hold" then return end
        _activeTouches[touch] = true
        _lastTouchStart = touch
    end)
    UserInputService.TouchEnded:Connect(function(touch)
        _activeTouches[touch] = nil
        if _lastTouchStart == touch then _lastTouchStart = nil end
        if _holdTouch == touch then _holdTouch = nil end
    end)

    -- Mobile jump button hook
    task.spawn(function()
        local pg = LP:WaitForChild("PlayerGui", 10)
        if not pg then return end
        local function hookBtn(btn)
            if btn:IsA("GuiButton") and btn.Name == "JumpButton" and not btn:GetAttribute("NoxaIJHooked") then
                btn:SetAttribute("NoxaIJHooked", true)
                btn.MouseButton1Down:Connect(function()
                    if not SpeedSystem.infJumpEnabled then return end
                    SpeedSystem.jumpHeld = true
                    if SpeedSystem.infJumpMode == "manual" then
                        doInfJump(50)
                    end
                end)
                btn.MouseButton1Up:Connect(function() SpeedSystem.jumpHeld = false end)
                btn.MouseLeave:Connect(function() SpeedSystem.jumpHeld = false end)
            end
        end
        for _, d in ipairs(pg:GetDescendants()) do pcall(hookBtn, d) end
        pg.DescendantAdded:Connect(function(d) pcall(hookBtn, d) end)
    end)
end

function SpeedSystem:forceNoSplatterReset()
    local char = LP.Character
    if not char then return end
    local hum = char:FindFirstChildOfClass("Humanoid")
    local root = char:FindFirstChild("HumanoidRootPart")
    if not hum or not root or hum.Health <= 0 then return end

    pcall(function()
        hum:ChangeState(Enum.HumanoidStateType.GettingUp)
        root.Velocity = Vector3.zero
        root.RotVelocity = Vector3.zero
        root.AssemblyLinearVelocity = Vector3.zero
        root.AssemblyAngularVelocity = Vector3.zero

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

function SpeedSystem:startAntiRagdoll()
    if self._antiRagdollConn then return end
    self._antiRagdollConn = RunService.Heartbeat:Connect(function()
        if not self.antiRagdollEnabled then return end
        local char = LP.Character
        if not char then return end
        local hum = char:FindFirstChildOfClass("Humanoid")
        local root = char:FindFirstChild("HumanoidRootPart")
        if not hum or not root or hum.Health <= 0 then return end

        local state = hum:GetState()
        local isRagdolled = (state == Enum.HumanoidStateType.Physics or state == Enum.HumanoidStateType.Ragdoll or state == Enum.HumanoidStateType.FallingDown)

        if self.antiRagdollMode == "No Splatter" then
            if isRagdolled then
                local now = tick()
                if now - (self._antiRagdollNoSplatterCooldown or 0) > 0.15 then
                    self._antiRagdollNoSplatterCooldown = now
                    self:forceNoSplatterReset()
                end
            end
            return
        end


        if isRagdolled then
            pcall(function()
                hum:ChangeState(Enum.HumanoidStateType.GettingUp)
                for _, obj in ipairs(char:GetDescendants()) do
                    if obj:IsA("Motor6D") then obj.Enabled = true end
                    if obj:IsA("Constraint") then obj.Enabled = true end
                end
                root.Velocity = Vector3.zero
                root.RotVelocity = Vector3.zero
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
    end)
end

function SpeedSystem:stopAntiRagdoll()
    if self._antiRagdollConn then
        self._antiRagdollConn:Disconnect()
        self._antiRagdollConn = nil
    end
end

function SpeedSystem:_autoDodgeTpUp()
    if self._autoDodgeTpUpDebounce then return end
    self._autoDodgeTpUpDebounce = true
    local char = LP.Character
    local root = char and char:FindFirstChild("HumanoidRootPart")
    if root then
        root.CFrame = CFrame.new(root.Position + Vector3.new(0, 8.7, 0))
    end
    task.delay(0.37, function()
        self._autoDodgeTpUpDebounce = false
    end)
end

function SpeedSystem:_autoDodgeTpDown()
    local char = LP.Character
    local root = char and char:FindFirstChild("HumanoidRootPart")
    if not root then return end
    local params = RaycastParams.new()
    params.FilterDescendantsInstances = {char}
    params.FilterType = Enum.RaycastFilterType.Exclude
    local result = workspace:Raycast(root.Position, Vector3.new(0, -500, 0), params)
    local targetY = result and (result.Position.Y + 2.5) or (root.Position.Y - 175)
    root.CFrame = CFrame.new(root.Position.X, targetY, root.Position.Z)
end

function SpeedSystem:startAutoDodge()
    if self._autoDodgeThread then return end
    self.autoDodgeEnabled = true
    self._autoDodgeThread = task.spawn(function()
        while self.autoDodgeEnabled do
            local char = LP.Character
            local root = char and char:FindFirstChild("HumanoidRootPart")
            if root then
                root.AssemblyLinearVelocity = Vector3.new(root.AssemblyLinearVelocity.X, 52, root.AssemblyLinearVelocity.Z)
                task.wait(0.08)
                root.AssemblyLinearVelocity = Vector3.new(root.AssemblyLinearVelocity.X, 52, root.AssemblyLinearVelocity.Z)
            end
            task.wait(0.1)
            self:_autoDodgeTpUp()
            task.wait(0.18)
            self:_autoDodgeTpDown()
            task.wait(0.15)
        end
        self._autoDodgeThread = nil
    end)
end

function SpeedSystem:stopAutoDodge()
    self.autoDodgeEnabled = false
    self._autoDodgeThread = nil
end

function SpeedSystem:setAutoDodge(on)
    if on then self:startAutoDodge() else self:stopAutoDodge() end
end

function SpeedSystem:toggleAutoDodge()
    self:setAutoDodge(not self.autoDodgeEnabled)
    return self.autoDodgeEnabled
end

function SpeedSystem:stopDropBrainrot()
    self._dropBrainrotActive = false
    if self._dropBrainrotConn then
        pcall(function() self._dropBrainrotConn:Disconnect() end)
        self._dropBrainrotConn = nil
    end
    for _, t in ipairs(self._dropConnections or {}) do
        if type(t) == "thread" then
            pcall(task.cancel, t)
        elseif typeof(t) == "RBXScriptConnection" then
            pcall(function() t:Disconnect() end)
        end
    end
    self._dropConnections = {}
    local c = LP.Character
    if c then
        local root = c:FindFirstChild("HumanoidRootPart")
        if root then
            root.AssemblyLinearVelocity = Vector3.zero
            root.AssemblyAngularVelocity = Vector3.zero
        end
    end
end

function SpeedSystem:runDropBrainrot()
    if self._dropBrainrotActive then return end
    if _G.KawaiStopAutoTPForAction then pcall(_G.KawaiStopAutoTPForAction) end
    if _G.AceStopAutoTPForAction then pcall(_G.AceStopAutoTPForAction) end
    if _G.K7StopAutoTPForAction then pcall(_G.K7StopAutoTPForAction) end

    local char = LP.Character
    local root = char and char:FindFirstChild("HumanoidRootPart")
    local hum = char and char:FindFirstChildOfClass("Humanoid")
    if not root or not hum then return end

    local mode = tonumber(self.dropMode) or 1
    local DROP_ASCEND_DURATION = tonumber(self.DROP_ASCEND_DURATION) or 0.2
    local DROP_ASCEND_SPEED = tonumber(self.DROP_ASCEND_SPEED) or 160

    -- Mode 1: Fling (Clean)
    if mode == 1 then
        local speedH = 0
        do
            local vel = root.AssemblyLinearVelocity
            speedH = Vector3.new(vel.X, 0, vel.Z).Magnitude
        end
        local cooldown = (speedH > 5) and 0.6 or 0.25
        if tick() - (self._dropLastTime or 0) < cooldown then return end
        self._dropLastTime = tick()
        self._dropBrainrotActive = true

        local function finishDrop(threadRef)
            if threadRef and self._dropConnections then
                for i = #self._dropConnections, 1, -1 do
                    if self._dropConnections[i] == threadRef then
                        table.remove(self._dropConnections, i)
                        break
                    end
                end
            end
            self._dropBrainrotActive = false
            local c = LP.Character
            if c then
                local r = c:FindFirstChild("HumanoidRootPart")
                local h = c:FindFirstChildOfClass("Humanoid")
                if r then
                    r.AssemblyLinearVelocity = Vector3.zero
                    r.AssemblyAngularVelocity = Vector3.zero
                    if r.Position.Y < -100 then
                        r.CFrame = CFrame.new(r.Position.X, 5, r.Position.Z)
                    end
                    local rp = RaycastParams.new()
                    rp.FilterDescendantsInstances = {c}
                    rp.FilterType = Enum.RaycastFilterType.Exclude
                    local rr = workspace:Raycast(r.Position, Vector3.new(0, -2000, 0), rp)
                    if rr then
                        local off = (h and h.HipHeight or 2) + (r.Size.Y / 2)
                        r.CFrame = CFrame.new(r.Position.X, rr.Position.Y + off, r.Position.Z)
                    end
                    if h and h.Health > 0 then
                        h:ChangeState(Enum.HumanoidStateType.Running)
                    end
                end
            end
        end

        local flingThread
        flingThread = task.spawn(function()
            local startTime = tick()
            while self._dropBrainrotActive and (tick() - startTime) < 0.25 do
                RunService.Heartbeat:Wait()
                local c = LP.Character
                local r = c and c:FindFirstChild("HumanoidRootPart")
                if not r then break end
                local vel = r.AssemblyLinearVelocity
                vel = Vector3.new(0, vel.Y, 0)
                r.AssemblyLinearVelocity = vel * 10000 + Vector3.new(0, 10000, 0)
                RunService.RenderStepped:Wait()
                if r and r.Parent then
                    r.AssemblyLinearVelocity = vel
                end
                RunService.Stepped:Wait()
                if r and r.Parent then
                    r.AssemblyLinearVelocity = vel + Vector3.new(0, 0.1, 0)
                end
            end
            finishDrop(flingThread)
        end)
        self._dropConnections = self._dropConnections or {}
        table.insert(self._dropConnections, flingThread)
        task.delay(0.35, function()
            if self._dropBrainrotActive then
                finishDrop(flingThread)
            end
        end)
        return
    end

    -- Mode 2: Jump Drop (Clean)
    self._dropBrainrotActive = true
    local t0 = tick()
    if self._dropBrainrotConn then
        pcall(function() self._dropBrainrotConn:Disconnect() end)
        self._dropBrainrotConn = nil
    end
    self._dropBrainrotConn = RunService.Heartbeat:Connect(function()
        local c = LP.Character
        local r = c and c:FindFirstChild("HumanoidRootPart")
        if not r then
            if self._dropBrainrotConn then
                pcall(function() self._dropBrainrotConn:Disconnect() end)
                self._dropBrainrotConn = nil
            end
            self._dropBrainrotActive = false
            return
        end
        if not self._dropBrainrotActive then
            if self._dropBrainrotConn then
                pcall(function() self._dropBrainrotConn:Disconnect() end)
                self._dropBrainrotConn = nil
            end
            return
        end
        if tick() - t0 >= DROP_ASCEND_DURATION then
            if self._dropBrainrotConn then
                pcall(function() self._dropBrainrotConn:Disconnect() end)
                self._dropBrainrotConn = nil
            end
            pcall(function()
                local rp = RaycastParams.new()
                rp.FilterDescendantsInstances = {c}
                rp.FilterType = Enum.RaycastFilterType.Exclude
                local rr = workspace:Raycast(r.Position, Vector3.new(0, -3000, 0), rp)
                if rr then
                    local hum2 = c:FindFirstChildOfClass("Humanoid")
                    local off = ((hum2 and hum2.HipHeight) or 2) + (r.Size.Y / 2)
                    r.CFrame = CFrame.new(r.Position.X, rr.Position.Y + off, r.Position.Z)
                    r.AssemblyLinearVelocity = Vector3.zero
                    r.AssemblyAngularVelocity = Vector3.zero
                    if hum2 and hum2.Health > 0 then
                        hum2:ChangeState(Enum.HumanoidStateType.Running)
                    end
                end
            end)
            self._dropBrainrotActive = false
            return
        end
        local lv = r.AssemblyLinearVelocity
        r.AssemblyLinearVelocity = Vector3.new(lv.X, DROP_ASCEND_SPEED, lv.Z)
    end)
end

function SpeedSystem:runTPDown()

    if self._tpDownActive then return end
    local char = LP.Character
    if not char then return end
    local root = char:FindFirstChild("HumanoidRootPart")
    if not root then return end
    self._tpDownActive = true

    pcall(function()
        local _, yaw = root.CFrame:ToEulerAnglesYXZ()

        for _, inst in ipairs(root:GetChildren()) do
            if inst:IsA("LinearVelocity") or inst:IsA("BodyVelocity") or inst:IsA("VectorForce") then
                pcall(function()
                    inst.Enabled = false
                    if inst:IsA("LinearVelocity") and inst.PlaneVelocity ~= nil then
                        inst.PlaneVelocity = Vector2.zero
                    end
                end)
            end
        end
        root.CFrame = CFrame.new(root.Position.X, -7, root.Position.Z) * CFrame.Angles(0, yaw, 0)
        root.AssemblyLinearVelocity = Vector3.zero
        root.AssemblyAngularVelocity = Vector3.zero
        if root.Velocity then root.Velocity = Vector3.zero end
        if root.RotVelocity then root.RotVelocity = Vector3.zero end
    end)

    self._tpDownActive = false
end

function SpeedSystem:_unbindInstantResetCam()
    if self._instantResetCamBound then
        pcall(function()
            RunService:UnbindFromRenderStep("InstaResetCam")
        end)
        self._instantResetCamBound = false
    end
end

function SpeedSystem:_restoreInstantResetCam()
    self:_unbindInstantResetCam()
    pcall(function()
        local cam = workspace.CurrentCamera
        local char = LP.Character
        local hum = char and char:FindFirstChildOfClass("Humanoid")
        if cam then
            if hum then cam.CameraSubject = hum end
            cam.CameraType = Enum.CameraType.Custom
        end
    end)
end

function SpeedSystem:stopInstantReset()
    self._instantResetStop = true
    self:_unbindInstantResetCam()
    if self._instantResetRespawnConn then
        pcall(function() self._instantResetRespawnConn:Disconnect() end)
        self._instantResetRespawnConn = nil
    end
    self:_restoreInstantResetCam()
    self._instantResetCooldown = false
    self._instantResetStop = false
end

-- Instant Reset = Cursed (simple Y velocity blast)
function SpeedSystem:runInstantReset()
    if self._instantResetCooldown then return end
    local character = LP.Character
    if not character then return end
    local hrp = character:FindFirstChild("HumanoidRootPart")
    if not hrp then return end

    self._instantResetCooldown = true
    self._instantResetStop = false

    pcall(function()
        hrp.AssemblyLinearVelocity = Vector3.new(
            hrp.AssemblyLinearVelocity.X,
            10000000,
            hrp.AssemblyLinearVelocity.Z
        )
    end)

    task.delay(0.5, function()
        self._instantResetCooldown = false
        self._instantResetStop = false
    end)
end

function SpeedSystem:_wireInstaResetOnDeath(char)
    if not char or not self.instaResetOnDeathEnabled then return end
    local hum = char:FindFirstChildOfClass("Humanoid") or char:WaitForChild("Humanoid", 2)
    if not hum then return end

    if self._instaResetOnDeathHealthConn then
        pcall(function() self._instaResetOnDeathHealthConn:Disconnect() end)
        self._instaResetOnDeathHealthConn = nil
    end

    local function tryReset()
        if not self.instaResetOnDeathEnabled then return end
        if self._instantResetCooldown then return end
        pcall(function() self:runInstantReset() end)
    end

    self._instaResetOnDeathHealthConn = hum:GetPropertyChangedSignal("Health"):Connect(function()
        if not self.instaResetOnDeathEnabled then return end
        if hum.Health <= 0 then tryReset() end
    end)
    hum.Died:Connect(function()
        if not self.instaResetOnDeathEnabled then return end
        tryReset()
    end)
end

function SpeedSystem:startInstaResetOnDeath()
    if self._instaResetOnDeathConn then
        pcall(function() self._instaResetOnDeathConn:Disconnect() end)
        self._instaResetOnDeathConn = nil
    end

    if not self.instaResetOnDeathEnabled then return end

    self:_wireInstaResetOnDeath(LP.Character)
    self._instaResetOnDeathConn = LP.CharacterAdded:Connect(function(char)
        if not self.instaResetOnDeathEnabled then return end
        task.delay(0.12, function()
            if self.instaResetOnDeathEnabled then
                self:_wireInstaResetOnDeath(char)
            end
        end)
    end)
end

function SpeedSystem:stopInstaResetOnDeath()
    self.instaResetOnDeathEnabled = false
    if self._instaResetOnDeathConn then
        pcall(function() self._instaResetOnDeathConn:Disconnect() end)
        self._instaResetOnDeathConn = nil
    end
    if self._instaResetOnDeathHealthConn then
        pcall(function() self._instaResetOnDeathHealthConn:Disconnect() end)
        self._instaResetOnDeathHealthConn = nil
    end
end

function SpeedSystem:setInstaResetOnDeath(on)
    on = on and true or false
    self.instaResetOnDeathEnabled = on
    if on then
        self:startInstaResetOnDeath()
    else
        self:stopInstaResetOnDeath()
    end
end

LP.CharacterAdded:Connect(function()
    if not SpeedSystem._instantResetCooldown then
        SpeedSystem:stopInstantReset()
    end
end)

function SpeedSystem:setAntiRagdoll(on)
    self.antiRagdollEnabled = on
    if on then
        self:startAntiRagdoll()
    else
        self:stopAntiRagdoll()
    end
end

-- ============================================================
-- CONFIG (Envy-style: flat table, one JSON write â€” fast)
-- ============================================================
CONFIG_FILE = "NoxaVynx_MainGUI_Config.json"
CONFIG_BACKUP = "NoxaVynx_MainGUI_Config.bak"
CONFIG_VERSION = 2
KEYBINDS_CONFIG_FILE = "NoxaVynx_Keybinds_Config.json"

local NoxaCfg = {
    http = game:GetService("HttpService"),
    extras = {},
    modules = {},
    pending = nil,
    dirty = false,
    loaded = false,
    autoSaveStarted = false,
    _extrasApplied = false,
    pendingMods = nil,
}

local function _cfgEnv()
    local g = (type(getgenv) == "function" and getgenv()) or _G or {}
    local wf = writefile or g.writefile or (syn and syn.writefile)
    local rf = readfile or g.readfile or (syn and syn.readfile)
    local isf = isfile or g.isfile or (syn and syn.isfile)
    if type(isf) ~= "function" and type(rf) == "function" then
        isf = function(path)
            local ok, res = pcall(rf, path)
            return ok and res ~= nil and res ~= ""
        end
    end
    return wf, rf, isf
end

local function _keyName(key)
    if typeof(key) ~= "EnumItem" then return nil end
    return key.Name
end
local function _keyFrom(name)
    if type(name) ~= "string" or name == "" or name == "None" then return nil end
    local ok, k = pcall(function() return Enum.KeyCode[name] end)
    return (ok and k) or nil
end

local function _posOf(frame)
    if not frame then return nil end
    local p = frame.Position
    return { xs = p.X.Scale, xo = p.X.Offset, ys = p.Y.Scale, yo = p.Y.Offset }
end
local function _applyPos(frame, d)
    if not frame or type(d) ~= "table" or d.xs == nil then return end
    frame.Position = UDim2.new(d.xs, d.xo or 0, d.ys, d.yo or 0)
end

-- API stubs kept so existing call-sites keep working
function NoxaCfg.registerModule(name, getTable)
    if type(name) == "string" and type(getTable) == "function" then
        NoxaCfg.modules[name] = getTable
    end
end
_G.NoxaRegisterModule = NoxaCfg.registerModule

NoxaCfg.registerConfigExtra = function(name, getter, setter)
    if type(name) == "string" then
        NoxaCfg.extras[name] = { get = getter, set = setter }
    end
end
_G.NoxaRegisterConfigExtra = NoxaCfg.registerConfigExtra

function NoxaCfg.env() return _cfgEnv() end
function NoxaCfg.canSave()
    local wf = select(1, _cfgEnv())
    return type(wf) == "function"
end
function NoxaCfg.keyToString(key) return _keyName(key) or "None" end
function NoxaCfg.stringToKey(value) return _keyFrom(value) end
NoxaCfg.serialize = function(v) return v end
NoxaCfg.deserialize = function(v) return v end
NoxaCfg.collectTablePublic = function() return nil end
NoxaCfg.applyTablePublic = function(tbl, saved)
    if type(tbl) ~= "table" or type(saved) ~= "table" then return end
    for k, v in pairs(saved) do
        if type(k) == "string" and k:sub(1, 1) ~= "_" then tbl[k] = v end
    end
end
NoxaCfg.reapplyPendingModules = function() end
NoxaCfg.applyExtras = function() end
NoxaCfg.apply = function() end
NoxaCfg.collectKeybinds = function() return {} end
NoxaCfg.applyKeybinds = function() end
function NoxaCfg.shouldBlockInput(inp, gp)
    if gp then return true end
    if _G.NoxaKeyListening then return true end
    return false
end

-- Flat collect (Envy style) â€” only the fields that matter
function NoxaCfg.collect()
    local kb = SpeedSystem.keybinds or {}
    local mods = rawget(_G, "NoxaMods") or NoxaCfg.modules.NoxaMods and (select(1, pcall(NoxaCfg.modules.NoxaMods)))
    if type(mods) ~= "table" then mods = {} end
    local bat = rawget(_G, "BatAimbot") or rawget(_G, "NoxaBatAimbot")
    if type(bat) ~= "table" then bat = {} end

    local cfg = {
        version = CONFIG_VERSION,
        -- speeds
        NS = SpeedSystem.NS,
        CS = SpeedSystem.CS,
        LAGGER_NORMAL = SpeedSystem.LAGGER_NORMAL,
        LAGGER_CARRY = SpeedSystem.LAGGER_CARRY,
        speedMethod = SpeedSystem.speedMethod,
        carryActive = SpeedSystem.carryActive == true,
        laggerActive = SpeedSystem.laggerActive == true,

        -- movement / utility toggles
        autoCarryEnabled = SpeedSystem.autoCarryEnabled == true,
        autoStealEnabled = SpeedSystem.autoStealEnabled == true,
        stealMode = SpeedSystem.stealMode,
        stealRadius = SpeedSystem.stealRadius,
        stealDuration = SpeedSystem.stealDuration,
        stealBarStyle = SpeedSystem.stealBarStyle,
        v3BarScale = SpeedSystem.v3BarScale,
        infJumpEnabled = SpeedSystem.infJumpEnabled == true,
        infJumpMode = SpeedSystem.infJumpMode,
        antiRagdollEnabled = SpeedSystem.antiRagdollEnabled == true,
        antiRagdollMode = SpeedSystem.antiRagdollMode,
        autoDodgeEnabled = SpeedSystem.autoDodgeEnabled == true,
        autoTpDownEnabled = SpeedSystem.autoTpDownEnabled == true,
        autoTpDownHeight = SpeedSystem.autoTpDownHeight,
        antiDesyncAimbotEnabled = SpeedSystem.antiDesyncAimbotEnabled == true,
        antiDesyncAutoSwingEnabled = SpeedSystem.antiDesyncAutoSwingEnabled == true,
        tpBatVersion = SpeedSystem.tpBatVersion,
        instaResetOnDeathEnabled = SpeedSystem.instaResetOnDeathEnabled == true,
        removeAccessoriesEnabled = SpeedSystem.removeAccessoriesEnabled == true,
        noPlayerCollisionEnabled = SpeedSystem.noPlayerCollisionEnabled == true,
        safeModeEnabled = SpeedSystem.safeModeEnabled == true,
        antiDieEnabled = SpeedSystem.antiDieEnabled == true,
        bodyLockEnabled = SpeedSystem.bodyLockEnabled == true,
        dropMode = SpeedSystem.dropMode,

        -- ui
        uiScale = SpeedSystem.uiScale,
        uiSkin = SpeedSystem.uiSkin,
        menuOpen = SpeedSystem.menuOpen ~= false,
        tabPos = SpeedSystem.tabPos,
        bgImageIndex = SpeedSystem.bgImageIndex,
        bgImageEnabled = SpeedSystem.bgImageEnabled ~= false,
        bgImageTransparency = SpeedSystem.bgImageTransparency,
        fov = SpeedSystem.fov,
        animPack = SpeedSystem.animPack,
        introEnabled = false,

        -- keybinds (name strings)
        key_Carry = _keyName(kb.Carry),
        key_Lagger = _keyName(kb.Lagger),
        key_AutoLeft = _keyName(kb.AutoLeft),
        key_AutoRight = _keyName(kb.AutoRight),
        key_BatAimbot = _keyName(kb.BatAimbot),
        key_TPBat = _keyName(kb.TPBat),
        key_Drop = _keyName(SpeedSystem.dropBrainrotKeybind),
        key_TPDown = _keyName(SpeedSystem.tpDownKeybind),
        key_Reset = _keyName(SpeedSystem.instantResetKeybind),
        key_AutoDodge = _keyName(SpeedSystem.autoDodgeKeybind),

        -- AutoPath
        autoLeft = SpeedSystem.AutoPath and SpeedSystem.AutoPath.leftEnabled == true,
        autoRight = SpeedSystem.AutoPath and SpeedSystem.AutoPath.rightEnabled == true,

        -- mobile
        mobileButtons = SpeedSystem.mobileButtons,

        -- NoxaMods
        antiLag = mods.antiLagEnabled == true,
        nuke = mods.nukeEnabled == true,
        batCounter = mods.batCounterEnabled == true,
        batCounterMode = mods.batCounterMode,
        medusaCounter = mods.medusaCounterEnabled == true,

        -- bat aimbot
        batAimbot = bat.enabled == true,
        batAimbotVersion = bat.version,
        batAimbotSpeed = bat.speed,

        -- positions (safe: never error if UI not ready)
        mainPos = (function()
            local ok, f = pcall(function() return rawget(_G, "MainClip") or MainClip end)
            return ok and _posOf(f) or nil
        end)(),
        floatPos = (function()
            local ok, f = pcall(function() return rawget(_G, "FloatOpen") or FloatOpen end)
            return ok and _posOf(f) or nil
        end)(),
    }

    -- all registered extras (bool / number / string / simple tables / UDim2 / KeyCode)
    local function packVal(val, depth)
        depth = depth or 0
        local t = typeof(val)
        if t == "boolean" or t == "number" or t == "string" then return val end
        if t == "EnumItem" then return val.Name end
        if t == "UDim2" then
            return { xs = val.X.Scale, xo = val.X.Offset, ys = val.Y.Scale, yo = val.Y.Offset }
        end
        if t == "table" and depth < 3 then
            local out, n = {}, 0
            for k, v in pairs(val) do
                if type(k) == "string" or type(k) == "number" then
                    local pv = packVal(v, depth + 1)
                    if pv ~= nil then out[k] = pv; n = n + 1 end
                end
            end
            return n > 0 and out or nil
        end
        return nil
    end
    for name, def in pairs(NoxaCfg.extras) do
        if def and type(def.get) == "function" then
            local ok, val = pcall(def.get)
            if ok and val ~= nil then
                local packed = packVal(val)
                if packed ~= nil then
                    cfg["x_" .. name] = packed
                end
            end
        end
    end
    return cfg
end

-- Fast async save: never blocks UI / toggles / arrows
-- collect + writefile run in a background thread; backup rare; no verify read
NoxaCfg._writePending = false
NoxaCfg._writing = false
NoxaCfg._lastSaveOk = nil
NoxaCfg._saveToken = 0
NoxaCfg._lastBackupAt = 0

local function _cfgDelfile()
    local g = (type(getgenv) == "function" and getgenv()) or _G or {}
    return delfile or g.delfile or (syn and syn.delfile)
end

NoxaCfg._doWrite = function()
    if NoxaCfg._writing then
        -- already writing: mark dirty so a follow-up pass runs
        NoxaCfg.dirty = true
        return
    end
    NoxaCfg._writing = true
    NoxaCfg._writePending = false
    NoxaCfg._saveToken = (NoxaCfg._saveToken or 0) + 1
    local token = NoxaCfg._saveToken

    task.spawn(function()
        local success = false
        pcall(function()
            local wf, rf, isf = _cfgEnv()
            if type(wf) ~= "function" then return end

            -- collect + encode off the toggle path (this thread only)
            local cfg = NoxaCfg.collect()
            local enc = NoxaCfg.http:JSONEncode(cfg)
            if type(enc) ~= "string" or #enc < 3 then return end

            -- backup at most once every 30s (not every toggle)
            local now = os.clock()
            if type(rf) == "function" and (now - (NoxaCfg._lastBackupAt or 0)) > 30 then
                local oldRaw
                pcall(function()
                    local has = true
                    if type(isf) == "function" then has = isf(CONFIG_FILE) end
                    if has then oldRaw = rf(CONFIG_FILE) end
                end)
                if type(oldRaw) == "string" and #oldRaw > 2 then
                    pcall(function() wf(CONFIG_BACKUP, oldRaw) end)
                    NoxaCfg._lastBackupAt = now
                end
            end

            -- single write (no verify read â€” that was freezing the game)
            wf(CONFIG_FILE, enc)
            success = true
        end)

        if token == NoxaCfg._saveToken then
            NoxaCfg._lastSaveOk = success
            if success then
                NoxaCfg.dirty = false
            end
            NoxaCfg._writing = false
            -- if something changed while we wrote, schedule one more pass
            if NoxaCfg.dirty and not NoxaCfg._writePending then
                NoxaCfg._writePending = true
                task.delay(0.25, function()
                    NoxaCfg._writePending = false
                    if NoxaCfg.dirty then
                        NoxaCfg._doWrite()
                    end
                end)
            end
        else
            NoxaCfg._writing = false
        end
    end)
end

NoxaCfg.saveConfig = function(force)
    NoxaCfg.dirty = true
    if NoxaCfg._writePending then return true end
    NoxaCfg._writePending = true
    -- short debounce: coalesce spam from arrows/toggles
    local delaySec = (force == true) and 0.08 or 0.35
    task.delay(delaySec, function()
        NoxaCfg._writePending = false
        if NoxaCfg.dirty then
            NoxaCfg._doWrite()
        end
    end)
    return true
end
_G.NoxaSaveConfig = function() return NoxaCfg.saveConfig(true) end

NoxaCfg.markConfigDirty = function()
    NoxaCfg.dirty = true
    if not NoxaCfg._writePending then
        NoxaCfg.saveConfig(false)
    end
end
_G.NoxaMarkDirty = NoxaCfg.markConfigDirty

NoxaCfg.loadConfig = function()
    if NoxaCfg.loaded then return end
    NoxaCfg.loaded = true
    local wf, rf, isf = _cfgEnv()
    if type(rf) ~= "function" then return end

    -- Green style: try main file, then backup
    local raw = nil
    local function tryRead(path)
        local has = false
        pcall(function()
            if type(isf) == "function" then has = isf(path) else has = true end
        end)
        if not has then return nil end
        local content
        pcall(function() content = rf(path) end)
        if type(content) == "string" and content ~= "" then return content end
        return nil
    end
    raw = tryRead(CONFIG_FILE)
    if not raw then
        raw = tryRead(CONFIG_BACKUP)
        if raw then
            print("[Noxa] Loaded config from backup")
        end
    end
    if not raw then
        print("[Noxa] No valid config file found, using defaults")
        return
    end

    local cfg
    local okDecode = pcall(function() cfg = NoxaCfg.http:JSONDecode(raw) end)
    if not okDecode or type(cfg) ~= "table" then
        -- corrupt: delete like Green
        local df = _cfgDelfile()
        if type(df) == "function" then
            pcall(function() df(CONFIG_FILE) end)
            pcall(function() df(CONFIG_BACKUP) end)
        end
        warn("[Noxa] Corrupt config deleted, using defaults")
        return
    end
    NoxaCfg.pending = cfg

    -- apply SpeedSystem scalars immediately (Envy style)
    local numMap = {
        NS = "NS", CS = "CS", LAGGER_NORMAL = "LAGGER_NORMAL", LAGGER_CARRY = "LAGGER_CARRY",
        stealRadius = "stealRadius", stealDuration = "stealDuration", v3BarScale = "v3BarScale",
        autoTpDownHeight = "autoTpDownHeight", uiScale = "uiScale",
        bgImageIndex = "bgImageIndex", bgImageTransparency = "bgImageTransparency", fov = "fov",
        dropMode = "dropMode",
    }
    for src, dst in pairs(numMap) do
        if type(cfg[src]) == "number" then SpeedSystem[dst] = cfg[src] end
    end
    local strMap = {
        speedMethod = true, stealMode = true, stealBarStyle = true, infJumpMode = true,
        antiRagdollMode = true, tpBatVersion = true, uiSkin = true, tabPos = true,
        animPack = true,
    }
    for k in pairs(strMap) do
        if type(cfg[k]) == "string" then SpeedSystem[k] = cfg[k] end
    end
    local boolMap = {
        "carryActive", "laggerActive", "autoCarryEnabled", "autoStealEnabled",
        "infJumpEnabled", "antiRagdollEnabled", "autoDodgeEnabled", "autoTpDownEnabled",
        "antiDesyncAimbotEnabled", "antiDesyncAutoSwingEnabled", "instaResetOnDeathEnabled",
        "removeAccessoriesEnabled", "noPlayerCollisionEnabled", "safeModeEnabled",
        "antiDieEnabled", "bodyLockEnabled", "bgImageEnabled", "menuOpen",
    }
    for _, k in ipairs(boolMap) do
        if cfg[k] ~= nil then SpeedSystem[k] = cfg[k] == true end
    end
    SpeedSystem.introEnabled = false

    -- keybinds
    local function setKb(id, name)
        local k = _keyFrom(name)
        if k and SpeedSystem.keybinds then SpeedSystem.keybinds[id] = k end
    end
    setKb("Carry", cfg.key_Carry)
    setKb("Lagger", cfg.key_Lagger)
    setKb("AutoLeft", cfg.key_AutoLeft)
    setKb("AutoRight", cfg.key_AutoRight)
    setKb("BatAimbot", cfg.key_BatAimbot)
    setKb("TPBat", cfg.key_TPBat)
    do
        local k = _keyFrom(cfg.key_Drop); if k then SpeedSystem.dropBrainrotKeybind = k end
        k = _keyFrom(cfg.key_TPDown); if k then SpeedSystem.tpDownKeybind = k end
        k = _keyFrom(cfg.key_Reset); if k then SpeedSystem.instantResetKeybind = k end
        k = _keyFrom(cfg.key_AutoDodge); if k then SpeedSystem.autoDodgeKeybind = k end
    end

    if type(cfg.mobileButtons) == "table" and type(SpeedSystem.mobileButtons) == "table" then
        for k, v in pairs(cfg.mobileButtons) do SpeedSystem.mobileButtons[k] = v end
    end
    if SpeedSystem.AutoPath then
        if cfg.autoLeft ~= nil then SpeedSystem.AutoPath.leftEnabled = cfg.autoLeft == true end
        if cfg.autoRight ~= nil then SpeedSystem.AutoPath.rightEnabled = cfg.autoRight == true end
    end

    NoxaCfg.dirty = false
    NoxaCfg._extrasApplied = false
end
_G.NoxaLoadConfig = NoxaCfg.loadConfig

-- Apply flags that need live modules (NoxaMods / BatAimbot / extras) after UI is up
NoxaCfg.reapplyConfigExtras = function()
    if NoxaCfg._extrasApplied then return end
    NoxaCfg._extrasApplied = true
    local cfg = NoxaCfg.pending
    if type(cfg) ~= "table" then return end

    local function unpackVal(val)
        if type(val) == "table" and val.xs ~= nil and val.ys ~= nil and val.xo ~= nil then
            return UDim2.new(val.xs, val.xo or 0, val.ys, val.yo or 0)
        end
        return val
    end

    local mods = rawget(_G, "NoxaMods")
    if type(mods) == "table" then
        local antiLag = cfg.antiLag
        if antiLag == nil and cfg.x_antiLagEnabled ~= nil then antiLag = cfg.x_antiLagEnabled end
        if antiLag ~= nil then
            mods.antiLagEnabled = antiLag == true
            pcall(function() if mods.setAntiLag then mods:setAntiLag(mods.antiLagEnabled) end end)
        end
        local nuke = cfg.nuke
        if nuke == nil and cfg.x_nukeEnabled ~= nil then nuke = cfg.x_nukeEnabled end
        if nuke ~= nil then
            mods.nukeEnabled = nuke == true
            pcall(function() if mods.setNukeOptimizer then mods:setNukeOptimizer(mods.nukeEnabled) end end)
        end
        local bc = cfg.batCounter
        if bc == nil and cfg.x_batCounterEnabled ~= nil then bc = cfg.x_batCounterEnabled end
        if bc ~= nil then mods.batCounterEnabled = bc == true end
        if type(cfg.batCounterMode) == "string" then mods.batCounterMode = cfg.batCounterMode
        elseif type(cfg.x_batCounterMode) == "string" then mods.batCounterMode = cfg.x_batCounterMode end
        if cfg.medusaCounter ~= nil then mods.medusaCounterEnabled = cfg.medusaCounter == true end
    end

    local bat = rawget(_G, "BatAimbot") or rawget(_G, "NoxaBatAimbot")
    if type(bat) == "table" then
        if cfg.batAimbot ~= nil then bat.enabled = cfg.batAimbot == true end
        if type(cfg.batAimbotVersion) == "string" then
            local v = cfg.batAimbotVersion
            if v ~= "V2" and v ~= "V3" then v = "V2" end
            bat.version = v
        end
        if type(cfg.batAimbotSpeed) == "number" then bat.speed = cfg.batAimbotSpeed end
    end

    -- ALL registered extras (setters do the real enable work)
    for name, def in pairs(NoxaCfg.extras) do
        local val = cfg["x_" .. name]
        if val == nil and cfg[name] ~= nil then val = cfg[name] end
        if val ~= nil and def and type(def.set) == "function" then
            pcall(def.set, unpackVal(val))
        end
    end

    -- positions (after UI exists)
    task.defer(function()
        task.wait(0.1)
        pcall(function()
            local main = rawget(_G, "MainClip") or MainClip
            local flt = rawget(_G, "FloatOpen") or FloatOpen
            local mp = cfg.mainPos or cfg.x_mainPosition
            local fp = cfg.floatPos or cfg.x_floatPosition
            _applyPos(main, mp)
            _applyPos(flt, fp)
        end)
        -- mobile buttons: re-apply hidden/lock/style after gui exists
        pcall(function()
            if type(_G.NoxaMobileApplyHidden) == "function" then _G.NoxaMobileApplyHidden() end
            if type(_G.NoxaMobileApplyStyle) == "function" then _G.NoxaMobileApplyStyle() end
            if type(_G.NoxaMobileApplyLock) == "function" then _G.NoxaMobileApplyLock() end
        end)
    end)
end

NoxaCfg.startAutoSave = function()
    if NoxaCfg.autoSaveStarted then return end
    NoxaCfg.autoSaveStarted = true
    -- periodic flush every 12s if dirty (non-blocking)
    task.spawn(function()
        while true do
            task.wait(12)
            if NoxaCfg.dirty then
                pcall(NoxaCfg._doWrite)
            end
        end
    end)
    -- leave / teleport: write ASAP on a background thread
    pcall(function()
        Players.PlayerRemoving:Connect(function(plr)
            if plr == LP then task.spawn(NoxaCfg._doWrite) end
        end)
    end)
    pcall(function()
        if LP.OnTeleport then
            LP.OnTeleport:Connect(function()
                task.spawn(NoxaCfg._doWrite)
            end)
        end
    end)
end

pcall(NoxaCfg.loadConfig)

for _, n in ipairs({
    "NoxaHub","RaVe","AdaptHubPolished","AceDuelsAdaptReconstruct","CyberHub",
    "NoxaStealBarGui","NoxaMobileButtons","NoxaEspDraw","NoxaRagdollToast",
    "AutoGrab","K7StealBarGui"
}) do
    local old = PlayerGui:FindFirstChild(n)
    if old then old:Destroy() end
end

pcall(function()
    local cg = game:GetService("CoreGui")
    for _, n in ipairs({"NoxaHub","NoxaStealBarGui","AutoGrab","K7StealBarGui"}) do
        local o = cg:FindFirstChild(n)
        if o then o:Destroy() end
    end
end)

local ACCENT       = Color3.fromRGB( 70, 170, 255)
local FX = {}
FX.A2              = Color3.fromRGB(150, 210, 255)
FX.AD              = Color3.fromRGB( 30, 100, 190)
local BG_MAIN      = Color3.fromRGB(  9,  12,  18)
BG_DARKER    = Color3.fromRGB(  4,   6,  10)
local ROW_BG       = Color3.fromRGB( 16,  22,  32)
local INPUT_BG     = Color3.fromRGB( 12,  18,  26)
local WHITE        = Color3.fromRGB(255, 255, 255)
local TEXT_MAIN    = Color3.fromRGB(240, 248, 255)
local TEXT_DIM     = Color3.fromRGB(125, 145, 165)
TEXT_SECTION = Color3.fromRGB(110, 190, 255)
TOGGLE_OFF   = Color3.fromRGB( 32,  38,  52)
local TOGGLE_ON    = ACCENT
KNOB_OFF     = Color3.fromRGB(200, 210, 225)
KNOB_ON      = Color3.fromRGB(  8,  12,  16)

FX.SEQ = ColorSequence.new({
    ColorSequenceKeypoint.new(0,   Color3.fromRGB( 40, 130, 230)),
    ColorSequenceKeypoint.new(0.5, Color3.fromRGB(100, 190, 255)),
    ColorSequenceKeypoint.new(1,   Color3.fromRGB( 40, 130, 230)),
})

local G = {
    FAST = TweenInfo.new(0.15, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
    MED  = TweenInfo.new(0.28, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
    BACK = TweenInfo.new(0.40, Enum.EasingStyle.Back, Enum.EasingDirection.Out),
    DK_C = ColorSequence.new({
        ColorSequenceKeypoint.new(0,    Color3.fromRGB( 40, 130, 230)),
        ColorSequenceKeypoint.new(0.35, Color3.fromRGB(100, 190, 255)),
        ColorSequenceKeypoint.new(0.65, Color3.fromRGB(100, 190, 255)),
        ColorSequenceKeypoint.new(1,    Color3.fromRGB( 40, 130, 230)),
    }),
    DK_T = NumberSequence.new({
        NumberSequenceKeypoint.new(0,    0.42, 0),
        NumberSequenceKeypoint.new(0.35, 0.72, 0),
        NumberSequenceKeypoint.new(0.7,  0.72, 0),
        NumberSequenceKeypoint.new(1,    0.45, 0),
    }),
    LT_C = ColorSequence.new({
        ColorSequenceKeypoint.new(0,    Color3.fromRGB(160,200,255)),
        ColorSequenceKeypoint.new(0.5,  Color3.fromRGB(160,200,255)),
        ColorSequenceKeypoint.new(1,    Color3.fromRGB(160,200,255)),
    }),

    LT_T = NumberSequence.new({
        NumberSequenceKeypoint.new(0,    0.55, 0),
        NumberSequenceKeypoint.new(0.25, 0.15, 0),
        NumberSequenceKeypoint.new(0.5,  0,    0),
        NumberSequenceKeypoint.new(0.75, 0.15, 0),
        NumberSequenceKeypoint.new(1,    0.55, 0),
    }),
    ARROW_GLOW_T = NumberSequence.new({
        NumberSequenceKeypoint.new(0,    0.82, 0),
        NumberSequenceKeypoint.new(0.28, 0.06, 0),
        NumberSequenceKeypoint.new(0.52, 0.22, 0),
        NumberSequenceKeypoint.new(1,    0.82, 0),
    }),
}

local NoxaUI = {}
function NoxaUI.tw(obj, info, props)
    TweenService:Create(obj, info, props):Play()
end

function NoxaUI.new(cls, props)
    local i = Instance.new(cls)
    for k, v in pairs(props) do
        if k ~= "Parent" then i[k] = v end
    end
    if props.Parent then i.Parent = props.Parent end
    return i
end

function NoxaUI.corner(parent, r)



    r = r or 10
    if r >= 99 then
        return NoxaUI.new("UICorner", {CornerRadius = UDim.new(1, 0), Parent = parent})
    end
    return NoxaUI.new("UICorner", {CornerRadius = UDim.new(0, r), Parent = parent})
end

function NoxaUI.darkStroke(parent, thick)

    local s = NoxaUI.new("UIStroke", {
        Color = WHITE, Thickness = 0,
        Transparency = 1,
        ApplyStrokeMode = Enum.ApplyStrokeMode.Border, Parent = parent,
    })
    return s
end

function NoxaUI.lightStroke(parent, thick)

    local s = NoxaUI.new("UIStroke", {
        Color = WHITE, Thickness = 0,
        Transparency = 1,
        ApplyStrokeMode = Enum.ApplyStrokeMode.Border, Parent = parent,
    })
    return s
end

do
    local shimmerTargets = {}
    local pulseTargets   = {}


    function FX.shimmer(grad, speed)
        table.insert(shimmerTargets, {grad=grad, speed=speed or 26, offset=math.random()*360})
    end


    function FX.pulse(stroke, base, amp, speed)
        table.insert(pulseTargets, {stroke=stroke, base=base or 0.72, amp=amp or 0.16, speed=speed or 2.2})
    end


    local _fxAcc = 0
    if _G._NoxaFxPulseConn then pcall(function() _G._NoxaFxPulseConn:Disconnect() end) end
    _G._NoxaFxPulseConn = _G._NoxaTrackConn(RunService.Heartbeat:Connect(function(dt)
        _fxAcc = _fxAcc + (dt or 0.016)
        if _fxAcc < 0.16 then return end
        _fxAcc = 0
        if MainClip and not MainClip.Visible then return end
        local t = tick()
        for _, d in ipairs(shimmerTargets) do
            if d.grad and d.grad.Parent then
                d.grad.Rotation = (d.offset + t * d.speed) % 360
            end
        end
        for _, d in ipairs(pulseTargets) do
            if d.stroke and d.stroke.Parent then
                d.stroke.Transparency = d.base + math.sin(t * d.speed) * d.amp
            end
        end
    end))



    function FX.shadow(_frame, _spread, _alpha)
        return nil
    end


    function FX.interactive(el, opts)
        opts = opts or {}
        local baseT = opts.baseT or el.BackgroundTransparency
        local hoverT = opts.hoverT or math.max(baseT - 0.14, 0)
        local glow = NoxaUI.new("UIStroke", {
            Name = "HoverGlow", Color = ACCENT, Thickness = 3,
            Transparency = 1, ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
            Parent = el,
        })
        FX.shimmer(NoxaUI.new("UIGradient", {Color = FX.SEQ, Parent = glow}), 40)
        local function enter()
            NoxaUI.tw(el, G.FAST, {BackgroundTransparency = hoverT})
            NoxaUI.tw(glow, G.FAST, {Transparency = 0.55})
        end
        local function leave()
            NoxaUI.tw(el, G.FAST, {BackgroundTransparency = baseT})
            NoxaUI.tw(glow, G.FAST, {Transparency = 1})
        end
        el.MouseEnter:Connect(enter)
        el.MouseLeave:Connect(leave)
        return glow
    end


    function FX.ripple(el)
        el.InputBegan:Connect(function(i)
            if i.UserInputType ~= Enum.UserInputType.MouseButton1
            and i.UserInputType ~= Enum.UserInputType.Touch then return end
            local host = el:IsA("GuiObject") and el or el.Parent
            local ring = NoxaUI.new("Frame", {
                AnchorPoint = Vector2.new(0.5, 0.5),
                Position = UDim2.new(0, i.Position.X - host.AbsolutePosition.X,
                                     0, i.Position.Y - host.AbsolutePosition.Y),
                Size = UDim2.new(0, 0, 0, 0),
                BackgroundColor3 = ACCENT, BackgroundTransparency = 0.55,
                BorderSizePixel = 0, ZIndex = 30, Parent = host,
            })
            NoxaUI.new("UICorner", {CornerRadius = UDim.new(1, 0), Parent = ring})
            NoxaUI.tw(ring, TweenInfo.new(0.45, Enum.EasingStyle.Quint, Enum.EasingDirection.Out),
               {Size = UDim2.new(0, 240, 0, 240), BackgroundTransparency = 1})
            task.delay(0.5, function() ring:Destroy() end)
        end)
    end
end

local ToggleStates = {}

ToggleStates.__cbs = {}
ToggleStates.__on = function(row, fn)
    if not row or not fn then return end
    local t = ToggleStates.__cbs
    t[row] = t[row] or {}
    table.insert(t[row], fn)
end

local AccentRegistry = {}
function NoxaUI.regAccent(inst, prop)
    table.insert(AccentRegistry, {inst=inst, prop=prop or "BackgroundColor3"})
end

THEMES = {
    {name="Noxa Blue",  accent=Color3.fromRGB(70, 170, 255), a2=Color3.fromRGB(140,190,255), ad=Color3.fromRGB(40,90,170)},
    {name="Noxa Ice",   accent=Color3.fromRGB(100,180,255), a2=Color3.fromRGB(180,220,255), ad=Color3.fromRGB(50,110,180)},
    {name="Noxa Night", accent=Color3.fromRGB(50,100,200), a2=Color3.fromRGB(110,160,240), ad=Color3.fromRGB(25,60,140)},
}

function NoxaUI.mixC(a, b, t) return a:Lerp(b, t) end
function NoxaUI.lighten(c, t) return NoxaUI.mixC(c, Color3.fromRGB(255,255,255), t) end
function NoxaUI.darken(c, t)  return NoxaUI.mixC(c, Color3.fromRGB(0,0,0), t) end

function NoxaUI.ckey(c)
    return string.format("%d,%d,%d",
        math.floor(c.R*255+0.5), math.floor(c.G*255+0.5), math.floor(c.B*255+0.5))
end

local ROLE = {}
function NoxaUI.role(baseRGB, fn) ROLE[NoxaUI.ckey(Color3.fromRGB(unpack(baseRGB)))] = fn end
NoxaUI.role({ 80,180,255}, function(t) return t.accent end)
NoxaUI.role({100,200,255}, function(t) return t.a2 end)
NoxaUI.role({ 80,180,255}, function(t) return t.ad end)
NoxaUI.role({158,226,206…"
 content://media/external/downloads/1000091598#:~:text=%2D%2D%20NOXA%20DUELS%20%C3%A2,openMain%2C%0A%20%20%20%20closeMain%20%3D%20closeMain%2C%0A%7D