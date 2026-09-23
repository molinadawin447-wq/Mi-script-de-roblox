local Players = game:GetService("Players")
local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

-- Crear la interfaz principal (ScreenGui)
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "CustomMenuGui"
screenGui.ResetOnSpawn = false
screenGui.Parent = playerGui

-- Marco principal centrado en la pantalla
local mainFrame = Instance.new("Frame")
mainFrame.Name = "MainFrame"
mainFrame.AnchorPoint = Vector2.new(0.5, 0.5)
mainFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
mainFrame.Size = UDim2.new(0, 420, 0, 420)
mainFrame.BackgroundTransparency = 1
mainFrame.Parent = screenGui

-- Configuración del sistema de cuadrícula (UIGridLayout)
local gridLayout = Instance.new("UIGridLayout")
gridLayout.Parent = mainFrame
gridLayout.CellSize = UDim2.new(0, 90, 0, 90) -- Cuadrados iguales de 90x90 px
gridLayout.CellPadding = UDim2.new(0, 10, 0, 10) -- Espaciado constante
gridLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
gridLayout.VerticalAlignment = Enum.VerticalAlignment.Center
gridLayout.SortOrder = Enum.SortOrder.LayoutOrder

-- Distribución de botones por filas (1 = Botón, 0 = Espacio transparente)
local pattern = {
	{1, 1, 1, 1}, -- Fila 1 (4 botones)
	{0, 1, 1, 1}, -- Fila 2 (3 botones)
	{0, 0, 1, 1}, -- Fila 3 (2 botones)
	{0, 0, 1, 1}  -- Fila 4 (2 botones)
}

local buttonCount = 0

for _, row in ipairs(pattern) do
	for _, cell in ipairs(row) do
		if cell == 1 then
			buttonCount = buttonCount + 1
			
			-- Crear botón cuadrado
			local button = Instance.new("TextButton")
			button.Name = "Btn_" .. buttonCount
			button.Text = "Boton " .. buttonCount
			button.TextColor3 = Color3.fromRGB(255, 255, 255)
			button.Font = Enum.Font.SourceSansBold
			button.TextSize = 16
			button.BackgroundColor3 = Color3.fromRGB(15, 15, 15) -- Negro oscuro
			button.BorderSizePixel = 0
			button.Parent = mainFrame

			-- Fuerza al botón a mantenerse estrictamente cuadrado (relación 1:1)
			local uiAspect = Instance.new("UIAspectRatioConstraint")
			uiAspect.AspectRatio = 1
			uiAspect.AspectType = Enum.AspectType.FitWithinMaxSize
			uiAspect.Parent = button

			-- Redondeado suave de esquinas
			local uiCorner = Instance.new("UICorner")
			uiCorner.CornerRadius = UDim.new(0, 12) -- Radio de curvatura
			uiCorner.Parent = button

			-- Evento al presionar
			local currentNum = buttonCount
			button.MouseButton1Click:Connect(function()
				print("Presionaste el Botón " .. currentNum)
			end)
		else
			-- Espacio para mantener el orden de la columna
			local spacer = Instance.new("Frame")
			spacer.Name = "Spacer"
			spacer.BackgroundTransparency = 1
			spacer.Parent = mainFrame
		end
	end
end
