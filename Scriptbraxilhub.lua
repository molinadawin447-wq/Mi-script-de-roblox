local Players = game:GetService("Players")
local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

local screenGui = Instance.new("ScreenGui")
screenGui.Name = "CustomMenuGui"
screenGui.ResetOnSpawn = false
screenGui.Parent = playerGui

--------------------------------------------------------------------------------
-- 1. MENÚ PRINCIPAL (LADO DERECHO)
--------------------------------------------------------------------------------
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

-- Configuración de botones basada en la imagen (3 columnas)
local buttonData = {
	-- Fila 1
	{ text = "INSTA\nRESET", bType = "Flash" },
	{ text = "AUTO\nLEFT", bType = "Toggle" },
	{ text = "AUTO\nRIGHT", bType = "Toggle" },
	
	-- Fila 2
	{ text = "BAT\nV2", bType = "Toggle" },
	{ text = "BAT\nAIMBOT", bType = "Toggle" },
	{ text = "LAGGER\nMODE", bType = "Toggle" },
	
	-- Fila 3
	{ text = "", bType = "None" }, -- Espacio vacío
	{ text = "CARRY\nSPD", bType = "Toggle" },
	{ text = "DROP\nBR", bType = "Flash" },
	
	-- Fila 4
	{ text = "", bType = "None" }, -- Espacio vacío
	{ text = "TP\nDOWN", bType = "Flash" },
	{ text = "TP\nBAT", bType = "Flash" }
}

for index, data in ipairs(buttonData) do
	if data.bType ~= "None" then
		local button = Instance.new("TextButton")
		button.Name = "Btn_" .. index
		button.Text = data.text
		button.TextColor3 = Color3.fromRGB(255, 255, 255) -- Texto blanco
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

--------------------------------------------------------------------------------
-- 2. PANEL IZQUIERDO DESPLEGABLE (MÁS ANCHO, MISMA ALTURA)
--------------------------------------------------------------------------------
local sidePanel = Instance.new("Frame")
sidePanel.Name = "SidePanel"
sidePanel.AnchorPoint = Vector2.new(0, 0)
sidePanel.Position = UDim2.new(0, 15, 0, 10)
sidePanel.Size = UDim2.new(0, 280, 0, 280) -- Más ancho, misma altura
sidePanel.BackgroundColor3 = Color3.fromRGB(10, 10, 10)
sidePanel.BorderSizePixel = 0
sidePanel.Visible = false
sidePanel.Parent = screenGui

local panelCorner = Instance.new("UICorner")
panelCorner.CornerRadius = UDim.new(0, 12)
panelCorner.Parent = sidePanel

local titleLabel = Instance.new("TextLabel")
titleLabel.Name = "TitleLabel"
titleLabel.Text = "HUB PANEL"
titleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
titleLabel.Font = Enum.Font.SourceSansBold
titleLabel.TextSize = 18
titleLabel.Size = UDim2.new(1, -40, 0, 30)
titleLabel.Position = UDim2.new(0, 10, 0, 8)
titleLabel.BackgroundTransparency = 1
titleLabel.TextXAlignment = Enum.TextXAlignment.Left
titleLabel.Parent = sidePanel

local minimizeBtn = Instance.new("TextButton")
minimizeBtn.Name = "MinimizeButton"
minimizeBtn.Text = "-"
minimizeBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
minimizeBtn.Font = Enum.Font.SourceSansBold
minimizeBtn.TextSize = 22
minimizeBtn.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
minimizeBtn.BorderSizePixel = 0
minimizeBtn.Position = UDim2.new(1, -30, 0, 8)
minimizeBtn.Size = UDim2.new(0, 22, 0, 22)
minimizeBtn.Parent = sidePanel

local minCorner = Instance.new("UICorner")
minCorner.CornerRadius = UDim.new(0, 6)
minCorner.Parent = minimizeBtn

local separator = Instance.new("Frame")
separator.Name = "Separator"
separator.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
separator.BorderSizePixel = 0
separator.Position = UDim2.new(0, 10, 0, 42)
separator.Size = UDim2.new(1, -20, 0, 2)
separator.Parent = sidePanel

--------------------------------------------------------------------------------
-- 3. BOTÓN IZQUIERDO (BRAxIL HUB) - SIN BORDE
--------------------------------------------------------------------------------
local leftButton = Instance.new("TextButton")
leftButton.Name = "LeftMenuButton"
leftButton.Text = "BRAxIL HUB"
leftButton.TextColor3 = Color3.fromRGB(255, 255, 255) -- Texto blanco
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

local function togglePanel()
	sidePanel.Visible = not sidePanel.Visible
	if sidePanel.Visible then
		leftButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		leftButton.TextColor3 = Color3.fromRGB(0, 0, 0)
	else
		leftButton.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
		leftButton.TextColor3 = Color3.fromRGB(255, 255, 255)
	end
end

leftButton.MouseButton1Click:Connect(togglePanel)
minimizeBtn.MouseButton1Click:Connect(togglePanel)