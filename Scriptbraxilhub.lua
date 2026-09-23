local Players = game:GetService("Players")
local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

local screenGui = Instance.new("ScreenGui")
screenGui.Name = "CustomMenuGui"
screenGui.ResetOnSpawn = false
screenGui.Parent = playerGui

local mainFrame = Instance.new("Frame")
mainFrame.Name = "MainFrame"
mainFrame.AnchorPoint = Vector2.new(0.5, 0.5)
mainFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
mainFrame.Size = UDim2.new(0, 300, 0, 300) -- Tamaño del contenedor más pequeño
mainFrame.BackgroundTransparency = 1
mainFrame.Parent = screenGui

local gridLayout = Instance.new("UIGridLayout")
gridLayout.Parent = mainFrame
gridLayout.CellSize = UDim2.new(0, 65, 0, 65) -- Botones más pequeños (65x65 px)
gridLayout.CellPadding = UDim2.new(0, 8, 0, 8) -- Espacio pequeño entre botones
gridLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
gridLayout.VerticalAlignment = Enum.VerticalAlignment.Center
gridLayout.SortOrder = Enum.SortOrder.LayoutOrder

-- Definición de cada botón según su posición en la cuadrícula
-- { Texto, TipoDeBoton ("Toggle" o "Flash") }
local buttonData = {
	-- Columna 1
	{ text = "INSTA\nRESET", bType = "Flash" },
	{ text = "", bType = "None" },
	{ text = "", bType = "None" },
	{ text = "", bType = "None" },
	
	-- Columna 2
	{ text = "OPCION\nA", bType = "Toggle" },
	{ text = "OPCION\nB", bType = "Toggle" },
	{ text = "", bType = "None" },
	{ text = "", bType = "None" },
	
	-- Columna 3
	{ text = "AUTO\nLEFT", bType = "Flash" },
	{ text = "OPCION\nC", bType = "Toggle" },
	{ text = "MODO\nDOWN", bType = "Flash" },
	{ text = "OPCION\nD", bType = "Toggle" },
	
	-- Columna 4
	{ text = "AUTO\nRIGHT", bType = "Flash" },
	{ text = "DROP\nBR", bType = "Flash" },
	{ text = "OPCION\nE", bType = "Toggle" },
	{ text = "OPCION\nF", bType = "Toggle" }
}

-- Reorganizar por filas para el UIGridLayout (4x4)
local gridOrder = {1, 5, 9, 13, 2, 6, 10, 14, 3, 7, 11, 15, 4, 8, 12, 16}

for _, index in ipairs(gridOrder) do
	local data = buttonData[index]
	
	if data.bType ~= "None" then
		local button = Instance.new("TextButton")
		button.Name = "Btn_" .. index
		button.Text = data.text
		button.TextColor3 = Color3.fromRGB(255, 255, 255)
		button.Font = Enum.Font.SourceSansBold
		button.TextSize = 12
		button.TextWrapped = true
		button.BackgroundColor3 = Color3.fromRGB(15, 15, 15) -- Negro oscuro
		button.BorderSizePixel = 0
		button.Parent = mainFrame

		local uiCorner = Instance.new("UICorner")
		uiCorner.CornerRadius = UDim.new(0, 8) -- Bordes redondeados
		uiCorner.Parent = button

		local uiAspect = Instance.new("UIAspectRatioConstraint")
		uiAspect.AspectRatio = 1
		uiAspect.Parent = button

		-- Variables de estado
		local isActive = false
		local originalText = data.text
		local timerThread = nil

		button.MouseButton1Click:Connect(function()
			if data.bType == "Toggle" then
				-- Botones de estado (blanco por tiempo determinado / encendido-apagado)
				isActive = not isActive
				
				if isActive then
					button.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
					button.Text = "" -- Desaparece el texto
					
					-- Temporizador para apagar automáticamente tras 40 minutos (2400 segundos)
					timerThread = task.delay(2400, function()
						if isActive then
							isActive = false
							button.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
							button.Text = originalText
						end
					end)
				else
					if timerThread then task.cancel(timerThread) end
					button.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
					button.Text = originalText
				end
				
			elseif data.bType == "Flash" then
				-- Botones con destello rápido (0.30 segundos)
				button.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				button.Text = ""
				
				task.wait(0.30)
				
				button.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
				button.Text = originalText
			end
		end)
	else
		-- Espacio transparente para mantener la alineación
		local spacer = Instance.new("Frame")
		spacer.BackgroundTransparency = 1
		spacer.Parent = mainFrame
	end
end
