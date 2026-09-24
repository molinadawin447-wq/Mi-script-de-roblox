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

--------------------------------------------------------------------------------
-- 2. PANEL IZQUIERDO DESPLEGABLE (SIN FONDO, MISMO TAMAÑO Y ESTRUCTURA)
--------------------------------------------------------------------------------
local sidePanel = Instance.new("Frame")
sidePanel.Name = "SidePanel"
sidePanel.AnchorPoint = Vector2.new(0, 0)
sidePanel.Position = UDim2.new(0, 160, 0, 10) -- Alineado en el centro/izquierda como en la foto
sidePanel.Size = UDim2.new(0, 220, 0, 360) -- Alto rectangular idéntico al de la imagen
sidePanel.BackgroundTransparency = 1 -- SIN FONDO
sidePanel.BorderSizePixel = 0
sidePanel.Visible = false
sidePanel.Parent = screenGui

-- Título BRAxIL HUB (Arriba)
local titleLabel = Instance.new("TextLabel")
titleLabel.Name = "TitleLabel"
titleLabel.Text = "BRAxIL HUB\nHUB • PREMIUM"
titleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
titleLabel.Font = Enum.Font.SourceSansBold
titleLabel.TextSize = 14
titleLabel.Size = UDim2.new(1, -40, 0, 30)
titleLabel.Position = UDim2.new(0, 10, 0, 5)
titleLabel.BackgroundTransparency = 1
titleLabel.TextXAlignment = Enum.TextXAlignment.Left
titleLabel.Parent = sidePanel

-- Botón Minimizar (-)
local minimizeBtn = Instance.new("TextButton")
minimizeBtn.Name = "MinimizeButton"
minimizeBtn.Text = "-"
minimizeBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
minimizeBtn.Font = Enum.Font.SourceSansBold
minimizeBtn.TextSize = 18
minimizeBtn.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
minimizeBtn.BackgroundTransparency = 0.3
minimizeBtn.BorderSizePixel = 0
minimizeBtn.Position = UDim2.new(1, -25, 0, 5)
minimizeBtn.Size = UDim2.new(0, 20, 0, 20)
minimizeBtn.Parent = sidePanel

local minCorner = Instance.new("UICorner")
minCorner.CornerRadius = UDim.new(0, 4)
minCorner.Parent = minimizeBtn

-- Pestañas laterales del borde derecho (Velocidad, Combate, Steal, etc.)
local tabFrame = Instance.new("Frame")
tabFrame.Name = "TabFrame"
tabFrame.Size = UDim2.new(0, 60, 1, -40)
tabFrame.Position = UDim2.new(1, -60, 0, 40)
tabFrame.BackgroundTransparency = 1
tabFrame.Parent = sidePanel

local tabList = Instance.new("UIListLayout")
tabList.SortOrder = Enum.SortOrder.LayoutOrder
tabList.Padding = UDim.new(0, 12)
tabList.HorizontalAlignment = Enum.HorizontalAlignment.Center
tabList.Parent = tabFrame

local tabs = {"Velocidad", "Combate", "Steal", "Movement", "Visual"}
for _, tabName in ipairs(tabs) do
	local tabBtn = Instance.new("TextButton")
	tabBtn.Size = UDim2.new(1, 0, 0, 18)
	tabBtn.BackgroundTransparency = 1
	tabBtn.Text = tabName
	tabBtn.TextColor3 = Color3.fromRGB(200, 200, 200)
	tabBtn.Font = Enum.Font.SourceSans
	tabBtn.TextSize = 11
	tabBtn.Parent = tabFrame
end

-- Contenedor principal para los ajustes (Izquierda)
local scrollContent = Instance.new("ScrollingFrame")
scrollContent.Name = "ScrollContent"
scrollContent.Size = UDim2.new(1, -65, 1, -40)
scrollContent.Position = UDim2.new(0, 5, 0, 40)
scrollContent.BackgroundTransparency = 1
scrollContent.BorderSizePixel = 0
scrollContent.ScrollBarThickness = 2
scrollContent.CanvasSize = UDim2.new(0, 0, 0, 320)
scrollContent.Parent = sidePanel

local contentList = Instance.new("UIListLayout")
contentList.SortOrder = Enum.SortOrder.LayoutOrder
contentList.Padding = UDim.new(0, 8)
contentList.Parent = scrollContent

-- Función auxiliar para crear etiquetas de sección
local function createSectionHeader(text)
	local label = Instance.new("TextLabel")
	label.Size = UDim2.new(1, 0, 0, 15)
	label.BackgroundTransparency = 1
	label.Text = text
	label.TextColor3 = Color3.fromRGB(150, 150, 150)
	label.Font = Enum.Font.SourceSansBold
	label.TextSize = 10
	label.TextXAlignment = Enum.TextXAlignment.Left
	label.Parent = scrollContent
end

-- Función auxiliar para crear elementos con cuadro de texto (Input Value)
local function createInputRow(labelText, defaultValue)
	local row = Instance.new("Frame")
	row.Size = UDim2.new(1, 0, 0, 28)
	row.BackgroundTransparency = 1
	row.Parent = scrollContent

	local txt = Instance.new("TextLabel")
	txt.Size = UDim2.new(0.65, 0, 1, 0)
	txt.BackgroundTransparency = 1
	txt.Text = labelText
	txt.TextColor3 = Color3.fromRGB(255, 255, 255)
	txt.Font = Enum.Font.SourceSans
	txt.TextSize = 11
	txt.TextXAlignment = Enum.TextXAlignment.Left
	txt.Parent = row

	local box = Instance.new("TextBox")
	box.Size = UDim2.new(0.3, 0, 0.8, 0)
	box.Position = UDim2.new(0.7, 0, 0.1, 0)
	box.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
	box.BackgroundTransparency = 0.4
	box.Text = defaultValue
	box.TextColor3 = Color3.fromRGB(255, 255, 255)
	box.Font = Enum.Font.SourceSansBold
	box.TextSize = 11
	box.Parent = row

	local corner = Instance.new("UICorner")
	corner.CornerRadius = UDim.new(0, 4)
	corner.Parent = box
end

-- Construcción de opciones internas del panel
createSectionHeader("SPEED CONFIGURATION")
createInputRow("Velocidad Normal", "30")
createInputRow("Velocidad de transporte", "29")

createSectionHeader("LAGGER MODE")
createInputRow("Lagger Normal", "30")
createInputRow("Carga de retrasador", "15")

createSectionHeader("CONTROLS")
createInputRow("Carry Mode", "C")
createInputRow("Modo Lagger", "K")

--------------------------------------------------------------------------------
-- 3. BOTÓN IZQUIERDO (BRAxIL HUB)
--------------------------------------------------------------------------------
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
