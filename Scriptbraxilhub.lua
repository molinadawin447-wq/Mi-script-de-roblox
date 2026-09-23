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
mainFrame.Position = UDim2.new(1, -15, 0, 15) -- Margen superior y derecho
mainFrame.Size = UDim2.new(0, 280, 0, 280)
mainFrame.BackgroundTransparency = 1
mainFrame.Parent = screenGui

local gridLayout = Instance.new("UIGridLayout")
gridLayout.Parent = mainFrame
gridLayout.CellSize = UDim2.new(0, 60, 0, 60)
gridLayout.CellPadding = UDim2.new(0, 8, 0, 8)
gridLayout.HorizontalAlignment = Enum.HorizontalAlignment.Right
gridLayout.VerticalAlignment = Enum.VerticalAlignment.Top
gridLayout.SortOrder = Enum.SortOrder.LayoutOrder

-- Definición de cada botón según su posición en la cuadrícula
local buttonData = {
	-- Columna 1
	{ text = "INSTA\nRESET", bType = "Flash" },
	{ text = "", bType = "None" },
	{ text = "", bType = "None" },
	{ text = "", bType = "None" },
	
	-- Columna 2
	{ text = "HABILIDAD\nUNO", bType = "Toggle" },
	{ text = "HABILIDAD\nDOS", bType = "Toggle" },
	{ text = "", bType = "None" },
	{ text = "", bType = "None" },
	
	-- Columna 3
	{ text = "AUTO\nLEFT", bType = "Toggle" },
	{ text = "HABILIDAD\nTRES", bType = "Toggle" },
	{ text = "MODO\nDOWN", bType = "Flash" },
	{ text = "HABILIDAD\nCUATRO", bType = "Toggle" },
	
	-- Columna 4
	{ text = "AUTO\nRIGHT", bType = "Toggle" },
	{ text = "DROP\nITEM", bType = "Flash" },
	{ text = "HABILIDAD\nCINCO", bType = "Toggle" },
	{ text = "HABILIDAD\nSEIS", bType = "Toggle" }
}

-- Reorganización por filas para el UIGridLayout (4x4)
local gridOrder = {1, 5, 9, 13, 2, 6, 10, 14, 3, 7, 11, 15, 4, 8, 12, 16}

for _, index in ipairs(gridOrder) do
	local data = buttonData[index]
	
	if data.bType ~= "None" then
		local button = Instance.new("TextButton")
		button.Name = "Btn_" .. index
		button.Text = data.text
		button.TextColor3 = Color3.fromRGB(255, 255, 255)
		button.Font = Enum.Font.SourceSansBold
		button.TextSize = 11
		button.TextWrapped = true
		button.BackgroundColor3 = Color3.fromRGB(5, 5, 5) -- Negro más oscuro
		button.BorderSizePixel = 0
		button.Parent = mainFrame

		local uiCorner = Instance.new("UICorner")
		uiCorner.CornerRadius = UDim.new(0, 8)
		uiCorner.Parent = button

		local uiAspect = Instance.new("UIAspectRatioConstraint")
		uiAspect.AspectRatio = 1
		uiAspect.Parent = button

		local isActive = false
		local originalText = data.text
		local timerThread = nil

		button.MouseButton1Click:Connect(function()
			if data.bType == "Toggle" then
				isActive = not isActive
				
				if isActive then
					button.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
					button.Text = ""
					
					timerThread = task.delay(2400, function()
						if isActive then
							isActive = false
							button.BackgroundColor3 = Color3.fromRGB(5, 5, 5)
							button.Text = originalText
						end
					end)
				else
					if timerThread then task.cancel(timerThread) end
					button.BackgroundColor3 = Color3.fromRGB(5, 5, 5)
					button.Text = originalText
				end
				
			elseif data.bType == "Flash" then
				button.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				button.Text = ""
				
				task.wait(0.30)
				
				button.BackgroundColor3 = Color3.fromRGB(5, 5, 5)
				button.Text = originalText
			end
		end)
	else
		local spacer = Instance.new("Frame")
		spacer.BackgroundTransparency = 1
		spacer.Parent = mainFrame
	end
end

--------------------------------------------------------------------------------
-- 2. BOTÓN IZQUIERDO (MÁS ANCHO Y A LA MITAD DE ALTURA)
--------------------------------------------------------------------------------
local leftButton = Instance.new("TextButton")
leftButton.Name = "LeftMenuButton"
leftButton.Text = "MENU\nIZQUIERDO"
leftButton.TextColor3 = Color3.fromRGB(255, 255, 255)
leftButton.Font = Enum.Font.SourceSansBold
leftButton.TextSize = 12
leftButton.TextWrapped = true
leftButton.BackgroundColor3 = Color3.fromRGB(5, 5, 5) -- Negro más oscuro
leftButton.BorderSizePixel = 0
leftButton.AnchorPoint = Vector2.new(0, 0)
leftButton.Position = UDim2.new(0, 15, 0, 15) -- Margen superior e izquierdo
leftButton.Size = UDim2.new(0, 100, 0, 136) -- Más ancho y la mitad de la altura total del menú derecho (~136px)
leftButton.Parent = screenGui

local leftCorner = Instance.new("UICorner")
leftCorner.CornerRadius = UDim.new(0, 8)
leftCorner.Parent = leftButton

-- Animación de interacción rápida para el botón izquierdo
local isLeftActive = false
leftButton.MouseButton1Click:Connect(function()
	isLeftActive = not isLeftActive
	if isLeftActive then
		leftButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		leftButton.Text = ""
	else
		leftButton.BackgroundColor3 = Color3.fromRGB(5, 5, 5)
		leftButton.Text = "MENU\nIZQUIERDO"
	end
end)
