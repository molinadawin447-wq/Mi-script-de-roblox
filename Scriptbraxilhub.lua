--[[
    greenduelsV2  (ScreenGui)
    Grabbed by Xavi GUI Copier v4.0.0 on 2026-09-25 12:35:38
    Discord: https://discord.gg/QhWDwSHvK
    899 instances
]]

local G = {}

-- greenduelsV2 (ScreenGui)
G.greenduelsV2 = Instance.new("ScreenGui")
G.greenduelsV2.Name = "greenduelsV2"
G.greenduelsV2.ResetOnSpawn = false
G.greenduelsV2.DisplayOrder = 10
G.greenduelsV2.IgnoreGuiInset = true
G.greenduelsV2.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
G.greenduelsV2.ScreenInsets = Enum.ScreenInsets.DeviceSafeInsets

-- UIScale (UIScale)
G.UIScale = Instance.new("UIScale")
G.UIScale.Parent = G.greenduelsV2

-- MainOuter (Frame)
G.MainOuter = Instance.new("Frame")
G.MainOuter.Name = "MainOuter"
G.MainOuter.BackgroundColor3 = Color3.fromRGB(8, 23, 17)
G.MainOuter.BorderSizePixel = 0
G.MainOuter.ClipsDescendants = true
G.MainOuter.Position = UDim2.new(0.5, -184, 0.5, -178)
G.MainOuter.Size = UDim2.new(0, 410, 0, 360)
G.MainOuter.Visible = false
G.MainOuter.Parent = G.greenduelsV2

-- UICorner (UICorner)
G.UICorner = Instance.new("UICorner")
G.UICorner.CornerRadius = UDim.new(0, 12)
G.UICorner.Parent = G.MainOuter

-- UIScale_2 (UIScale)
G.UIScale_2 = Instance.new("UIScale")
G.UIScale_2.Parent = G.MainOuter

-- BgFill (Frame)
G.BgFill = Instance.new("Frame")
G.BgFill.Name = "BgFill"
G.BgFill.BackgroundColor3 = Color3.fromRGB(15, 44, 31)
G.BgFill.BackgroundTransparency = 0.079999998211860657
G.BgFill.BorderSizePixel = 0
G.BgFill.Size = UDim2.new(1, 0, 1, 0)
G.BgFill.ZIndex = 0
G.BgFill.Parent = G.MainOuter

-- UICorner_2 (UICorner)
G.UICorner_2 = Instance.new("UICorner")
G.UICorner_2.CornerRadius = UDim.new(0, 12)
G.UICorner_2.Parent = G.BgFill

-- UIGradient (UIGradient)
G.UIGradient = Instance.new("UIGradient")
G.UIGradient.Color = ColorSequence.new({ColorSequenceKeypoint.new(0, Color3.fromRGB(25, 45, 33)), ColorSequenceKeypoint.new(0.5, Color3.fromRGB(9, 17, 14)), ColorSequenceKeypoint.new(1, Color3.fromRGB(6, 16, 10))})
G.UIGradient.Rotation = 90
G.UIGradient.Parent = G.BgFill

-- WindowOutline (Frame)
G.WindowOutline = Instance.new("Frame")
G.WindowOutline.Name = "WindowOutline"
G.WindowOutline.BackgroundTransparency = 1
G.WindowOutline.BorderSizePixel = 0
G.WindowOutline.Position = UDim2.new(0, 1, 0, 1)
G.WindowOutline.Size = UDim2.new(1, -2, 1, -2)
G.WindowOutline.ZIndex = 30
G.WindowOutline.Parent = G.MainOuter

-- UICorner_3 (UICorner)
G.UICorner_3 = Instance.new("UICorner")
G.UICorner_3.CornerRadius = UDim.new(0, 11)
G.UICorner_3.Parent = G.WindowOutline

-- UIStroke (UIStroke)
G.UIStroke = Instance.new("UIStroke")
G.UIStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
G.UIStroke.Color = Color3.fromRGB(51, 119, 78)
G.UIStroke.Thickness = 2
G.UIStroke.Parent = G.WindowOutline

-- Frame (Frame)
G.Frame = Instance.new("Frame")
G.Frame.BackgroundColor3 = Color3.fromRGB(8, 19, 14)
G.Frame.BackgroundTransparency = 0.11999999731779099
G.Frame.BorderSizePixel = 0
G.Frame.Position = UDim2.new(0, 1, 0, 1)
G.Frame.Size = UDim2.new(1, -2, 0, 55)
G.Frame.ZIndex = 5
G.Frame.Parent = G.MainOuter

-- UICorner_4 (UICorner)
G.UICorner_4 = Instance.new("UICorner")
G.UICorner_4.CornerRadius = UDim.new(0, 11)
G.UICorner_4.Parent = G.Frame

-- Frame_2 (Frame)
G.Frame_2 = Instance.new("Frame")
G.Frame_2.BackgroundColor3 = Color3.fromRGB(9, 17, 14)
G.Frame_2.BorderSizePixel = 0
G.Frame_2.Position = UDim2.new(0, 14, 0.5, -17)
G.Frame_2.Size = UDim2.new(0, 34, 0, 34)
G.Frame_2.ZIndex = 6
G.Frame_2.Parent = G.Frame

-- UICorner_5 (UICorner)
G.UICorner_5 = Instance.new("UICorner")
G.UICorner_5.CornerRadius = UDim.new(0, 16)
G.UICorner_5.Parent = G.Frame_2

-- UIStroke_2 (UIStroke)
G.UIStroke_2 = Instance.new("UIStroke")
G.UIStroke_2.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
G.UIStroke_2.Color = Color3.fromRGB(22, 76, 43)
G.UIStroke_2.Thickness = 1.5
G.UIStroke_2.Transparency = 0.25
G.UIStroke_2.Parent = G.Frame_2

-- ImageLabel (ImageLabel)
G.ImageLabel = Instance.new("ImageLabel")
G.ImageLabel.BackgroundTransparency = 1
G.ImageLabel.Position = UDim2.new(0, 2, 0, 2)
G.ImageLabel.Size = UDim2.new(1, -4, 1, -4)
G.ImageLabel.ZIndex = 7
G.ImageLabel.Image = "rbxthumb://type=AvatarHeadShot&id=9016504614&w=150&h=150"
G.ImageLabel.ScaleType = Enum.ScaleType.Crop
G.ImageLabel.Parent = G.Frame_2

-- UICorner_6 (UICorner)
G.UICorner_6 = Instance.new("UICorner")
G.UICorner_6.CornerRadius = UDim.new(0, 14)
G.UICorner_6.Parent = G.ImageLabel

-- TextLabel (TextLabel)
G.TextLabel = Instance.new("TextLabel")
G.TextLabel.BackgroundTransparency = 1
G.TextLabel.Position = UDim2.new(0, 58, 0, 9)
G.TextLabel.Size = UDim2.new(1, -116, 0, 24)
G.TextLabel.ZIndex = 6
G.TextLabel.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Heavy, Enum.FontStyle.Normal)
G.TextLabel.Text = "greenduels"
G.TextLabel.TextColor3 = Color3.fromRGB(235, 250, 241)
G.TextLabel.TextSize = 18
G.TextLabel.TextXAlignment = Enum.TextXAlignment.Left
G.TextLabel.Parent = G.Frame

-- TextLabel_2 (TextLabel)
G.TextLabel_2 = Instance.new("TextLabel")
G.TextLabel_2.BackgroundTransparency = 1
G.TextLabel_2.Position = UDim2.new(0, 59, 0, 33)
G.TextLabel_2.Size = UDim2.new(0, 160, 0, 11)
G.TextLabel_2.ZIndex = 6
G.TextLabel_2.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Medium, Enum.FontStyle.Normal)
G.TextLabel_2.Text = "powered by luck"
G.TextLabel_2.TextColor3 = Color3.fromRGB(113, 165, 134)
G.TextLabel_2.TextSize = 10
G.TextLabel_2.TextXAlignment = Enum.TextXAlignment.Left
G.TextLabel_2.Parent = G.Frame

-- TextButton (TextButton)
G.TextButton = Instance.new("TextButton")
G.TextButton.BackgroundColor3 = Color3.fromRGB(42, 27, 29)
G.TextButton.BorderSizePixel = 0
G.TextButton.Position = UDim2.new(1, -46, 0.5, -15)
G.TextButton.Size = UDim2.new(0, 30, 0, 30)
G.TextButton.ZIndex = 7
G.TextButton.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Heavy, Enum.FontStyle.Normal)
G.TextButton.Text = "X"
G.TextButton.TextColor3 = Color3.fromRGB(244, 172, 172)
G.TextButton.TextSize = 13
G.TextButton.Parent = G.Frame

-- UICorner_7 (UICorner)
G.UICorner_7 = Instance.new("UICorner")
G.UICorner_7.CornerRadius = UDim.new(0, 10)
G.UICorner_7.Parent = G.TextButton

-- UIStroke_3 (UIStroke)
G.UIStroke_3 = Instance.new("UIStroke")
G.UIStroke_3.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
G.UIStroke_3.Color = Color3.fromRGB(84, 48, 53)
G.UIStroke_3.Parent = G.TextButton

-- Frame_3 (Frame)
G.Frame_3 = Instance.new("Frame")
G.Frame_3.BackgroundColor3 = Color3.fromRGB(23, 58, 38)
G.Frame_3.BorderSizePixel = 0
G.Frame_3.Position = UDim2.new(0, 1, 0, 56)
G.Frame_3.Size = UDim2.new(1, -2, 0, 1)
G.Frame_3.ZIndex = 5
G.Frame_3.Parent = G.MainOuter

-- Frame_4 (Frame)
G.Frame_4 = Instance.new("Frame")
G.Frame_4.BackgroundColor3 = Color3.fromRGB(12, 22, 18)
G.Frame_4.BackgroundTransparency = 0.75999999046325684
G.Frame_4.BorderSizePixel = 0
G.Frame_4.ClipsDescendants = true
G.Frame_4.Position = UDim2.new(0, 10, 0, 63)
G.Frame_4.Size = UDim2.new(1, -20, 1, -121)
G.Frame_4.ZIndex = 2
G.Frame_4.Parent = G.MainOuter

-- UICorner_8 (UICorner)
G.UICorner_8 = Instance.new("UICorner")
G.UICorner_8.CornerRadius = UDim.new(0, 10)
G.UICorner_8.Parent = G.Frame_4

-- MainScroll (ScrollingFrame)
G.MainScroll = Instance.new("ScrollingFrame")
G.MainScroll.Name = "MainScroll"
G.MainScroll.BackgroundTransparency = 1
G.MainScroll.BorderSizePixel = 0
G.MainScroll.Size = UDim2.new(1, 0, 1, 0)
G.MainScroll.ZIndex = 3
G.MainScroll.AutomaticCanvasSize = Enum.AutomaticSize.Y
G.MainScroll.CanvasPosition = Vector2.new(0, 515.13995361328125)
G.MainScroll.CanvasSize = UDim2.new(0, 0, 0, 0)
G.MainScroll.ScrollBarImageColor3 = Color3.fromRGB(42, 230, 123)
G.MainScroll.ScrollBarImageTransparency = 0.64999997615814209
G.MainScroll.ScrollBarThickness = 2
G.MainScroll.ScrollingDirection = Enum.ScrollingDirection.Y
G.MainScroll.Parent = G.Frame_4

-- UIListLayout (UIListLayout)
G.UIListLayout = Instance.new("UIListLayout")
G.UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
G.UIListLayout.Padding = UDim.new(0, 6)
G.UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
G.UIListLayout.Parent = G.MainScroll

-- UIPadding (UIPadding)
G.UIPadding = Instance.new("UIPadding")
G.UIPadding.PaddingBottom = UDim.new(0, 18)
G.UIPadding.PaddingLeft = UDim.new(0, 6)
G.UIPadding.PaddingRight = UDim.new(0, 6)
G.UIPadding.PaddingTop = UDim.new(0, 10)
G.UIPadding.Parent = G.MainScroll

-- Speed (Frame)
G.Speed = Instance.new("Frame")
G.Speed.Name = "Speed"
G.Speed.AutomaticSize = Enum.AutomaticSize.Y
G.Speed.BackgroundTransparency = 1
G.Speed.BorderSizePixel = 0
G.Speed.LayoutOrder = 1
G.Speed.Size = UDim2.new(1, 0, 0, 0)
G.Speed.Visible = false
G.Speed.Parent = G.MainScroll

-- UIListLayout_2 (UIListLayout)
G.UIListLayout_2 = Instance.new("UIListLayout")
G.UIListLayout_2.HorizontalAlignment = Enum.HorizontalAlignment.Center
G.UIListLayout_2.Padding = UDim.new(0, 6)
G.UIListLayout_2.SortOrder = Enum.SortOrder.LayoutOrder
G.UIListLayout_2.Parent = G.Speed

-- Frame_5 (Frame)
G.Frame_5 = Instance.new("Frame")
G.Frame_5.BackgroundTransparency = 1
G.Frame_5.BorderSizePixel = 0
G.Frame_5.LayoutOrder = 1
G.Frame_5.Size = UDim2.new(1, 0, 0, 2)
G.Frame_5.Parent = G.Speed

-- Frame_6 (Frame)
G.Frame_6 = Instance.new("Frame")
G.Frame_6.BackgroundColor3 = Color3.fromRGB(40, 92, 64)
G.Frame_6.BackgroundTransparency = 0.25
G.Frame_6.BorderSizePixel = 0
G.Frame_6.LayoutOrder = 2
G.Frame_6.Size = UDim2.new(1, -10, 0, 32)
G.Frame_6.Parent = G.Speed

-- UICorner_9 (UICorner)
G.UICorner_9 = Instance.new("UICorner")
G.UICorner_9.CornerRadius = UDim.new(0, 10)
G.UICorner_9.Parent = G.Frame_6

-- UIStroke_4 (UIStroke)
G.UIStroke_4 = Instance.new("UIStroke")
G.UIStroke_4.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
G.UIStroke_4.Color = Color3.fromRGB(24, 65, 38)
G.UIStroke_4.Transparency = 0.40000000596046448
G.UIStroke_4.Parent = G.Frame_6

-- Frame_7 (Frame)
G.Frame_7 = Instance.new("Frame")
G.Frame_7.BackgroundColor3 = Color3.fromRGB(42, 230, 123)
G.Frame_7.BorderSizePixel = 0
G.Frame_7.Position = UDim2.new(0, 10, 0, 9)
G.Frame_7.Size = UDim2.new(0, 4, 1, -18)
G.Frame_7.Parent = G.Frame_6

-- UICorner_10 (UICorner)
G.UICorner_10 = Instance.new("UICorner")
G.UICorner_10.CornerRadius = UDim.new(0, 2)
G.UICorner_10.Parent = G.Frame_7

-- TextLabel_3 (TextLabel)
G.TextLabel_3 = Instance.new("TextLabel")
G.TextLabel_3.BackgroundTransparency = 1
G.TextLabel_3.Position = UDim2.new(0, 22, 0, 0)
G.TextLabel_3.Size = UDim2.new(1, -30, 1, 0)
G.TextLabel_3.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal)
G.TextLabel_3.Text = "SPEED VALUES"
G.TextLabel_3.TextColor3 = Color3.fromRGB(218, 255, 233)
G.TextLabel_3.TextSize = 13
G.TextLabel_3.TextXAlignment = Enum.TextXAlignment.Left
G.TextLabel_3.Parent = G.Frame_6

-- Frame_8 (Frame)
G.Frame_8 = Instance.new("Frame")
G.Frame_8.BackgroundTransparency = 1
G.Frame_8.BorderSizePixel = 0
G.Frame_8.LayoutOrder = 3
G.Frame_8.Size = UDim2.new(1, 0, 0, 2)
G.Frame_8.Parent = G.Speed

-- Frame_9 (Frame)
G.Frame_9 = Instance.new("Frame")
G.Frame_9.BackgroundColor3 = Color3.fromRGB(19, 33, 26)
G.Frame_9.BackgroundTransparency = 0.11999999731779099
G.Frame_9.BorderSizePixel = 0
G.Frame_9.LayoutOrder = 4
G.Frame_9.Size = UDim2.new(1, -16, 0, 42)
G.Frame_9.Parent = G.Speed

-- UICorner_11 (UICorner)
G.UICorner_11 = Instance.new("UICorner")
G.UICorner_11.CornerRadius = UDim.new(0, 16)
G.UICorner_11.Parent = G.Frame_9

-- UIStroke_5 (UIStroke)
G.UIStroke_5 = Instance.new("UIStroke")
G.UIStroke_5.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
G.UIStroke_5.Color = Color3.fromRGB(31, 54, 40)
G.UIStroke_5.Transparency = 0.5
G.UIStroke_5.Parent = G.Frame_9

-- TextLabel_4 (TextLabel)
G.TextLabel_4 = Instance.new("TextLabel")
G.TextLabel_4.BackgroundTransparency = 1
G.TextLabel_4.Position = UDim2.new(0, 12, 0, 0)
G.TextLabel_4.Size = UDim2.new(1, -100, 1, 0)
G.TextLabel_4.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Medium, Enum.FontStyle.Normal)
G.TextLabel_4.Text = "Normal Speed"
G.TextLabel_4.TextColor3 = Color3.fromRGB(220, 239, 228)
G.TextLabel_4.TextSize = 13
G.TextLabel_4.TextXAlignment = Enum.TextXAlignment.Left
G.TextLabel_4.Parent = G.Frame_9

-- Frame_10 (Frame)
G.Frame_10 = Instance.new("Frame")
G.Frame_10.BackgroundColor3 = Color3.fromRGB(9, 23, 15)
G.Frame_10.BorderSizePixel = 0
G.Frame_10.Position = UDim2.new(1, -88, 0.5, -15)
G.Frame_10.Size = UDim2.new(0, 76, 0, 30)
G.Frame_10.Parent = G.Frame_9

-- UICorner_12 (UICorner)
G.UICorner_12 = Instance.new("UICorner")
G.UICorner_12.CornerRadius = UDim.new(0, 13)
G.UICorner_12.Parent = G.Frame_10

-- UIStroke_6 (UIStroke)
G.UIStroke_6 = Instance.new("UIStroke")
G.UIStroke_6.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
G.UIStroke_6.Color = Color3.fromRGB(31, 54, 40)
G.UIStroke_6.Transparency = 0.30000001192092896
G.UIStroke_6.Parent = G.Frame_10

-- TextBox (TextBox)
G.TextBox = Instance.new("TextBox")
G.TextBox.BackgroundTransparency = 1
G.TextBox.Position = UDim2.new(0, 4, 0, 0)
G.TextBox.Size = UDim2.new(1, -8, 1, 0)
G.TextBox.ZIndex = 8
G.TextBox.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal)
G.TextBox.Text = "60"
G.TextBox.TextColor3 = Color3.fromRGB(154, 255, 191)
G.TextBox.TextSize = 14
G.TextBox.ClearTextOnFocus = false
G.TextBox.Parent = G.Frame_10

-- Frame_11 (Frame)
G.Frame_11 = Instance.new("Frame")
G.Frame_11.BackgroundColor3 = Color3.fromRGB(19, 33, 26)
G.Frame_11.BackgroundTransparency = 0.11999999731779099
G.Frame_11.BorderSizePixel = 0
G.Frame_11.LayoutOrder = 5
G.Frame_11.Size = UDim2.new(1, -16, 0, 42)
G.Frame_11.Parent = G.Speed

-- UICorner_13 (UICorner)
G.UICorner_13 = Instance.new("UICorner")
G.UICorner_13.CornerRadius = UDim.new(0, 16)
G.UICorner_13.Parent = G.Frame_11

-- UIStroke_7 (UIStroke)
G.UIStroke_7 = Instance.new("UIStroke")
G.UIStroke_7.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
G.UIStroke_7.Color = Color3.fromRGB(31, 54, 40)
G.UIStroke_7.Transparency = 0.5
G.UIStroke_7.Parent = G.Frame_11

-- TextLabel_5 (TextLabel)
G.TextLabel_5 = Instance.new("TextLabel")
G.TextLabel_5.BackgroundTransparency = 1
G.TextLabel_5.Position = UDim2.new(0, 12, 0, 0)
G.TextLabel_5.Size = UDim2.new(1, -100, 1, 0)
G.TextLabel_5.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Medium, Enum.FontStyle.Normal)
G.TextLabel_5.Text = "Carry Speed"
G.TextLabel_5.TextColor3 = Color3.fromRGB(220, 239, 228)
G.TextLabel_5.TextSize = 13
G.TextLabel_5.TextXAlignment = Enum.TextXAlignment.Left
G.TextLabel_5.Parent = G.Frame_11

-- Frame_12 (Frame)
G.Frame_12 = Instance.new("Frame")
G.Frame_12.BackgroundColor3 = Color3.fromRGB(9, 23, 15)
G.Frame_12.BorderSizePixel = 0
G.Frame_12.Position = UDim2.new(1, -88, 0.5, -15)
G.Frame_12.Size = UDim2.new(0, 76, 0, 30)
G.Frame_12.Parent = G.Frame_11

-- UICorner_14 (UICorner)
G.UICorner_14 = Instance.new("UICorner")
G.UICorner_14.CornerRadius = UDim.new(0, 13)
G.UICorner_14.Parent = G.Frame_12

-- UIStroke_8 (UIStroke)
G.UIStroke_8 = Instance.new("UIStroke")
G.UIStroke_8.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
G.UIStroke_8.Color = Color3.fromRGB(31, 54, 40)
G.UIStroke_8.Transparency = 0.30000001192092896
G.UIStroke_8.Parent = G.Frame_12

-- TextBox_2 (TextBox)
G.TextBox_2 = Instance.new("TextBox")
G.TextBox_2.BackgroundTransparency = 1
G.TextBox_2.Position = UDim2.new(0, 4, 0, 0)
G.TextBox_2.Size = UDim2.new(1, -8, 1, 0)
G.TextBox_2.ZIndex = 8
G.TextBox_2.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal)
G.TextBox_2.Text = "30"
G.TextBox_2.TextColor3 = Color3.fromRGB(154, 255, 191)
G.TextBox_2.TextSize = 14
G.TextBox_2.ClearTextOnFocus = false
G.TextBox_2.Parent = G.Frame_12

-- Frame_13 (Frame)
G.Frame_13 = Instance.new("Frame")
G.Frame_13.BackgroundColor3 = Color3.fromRGB(19, 33, 26)
G.Frame_13.BackgroundTransparency = 0.11999999731779099
G.Frame_13.BorderSizePixel = 0
G.Frame_13.LayoutOrder = 6
G.Frame_13.Size = UDim2.new(1, -16, 0, 42)
G.Frame_13.Parent = G.Speed

-- UICorner_15 (UICorner)
G.UICorner_15 = Instance.new("UICorner")
G.UICorner_15.CornerRadius = UDim.new(0, 16)
G.UICorner_15.Parent = G.Frame_13

-- UIStroke_9 (UIStroke)
G.UIStroke_9 = Instance.new("UIStroke")
G.UIStroke_9.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
G.UIStroke_9.Color = Color3.fromRGB(31, 54, 40)
G.UIStroke_9.Transparency = 0.5
G.UIStroke_9.Parent = G.Frame_13

-- TextLabel_6 (TextLabel)
G.TextLabel_6 = Instance.new("TextLabel")
G.TextLabel_6.BackgroundTransparency = 1
G.TextLabel_6.Position = UDim2.new(0, 12, 0, 0)
G.TextLabel_6.Size = UDim2.new(1, -100, 1, 0)
G.TextLabel_6.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Medium, Enum.FontStyle.Normal)
G.TextLabel_6.Text = "Lagger Speed"
G.TextLabel_6.TextColor3 = Color3.fromRGB(220, 239, 228)
G.TextLabel_6.TextSize = 13
G.TextLabel_6.TextXAlignment = Enum.TextXAlignment.Left
G.TextLabel_6.Parent = G.Frame_13

-- Frame_14 (Frame)
G.Frame_14 = Instance.new("Frame")
G.Frame_14.BackgroundColor3 = Color3.fromRGB(9, 23, 15)
G.Frame_14.BorderSizePixel = 0
G.Frame_14.Position = UDim2.new(1, -88, 0.5, -15)
G.Frame_14.Size = UDim2.new(0, 76, 0, 30)
G.Frame_14.Parent = G.Frame_13

-- UICorner_16 (UICorner)
G.UICorner_16 = Instance.new("UICorner")
G.UICorner_16.CornerRadius = UDim.new(0, 13)
G.UICorner_16.Parent = G.Frame_14

-- UIStroke_10 (UIStroke)
G.UIStroke_10 = Instance.new("UIStroke")
G.UIStroke_10.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
G.UIStroke_10.Color = Color3.fromRGB(31, 54, 40)
G.UIStroke_10.Transparency = 0.30000001192092896
G.UIStroke_10.Parent = G.Frame_14

-- TextBox_3 (TextBox)
G.TextBox_3 = Instance.new("TextBox")
G.TextBox_3.BackgroundTransparency = 1
G.TextBox_3.Position = UDim2.new(0, 4, 0, 0)
G.TextBox_3.Size = UDim2.new(1, -8, 1, 0)
G.TextBox_3.ZIndex = 8
G.TextBox_3.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal)
G.TextBox_3.Text = "10.1"
G.TextBox_3.TextColor3 = Color3.fromRGB(154, 255, 191)
G.TextBox_3.TextSize = 14
G.TextBox_3.ClearTextOnFocus = false
G.TextBox_3.Parent = G.Frame_14

-- Frame_15 (Frame)
G.Frame_15 = Instance.new("Frame")
G.Frame_15.BackgroundColor3 = Color3.fromRGB(19, 33, 26)
G.Frame_15.BackgroundTransparency = 0.11999999731779099
G.Frame_15.BorderSizePixel = 0
G.Frame_15.LayoutOrder = 7
G.Frame_15.Size = UDim2.new(1, -16, 0, 42)
G.Frame_15.Parent = G.Speed

-- UICorner_17 (UICorner)
G.UICorner_17 = Instance.new("UICorner")
G.UICorner_17.CornerRadius = UDim.new(0, 16)
G.UICorner_17.Parent = G.Frame_15

-- UIStroke_11 (UIStroke)
G.UIStroke_11 = Instance.new("UIStroke")
G.UIStroke_11.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
G.UIStroke_11.Color = Color3.fromRGB(31, 54, 40)
G.UIStroke_11.Transparency = 0.5
G.UIStroke_11.Parent = G.Frame_15

-- TextLabel_7 (TextLabel)
G.TextLabel_7 = Instance.new("TextLabel")
G.TextLabel_7.BackgroundTransparency = 1
G.TextLabel_7.Position = UDim2.new(0, 12, 0, 0)
G.TextLabel_7.Size = UDim2.new(1, -100, 1, 0)
G.TextLabel_7.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Medium, Enum.FontStyle.Normal)
G.TextLabel_7.Text = "Lagger Carry Speed"
G.TextLabel_7.TextColor3 = Color3.fromRGB(220, 239, 228)
G.TextLabel_7.TextSize = 13
G.TextLabel_7.TextXAlignment = Enum.TextXAlignment.Left
G.TextLabel_7.Parent = G.Frame_15

-- Frame_16 (Frame)
G.Frame_16 = Instance.new("Frame")
G.Frame_16.BackgroundColor3 = Color3.fromRGB(9, 23, 15)
G.Frame_16.BorderSizePixel = 0
G.Frame_16.Position = UDim2.new(1, -88, 0.5, -15)
G.Frame_16.Size = UDim2.new(0, 76, 0, 30)
G.Frame_16.Parent = G.Frame_15

-- UICorner_18 (UICorner)
G.UICorner_18 = Instance.new("UICorner")
G.UICorner_18.CornerRadius = UDim.new(0, 13)
G.UICorner_18.Parent = G.Frame_16

-- UIStroke_12 (UIStroke)
G.UIStroke_12 = Instance.new("UIStroke")
G.UIStroke_12.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
G.UIStroke_12.Color = Color3.fromRGB(31, 54, 40)
G.UIStroke_12.Transparency = 0.30000001192092896
G.UIStroke_12.Parent = G.Frame_16

-- TextBox_4 (TextBox)
G.TextBox_4 = Instance.new("TextBox")
G.TextBox_4.BackgroundTransparency = 1
G.TextBox_4.Position = UDim2.new(0, 4, 0, 0)
G.TextBox_4.Size = UDim2.new(1, -8, 1, 0)
G.TextBox_4.ZIndex = 8
G.TextBox_4.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal)
G.TextBox_4.Text = "15"
G.TextBox_4.TextColor3 = Color3.fromRGB(154, 255, 191)
G.TextBox_4.TextSize = 14
G.TextBox_4.ClearTextOnFocus = false
G.TextBox_4.Parent = G.Frame_16

-- Frame_17 (Frame)
G.Frame_17 = Instance.new("Frame")
G.Frame_17.BackgroundTransparency = 1
G.Frame_17.BorderSizePixel = 0
G.Frame_17.LayoutOrder = 8
G.Frame_17.Size = UDim2.new(1, 0, 0, 4)
G.Frame_17.Parent = G.Speed

-- Frame_18 (Frame)
G.Frame_18 = Instance.new("Frame")
G.Frame_18.BackgroundColor3 = Color3.fromRGB(19, 33, 26)
G.Frame_18.BorderSizePixel = 0
G.Frame_18.LayoutOrder = 9
G.Frame_18.Size = UDim2.new(1, -10, 0, 44)
G.Frame_18.Parent = G.Speed

-- UICorner_19 (UICorner)
G.UICorner_19 = Instance.new("UICorner")
G.UICorner_19.CornerRadius = UDim.new(0, 9)
G.UICorner_19.Parent = G.Frame_18

-- UIStroke_13 (UIStroke)
G.UIStroke_13 = Instance.new("UIStroke")
G.UIStroke_13.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
G.UIStroke_13.Color = Color3.fromRGB(31, 54, 40)
G.UIStroke_13.Parent = G.Frame_18

-- TextLabel_8 (TextLabel)
G.TextLabel_8 = Instance.new("TextLabel")
G.TextLabel_8.BackgroundTransparency = 1
G.TextLabel_8.Position = UDim2.new(0, 14, 0, 0)
G.TextLabel_8.Size = UDim2.new(0.5, 0, 1, 0)
G.TextLabel_8.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal)
G.TextLabel_8.Text = "Current Mode"
G.TextLabel_8.TextColor3 = Color3.fromRGB(220, 239, 228)
G.TextLabel_8.TextSize = 13
G.TextLabel_8.TextXAlignment = Enum.TextXAlignment.Left
G.TextLabel_8.Parent = G.Frame_18

-- TextLabel_9 (TextLabel)
G.TextLabel_9 = Instance.new("TextLabel")
G.TextLabel_9.BackgroundTransparency = 1
G.TextLabel_9.Position = UDim2.new(0.5, 0, 0, 0)
G.TextLabel_9.Size = UDim2.new(0.40000000596046448, 0, 1, 0)
G.TextLabel_9.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal)
G.TextLabel_9.Text = "Normal"
G.TextLabel_9.TextColor3 = Color3.fromRGB(138, 236, 173)
G.TextLabel_9.TextSize = 12
G.TextLabel_9.TextXAlignment = Enum.TextXAlignment.Left
G.TextLabel_9.Parent = G.Frame_18

-- Frame_19 (Frame)
G.Frame_19 = Instance.new("Frame")
G.Frame_19.BackgroundTransparency = 1
G.Frame_19.BorderSizePixel = 0
G.Frame_19.LayoutOrder = 10
G.Frame_19.Size = UDim2.new(1, 0, 0, 8)
G.Frame_19.Parent = G.Speed

-- Frame_20 (Frame)
G.Frame_20 = Instance.new("Frame")
G.Frame_20.BackgroundColor3 = Color3.fromRGB(40, 92, 64)
G.Frame_20.BackgroundTransparency = 0.25
G.Frame_20.BorderSizePixel = 0
G.Frame_20.LayoutOrder = 11
G.Frame_20.Size = UDim2.new(1, -10, 0, 32)
G.Frame_20.Parent = G.Speed

-- UICorner_20 (UICorner)
G.UICorner_20 = Instance.new("UICorner")
G.UICorner_20.CornerRadius = UDim.new(0, 10)
G.UICorner_20.Parent = G.Frame_20

-- UIStroke_14 (UIStroke)
G.UIStroke_14 = Instance.new("UIStroke")
G.UIStroke_14.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
G.UIStroke_14.Color = Color3.fromRGB(24, 65, 38)
G.UIStroke_14.Transparency = 0.40000000596046448
G.UIStroke_14.Parent = G.Frame_20

-- Frame_21 (Frame)
G.Frame_21 = Instance.new("Frame")
G.Frame_21.BackgroundColor3 = Color3.fromRGB(42, 230, 123)
G.Frame_21.BorderSizePixel = 0
G.Frame_21.Position = UDim2.new(0, 10, 0, 9)
G.Frame_21.Size = UDim2.new(0, 4, 1, -18)
G.Frame_21.Parent = G.Frame_20

-- UICorner_21 (UICorner)
G.UICorner_21 = Instance.new("UICorner")
G.UICorner_21.CornerRadius = UDim.new(0, 2)
G.UICorner_21.Parent = G.Frame_21

-- TextLabel_10 (TextLabel)
G.TextLabel_10 = Instance.new("TextLabel")
G.TextLabel_10.BackgroundTransparency = 1
G.TextLabel_10.Position = UDim2.new(0, 22, 0, 0)
G.TextLabel_10.Size = UDim2.new(1, -30, 1, 0)
G.TextLabel_10.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal)
G.TextLabel_10.Text = "SPEED KEYBINDS"
G.TextLabel_10.TextColor3 = Color3.fromRGB(218, 255, 233)
G.TextLabel_10.TextSize = 13
G.TextLabel_10.TextXAlignment = Enum.TextXAlignment.Left
G.TextLabel_10.Parent = G.Frame_20

-- Frame_22 (Frame)
G.Frame_22 = Instance.new("Frame")
G.Frame_22.BackgroundTransparency = 1
G.Frame_22.BorderSizePixel = 0
G.Frame_22.LayoutOrder = 12
G.Frame_22.Size = UDim2.new(1, 0, 0, 2)
G.Frame_22.Parent = G.Speed

-- Frame_23 (Frame)
G.Frame_23 = Instance.new("Frame")
G.Frame_23.BackgroundColor3 = Color3.fromRGB(19, 33, 26)
G.Frame_23.BackgroundTransparency = 0.11999999731779099
G.Frame_23.BorderSizePixel = 0
G.Frame_23.LayoutOrder = 13
G.Frame_23.Size = UDim2.new(1, -16, 0, 40)
G.Frame_23.Parent = G.Speed

-- UICorner_22 (UICorner)
G.UICorner_22 = Instance.new("UICorner")
G.UICorner_22.CornerRadius = UDim.new(0, 16)
G.UICorner_22.Parent = G.Frame_23

-- UIStroke_15 (UIStroke)
G.UIStroke_15 = Instance.new("UIStroke")
G.UIStroke_15.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
G.UIStroke_15.Color = Color3.fromRGB(31, 54, 40)
G.UIStroke_15.Transparency = 0.55000001192092896
G.UIStroke_15.Parent = G.Frame_23

-- TextLabel_11 (TextLabel)
G.TextLabel_11 = Instance.new("TextLabel")
G.TextLabel_11.BackgroundTransparency = 1
G.TextLabel_11.Position = UDim2.new(0, 12, 0, 0)
G.TextLabel_11.Size = UDim2.new(1, -96, 1, 0)
G.TextLabel_11.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Medium, Enum.FontStyle.Normal)
G.TextLabel_11.Text = "Speed Key (toggles)"
G.TextLabel_11.TextColor3 = Color3.fromRGB(220, 239, 228)
G.TextLabel_11.TextSize = 13
G.TextLabel_11.TextXAlignment = Enum.TextXAlignment.Left
G.TextLabel_11.Parent = G.Frame_23

-- TextButton_2 (TextButton)
G.TextButton_2 = Instance.new("TextButton")
G.TextButton_2.BackgroundColor3 = Color3.fromRGB(22, 76, 43)
G.TextButton_2.BorderSizePixel = 0
G.TextButton_2.Position = UDim2.new(1, -72, 0.5, -14)
G.TextButton_2.Size = UDim2.new(0, 62, 0, 28)
G.TextButton_2.ZIndex = 8
G.TextButton_2.AutoButtonColor = false
G.TextButton_2.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Heavy, Enum.FontStyle.Normal)
G.TextButton_2.Text = "Q"
G.TextButton_2.TextColor3 = Color3.fromRGB(42, 230, 123)
G.TextButton_2.TextSize = 11
G.TextButton_2.TextWrapped = true
G.TextButton_2.Parent = G.Frame_23

-- UICorner_23 (UICorner)
G.UICorner_23 = Instance.new("UICorner")
G.UICorner_23.CornerRadius = UDim.new(0, 9)
G.UICorner_23.Parent = G.TextButton_2

-- KeybindStroke (UIStroke)
G.KeybindStroke = Instance.new("UIStroke")
G.KeybindStroke.Name = "KeybindStroke"
G.KeybindStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
G.KeybindStroke.Color = Color3.fromRGB(92, 255, 150)
G.KeybindStroke.Transparency = 0.079999998211860657
G.KeybindStroke.Parent = G.TextButton_2

-- KeybindShine (Frame)
G.KeybindShine = Instance.new("Frame")
G.KeybindShine.Name = "KeybindShine"
G.KeybindShine.BackgroundColor3 = Color3.fromRGB(180, 255, 205)
G.KeybindShine.BackgroundTransparency = 1
G.KeybindShine.BorderSizePixel = 0
G.KeybindShine.Size = UDim2.new(1, 0, 0, 10)
G.KeybindShine.ZIndex = 9
G.KeybindShine.Parent = G.TextButton_2

-- UICorner_24 (UICorner)
G.UICorner_24 = Instance.new("UICorner")
G.UICorner_24.CornerRadius = UDim.new(0, 9)
G.UICorner_24.Parent = G.KeybindShine

-- Frame_24 (Frame)
G.Frame_24 = Instance.new("Frame")
G.Frame_24.BackgroundColor3 = Color3.fromRGB(19, 33, 26)
G.Frame_24.BackgroundTransparency = 0.11999999731779099
G.Frame_24.BorderSizePixel = 0
G.Frame_24.LayoutOrder = 14
G.Frame_24.Size = UDim2.new(1, -16, 0, 40)
G.Frame_24.Parent = G.Speed

-- UICorner_25 (UICorner)
G.UICorner_25 = Instance.new("UICorner")
G.UICorner_25.CornerRadius = UDim.new(0, 16)
G.UICorner_25.Parent = G.Frame_24

-- UIStroke_16 (UIStroke)
G.UIStroke_16 = Instance.new("UIStroke")
G.UIStroke_16.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
G.UIStroke_16.Color = Color3.fromRGB(31, 54, 40)
G.UIStroke_16.Transparency = 0.55000001192092896
G.UIStroke_16.Parent = G.Frame_24

-- TextLabel_12 (TextLabel)
G.TextLabel_12 = Instance.new("TextLabel")
G.TextLabel_12.BackgroundTransparency = 1
G.TextLabel_12.Position = UDim2.new(0, 12, 0, 0)
G.TextLabel_12.Size = UDim2.new(1, -96, 1, 0)
G.TextLabel_12.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Medium, Enum.FontStyle.Normal)
G.TextLabel_12.Text = "Lagger Key (toggles)"
G.TextLabel_12.TextColor3 = Color3.fromRGB(220, 239, 228)
G.TextLabel_12.TextSize = 13
G.TextLabel_12.TextXAlignment = Enum.TextXAlignment.Left
G.TextLabel_12.Parent = G.Frame_24

-- TextButton_3 (TextButton)
G.TextButton_3 = Instance.new("TextButton")
G.TextButton_3.BackgroundColor3 = Color3.fromRGB(18, 26, 20)
G.TextButton_3.BorderSizePixel = 0
G.TextButton_3.Position = UDim2.new(1, -72, 0.5, -14)
G.TextButton_3.Size = UDim2.new(0, 62, 0, 28)
G.TextButton_3.ZIndex = 8
G.TextButton_3.AutoButtonColor = false
G.TextButton_3.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Heavy, Enum.FontStyle.Normal)
G.TextButton_3.Text = "None"
G.TextButton_3.TextColor3 = Color3.fromRGB(105, 150, 120)
G.TextButton_3.TextSize = 11
G.TextButton_3.TextWrapped = true
G.TextButton_3.Parent = G.Frame_24

-- UICorner_26 (UICorner)
G.UICorner_26 = Instance.new("UICorner")
G.UICorner_26.CornerRadius = UDim.new(0, 9)
G.UICorner_26.Parent = G.TextButton_3

-- KeybindStroke_2 (UIStroke)
G.KeybindStroke_2 = Instance.new("UIStroke")
G.KeybindStroke_2.Name = "KeybindStroke"
G.KeybindStroke_2.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
G.KeybindStroke_2.Color = Color3.fromRGB(35, 75, 48)
G.KeybindStroke_2.Transparency = 0.44999998807907104
G.KeybindStroke_2.Parent = G.TextButton_3

-- KeybindShine_2 (Frame)
G.KeybindShine_2 = Instance.new("Frame")
G.KeybindShine_2.Name = "KeybindShine"
G.KeybindShine_2.BackgroundColor3 = Color3.fromRGB(180, 255, 205)
G.KeybindShine_2.BackgroundTransparency = 1
G.KeybindShine_2.BorderSizePixel = 0
G.KeybindShine_2.Size = UDim2.new(1, 0, 0, 10)
G.KeybindShine_2.ZIndex = 9
G.KeybindShine_2.Parent = G.TextButton_3

-- UICorner_27 (UICorner)
G.UICorner_27 = Instance.new("UICorner")
G.UICorner_27.CornerRadius = UDim.new(0, 9)
G.UICorner_27.Parent = G.KeybindShine_2

-- Frame_25 (Frame)
G.Frame_25 = Instance.new("Frame")
G.Frame_25.BackgroundTransparency = 1
G.Frame_25.BorderSizePixel = 0
G.Frame_25.LayoutOrder = 15
G.Frame_25.Size = UDim2.new(1, 0, 0, 4)
G.Frame_25.Parent = G.Speed

-- Frame_26 (Frame)
G.Frame_26 = Instance.new("Frame")
G.Frame_26.BackgroundColor3 = Color3.fromRGB(19, 33, 26)
G.Frame_26.BackgroundTransparency = 0.11999999731779099
G.Frame_26.BorderSizePixel = 0
G.Frame_26.LayoutOrder = 16
G.Frame_26.Size = UDim2.new(1, -16, 0, 42)
G.Frame_26.Parent = G.Speed

-- UICorner_28 (UICorner)
G.UICorner_28 = Instance.new("UICorner")
G.UICorner_28.CornerRadius = UDim.new(0, 16)
G.UICorner_28.Parent = G.Frame_26

-- UIStroke_17 (UIStroke)
G.UIStroke_17 = Instance.new("UIStroke")
G.UIStroke_17.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
G.UIStroke_17.Color = Color3.fromRGB(31, 54, 40)
G.UIStroke_17.Transparency = 0.5
G.UIStroke_17.Parent = G.Frame_26

-- TextLabel_13 (TextLabel)
G.TextLabel_13 = Instance.new("TextLabel")
G.TextLabel_13.BackgroundTransparency = 1
G.TextLabel_13.Position = UDim2.new(0, 12, 0, 0)
G.TextLabel_13.Size = UDim2.new(1, -70, 1, 0)
G.TextLabel_13.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Medium, Enum.FontStyle.Normal)
G.TextLabel_13.Text = "Auto Change Speed"
G.TextLabel_13.TextColor3 = Color3.fromRGB(220, 239, 228)
G.TextLabel_13.TextSize = 13
G.TextLabel_13.TextXAlignment = Enum.TextXAlignment.Left
G.TextLabel_13.Parent = G.Frame_26

-- Frame_27 (Frame)
G.Frame_27 = Instance.new("Frame")
G.Frame_27.BackgroundColor3 = Color3.fromRGB(35, 48, 41)
G.Frame_27.BorderSizePixel = 0
G.Frame_27.Position = UDim2.new(1, -62, 0.5, -12)
G.Frame_27.Size = UDim2.new(0, 48, 0, 24)
G.Frame_27.ZIndex = 7
G.Frame_27.Parent = G.Frame_26

-- UICorner_29 (UICorner)
G.UICorner_29 = Instance.new("UICorner")
G.UICorner_29.CornerRadius = UDim.new(0, 11)
G.UICorner_29.Parent = G.Frame_27

-- Frame_28 (Frame)
G.Frame_28 = Instance.new("Frame")
G.Frame_28.BackgroundColor3 = Color3.fromRGB(119, 149, 130)
G.Frame_28.BorderSizePixel = 0
G.Frame_28.Position = UDim2.new(0, 4, 0.5, -7)
G.Frame_28.Size = UDim2.new(0, 14, 0, 14)
G.Frame_28.ZIndex = 8
G.Frame_28.Parent = G.Frame_27

-- UICorner_30 (UICorner)
G.UICorner_30 = Instance.new("UICorner")
G.UICorner_30.CornerRadius = UDim.new(0, 7)
G.UICorner_30.Parent = G.Frame_28

-- TextButton_4 (TextButton)
G.TextButton_4 = Instance.new("TextButton")
G.TextButton_4.BackgroundTransparency = 1
G.TextButton_4.BorderSizePixel = 0
G.TextButton_4.Size = UDim2.new(1, 0, 1, 0)
G.TextButton_4.ZIndex = 9
G.TextButton_4.Text = ""
G.TextButton_4.Parent = G.Frame_27

-- TextButton_5 (TextButton)
G.TextButton_5 = Instance.new("TextButton")
G.TextButton_5.BackgroundTransparency = 1
G.TextButton_5.BorderSizePixel = 0
G.TextButton_5.Size = UDim2.new(1, -56, 1, 0)
G.TextButton_5.ZIndex = 5
G.TextButton_5.Text = ""
G.TextButton_5.Parent = G.Frame_26

-- Combat (Frame)
G.Combat = Instance.new("Frame")
G.Combat.Name = "Combat"
G.Combat.AutomaticSize = Enum.AutomaticSize.Y
G.Combat.BackgroundTransparency = 1
G.Combat.BorderSizePixel = 0
G.Combat.LayoutOrder = 2
G.Combat.Size = UDim2.new(1, 0, 0, 0)
G.Combat.Visible = false
G.Combat.Parent = G.MainScroll

-- UIListLayout_3 (UIListLayout)
G.UIListLayout_3 = Instance.new("UIListLayout")
G.UIListLayout_3.HorizontalAlignment = Enum.HorizontalAlignment.Center
G.UIListLayout_3.Padding = UDim.new(0, 6)
G.UIListLayout_3.SortOrder = Enum.SortOrder.LayoutOrder
G.UIListLayout_3.Parent = G.Combat

-- Frame_29 (Frame)
G.Frame_29 = Instance.new("Frame")
G.Frame_29.BackgroundTransparency = 1
G.Frame_29.BorderSizePixel = 0
G.Frame_29.LayoutOrder = 1
G.Frame_29.Size = UDim2.new(1, 0, 0, 2)
G.Frame_29.Parent = G.Combat

-- Frame_30 (Frame)
G.Frame_30 = Instance.new("Frame")
G.Frame_30.BackgroundColor3 = Color3.fromRGB(40, 92, 64)
G.Frame_30.BackgroundTransparency = 0.25
G.Frame_30.BorderSizePixel = 0
G.Frame_30.LayoutOrder = 2
G.Frame_30.Size = UDim2.new(1, -10, 0, 32)
G.Frame_30.Parent = G.Combat

-- UICorner_31 (UICorner)
G.UICorner_31 = Instance.new("UICorner")
G.UICorner_31.CornerRadius = UDim.new(0, 10)
G.UICorner_31.Parent = G.Frame_30

-- UIStroke_18 (UIStroke)
G.UIStroke_18 = Instance.new("UIStroke")
G.UIStroke_18.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
G.UIStroke_18.Color = Color3.fromRGB(24, 65, 38)
G.UIStroke_18.Transparency = 0.40000000596046448
G.UIStroke_18.Parent = G.Frame_30

-- Frame_31 (Frame)
G.Frame_31 = Instance.new("Frame")
G.Frame_31.BackgroundColor3 = Color3.fromRGB(42, 230, 123)
G.Frame_31.BorderSizePixel = 0
G.Frame_31.Position = UDim2.new(0, 10, 0, 9)
G.Frame_31.Size = UDim2.new(0, 4, 1, -18)
G.Frame_31.Parent = G.Frame_30

-- UICorner_32 (UICorner)
G.UICorner_32 = Instance.new("UICorner")
G.UICorner_32.CornerRadius = UDim.new(0, 2)
G.UICorner_32.Parent = G.Frame_31

-- TextLabel_14 (TextLabel)
G.TextLabel_14 = Instance.new("TextLabel")
G.TextLabel_14.BackgroundTransparency = 1
G.TextLabel_14.Position = UDim2.new(0, 22, 0, 0)
G.TextLabel_14.Size = UDim2.new(1, -30, 1, 0)
G.TextLabel_14.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal)
G.TextLabel_14.Text = "AIMBOT OPTIONS"
G.TextLabel_14.TextColor3 = Color3.fromRGB(218, 255, 233)
G.TextLabel_14.TextSize = 13
G.TextLabel_14.TextXAlignment = Enum.TextXAlignment.Left
G.TextLabel_14.Parent = G.Frame_30

-- Frame_32 (Frame)
G.Frame_32 = Instance.new("Frame")
G.Frame_32.BackgroundTransparency = 1
G.Frame_32.BorderSizePixel = 0
G.Frame_32.LayoutOrder = 3
G.Frame_32.Size = UDim2.new(1, 0, 0, 2)
G.Frame_32.Parent = G.Combat

-- Frame_33 (Frame)
G.Frame_33 = Instance.new("Frame")
G.Frame_33.BackgroundColor3 = Color3.fromRGB(19, 33, 26)
G.Frame_33.BackgroundTransparency = 0.20000000298023224
G.Frame_33.BorderSizePixel = 0
G.Frame_33.ClipsDescendants = true
G.Frame_33.LayoutOrder = 4
G.Frame_33.Size = UDim2.new(1, -10, 0, 42)
G.Frame_33.Parent = G.Combat

-- UICorner_33 (UICorner)
G.UICorner_33 = Instance.new("UICorner")
G.UICorner_33.CornerRadius = UDim.new(0, 11)
G.UICorner_33.Parent = G.Frame_33

-- UIStroke_19 (UIStroke)
G.UIStroke_19 = Instance.new("UIStroke")
G.UIStroke_19.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
G.UIStroke_19.Color = Color3.fromRGB(31, 54, 40)
G.UIStroke_19.Transparency = 0.37999999523162842
G.UIStroke_19.Parent = G.Frame_33

-- TextLabel_15 (TextLabel)
G.TextLabel_15 = Instance.new("TextLabel")
G.TextLabel_15.BackgroundTransparency = 1
G.TextLabel_15.Position = UDim2.new(0, 14, 0, 0)
G.TextLabel_15.Size = UDim2.new(1, -96, 0, 42)
G.TextLabel_15.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal)
G.TextLabel_15.Text = "Aimbot Options"
G.TextLabel_15.TextColor3 = Color3.fromRGB(220, 239, 228)
G.TextLabel_15.TextSize = 13
G.TextLabel_15.TextXAlignment = Enum.TextXAlignment.Left
G.TextLabel_15.Parent = G.Frame_33

-- TextButton_6 (TextButton)
G.TextButton_6 = Instance.new("TextButton")
G.TextButton_6.BackgroundColor3 = Color3.fromRGB(10, 14, 12)
G.TextButton_6.BorderSizePixel = 0
G.TextButton_6.Position = UDim2.new(1, -50, 0, 7)
G.TextButton_6.Size = UDim2.new(0, 42, 0, 28)
G.TextButton_6.ZIndex = 33
G.TextButton_6.AutoButtonColor = false
G.TextButton_6.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Heavy, Enum.FontStyle.Normal)
G.TextButton_6.Text = "â–¼"
G.TextButton_6.TextColor3 = Color3.fromRGB(235, 245, 238)
G.TextButton_6.TextSize = 12
G.TextButton_6.Parent = G.Frame_33

-- UICorner_34 (UICorner)
G.UICorner_34 = Instance.new("UICorner")
G.UICorner_34.CornerRadius = UDim.new(0, 9)
G.UICorner_34.Parent = G.TextButton_6

-- UIStroke_20 (UIStroke)
G.UIStroke_20 = Instance.new("UIStroke")
G.UIStroke_20.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
G.UIStroke_20.Color = Color3.fromRGB(28, 48, 36)
G.UIStroke_20.Transparency = 0.34999999403953552
G.UIStroke_20.Parent = G.TextButton_6

-- Frame_34 (Frame)
G.Frame_34 = Instance.new("Frame")
G.Frame_34.BackgroundColor3 = Color3.fromRGB(7, 9, 8)
G.Frame_34.BorderSizePixel = 0
G.Frame_34.Position = UDim2.new(0, 4, 0, 42)
G.Frame_34.Size = UDim2.new(1, -8, 0, 30)
G.Frame_34.Visible = false
G.Frame_34.ZIndex = 30
G.Frame_34.Parent = G.Frame_33

-- UICorner_35 (UICorner)
G.UICorner_35 = Instance.new("UICorner")
G.UICorner_35.Parent = G.Frame_34

-- UIStroke_21 (UIStroke)
G.UIStroke_21 = Instance.new("UIStroke")
G.UIStroke_21.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
G.UIStroke_21.Color = Color3.fromRGB(42, 230, 123)
G.UIStroke_21.Transparency = 0.41999998688697815
G.UIStroke_21.Parent = G.Frame_34

-- Frame_35 (Frame)
G.Frame_35 = Instance.new("Frame")
G.Frame_35.BackgroundColor3 = Color3.fromRGB(42, 230, 123)
G.Frame_35.BorderSizePixel = 0
G.Frame_35.Position = UDim2.new(0, 4, 0, 4)
G.Frame_35.Size = UDim2.new(0.5, -5, 1, -8)
G.Frame_35.ZIndex = 31
G.Frame_35.Parent = G.Frame_34

-- UICorner_36 (UICorner)
G.UICorner_36 = Instance.new("UICorner")
G.UICorner_36.CornerRadius = UDim.new(0, 7)
G.UICorner_36.Parent = G.Frame_35

-- TextButton_7 (TextButton)
G.TextButton_7 = Instance.new("TextButton")
G.TextButton_7.BackgroundTransparency = 1
G.TextButton_7.BorderSizePixel = 0
G.TextButton_7.Size = UDim2.new(0.5, 0, 1, 0)
G.TextButton_7.ZIndex = 32
G.TextButton_7.AutoButtonColor = false
G.TextButton_7.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Heavy, Enum.FontStyle.Normal)
G.TextButton_7.Text = "NORMAL"
G.TextButton_7.TextColor3 = Color3.fromRGB(255, 255, 255)
G.TextButton_7.TextSize = 10
G.TextButton_7.Parent = G.Frame_34

-- TextButton_8 (TextButton)
G.TextButton_8 = Instance.new("TextButton")
G.TextButton_8.BackgroundTransparency = 1
G.TextButton_8.BorderSizePixel = 0
G.TextButton_8.Position = UDim2.new(0.5, 0, 0, 0)
G.TextButton_8.Size = UDim2.new(0.5, 0, 1, 0)
G.TextButton_8.ZIndex = 32
G.TextButton_8.AutoButtonColor = false
G.TextButton_8.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Heavy, Enum.FontStyle.Normal)
G.TextButton_8.Text = "BYPASS"
G.TextButton_8.TextColor3 = Color3.fromRGB(220, 239, 228)
G.TextButton_8.TextSize = 10
G.TextButton_8.Parent = G.Frame_34

-- Frame_36 (Frame)
G.Frame_36 = Instance.new("Frame")
G.Frame_36.BackgroundColor3 = Color3.fromRGB(19, 33, 26)
G.Frame_36.BackgroundTransparency = 0.11999999731779099
G.Frame_36.BorderSizePixel = 0
G.Frame_36.LayoutOrder = 5
G.Frame_36.Size = UDim2.new(1, -10, 0, 0)
G.Frame_36.Visible = false
G.Frame_36.Parent = G.Combat

-- UICorner_37 (UICorner)
G.UICorner_37 = Instance.new("UICorner")
G.UICorner_37.CornerRadius = UDim.new(0, 16)
G.UICorner_37.Parent = G.Frame_36

-- UIStroke_22 (UIStroke)
G.UIStroke_22 = Instance.new("UIStroke")
G.UIStroke_22.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
G.UIStroke_22.Color = Color3.fromRGB(31, 54, 40)
G.UIStroke_22.Transparency = 0.5
G.UIStroke_22.Parent = G.Frame_36

-- TextLabel_16 (TextLabel)
G.TextLabel_16 = Instance.new("TextLabel")
G.TextLabel_16.BackgroundTransparency = 1
G.TextLabel_16.Position = UDim2.new(0, 12, 0, 0)
G.TextLabel_16.Size = UDim2.new(1, -100, 1, 0)
G.TextLabel_16.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Medium, Enum.FontStyle.Normal)
G.TextLabel_16.Text = "Auto Bat Speed"
G.TextLabel_16.TextColor3 = Color3.fromRGB(220, 239, 228)
G.TextLabel_16.TextSize = 13
G.TextLabel_16.TextXAlignment = Enum.TextXAlignment.Left
G.TextLabel_16.Parent = G.Frame_36

-- Frame_37 (Frame)
G.Frame_37 = Instance.new("Frame")
G.Frame_37.BackgroundColor3 = Color3.fromRGB(9, 23, 15)
G.Frame_37.BorderSizePixel = 0
G.Frame_37.Position = UDim2.new(1, -88, 0.5, -15)
G.Frame_37.Size = UDim2.new(0, 76, 0, 30)
G.Frame_37.Parent = G.Frame_36

-- UICorner_38 (UICorner)
G.UICorner_38 = Instance.new("UICorner")
G.UICorner_38.CornerRadius = UDim.new(0, 13)
G.UICorner_38.Parent = G.Frame_37

-- UIStroke_23 (UIStroke)
G.UIStroke_23 = Instance.new("UIStroke")
G.UIStroke_23.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
G.UIStroke_23.Color = Color3.fromRGB(31, 54, 40)
G.UIStroke_23.Transparency = 0.30000001192092896
G.UIStroke_23.Parent = G.Frame_37

-- TextBox_5 (TextBox)
G.TextBox_5 = Instance.new("TextBox")
G.TextBox_5.BackgroundTransparency = 1
G.TextBox_5.Position = UDim2.new(0, 4, 0, 0)
G.TextBox_5.Size = UDim2.new(1, -8, 1, 0)
G.TextBox_5.ZIndex = 8
G.TextBox_5.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal)
G.TextBox_5.Text = "58"
G.TextBox_5.TextColor3 = Color3.fromRGB(154, 255, 191)
G.TextBox_5.TextSize = 14
G.TextBox_5.ClearTextOnFocus = false
G.TextBox_5.Parent = G.Frame_37

-- Frame_38 (Frame)
G.Frame_38 = Instance.new("Frame")
G.Frame_38.BackgroundColor3 = Color3.fromRGB(19, 33, 26)
G.Frame_38.BackgroundTransparency = 0.11999999731779099
G.Frame_38.BorderSizePixel = 0
G.Frame_38.LayoutOrder = 6
G.Frame_38.Size = UDim2.new(1, -10, 0, 0)
G.Frame_38.Visible = false
G.Frame_38.Parent = G.Combat

-- UICorner_39 (UICorner)
G.UICorner_39 = Instance.new("UICorner")
G.UICorner_39.CornerRadius = UDim.new(0, 16)
G.UICorner_39.Parent = G.Frame_38

-- UIStroke_24 (UIStroke)
G.UIStroke_24 = Instance.new("UIStroke")
G.UIStroke_24.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
G.UIStroke_24.Color = Color3.fromRGB(31, 54, 40)
G.UIStroke_24.Transparency = 0.5
G.UIStroke_24.Parent = G.Frame_38

-- TextLabel_17 (TextLabel)
G.TextLabel_17 = Instance.new("TextLabel")
G.TextLabel_17.BackgroundTransparency = 1
G.TextLabel_17.Position = UDim2.new(0, 12, 0, 0)
G.TextLabel_17.Size = UDim2.new(1, -100, 1, 0)
G.TextLabel_17.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Medium, Enum.FontStyle.Normal)
G.TextLabel_17.Text = "Lagger Auto Bat Speed"
G.TextLabel_17.TextColor3 = Color3.fromRGB(220, 239, 228)
G.TextLabel_17.TextSize = 13
G.TextLabel_17.TextXAlignment = Enum.TextXAlignment.Left
G.TextLabel_17.Parent = G.Frame_38

-- Frame_39 (Frame)
G.Frame_39 = Instance.new("Frame")
G.Frame_39.BackgroundColor3 = Color3.fromRGB(9, 23, 15)
G.Frame_39.BorderSizePixel = 0
G.Frame_39.Position = UDim2.new(1, -88, 0.5, -15)
G.Frame_39.Size = UDim2.new(0, 76, 0, 30)
G.Frame_39.Parent = G.Frame_38

-- UICorner_40 (UICorner)
G.UICorner_40 = Instance.new("UICorner")
G.UICorner_40.CornerRadius = UDim.new(0, 13)
G.UICorner_40.Parent = G.Frame_39

-- UIStroke_25 (UIStroke)
G.UIStroke_25 = Instance.new("UIStroke")
G.UIStroke_25.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
G.UIStroke_25.Color = Color3.fromRGB(31, 54, 40)
G.UIStroke_25.Transparency = 0.30000001192092896
G.UIStroke_25.Parent = G.Frame_39

-- TextBox_6 (TextBox)
G.TextBox_6 = Instance.new("TextBox")
G.TextBox_6.BackgroundTransparency = 1
G.TextBox_6.Position = UDim2.new(0, 4, 0, 0)
G.TextBox_6.Size = UDim2.new(1, -8, 1, 0)
G.TextBox_6.ZIndex = 8
G.TextBox_6.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal)
G.TextBox_6.Text = "40"
G.TextBox_6.TextColor3 = Color3.fromRGB(154, 255, 191)
G.TextBox_6.TextSize = 14
G.TextBox_6.ClearTextOnFocus = false
G.TextBox_6.Parent = G.Frame_39

-- Frame_40 (Frame)
G.Frame_40 = Instance.new("Frame")
G.Frame_40.BackgroundColor3 = Color3.fromRGB(19, 33, 26)
G.Frame_40.BackgroundTransparency = 0.20000000298023224
G.Frame_40.BorderSizePixel = 0
G.Frame_40.LayoutOrder = 7
G.Frame_40.Size = UDim2.new(1, -10, 0, 0)
G.Frame_40.Visible = false
G.Frame_40:SetAttribute("On", false)
G.Frame_40.Parent = G.Combat

-- UICorner_41 (UICorner)
G.UICorner_41 = Instance.new("UICorner")
G.UICorner_41.CornerRadius = UDim.new(0, 16)
G.UICorner_41.Parent = G.Frame_40

-- UIStroke_26 (UIStroke)
G.UIStroke_26 = Instance.new("UIStroke")
G.UIStroke_26.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
G.UIStroke_26.Color = Color3.fromRGB(31, 54, 40)
G.UIStroke_26.Transparency = 0.5
G.UIStroke_26.Parent = G.Frame_40

-- TextLabel_18 (TextLabel)
G.TextLabel_18 = Instance.new("TextLabel")
G.TextLabel_18.BackgroundTransparency = 1
G.TextLabel_18.Position = UDim2.new(0, 12, 0, 0)
G.TextLabel_18.Size = UDim2.new(1, -150, 1, 0)
G.TextLabel_18.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Medium, Enum.FontStyle.Normal)
G.TextLabel_18.Text = "Normal Aimbot"
G.TextLabel_18.TextColor3 = Color3.fromRGB(220, 239, 228)
G.TextLabel_18.TextSize = 13
G.TextLabel_18.TextXAlignment = Enum.TextXAlignment.Left
G.TextLabel_18.Parent = G.Frame_40

-- Frame_41 (Frame)
G.Frame_41 = Instance.new("Frame")
G.Frame_41.BackgroundColor3 = Color3.fromRGB(35, 48, 41)
G.Frame_41.BorderSizePixel = 0
G.Frame_41.Position = UDim2.new(1, -116, 0.5, -12)
G.Frame_41.Size = UDim2.new(0, 44, 0, 24)
G.Frame_41.ZIndex = 7
G.Frame_41.Parent = G.Frame_40

-- UICorner_42 (UICorner)
G.UICorner_42 = Instance.new("UICorner")
G.UICorner_42.CornerRadius = UDim.new(0, 11)
G.UICorner_42.Parent = G.Frame_41

-- Frame_42 (Frame)
G.Frame_42 = Instance.new("Frame")
G.Frame_42.BackgroundColor3 = Color3.fromRGB(119, 149, 130)
G.Frame_42.BorderSizePixel = 0
G.Frame_42.Position = UDim2.new(0, 4, 0.5, -7)
G.Frame_42.Size = UDim2.new(0, 14, 0, 14)
G.Frame_42.ZIndex = 8
G.Frame_42.Parent = G.Frame_41

-- UICorner_43 (UICorner)
G.UICorner_43 = Instance.new("UICorner")
G.UICorner_43.CornerRadius = UDim.new(0, 7)
G.UICorner_43.Parent = G.Frame_42

-- TextButton_9 (TextButton)
G.TextButton_9 = Instance.new("TextButton")
G.TextButton_9.BackgroundTransparency = 1
G.TextButton_9.BorderSizePixel = 0
G.TextButton_9.Size = UDim2.new(1, 0, 1, 0)
G.TextButton_9.ZIndex = 9
G.TextButton_9.Text = ""
G.TextButton_9.Parent = G.Frame_41

-- TextButton_10 (TextButton)
G.TextButton_10 = Instance.new("TextButton")
G.TextButton_10.BackgroundColor3 = Color3.fromRGB(18, 26, 20)
G.TextButton_10.BorderSizePixel = 0
G.TextButton_10.Position = UDim2.new(1, -64, 0.5, -14)
G.TextButton_10.Size = UDim2.new(0, 58, 0, 28)
G.TextButton_10.ZIndex = 8
G.TextButton_10.AutoButtonColor = false
G.TextButton_10.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Heavy, Enum.FontStyle.Normal)
G.TextButton_10.Text = "None"
G.TextButton_10.TextColor3 = Color3.fromRGB(105, 150, 120)
G.TextButton_10.TextSize = 11
G.TextButton_10.TextWrapped = true
G.TextButton_10.Parent = G.Frame_40

-- UICorner_44 (UICorner)
G.UICorner_44 = Instance.new("UICorner")
G.UICorner_44.CornerRadius = UDim.new(0, 9)
G.UICorner_44.Parent = G.TextButton_10

-- KeybindStroke_3 (UIStroke)
G.KeybindStroke_3 = Instance.new("UIStroke")
G.KeybindStroke_3.Name = "KeybindStroke"
G.KeybindStroke_3.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
G.KeybindStroke_3.Color = Color3.fromRGB(35, 75, 48)
G.KeybindStroke_3.Transparency = 0.44999998807907104
G.KeybindStroke_3.Parent = G.TextButton_10

-- TextButton_11 (TextButton)
G.TextButton_11 = Instance.new("TextButton")
G.TextButton_11.BackgroundTransparency = 1
G.TextButton_11.BorderSizePixel = 0
G.TextButton_11.Size = UDim2.new(1, -72, 1, 0)
G.TextButton_11.ZIndex = 5
G.TextButton_11.Text = ""
G.TextButton_11.Parent = G.Frame_40

-- Frame_43 (Frame)
G.Frame_43 = Instance.new("Frame")
G.Frame_43.BackgroundColor3 = Color3.fromRGB(19, 33, 26)
G.Frame_43.BackgroundTransparency = 0.11999999731779099
G.Frame_43.BorderSizePixel = 0
G.Frame_43.LayoutOrder = 8
G.Frame_43.Size = UDim2.new(1, -10, 0, 0)
G.Frame_43.Visible = false
G.Frame_43.Parent = G.Combat

-- UICorner_45 (UICorner)
G.UICorner_45 = Instance.new("UICorner")
G.UICorner_45.CornerRadius = UDim.new(0, 16)
G.UICorner_45.Parent = G.Frame_43

-- UIStroke_27 (UIStroke)
G.UIStroke_27 = Instance.new("UIStroke")
G.UIStroke_27.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
G.UIStroke_27.Color = Color3.fromRGB(31, 54, 40)
G.UIStroke_27.Transparency = 0.5
G.UIStroke_27.Parent = G.Frame_43

-- TextLabel_19 (TextLabel)
G.TextLabel_19 = Instance.new("TextLabel")
G.TextLabel_19.BackgroundTransparency = 1
G.TextLabel_19.Position = UDim2.new(0, 12, 0, 0)
G.TextLabel_19.Size = UDim2.new(1, -70, 1, 0)
G.TextLabel_19.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Medium, Enum.FontStyle.Normal)
G.TextLabel_19.Text = "Auto Swing: OFF"
G.TextLabel_19.TextColor3 = Color3.fromRGB(220, 239, 228)
G.TextLabel_19.TextSize = 13
G.TextLabel_19.TextXAlignment = Enum.TextXAlignment.Left
G.TextLabel_19.Parent = G.Frame_43

-- Frame_44 (Frame)
G.Frame_44 = Instance.new("Frame")
G.Frame_44.BackgroundColor3 = Color3.fromRGB(35, 48, 41)
G.Frame_44.BorderSizePixel = 0
G.Frame_44.Position = UDim2.new(1, -62, 0.5, -12)
G.Frame_44.Size = UDim2.new(0, 48, 0, 24)
G.Frame_44.ZIndex = 7
G.Frame_44.Parent = G.Frame_43

-- UICorner_46 (UICorner)
G.UICorner_46 = Instance.new("UICorner")
G.UICorner_46.CornerRadius = UDim.new(0, 11)
G.UICorner_46.Parent = G.Frame_44

-- Frame_45 (Frame)
G.Frame_45 = Instance.new("Frame")
G.Frame_45.BackgroundColor3 = Color3.fromRGB(119, 149, 130)
G.Frame_45.BorderSizePixel = 0
G.Frame_45.Position = UDim2.new(0, 4, 0.5, -7)
G.Frame_45.Size = UDim2.new(0, 14, 0, 14)
G.Frame_45.ZIndex = 8
G.Frame_45.Parent = G.Frame_44

-- UICorner_47 (UICorner)
G.UICorner_47 = Instance.new("UICorner")
G.UICorner_47.CornerRadius = UDim.new(0, 7)
G.UICorner_47.Parent = G.Frame_45

-- TextButton_12 (TextButton)
G.TextButton_12 = Instance.new("TextButton")
G.TextButton_12.BackgroundTransparency = 1
G.TextButton_12.BorderSizePixel = 0
G.TextButton_12.Size = UDim2.new(1, 0, 1, 0)
G.TextButton_12.ZIndex = 9
G.TextButton_12.Text = ""
G.TextButton_12.Parent = G.Frame_44

-- TextButton_13 (TextButton)
G.TextButton_13 = Instance.new("TextButton")
G.TextButton_13.BackgroundTransparency = 1
G.TextButton_13.BorderSizePixel = 0
G.TextButton_13.Size = UDim2.new(1, -56, 1, 0)
G.TextButton_13.ZIndex = 5
G.TextButton_13.Text = ""
G.TextButton_13.Parent = G.Frame_43

-- Frame_46 (Frame)
G.Frame_46 = Instance.new("Frame")
G.Frame_46.BackgroundColor3 = Color3.fromRGB(19, 33, 26)
G.Frame_46.BackgroundTransparency = 0.11999999731779099
G.Frame_46.BorderSizePixel = 0
G.Frame_46.LayoutOrder = 9
G.Frame_46.Size = UDim2.new(1, -10, 0, 0)
G.Frame_46.Visible = false
G.Frame_46.Parent = G.Combat

-- UICorner_48 (UICorner)
G.UICorner_48 = Instance.new("UICorner")
G.UICorner_48.CornerRadius = UDim.new(0, 16)
G.UICorner_48.Parent = G.Frame_46

-- UIStroke_28 (UIStroke)
G.UIStroke_28 = Instance.new("UIStroke")
G.UIStroke_28.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
G.UIStroke_28.Color = Color3.fromRGB(31, 54, 40)
G.UIStroke_28.Transparency = 0.5
G.UIStroke_28.Parent = G.Frame_46

-- TextLabel_20 (TextLabel)
G.TextLabel_20 = Instance.new("TextLabel")
G.TextLabel_20.BackgroundTransparency = 1
G.TextLabel_20.Position = UDim2.new(0, 12, 0, 0)
G.TextLabel_20.Size = UDim2.new(1, -70, 1, 0)
G.TextLabel_20.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Medium, Enum.FontStyle.Normal)
G.TextLabel_20.Text = "Mirror Tp Down"
G.TextLabel_20.TextColor3 = Color3.fromRGB(220, 239, 228)
G.TextLabel_20.TextSize = 13
G.TextLabel_20.TextXAlignment = Enum.TextXAlignment.Left
G.TextLabel_20.Parent = G.Frame_46

-- Frame_47 (Frame)
G.Frame_47 = Instance.new("Frame")
G.Frame_47.BackgroundColor3 = Color3.fromRGB(35, 48, 41)
G.Frame_47.BorderSizePixel = 0
G.Frame_47.Position = UDim2.new(1, -62, 0.5, -12)
G.Frame_47.Size = UDim2.new(0, 48, 0, 24)
G.Frame_47.ZIndex = 7
G.Frame_47.Parent = G.Frame_46

-- UICorner_49 (UICorner)
G.UICorner_49 = Instance.new("UICorner")
G.UICorner_49.CornerRadius = UDim.new(0, 11)
G.UICorner_49.Parent = G.Frame_47

-- Frame_48 (Frame)
G.Frame_48 = Instance.new("Frame")
G.Frame_48.BackgroundColor3 = Color3.fromRGB(119, 149, 130)
G.Frame_48.BorderSizePixel = 0
G.Frame_48.Position = UDim2.new(0, 4, 0.5, -7)
G.Frame_48.Size = UDim2.new(0, 14, 0, 14)
G.Frame_48.ZIndex = 8
G.Frame_48.Parent = G.Frame_47

-- UICorner_50 (UICorner)
G.UICorner_50 = Instance.new("UICorner")
G.UICorner_50.CornerRadius = UDim.new(0, 7)
G.UICorner_50.Parent = G.Frame_48

-- TextButton_14 (TextButton)
G.TextButton_14 = Instance.new("TextButton")
G.TextButton_14.BackgroundTransparency = 1
G.TextButton_14.BorderSizePixel = 0
G.TextButton_14.Size = UDim2.new(1, 0, 1, 0)
G.TextButton_14.ZIndex = 9
G.TextButton_14.Text = ""
G.TextButton_14.Parent = G.Frame_47

-- TextButton_15 (TextButton)
G.TextButton_15 = Instance.new("TextButton")
G.TextButton_15.BackgroundTransparency = 1
G.TextButton_15.BorderSizePixel = 0
G.TextButton_15.Size = UDim2.new(1, -56, 1, 0)
G.TextButton_15.ZIndex = 5
G.TextButton_15.Text = ""
G.TextButton_15.Parent = G.Frame_46

-- Frame_49 (Frame)
G.Frame_49 = Instance.new("Frame")
G.Frame_49.BackgroundColor3 = Color3.fromRGB(19, 33, 26)
G.Frame_49.BackgroundTransparency = 0.20000000298023224
G.Frame_49.BorderSizePixel = 0
G.Frame_49.LayoutOrder = 10
G.Frame_49.Size = UDim2.new(1, -16, 0, 42)
G.Frame_49:SetAttribute("On", false)
G.Frame_49.Parent = G.Combat

-- UICorner_51 (UICorner)
G.UICorner_51 = Instance.new("UICorner")
G.UICorner_51.CornerRadius = UDim.new(0, 16)
G.UICorner_51.Parent = G.Frame_49

-- UIStroke_29 (UIStroke)
G.UIStroke_29 = Instance.new("UIStroke")
G.UIStroke_29.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
G.UIStroke_29.Color = Color3.fromRGB(31, 54, 40)
G.UIStroke_29.Transparency = 0.5
G.UIStroke_29.Parent = G.Frame_49

-- TextLabel_21 (TextLabel)
G.TextLabel_21 = Instance.new("TextLabel")
G.TextLabel_21.BackgroundTransparency = 1
G.TextLabel_21.Position = UDim2.new(0, 12, 0, 0)
G.TextLabel_21.Size = UDim2.new(1, -150, 1, 0)
G.TextLabel_21.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Medium, Enum.FontStyle.Normal)
G.TextLabel_21.Text = "TP Bat Aimbot"
G.TextLabel_21.TextColor3 = Color3.fromRGB(220, 239, 228)
G.TextLabel_21.TextSize = 13
G.TextLabel_21.TextXAlignment = Enum.TextXAlignment.Left
G.TextLabel_21.Parent = G.Frame_49

-- Frame_50 (Frame)
G.Frame_50 = Instance.new("Frame")
G.Frame_50.BackgroundColor3 = Color3.fromRGB(35, 48, 41)
G.Frame_50.BorderSizePixel = 0
G.Frame_50.Position = UDim2.new(1, -116, 0.5, -12)
G.Frame_50.Size = UDim2.new(0, 44, 0, 24)
G.Frame_50.ZIndex = 7
G.Frame_50.Parent = G.Frame_49

-- UICorner_52 (UICorner)
G.UICorner_52 = Instance.new("UICorner")
G.UICorner_52.CornerRadius = UDim.new(0, 11)
G.UICorner_52.Parent = G.Frame_50

-- Frame_51 (Frame)
G.Frame_51 = Instance.new("Frame")
G.Frame_51.BackgroundColor3 = Color3.fromRGB(119, 149, 130)
G.Frame_51.BorderSizePixel = 0
G.Frame_51.Position = UDim2.new(0, 4, 0.5, -7)
G.Frame_51.Size = UDim2.new(0, 14, 0, 14)
G.Frame_51.ZIndex = 8
G.Frame_51.Parent = G.Frame_50

-- UICorner_53 (UICorner)
G.UICorner_53 = Instance.new("UICorner")
G.UICorner_53.CornerRadius = UDim.new(0, 7)
G.UICorner_53.Parent = G.Frame_51

-- TextButton_16 (TextButton)
G.TextButton_16 = Instance.new("TextButton")
G.TextButton_16.BackgroundTransparency = 1
G.TextButton_16.BorderSizePixel = 0
G.TextButton_16.Size = UDim2.new(1, 0, 1, 0)
G.TextButton_16.ZIndex = 9
G.TextButton_16.Text = ""
G.TextButton_16.Parent = G.Frame_50

-- TextButton_17 (TextButton)
G.TextButton_17 = Instance.new("TextButton")
G.TextButton_17.BackgroundColor3 = Color3.fromRGB(18, 26, 20)
G.TextButton_17.BorderSizePixel = 0
G.TextButton_17.Position = UDim2.new(1, -64, 0.5, -14)
G.TextButton_17.Size = UDim2.new(0, 58, 0, 28)
G.TextButton_17.ZIndex = 8
G.TextButton_17.AutoButtonColor = false
G.TextButton_17.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Heavy, Enum.FontStyle.Normal)
G.TextButton_17.Text = "None"
G.TextButton_17.TextColor3 = Color3.fromRGB(105, 150, 120)
G.TextButton_17.TextSize = 11
G.TextButton_17.TextWrapped = true
G.TextButton_17.Parent = G.Frame_49

-- UICorner_54 (UICorner)
G.UICorner_54 = Instance.new("UICorner")
G.UICorner_54.CornerRadius = UDim.new(0, 9)
G.UICorner_54.Parent = G.TextButton_17

-- KeybindStroke_4 (UIStroke)
G.KeybindStroke_4 = Instance.new("UIStroke")
G.KeybindStroke_4.Name = "KeybindStroke"
G.KeybindStroke_4.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
G.KeybindStroke_4.Color = Color3.fromRGB(35, 75, 48)
G.KeybindStroke_4.Transparency = 0.44999998807907104
G.KeybindStroke_4.Parent = G.TextButton_17

-- TextButton_18 (TextButton)
G.TextButton_18 = Instance.new("TextButton")
G.TextButton_18.BackgroundTransparency = 1
G.TextButton_18.BorderSizePixel = 0
G.TextButton_18.Size = UDim2.new(1, -72, 1, 0)
G.TextButton_18.ZIndex = 5
G.TextButton_18.Text = ""
G.TextButton_18.Parent = G.Frame_49

-- Frame_52 (Frame)
G.Frame_52 = Instance.new("Frame")
G.Frame_52.BackgroundColor3 = Color3.fromRGB(19, 33, 26)
G.Frame_52.BackgroundTransparency = 0.11999999731779099
G.Frame_52.BorderSizePixel = 0
G.Frame_52.LayoutOrder = 11
G.Frame_52.Size = UDim2.new(1, -16, 0, 42)
G.Frame_52.Parent = G.Combat

-- UICorner_55 (UICorner)
G.UICorner_55 = Instance.new("UICorner")
G.UICorner_55.CornerRadius = UDim.new(0, 16)
G.UICorner_55.Parent = G.Frame_52

-- UIStroke_30 (UIStroke)
G.UIStroke_30 = Instance.new("UIStroke")
G.UIStroke_30.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
G.UIStroke_30.Color = Color3.fromRGB(31, 54, 40)
G.UIStroke_30.Transparency = 0.5
G.UIStroke_30.Parent = G.Frame_52

-- TextLabel_22 (TextLabel)
G.TextLabel_22 = Instance.new("TextLabel")
G.TextLabel_22.BackgroundTransparency = 1
G.TextLabel_22.Position = UDim2.new(0, 12, 0, 0)
G.TextLabel_22.Size = UDim2.new(1, -70, 1, 0)
G.TextLabel_22.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Medium, Enum.FontStyle.Normal)
G.TextLabel_22.Text = "Body Lock"
G.TextLabel_22.TextColor3 = Color3.fromRGB(220, 239, 228)
G.TextLabel_22.TextSize = 13
G.TextLabel_22.TextXAlignment = Enum.TextXAlignment.Left
G.TextLabel_22.Parent = G.Frame_52

-- Frame_53 (Frame)
G.Frame_53 = Instance.new("Frame")
G.Frame_53.BackgroundColor3 = Color3.fromRGB(35, 48, 41)
G.Frame_53.BorderSizePixel = 0
G.Frame_53.Position = UDim2.new(1, -62, 0.5, -12)
G.Frame_53.Size = UDim2.new(0, 48, 0, 24)
G.Frame_53.ZIndex = 7
G.Frame_53.Parent = G.Frame_52

-- UICorner_56 (UICorner)
G.UICorner_56 = Instance.new("UICorner")
G.UICorner_56.CornerRadius = UDim.new(0, 11)
G.UICorner_56.Parent = G.Frame_53

-- Frame_54 (Frame)
G.Frame_54 = Instance.new("Frame")
G.Frame_54.BackgroundColor3 = Color3.fromRGB(119, 149, 130)
G.Frame_54.BorderSizePixel = 0
G.Frame_54.Position = UDim2.new(0, 4, 0.5, -7)
G.Frame_54.Size = UDim2.new(0, 14, 0, 14)
G.Frame_54.ZIndex = 8
G.Frame_54.Parent = G.Frame_53

-- UICorner_57 (UICorner)
G.UICorner_57 = Instance.new("UICorner")
G.UICorner_57.CornerRadius = UDim.new(0, 7)
G.UICorner_57.Parent = G.Frame_54

-- TextButton_19 (TextButton)
G.TextButton_19 = Instance.new("TextButton")
G.TextButton_19.BackgroundTransparency = 1
G.TextButton_19.BorderSizePixel = 0
G.TextButton_19.Size = UDim2.new(1, 0, 1, 0)
G.TextButton_19.ZIndex = 9
G.TextButton_19.Text = ""
G.TextButton_19.Parent = G.Frame_53

-- TextButton_20 (TextButton)
G.TextButton_20 = Instance.new("TextButton")
G.TextButton_20.BackgroundTransparency = 1
G.TextButton_20.BorderSizePixel = 0
G.TextButton_20.Size = UDim2.new(1, -56, 1, 0)
G.TextButton_20.ZIndex = 5
G.TextButton_20.Text = ""
G.TextButton_20.Parent = G.Frame_52

-- Frame_55 (Frame)
G.Frame_55 = Instance.new("Frame")
G.Frame_55.BackgroundColor3 = Color3.fromRGB(19, 33, 26)
G.Frame_55.BackgroundTransparency = 0.11999999731779099
G.Frame_55.BorderSizePixel = 0
G.Frame_55.LayoutOrder = 12
G.Frame_55.Size = UDim2.new(1, -16, 0, 42)
G.Frame_55.Parent = G.Combat

-- UICorner_58 (UICorner)
G.UICorner_58 = Instance.new("UICorner")
G.UICorner_58.CornerRadius = UDim.new(0, 16)
G.UICorner_58.Parent = G.Frame_55

-- UIStroke_31 (UIStroke)
G.UIStroke_31 = Instance.new("UIStroke")
G.UIStroke_31.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
G.UIStroke_31.Color = Color3.fromRGB(31, 54, 40)
G.UIStroke_31.Transparency = 0.5
G.UIStroke_31.Parent = G.Frame_55

-- TextLabel_23 (TextLabel)
G.TextLabel_23 = Instance.new("TextLabel")
G.TextLabel_23.BackgroundTransparency = 1
G.TextLabel_23.Position = UDim2.new(0, 12, 0, 0)
G.TextLabel_23.Size = UDim2.new(1, -100, 1, 0)
G.TextLabel_23.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Medium, Enum.FontStyle.Normal)
G.TextLabel_23.Text = "Body Lock Radius"
G.TextLabel_23.TextColor3 = Color3.fromRGB(220, 239, 228)
G.TextLabel_23.TextSize = 13
G.TextLabel_23.TextXAlignment = Enum.TextXAlignment.Left
G.TextLabel_23.Parent = G.Frame_55

-- Frame_56 (Frame)
G.Frame_56 = Instance.new("Frame")
G.Frame_56.BackgroundColor3 = Color3.fromRGB(9, 23, 15)
G.Frame_56.BorderSizePixel = 0
G.Frame_56.Position = UDim2.new(1, -88, 0.5, -15)
G.Frame_56.Size = UDim2.new(0, 76, 0, 30)
G.Frame_56.Parent = G.Frame_55

-- UICorner_59 (UICorner)
G.UICorner_59 = Instance.new("UICorner")
G.UICorner_59.CornerRadius = UDim.new(0, 13)
G.UICorner_59.Parent = G.Frame_56

-- UIStroke_32 (UIStroke)
G.UIStroke_32 = Instance.new("UIStroke")
G.UIStroke_32.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
G.UIStroke_32.Color = Color3.fromRGB(31, 54, 40)
G.UIStroke_32.Transparency = 0.30000001192092896
G.UIStroke_32.Parent = G.Frame_56

-- TextBox_7 (TextBox)
G.TextBox_7 = Instance.new("TextBox")
G.TextBox_7.BackgroundTransparency = 1
G.TextBox_7.Position = UDim2.new(0, 4, 0, 0)
G.TextBox_7.Size = UDim2.new(1, -8, 1, 0)
G.TextBox_7.ZIndex = 8
G.TextBox_7.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal)
G.TextBox_7.Text = "20"
G.TextBox_7.TextColor3 = Color3.fromRGB(154, 255, 191)
G.TextBox_7.TextSize = 14
G.TextBox_7.ClearTextOnFocus = false
G.TextBox_7.Parent = G.Frame_56

-- Frame_57 (Frame)
G.Frame_57 = Instance.new("Frame")
G.Frame_57.BackgroundTransparency = 1
G.Frame_57.BorderSizePixel = 0
G.Frame_57.LayoutOrder = 13
G.Frame_57.Size = UDim2.new(1, 0, 0, 6)
G.Frame_57.Parent = G.Combat

-- Frame_58 (Frame)
G.Frame_58 = Instance.new("Frame")
G.Frame_58.BackgroundColor3 = Color3.fromRGB(40, 92, 64)
G.Frame_58.BackgroundTransparency = 0.25
G.Frame_58.BorderSizePixel = 0
G.Frame_58.LayoutOrder = 14
G.Frame_58.Size = UDim2.new(1, -10, 0, 32)
G.Frame_58.Parent = G.Combat

-- UICorner_60 (UICorner)
G.UICorner_60 = Instance.new("UICorner")
G.UICorner_60.CornerRadius = UDim.new(0, 10)
G.UICorner_60.Parent = G.Frame_58

-- UIStroke_33 (UIStroke)
G.UIStroke_33 = Instance.new("UIStroke")
G.UIStroke_33.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
G.UIStroke_33.Color = Color3.fromRGB(24, 65, 38)
G.UIStroke_33.Transparency = 0.40000000596046448
G.UIStroke_33.Parent = G.Frame_58

-- Frame_59 (Frame)
G.Frame_59 = Instance.new("Frame")
G.Frame_59.BackgroundColor3 = Color3.fromRGB(42, 230, 123)
G.Frame_59.BorderSizePixel = 0
G.Frame_59.Position = UDim2.new(0, 10, 0, 9)
G.Frame_59.Size = UDim2.new(0, 4, 1, -18)
G.Frame_59.Parent = G.Frame_58

-- UICorner_61 (UICorner)
G.UICorner_61 = Instance.new("UICorner")
G.UICorner_61.CornerRadius = UDim.new(0, 2)
G.UICorner_61.Parent = G.Frame_59

-- TextLabel_24 (TextLabel)
G.TextLabel_24 = Instance.new("TextLabel")
G.TextLabel_24.BackgroundTransparency = 1
G.TextLabel_24.Position = UDim2.new(0, 22, 0, 0)
G.TextLabel_24.Size = UDim2.new(1, -30, 1, 0)
G.TextLabel_24.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal)
G.TextLabel_24.Text = "BAT COUNTER / MEDUSA"
G.TextLabel_24.TextColor3 = Color3.fromRGB(218, 255, 233)
G.TextLabel_24.TextSize = 13
G.TextLabel_24.TextXAlignment = Enum.TextXAlignment.Left
G.TextLabel_24.Parent = G.Frame_58

-- Frame_60 (Frame)
G.Frame_60 = Instance.new("Frame")
G.Frame_60.BackgroundColor3 = Color3.fromRGB(19, 33, 26)
G.Frame_60.BackgroundTransparency = 0.11999999731779099
G.Frame_60.BorderSizePixel = 0
G.Frame_60.LayoutOrder = 15
G.Frame_60.Size = UDim2.new(1, -16, 0, 42)
G.Frame_60.Parent = G.Combat

-- UICorner_62 (UICorner)
G.UICorner_62 = Instance.new("UICorner")
G.UICorner_62.CornerRadius = UDim.new(0, 16)
G.UICorner_62.Parent = G.Frame_60

-- UIStroke_34 (UIStroke)
G.UIStroke_34 = Instance.new("UIStroke")
G.UIStroke_34.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
G.UIStroke_34.Color = Color3.fromRGB(31, 54, 40)
G.UIStroke_34.Transparency = 0.5
G.UIStroke_34.Parent = G.Frame_60

-- TextLabel_25 (TextLabel)
G.TextLabel_25 = Instance.new("TextLabel")
G.TextLabel_25.BackgroundTransparency = 1
G.TextLabel_25.Position = UDim2.new(0, 12, 0, 0)
G.TextLabel_25.Size = UDim2.new(1, -70, 1, 0)
G.TextLabel_25.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Medium, Enum.FontStyle.Normal)
G.TextLabel_25.Text = "Bat Counter"
G.TextLabel_25.TextColor3 = Color3.fromRGB(220, 239, 228)
G.TextLabel_25.TextSize = 13
G.TextLabel_25.TextXAlignment = Enum.TextXAlignment.Left
G.TextLabel_25.Parent = G.Frame_60

-- Frame_61 (Frame)
G.Frame_61 = Instance.new("Frame")
G.Frame_61.BackgroundColor3 = Color3.fromRGB(35, 48, 41)
G.Frame_61.BorderSizePixel = 0
G.Frame_61.Position = UDim2.new(1, -62, 0.5, -12)
G.Frame_61.Size = UDim2.new(0, 48, 0, 24)
G.Frame_61.ZIndex = 7
G.Frame_61.Parent = G.Frame_60

-- UICorner_63 (UICorner)
G.UICorner_63 = Instance.new("UICorner")
G.UICorner_63.CornerRadius = UDim.new(0, 11)
G.UICorner_63.Parent = G.Frame_61

-- Frame_62 (Frame)
G.Frame_62 = Instance.new("Frame")
G.Frame_62.BackgroundColor3 = Color3.fromRGB(119, 149, 130)
G.Frame_62.BorderSizePixel = 0
G.Frame_62.Position = UDim2.new(0, 4, 0.5, -7)
G.Frame_62.Size = UDim2.new(0, 14, 0, 14)
G.Frame_62.ZIndex = 8
G.Frame_62.Parent = G.Frame_61

-- UICorner_64 (UICorner)
G.UICorner_64 = Instance.new("UICorner")
G.UICorner_64.CornerRadius = UDim.new(0, 7)
G.UICorner_64.Parent = G.Frame_62

-- TextButton_21 (TextButton)
G.TextButton_21 = Instance.new("TextButton")
G.TextButton_21.BackgroundTransparency = 1
G.TextButton_21.BorderSizePixel = 0
G.TextButton_21.Size = UDim2.new(1, 0, 1, 0)
G.TextButton_21.ZIndex = 9
G.TextButton_21.Text = ""
G.TextButton_21.Parent = G.Frame_61

-- TextButton_22 (TextButton)
G.TextButton_22 = Instance.new("TextButton")
G.TextButton_22.BackgroundTransparency = 1
G.TextButton_22.BorderSizePixel = 0
G.TextButton_22.Size = UDim2.new(1, -56, 1, 0)
G.TextButton_22.ZIndex = 5
G.TextButton_22.Text = ""
G.TextButton_22.Parent = G.Frame_60

-- Frame_63 (Frame)
G.Frame_63 = Instance.new("Frame")
G.Frame_63.BackgroundColor3 = Color3.fromRGB(19, 33, 26)
G.Frame_63.BackgroundTransparency = 0.11999999731779099
G.Frame_63.BorderSizePixel = 0
G.Frame_63.LayoutOrder = 16
G.Frame_63.Size = UDim2.new(1, -16, 0, 42)
G.Frame_63.Parent = G.Combat

-- UICorner_65 (UICorner)
G.UICorner_65 = Instance.new("UICorner")
G.UICorner_65.CornerRadius = UDim.new(0, 16)
G.UICorner_65.Parent = G.Frame_63

-- UIStroke_35 (UIStroke)
G.UIStroke_35 = Instance.new("UIStroke")
G.UIStroke_35.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
G.UIStroke_35.Color = Color3.fromRGB(31, 54, 40)
G.UIStroke_35.Transparency = 0.5
G.UIStroke_35.Parent = G.Frame_63

-- TextLabel_26 (TextLabel)
G.TextLabel_26 = Instance.new("TextLabel")
G.TextLabel_26.BackgroundTransparency = 1
G.TextLabel_26.Position = UDim2.new(0, 12, 0, 0)
G.TextLabel_26.Size = UDim2.new(1, -70, 1, 0)
G.TextLabel_26.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Medium, Enum.FontStyle.Normal)
G.TextLabel_26.Text = "Medusa Counter"
G.TextLabel_26.TextColor3 = Color3.fromRGB(220, 239, 228)
G.TextLabel_26.TextSize = 13
G.TextLabel_26.TextXAlignment = Enum.TextXAlignment.Left
G.TextLabel_26.Parent = G.Frame_63

-- Frame_64 (Frame)
G.Frame_64 = Instance.new("Frame")
G.Frame_64.BackgroundColor3 = Color3.fromRGB(35, 48, 41)
G.Frame_64.BorderSizePixel = 0
G.Frame_64.Position = UDim2.new(1, -62, 0.5, -12)
G.Frame_64.Size = UDim2.new(0, 48, 0, 24)
G.Frame_64.ZIndex = 7
G.Frame_64.Parent = G.Frame_63

-- UICorner_66 (UICorner)
G.UICorner_66 = Instance.new("UICorner")
G.UICorner_66.CornerRadius = UDim.new(0, 11)
G.UICorner_66.Parent = G.Frame_64

-- Frame_65 (Frame)
G.Frame_65 = Instance.new("Frame")
G.Frame_65.BackgroundColor3 = Color3.fromRGB(119, 149, 130)
G.Frame_65.BorderSizePixel = 0
G.Frame_65.Position = UDim2.new(0, 4, 0.5, -7)
G.Frame_65.Size = UDim2.new(0, 14, 0, 14)
G.Frame_65.ZIndex = 8
G.Frame_65.Parent = G.Frame_64

-- UICorner_67 (UICorner)
G.UICorner_67 = Instance.new("UICorner")
G.UICorner_67.CornerRadius = UDim.new(0, 7)
G.UICorner_67.Parent = G.Frame_65

-- TextButton_23 (TextButton)
G.TextButton_23 = Instance.new("TextButton")
G.TextButton_23.BackgroundTransparency = 1
G.TextButton_23.BorderSizePixel = 0
G.TextButton_23.Size = UDim2.new(1, 0, 1, 0)
G.TextButton_23.ZIndex = 9
G.TextButton_23.Text = ""
G.TextButton_23.Parent = G.Frame_64

-- TextButton_24 (TextButton)
G.TextButton_24 = Instance.new("TextButton")
G.TextButton_24.BackgroundTransparency = 1
G.TextButton_24.BorderSizePixel = 0
G.TextButton_24.Size = UDim2.new(1, -56, 1, 0)
G.TextButton_24.ZIndex = 5
G.TextButton_24.Text = ""
G.TextButton_24.Parent = G.Frame_63

-- Frame_66 (Frame)
G.Frame_66 = Instance.new("Frame")
G.Frame_66.BackgroundColor3 = Color3.fromRGB(19, 33, 26)
G.Frame_66.BackgroundTransparency = 0.11999999731779099
G.Frame_66.BorderSizePixel = 0
G.Frame_66.LayoutOrder = 17
G.Frame_66.Size = UDim2.new(1, -16, 0, 42)
G.Frame_66.Parent = G.Combat

-- UICorner_68 (UICorner)
G.UICorner_68 = Instance.new("UICorner")
G.UICorner_68.CornerRadius = UDim.new(0, 16)
G.UICorner_68.Parent = G.Frame_66

-- UIStroke_36 (UIStroke)
G.UIStroke_36 = Instance.new("UIStroke")
G.UIStroke_36.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
G.UIStroke_36.Color = Color3.fromRGB(31, 54, 40)
G.UIStroke_36.Transparency = 0.5
G.UIStroke_36.Parent = G.Frame_66

-- TextLabel_27 (TextLabel)
G.TextLabel_27 = Instance.new("TextLabel")
G.TextLabel_27.BackgroundTransparency = 1
G.TextLabel_27.Position = UDim2.new(0, 12, 0, 0)
G.TextLabel_27.Size = UDim2.new(1, -70, 1, 0)
G.TextLabel_27.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Medium, Enum.FontStyle.Normal)
G.TextLabel_27.Text = "Reset On Medusa"
G.TextLabel_27.TextColor3 = Color3.fromRGB(220, 239, 228)
G.TextLabel_27.TextSize = 13
G.TextLabel_27.TextXAlignment = Enum.TextXAlignment.Left
G.TextLabel_27.Parent = G.Frame_66

-- Frame_67 (Frame)
G.Frame_67 = Instance.new("Frame")
G.Frame_67.BackgroundColor3 = Color3.fromRGB(35, 48, 41)
G.Frame_67.BorderSizePixel = 0
G.Frame_67.Position = UDim2.new(1, -62, 0.5, -12)
G.Frame_67.Size = UDim2.new(0, 48, 0, 24)
G.Frame_67.ZIndex = 7
G.Frame_67.Parent = G.Frame_66

-- UICorner_69 (UICorner)
G.UICorner_69 = Instance.new("UICorner")
G.UICorner_69.CornerRadius = UDim.new(0, 11)
G.UICorner_69.Parent = G.Frame_67

-- Frame_68 (Frame)
G.Frame_68 = Instance.new("Frame")
G.Frame_68.BackgroundColor3 = Color3.fromRGB(119, 149, 130)
G.Frame_68.BorderSizePixel = 0
G.Frame_68.Position = UDim2.new(0, 4, 0.5, -7)
G.Frame_68.Size = UDim2.new(0, 14, 0, 14)
G.Frame_68.ZIndex = 8
G.Frame_68.Parent = G.Frame_67

-- UICorner_70 (UICorner)
G.UICorner_70 = Instance.new("UICorner")
G.UICorner_70.CornerRadius = UDim.new(0, 7)
G.UICorner_70.Parent = G.Frame_68

-- TextButton_25 (TextButton)
G.TextButton_25 = Instance.new("TextButton")
G.TextButton_25.BackgroundTransparency = 1
G.TextButton_25.BorderSizePixel = 0
G.TextButton_25.Size = UDim2.new(1, 0, 1, 0)
G.TextButton_25.ZIndex = 9
G.TextButton_25.Text = ""
G.TextButton_25.Parent = G.Frame_67

-- TextButton_26 (TextButton)
G.TextButton_26 = Instance.new("TextButton")
G.TextButton_26.BackgroundTransparency = 1
G.TextButton_26.BorderSizePixel = 0
G.TextButton_26.Size = UDim2.new(1, -56, 1, 0)
G.TextButton_26.ZIndex = 5
G.TextButton_26.Text = ""
G.TextButton_26.Parent = G.Frame_66

-- AutoSteal (Frame)
G.AutoSteal = Instance.new("Frame")
G.AutoSteal.Name = "Auto Steal"
G.AutoSteal.AutomaticSize = Enum.AutomaticSize.Y
G.AutoSteal.BackgroundTransparency = 1
G.AutoSteal.BorderSizePixel = 0
G.AutoSteal.LayoutOrder = 3
G.AutoSteal.Size = UDim2.new(1, 0, 0, 0)
G.AutoSteal.Visible = false
G.AutoSteal.Parent = G.MainScroll

-- UIListLayout_4 (UIListLayout)
G.UIListLayout_4 = Instance.new("UIListLayout")
G.UIListLayout_4.HorizontalAlignment = Enum.HorizontalAlignment.Center
G.UIListLayout_4.Padding = UDim.new(0, 6)
G.UIListLayout_4.SortOrder = Enum.SortOrder.LayoutOrder
G.UIListLayout_4.Parent = G.AutoSteal

-- Frame_69 (Frame)
G.Frame_69 = Instance.new("Frame")
G.Frame_69.BackgroundTransparency = 1
G.Frame_69.BorderSizePixel = 0
G.Frame_69.LayoutOrder = 1
G.Frame_69.Size = UDim2.new(1, 0, 0, 2)
G.Frame_69.Parent = G.AutoSteal

-- Frame_70 (Frame)
G.Frame_70 = Instance.new("Frame")
G.Frame_70.BackgroundColor3 = Color3.fromRGB(40, 92, 64)
G.Frame_70.BackgroundTransparency = 0.25
G.Frame_70.BorderSizePixel = 0
G.Frame_70.LayoutOrder = 2
G.Frame_70.Size = UDim2.new(1, -10, 0, 32)
G.Frame_70.Parent = G.AutoSteal

-- UICorner_71 (UICorner)
G.UICorner_71 = Instance.new("UICorner")
G.UICorner_71.CornerRadius = UDim.new(0, 10)
G.UICorner_71.Parent = G.Frame_70

-- UIStroke_37 (UIStroke)
G.UIStroke_37 = Instance.new("UIStroke")
G.UIStroke_37.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
G.UIStroke_37.Color = Color3.fromRGB(24, 65, 38)
G.UIStroke_37.Transparency = 0.40000000596046448
G.UIStroke_37.Parent = G.Frame_70

-- Frame_71 (Frame)
G.Frame_71 = Instance.new("Frame")
G.Frame_71.BackgroundColor3 = Color3.fromRGB(42, 230, 123)
G.Frame_71.BorderSizePixel = 0
G.Frame_71.Position = UDim2.new(0, 10, 0, 9)
G.Frame_71.Size = UDim2.new(0, 4, 1, -18)
G.Frame_71.Parent = G.Frame_70

-- UICorner_72 (UICorner)
G.UICorner_72 = Instance.new("UICorner")
G.UICorner_72.CornerRadius = UDim.new(0, 2)
G.UICorner_72.Parent = G.Frame_71

-- TextLabel_28 (TextLabel)
G.TextLabel_28 = Instance.new("TextLabel")
G.TextLabel_28.BackgroundTransparency = 1
G.TextLabel_28.Position = UDim2.new(0, 22, 0, 0)
G.TextLabel_28.Size = UDim2.new(1, -30, 1, 0)
G.TextLabel_28.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal)
G.TextLabel_28.Text = "INSTA GRAB"
G.TextLabel_28.TextColor3 = Color3.fromRGB(218, 255, 233)
G.TextLabel_28.TextSize = 13
G.TextLabel_28.TextXAlignment = Enum.TextXAlignment.Left
G.TextLabel_28.Parent = G.Frame_70

-- Frame_72 (Frame)
G.Frame_72 = Instance.new("Frame")
G.Frame_72.BackgroundTransparency = 1
G.Frame_72.BorderSizePixel = 0
G.Frame_72.LayoutOrder = 3
G.Frame_72.Size = UDim2.new(1, 0, 0, 2)
G.Frame_72.Parent = G.AutoSteal

-- Frame_73 (Frame)
G.Frame_73 = Instance.new("Frame")
G.Frame_73.BackgroundColor3 = Color3.fromRGB(19, 33, 26)
G.Frame_73.BackgroundTransparency = 0.11999999731779099
G.Frame_73.BorderSizePixel = 0
G.Frame_73.LayoutOrder = 4
G.Frame_73.Size = UDim2.new(1, -16, 0, 42)
G.Frame_73.Parent = G.AutoSteal

-- UICorner_73 (UICorner)
G.UICorner_73 = Instance.new("UICorner")
G.UICorner_73.CornerRadius = UDim.new(0, 16)
G.UICorner_73.Parent = G.Frame_73

-- UIStroke_38 (UIStroke)
G.UIStroke_38 = Instance.new("UIStroke")
G.UIStroke_38.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
G.UIStroke_38.Color = Color3.fromRGB(31, 54, 40)
G.UIStroke_38.Transparency = 0.5
G.UIStroke_38.Parent = G.Frame_73

-- TextLabel_29 (TextLabel)
G.TextLabel_29 = Instance.new("TextLabel")
G.TextLabel_29.BackgroundTransparency = 1
G.TextLabel_29.Position = UDim2.new(0, 12, 0, 0)
G.TextLabel_29.Size = UDim2.new(1, -70, 1, 0)
G.TextLabel_29.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Medium, Enum.FontStyle.Normal)
G.TextLabel_29.Text = "Auto Steal"
G.TextLabel_29.TextColor3 = Color3.fromRGB(220, 239, 228)
G.TextLabel_29.TextSize = 13
G.TextLabel_29.TextXAlignment = Enum.TextXAlignment.Left
G.TextLabel_29.Parent = G.Frame_73

-- Frame_74 (Frame)
G.Frame_74 = Instance.new("Frame")
G.Frame_74.BackgroundColor3 = Color3.fromRGB(24, 168, 84)
G.Frame_74.BorderSizePixel = 0
G.Frame_74.Position = UDim2.new(1, -62, 0.5, -12)
G.Frame_74.Size = UDim2.new(0, 48, 0, 24)
G.Frame_74.ZIndex = 7
G.Frame_74.Parent = G.Frame_73

-- UICorner_74 (UICorner)
G.UICorner_74 = Instance.new("UICorner")
G.UICorner_74.CornerRadius = UDim.new(0, 11)
G.UICorner_74.Parent = G.Frame_74

-- Frame_75 (Frame)
G.Frame_75 = Instance.new("Frame")
G.Frame_75.BackgroundColor3 = Color3.fromRGB(219, 255, 232)
G.Frame_75.BorderSizePixel = 0
G.Frame_75.Position = UDim2.new(1, -18, 0.5, -7)
G.Frame_75.Size = UDim2.new(0, 14, 0, 14)
G.Frame_75.ZIndex = 8
G.Frame_75.Parent = G.Frame_74

-- UICorner_75 (UICorner)
G.UICorner_75 = Instance.new("UICorner")
G.UICorner_75.CornerRadius = UDim.new(0, 7)
G.UICorner_75.Parent = G.Frame_75

-- TextButton_27 (TextButton)
G.TextButton_27 = Instance.new("TextButton")
G.TextButton_27.BackgroundTransparency = 1
G.TextButton_27.BorderSizePixel = 0
G.TextButton_27.Size = UDim2.new(1, 0, 1, 0)
G.TextButton_27.ZIndex = 9
G.TextButton_27.Text = ""
G.TextButton_27.Parent = G.Frame_74

-- TextButton_28 (TextButton)
G.TextButton_28 = Instance.new("TextButton")
G.TextButton_28.BackgroundTransparency = 1
G.TextButton_28.BorderSizePixel = 0
G.TextButton_28.Size = UDim2.new(1, -56, 1, 0)
G.TextButton_28.ZIndex = 5
G.TextButton_28.Text = ""
G.TextButton_28.Parent = G.Frame_73

-- Frame_76 (Frame)
G.Frame_76 = Instance.new("Frame")
G.Frame_76.BackgroundTransparency = 1
G.Frame_76.BorderSizePixel = 0
G.Frame_76.LayoutOrder = 5
G.Frame_76.Size = UDim2.new(1, 0, 0, 4)
G.Frame_76.Parent = G.AutoSteal

-- Frame_77 (Frame)
G.Frame_77 = Instance.new("Frame")
G.Frame_77.BackgroundTransparency = 1
G.Frame_77.BorderSizePixel = 0
G.Frame_77.LayoutOrder = 6
G.Frame_77.Size = UDim2.new(1, 0, 0, 4)
G.Frame_77.Parent = G.AutoSteal

-- Frame_78 (Frame)
G.Frame_78 = Instance.new("Frame")
G.Frame_78.BackgroundColor3 = Color3.fromRGB(40, 92, 64)
G.Frame_78.BackgroundTransparency = 0.25
G.Frame_78.BorderSizePixel = 0
G.Frame_78.LayoutOrder = 7
G.Frame_78.Size = UDim2.new(1, -10, 0, 32)
G.Frame_78.Parent = G.AutoSteal

-- UICorner_76 (UICorner)
G.UICorner_76 = Instance.new("UICorner")
G.UICorner_76.CornerRadius = UDim.new(0, 10)
G.UICorner_76.Parent = G.Frame_78

-- UIStroke_39 (UIStroke)
G.UIStroke_39 = Instance.new("UIStroke")
G.UIStroke_39.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
G.UIStroke_39.Color = Color3.fromRGB(24, 65, 38)
G.UIStroke_39.Transparency = 0.40000000596046448
G.UIStroke_39.Parent = G.Frame_78

-- Frame_79 (Frame)
G.Frame_79 = Instance.new("Frame")
G.Frame_79.BackgroundColor3 = Color3.fromRGB(42, 230, 123)
G.Frame_79.BorderSizePixel = 0
G.Frame_79.Position = UDim2.new(0, 10, 0, 9)
G.Frame_79.Size = UDim2.new(0, 4, 1, -18)
G.Frame_79.Parent = G.Frame_78

-- UICorner_77 (UICorner)
G.UICorner_77 = Instance.new("UICorner")
G.UICorner_77.CornerRadius = UDim.new(0, 2)
G.UICorner_77.Parent = G.Frame_79

-- TextLabel_30 (TextLabel)
G.TextLabel_30 = Instance.new("TextLabel")
G.TextLabel_30.BackgroundTransparency = 1
G.TextLabel_30.Position = UDim2.new(0, 22, 0, 0)
G.TextLabel_30.Size = UDim2.new(1, -30, 1, 0)
G.TextLabel_30.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal)
G.TextLabel_30.Text = "STEAL CONFIG"
G.TextLabel_30.TextColor3 = Color3.fromRGB(218, 255, 233)
G.TextLabel_30.TextSize = 13
G.TextLabel_30.TextXAlignment = Enum.TextXAlignment.Left
G.TextLabel_30.Parent = G.Frame_78

-- Frame_80 (Frame)
G.Frame_80 = Instance.new("Frame")
G.Frame_80.BackgroundTransparency = 1
G.Frame_80.BorderSizePixel = 0
G.Frame_80.LayoutOrder = 8
G.Frame_80.Size = UDim2.new(1, 0, 0, 2)
G.Frame_80.Parent = G.AutoSteal

-- Frame_81 (Frame)
G.Frame_81 = Instance.new("Frame")
G.Frame_81.BackgroundColor3 = Color3.fromRGB(19, 33, 26)
G.Frame_81.BackgroundTransparency = 0.11999999731779099
G.Frame_81.BorderSizePixel = 0
G.Frame_81.LayoutOrder = 9
G.Frame_81.Size = UDim2.new(1, -16, 0, 42)
G.Frame_81.Parent = G.AutoSteal

-- UICorner_78 (UICorner)
G.UICorner_78 = Instance.new("UICorner")
G.UICorner_78.CornerRadius = UDim.new(0, 16)
G.UICorner_78.Parent = G.Frame_81

-- UIStroke_40 (UIStroke)
G.UIStroke_40 = Instance.new("UIStroke")
G.UIStroke_40.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
G.UIStroke_40.Color = Color3.fromRGB(31, 54, 40)
G.UIStroke_40.Transparency = 0.5
G.UIStroke_40.Parent = G.Frame_81

-- TextLabel_31 (TextLabel)
G.TextLabel_31 = Instance.new("TextLabel")
G.TextLabel_31.BackgroundTransparency = 1
G.TextLabel_31.Position = UDim2.new(0, 12, 0, 0)
G.TextLabel_31.Size = UDim2.new(1, -100, 1, 0)
G.TextLabel_31.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Medium, Enum.FontStyle.Normal)
G.TextLabel_31.Text = "Radius"
G.TextLabel_31.TextColor3 = Color3.fromRGB(220, 239, 228)
G.TextLabel_31.TextSize = 13
G.TextLabel_31.TextXAlignment = Enum.TextXAlignment.Left
G.TextLabel_31.Parent = G.Frame_81

-- Frame_82 (Frame)
G.Frame_82 = Instance.new("Frame")
G.Frame_82.BackgroundColor3 = Color3.fromRGB(9, 23, 15)
G.Frame_82.BorderSizePixel = 0
G.Frame_82.Position = UDim2.new(1, -88, 0.5, -15)
G.Frame_82.Size = UDim2.new(0, 76, 0, 30)
G.Frame_82.Parent = G.Frame_81

-- UICorner_79 (UICorner)
G.UICorner_79 = Instance.new("UICorner")
G.UICorner_79.CornerRadius = UDim.new(0, 13)
G.UICorner_79.Parent = G.Frame_82

-- UIStroke_41 (UIStroke)
G.UIStroke_41 = Instance.new("UIStroke")
G.UIStroke_41.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
G.UIStroke_41.Color = Color3.fromRGB(31, 54, 40)
G.UIStroke_41.Transparency = 0.30000001192092896
G.UIStroke_41.Parent = G.Frame_82

-- TextBox_8 (TextBox)
G.TextBox_8 = Instance.new("TextBox")
G.TextBox_8.BackgroundTransparency = 1
G.TextBox_8.Position = UDim2.new(0, 4, 0, 0)
G.TextBox_8.Size = UDim2.new(1, -8, 1, 0)
G.TextBox_8.ZIndex = 8
G.TextBox_8.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal)
G.TextBox_8.Text = "9"
G.TextBox_8.TextColor3 = Color3.fromRGB(154, 255, 191)
G.TextBox_8.TextSize = 14
G.TextBox_8.ClearTextOnFocus = false
G.TextBox_8.Parent = G.Frame_82

-- Frame_83 (Frame)
G.Frame_83 = Instance.new("Frame")
G.Frame_83.BackgroundColor3 = Color3.fromRGB(19, 33, 26)
G.Frame_83.BackgroundTransparency = 0.11999999731779099
G.Frame_83.BorderSizePixel = 0
G.Frame_83.LayoutOrder = 10
G.Frame_83.Size = UDim2.new(1, -16, 0, 42)
G.Frame_83.Parent = G.AutoSteal

-- UICorner_80 (UICorner)
G.UICorner_80 = Instance.new("UICorner")
G.UICorner_80.CornerRadius = UDim.new(0, 16)
G.UICorner_80.Parent = G.Frame_83

-- UIStroke_42 (UIStroke)
G.UIStroke_42 = Instance.new("UIStroke")
G.UIStroke_42.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
G.UIStroke_42.Color = Color3.fromRGB(31, 54, 40)
G.UIStroke_42.Transparency = 0.5
G.UIStroke_42.Parent = G.Frame_83

-- TextLabel_32 (TextLabel)
G.TextLabel_32 = Instance.new("TextLabel")
G.TextLabel_32.BackgroundTransparency = 1
G.TextLabel_32.Position = UDim2.new(0, 12, 0, 0)
G.TextLabel_32.Size = UDim2.new(1, -100, 1, 0)
G.TextLabel_32.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Medium, Enum.FontStyle.Normal)
G.TextLabel_32.Text = "Duration"
G.TextLabel_32.TextColor3 = Color3.fromRGB(220, 239, 228)
G.TextLabel_32.TextSize = 13
G.TextLabel_32.TextXAlignment = Enum.TextXAlignment.Left
G.TextLabel_32.Parent = G.Frame_83

-- Frame_84 (Frame)
G.Frame_84 = Instance.new("Frame")
G.Frame_84.BackgroundColor3 = Color3.fromRGB(9, 23, 15)
G.Frame_84.BorderSizePixel = 0
G.Frame_84.Position = UDim2.new(1, -88, 0.5, -15)
G.Frame_84.Size = UDim2.new(0, 76, 0, 30)
G.Frame_84.Parent = G.Frame_83

-- UICorner_81 (UICorner)
G.UICorner_81 = Instance.new("UICorner")
G.UICorner_81.CornerRadius = UDim.new(0, 13)
G.UICorner_81.Parent = G.Frame_84

-- UIStroke_43 (UIStroke)
G.UIStroke_43 = Instance.new("UIStroke")
G.UIStroke_43.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
G.UIStroke_43.Color = Color3.fromRGB(31, 54, 40)
G.UIStroke_43.Transparency = 0.30000001192092896
G.UIStroke_43.Parent = G.Frame_84

-- TextBox_9 (TextBox)
G.TextBox_9 = Instance.new("TextBox")
G.TextBox_9.BackgroundTransparency = 1
G.TextBox_9.Position = UDim2.new(0, 4, 0, 0)
G.TextBox_9.Size = UDim2.new(1, -8, 1, 0)
G.TextBox_9.ZIndex = 8
G.TextBox_9.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal)
G.TextBox_9.Text = "1.3"
G.TextBox_9.TextColor3 = Color3.fromRGB(154, 255, 191)
G.TextBox_9.TextSize = 14
G.TextBox_9.ClearTextOnFocus = false
G.TextBox_9.Parent = G.Frame_84

-- Frame_85 (Frame)
G.Frame_85 = Instance.new("Frame")
G.Frame_85.BackgroundTransparency = 1
G.Frame_85.BorderSizePixel = 0
G.Frame_85.LayoutOrder = 11
G.Frame_85.Size = UDim2.new(1, 0, 0, 6)
G.Frame_85.Parent = G.AutoSteal

-- Frame_86 (Frame)
G.Frame_86 = Instance.new("Frame")
G.Frame_86.BackgroundColor3 = Color3.fromRGB(40, 92, 64)
G.Frame_86.BackgroundTransparency = 0.25
G.Frame_86.BorderSizePixel = 0
G.Frame_86.LayoutOrder = 12
G.Frame_86.Size = UDim2.new(1, -10, 0, 32)
G.Frame_86.Parent = G.AutoSteal

-- UICorner_82 (UICorner)
G.UICorner_82 = Instance.new("UICorner")
G.UICorner_82.CornerRadius = UDim.new(0, 10)
G.UICorner_82.Parent = G.Frame_86

-- UIStroke_44 (UIStroke)
G.UIStroke_44 = Instance.new("UIStroke")
G.UIStroke_44.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
G.UIStroke_44.Color = Color3.fromRGB(24, 65, 38)
G.UIStroke_44.Transparency = 0.40000000596046448
G.UIStroke_44.Parent = G.Frame_86

-- Frame_87 (Frame)
G.Frame_87 = Instance.new("Frame")
G.Frame_87.BackgroundColor3 = Color3.fromRGB(42, 230, 123)
G.Frame_87.BorderSizePixel = 0
G.Frame_87.Position = UDim2.new(0, 10, 0, 9)
G.Frame_87.Size = UDim2.new(0, 4, 1, -18)
G.Frame_87.Parent = G.Frame_86

-- UICorner_83 (UICorner)
G.UICorner_83 = Instance.new("UICorner")
G.UICorner_83.CornerRadius = UDim.new(0, 2)
G.UICorner_83.Parent = G.Frame_87

-- TextLabel_33 (TextLabel)
G.TextLabel_33 = Instance.new("TextLabel")
G.TextLabel_33.BackgroundTransparency = 1
G.TextLabel_33.Position = UDim2.new(0, 22, 0, 0)
G.TextLabel_33.Size = UDim2.new(1, -30, 1, 0)
G.TextLabel_33.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal)
G.TextLabel_33.Text = "STEAL MODE"
G.TextLabel_33.TextColor3 = Color3.fromRGB(218, 255, 233)
G.TextLabel_33.TextSize = 13
G.TextLabel_33.TextXAlignment = Enum.TextXAlignment.Left
G.TextLabel_33.Parent = G.Frame_86

-- Frame_88 (Frame)
G.Frame_88 = Instance.new("Frame")
G.Frame_88.BackgroundTransparency = 1
G.Frame_88.BorderSizePixel = 0
G.Frame_88.LayoutOrder = 13
G.Frame_88.Size = UDim2.new(1, 0, 0, 2)
G.Frame_88.Parent = G.AutoSteal

-- Frame_89 (Frame)
G.Frame_89 = Instance.new("Frame")
G.Frame_89.BackgroundColor3 = Color3.fromRGB(8, 18, 12)
G.Frame_89.BorderSizePixel = 0
G.Frame_89.ClipsDescendants = true
G.Frame_89.LayoutOrder = 14
G.Frame_89.Size = UDim2.new(1, -10, 0, 42)
G.Frame_89.Parent = G.AutoSteal

-- UICorner_84 (UICorner)
G.UICorner_84 = Instance.new("UICorner")
G.UICorner_84.CornerRadius = UDim.new(0, 9)
G.UICorner_84.Parent = G.Frame_89

-- UIStroke_45 (UIStroke)
G.UIStroke_45 = Instance.new("UIStroke")
G.UIStroke_45.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
G.UIStroke_45.Color = Color3.fromRGB(30, 86, 52)
G.UIStroke_45.Transparency = 0.31999999284744263
G.UIStroke_45.Parent = G.Frame_89

-- TextLabel_34 (TextLabel)
G.TextLabel_34 = Instance.new("TextLabel")
G.TextLabel_34.BackgroundTransparency = 1
G.TextLabel_34.Position = UDim2.new(0, 14, 0, 0)
G.TextLabel_34.Size = UDim2.new(1, -78, 0, 42)
G.TextLabel_34.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Heavy, Enum.FontStyle.Normal)
G.TextLabel_34.Text = "Steal Mode"
G.TextLabel_34.TextColor3 = Color3.fromRGB(220, 239, 228)
G.TextLabel_34.TextSize = 13
G.TextLabel_34.TextXAlignment = Enum.TextXAlignment.Left
G.TextLabel_34.Parent = G.Frame_89

-- TextButton_29 (TextButton)
G.TextButton_29 = Instance.new("TextButton")
G.TextButton_29.BackgroundColor3 = Color3.fromRGB(10, 14, 12)
G.TextButton_29.BorderSizePixel = 0
G.TextButton_29.Position = UDim2.new(1, -50, 0, 7)
G.TextButton_29.Size = UDim2.new(0, 42, 0, 28)
G.TextButton_29.ZIndex = 33
G.TextButton_29.AutoButtonColor = false
G.TextButton_29.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Heavy, Enum.FontStyle.Normal)
G.TextButton_29.Text = "â–¼"
G.TextButton_29.TextColor3 = Color3.fromRGB(235, 245, 238)
G.TextButton_29.TextSize = 12
G.TextButton_29.Parent = G.Frame_89

-- UICorner_85 (UICorner)
G.UICorner_85 = Instance.new("UICorner")
G.UICorner_85.CornerRadius = UDim.new(0, 9)
G.UICorner_85.Parent = G.TextButton_29

-- UIStroke_46 (UIStroke)
G.UIStroke_46 = Instance.new("UIStroke")
G.UIStroke_46.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
G.UIStroke_46.Color = Color3.fromRGB(28, 48, 36)
G.UIStroke_46.Transparency = 0.34999999403953552
G.UIStroke_46.Parent = G.TextButton_29

-- Frame_90 (Frame)
G.Frame_90 = Instance.new("Frame")
G.Frame_90.BackgroundColor3 = Color3.fromRGB(7, 9, 8)
G.Frame_90.BorderSizePixel = 0
G.Frame_90.Position = UDim2.new(0, 4, 0, 42)
G.Frame_90.Size = UDim2.new(1, -8, 0, 34)
G.Frame_90.Visible = false
G.Frame_90.ZIndex = 30
G.Frame_90.Parent = G.Frame_89

-- UICorner_86 (UICorner)
G.UICorner_86 = Instance.new("UICorner")
G.UICorner_86.Parent = G.Frame_90

-- TextButton_30 (TextButton)
G.TextButton_30 = Instance.new("TextButton")
G.TextButton_30.BackgroundColor3 = Color3.fromRGB(6, 14, 10)
G.TextButton_30.BorderSizePixel = 0
G.TextButton_30.Position = UDim2.new(0, 4, 0, 4)
G.TextButton_30.Size = UDim2.new(0.5, -5, 1, -8)
G.TextButton_30.ZIndex = 32
G.TextButton_30.AutoButtonColor = false
G.TextButton_30.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Heavy, Enum.FontStyle.Normal)
G.TextButton_30.Text = "Normal"
G.TextButton_30.TextColor3 = Color3.fromRGB(225, 240, 230)
G.TextButton_30.TextSize = 11
G.TextButton_30.TextWrapped = true
G.TextButton_30:SetAttribute("SelectorActive", false)
G.TextButton_30.Parent = G.Frame_90

-- UICorner_87 (UICorner)
G.UICorner_87 = Instance.new("UICorner")
G.UICorner_87.CornerRadius = UDim.new(0, 7)
G.UICorner_87.Parent = G.TextButton_30

-- UICorner_88 (UICorner)
G.UICorner_88 = Instance.new("UICorner")
G.UICorner_88.Parent = G.TextButton_30

-- SelectorStroke (UIStroke)
G.SelectorStroke = Instance.new("UIStroke")
G.SelectorStroke.Name = "SelectorStroke"
G.SelectorStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
G.SelectorStroke.Color = Color3.fromRGB(24, 54, 34)
G.SelectorStroke.Transparency = 0.64999997615814209
G.SelectorStroke.Parent = G.TextButton_30

-- SelectorShine (Frame)
G.SelectorShine = Instance.new("Frame")
G.SelectorShine.Name = "SelectorShine"
G.SelectorShine.BackgroundColor3 = Color3.fromRGB(180, 255, 205)
G.SelectorShine.BackgroundTransparency = 1
G.SelectorShine.BorderSizePixel = 0
G.SelectorShine.Size = UDim2.new(1, 0, 0, 10)
G.SelectorShine.ZIndex = 33
G.SelectorShine.Parent = G.TextButton_30

-- UICorner_89 (UICorner)
G.UICorner_89 = Instance.new("UICorner")
G.UICorner_89.Parent = G.SelectorShine

-- TextButton_31 (TextButton)
G.TextButton_31 = Instance.new("TextButton")
G.TextButton_31.BackgroundColor3 = Color3.fromRGB(14, 76, 38)
G.TextButton_31.BorderSizePixel = 0
G.TextButton_31.Position = UDim2.new(0.5, 1, 0, 4)
G.TextButton_31.Size = UDim2.new(0.5, -5, 1, -8)
G.TextButton_31.ZIndex = 32
G.TextButton_31.AutoButtonColor = false
G.TextButton_31.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Heavy, Enum.FontStyle.Normal)
G.TextButton_31.Text = "Semi"
G.TextButton_31.TextColor3 = Color3.fromRGB(145, 255, 185)
G.TextButton_31.TextSize = 11
G.TextButton_31.TextWrapped = true
G.TextButton_31:SetAttribute("SelectorActive", true)
G.TextButton_31.Parent = G.Frame_90

-- UICorner_90 (UICorner)
G.UICorner_90 = Instance.new("UICorner")
G.UICorner_90.CornerRadius = UDim.new(0, 7)
G.UICorner_90.Parent = G.TextButton_31

-- UICorner_91 (UICorner)
G.UICorner_91 = Instance.new("UICorner")
G.UICorner_91.Parent = G.TextButton_31

-- SelectorStroke_2 (UIStroke)
G.SelectorStroke_2 = Instance.new("UIStroke")
G.SelectorStroke_2.Name = "SelectorStroke"
G.SelectorStroke_2.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
G.SelectorStroke_2.Color = Color3.fromRGB(80, 255, 145)
G.SelectorStroke_2.Thickness = 1.6000000238418579
G.SelectorStroke_2.Transparency = 0.019999999552965164
G.SelectorStroke_2.Parent = G.TextButton_31

-- SelectorShine_2 (Frame)
G.SelectorShine_2 = Instance.new("Frame")
G.SelectorShine_2.Name = "SelectorShine"
G.SelectorShine_2.BackgroundColor3 = Color3.fromRGB(180, 255, 205)
G.SelectorShine_2.BackgroundTransparency = 1
G.SelectorShine_2.BorderSizePixel = 0
G.SelectorShine_2.Size = UDim2.new(1, 0, 0, 10)
G.SelectorShine_2.ZIndex = 33
G.SelectorShine_2.Parent = G.TextButton_31

-- UICorner_92 (UICorner)
G.UICorner_92 = Instance.new("UICorner")
G.UICorner_92.Parent = G.SelectorShine_2

-- Movement (Frame)
G.Movement = Instance.new("Frame")
G.Movement.Name = "Movement"
G.Movement.AutomaticSize = Enum.AutomaticSize.Y
G.Movement.BackgroundTransparency = 1
G.Movement.BorderSizePixel = 0
G.Movement.LayoutOrder = 4
G.Movement.Size = UDim2.new(1, 0, 0, 0)
G.Movement.Visible = false
G.Movement.Parent = G.MainScroll

-- UIListLayout_5 (UIListLayout)
G.UIListLayout_5 = Instance.new("UIListLayout")
G.UIListLayout_5.HorizontalAlignment = Enum.HorizontalAlignment.Center
G.UIListLayout_5.Padding = UDim.new(0, 6)
G.UIListLayout_5.SortOrder = Enum.SortOrder.LayoutOrder
G.UIListLayout_5.Parent = G.Movement

-- Frame_91 (Frame)
G.Frame_91 = Instance.new("Frame")
G.Frame_91.BackgroundTransparency = 1
G.Frame_91.BorderSizePixel = 0
G.Frame_91.LayoutOrder = 1
G.Frame_91.Size = UDim2.new(1, 0, 0, 2)
G.Frame_91.Parent = G.Movement

-- Frame_92 (Frame)
G.Frame_92 = Instance.new("Frame")
G.Frame_92.BackgroundColor3 = Color3.fromRGB(40, 92, 64)
G.Frame_92.BackgroundTransparency = 0.25
G.Frame_92.BorderSizePixel = 0
G.Frame_92.LayoutOrder = 2
G.Frame_92.Size = UDim2.new(1, -10, 0, 32)
G.Frame_92.Parent = G.Movement

-- UICorner_93 (UICorner)
G.UICorner_93 = Instance.new("UICorner")
G.UICorner_93.CornerRadius = UDim.new(0, 10)
G.UICorner_93.Parent = G.Frame_92

-- UIStroke_47 (UIStroke)
G.UIStroke_47 = Instance.new("UIStroke")
G.UIStroke_47.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
G.UIStroke_47.Color = Color3.fromRGB(24, 65, 38)
G.UIStroke_47.Transparency = 0.40000000596046448
G.UIStroke_47.Parent = G.Frame_92

-- Frame_93 (Frame)
G.Frame_93 = Instance.new("Frame")
G.Frame_93.BackgroundColor3 = Color3.fromRGB(42, 230, 123)
G.Frame_93.BorderSizePixel = 0
G.Frame_93.Position = UDim2.new(0, 10, 0, 9)
G.Frame_93.Size = UDim2.new(0, 4, 1, -18)
G.Frame_93.Parent = G.Frame_92

-- UICorner_94 (UICorner)
G.UICorner_94 = Instance.new("UICorner")
G.UICorner_94.CornerRadius = UDim.new(0, 2)
G.UICorner_94.Parent = G.Frame_93

-- TextLabel_35 (TextLabel)
G.TextLabel_35 = Instance.new("TextLabel")
G.TextLabel_35.BackgroundTransparency = 1
G.TextLabel_35.Position = UDim2.new(0, 22, 0, 0)
G.TextLabel_35.Size = UDim2.new(1, -30, 1, 0)
G.TextLabel_35.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal)
G.TextLabel_35.Text = "INFINITE JUMP"
G.TextLabel_35.TextColor3 = Color3.fromRGB(218, 255, 233)
G.TextLabel_35.TextSize = 13
G.TextLabel_35.TextXAlignment = Enum.TextXAlignment.Left
G.TextLabel_35.Parent = G.Frame_92

-- Frame_94 (Frame)
G.Frame_94 = Instance.new("Frame")
G.Frame_94.BackgroundTransparency = 1
G.Frame_94.BorderSizePixel = 0
G.Frame_94.LayoutOrder = 3
G.Frame_94.Size = UDim2.new(1, 0, 0, 2)
G.Frame_94.Parent = G.Movement

-- Frame_95 (Frame)
G.Frame_95 = Instance.new("Frame")
G.Frame_95.BackgroundColor3 = Color3.fromRGB(19, 33, 26)
G.Frame_95.BackgroundTransparency = 0.11999999731779099
G.Frame_95.BorderSizePixel = 0
G.Frame_95.LayoutOrder = 4
G.Frame_95.Size = UDim2.new(1, -16, 0, 42)
G.Frame_95.Parent = G.Movement

-- UICorner_95 (UICorner)
G.UICorner_95 = Instance.new("UICorner")
G.UICorner_95.CornerRadius = UDim.new(0, 16)
G.UICorner_95.Parent = G.Frame_95

-- UIStroke_48 (UIStroke)
G.UIStroke_48 = Instance.new("UIStroke")
G.UIStroke_48.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
G.UIStroke_48.Color = Color3.fromRGB(31, 54, 40)
G.UIStroke_48.Transparency = 0.5
G.UIStroke_48.Parent = G.Frame_95

-- TextLabel_36 (TextLabel)
G.TextLabel_36 = Instance.new("TextLabel")
G.TextLabel_36.BackgroundTransparency = 1
G.TextLabel_36.Position = UDim2.new(0, 12, 0, 0)
G.TextLabel_36.Size = UDim2.new(1, -70, 1, 0)
G.TextLabel_36.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Medium, Enum.FontStyle.Normal)
G.TextLabel_36.Text = "Infinite Jump"
G.TextLabel_36.TextColor3 = Color3.fromRGB(220, 239, 228)
G.TextLabel_36.TextSize = 13
G.TextLabel_36.TextXAlignment = Enum.TextXAlignment.Left
G.TextLabel_36.Parent = G.Frame_95

-- Frame_96 (Frame)
G.Frame_96 = Instance.new("Frame")
G.Frame_96.BackgroundColor3 = Color3.fromRGB(24, 168, 84)
G.Frame_96.BorderSizePixel = 0
G.Frame_96.Position = UDim2.new(1, -62, 0.5, -12)
G.Frame_96.Size = UDim2.new(0, 48, 0, 24)
G.Frame_96.ZIndex = 7
G.Frame_96.Parent = G.Frame_95

-- UICorner_96 (UICorner)
G.UICorner_96 = Instance.new("UICorner")
G.UICorner_96.CornerRadius = UDim.new(0, 11)
G.UICorner_96.Parent = G.Frame_96

-- Frame_97 (Frame)
G.Frame_97 = Instance.new("Frame")
G.Frame_97.BackgroundColor3 = Color3.fromRGB(219, 255, 232)
G.Frame_97.BorderSizePixel = 0
G.Frame_97.Position = UDim2.new(1, -18, 0.5, -7)
G.Frame_97.Size = UDim2.new(0, 14, 0, 14)
G.Frame_97.ZIndex = 8
G.Frame_97.Parent = G.Frame_96

-- UICorner_97 (UICorner)
G.UICorner_97 = Instance.new("UICorner")
G.UICorner_97.CornerRadius = UDim.new(0, 7)
G.UICorner_97.Parent = G.Frame_97

-- TextButton_32 (TextButton)
G.TextButton_32 = Instance.new("TextButton")
G.TextButton_32.BackgroundTransparency = 1
G.TextButton_32.BorderSizePixel = 0
G.TextButton_32.Size = UDim2.new(1, 0, 1, 0)
G.TextButton_32.ZIndex = 9
G.TextButton_32.Text = ""
G.TextButton_32.Parent = G.Frame_96

-- TextButton_33 (TextButton)
G.TextButton_33 = Instance.new("TextButton")
G.TextButton_33.BackgroundTransparency = 1
G.TextButton_33.BorderSizePixel = 0
G.TextButton_33.Size = UDim2.new(1, -56, 1, 0)
G.TextButton_33.ZIndex = 5
G.TextButton_33.Text = ""
G.TextButton_33.Parent = G.Frame_95

-- Frame_98 (Frame)
G.Frame_98 = Instance.new("Frame")
G.Frame_98.BackgroundTransparency = 1
G.Frame_98.BorderSizePixel = 0
G.Frame_98.LayoutOrder = 5
G.Frame_98.Size = UDim2.new(1, 0, 0, 2)
G.Frame_98.Parent = G.Movement

-- Frame_99 (Frame)
G.Frame_99 = Instance.new("Frame")
G.Frame_99.BackgroundColor3 = Color3.fromRGB(40, 92, 64)
G.Frame_99.BackgroundTransparency = 0.25
G.Frame_99.BorderSizePixel = 0
G.Frame_99.LayoutOrder = 6
G.Frame_99.Size = UDim2.new(1, -10, 0, 32)
G.Frame_99.Parent = G.Movement

-- UICorner_98 (UICorner)
G.UICorner_98 = Instance.new("UICorner")
G.UICorner_98.CornerRadius = UDim.new(0, 10)
G.UICorner_98.Parent = G.Frame_99

-- UIStroke_49 (UIStroke)
G.UIStroke_49 = Instance.new("UIStroke")
G.UIStroke_49.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
G.UIStroke_49.Color = Color3.fromRGB(24, 65, 38)
G.UIStroke_49.Transparency = 0.40000000596046448
G.UIStroke_49.Parent = G.Frame_99

-- Frame_100 (Frame)
G.Frame_100 = Instance.new("Frame")
G.Frame_100.BackgroundColor3 = Color3.fromRGB(42, 230, 123)
G.Frame_100.BorderSizePixel = 0
G.Frame_100.Position = UDim2.new(0, 10, 0, 9)
G.Frame_100.Size = UDim2.new(0, 4, 1, -18)
G.Frame_100.Parent = G.Frame_99

-- UICorner_99 (UICorner)
G.UICorner_99 = Instance.new("UICorner")
G.UICorner_99.CornerRadius = UDim.new(0, 2)
G.UICorner_99.Parent = G.Frame_100

-- TextLabel_37 (TextLabel)
G.TextLabel_37 = Instance.new("TextLabel")
G.TextLabel_37.BackgroundTransparency = 1
G.TextLabel_37.Position = UDim2.new(0, 22, 0, 0)
G.TextLabel_37.Size = UDim2.new(1, -30, 1, 0)
G.TextLabel_37.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal)
G.TextLabel_37.Text = "JUMP MODE"
G.TextLabel_37.TextColor3 = Color3.fromRGB(218, 255, 233)
G.TextLabel_37.TextSize = 13
G.TextLabel_37.TextXAlignment = Enum.TextXAlignment.Left
G.TextLabel_37.Parent = G.Frame_99

-- Frame_101 (Frame)
G.Frame_101 = Instance.new("Frame")
G.Frame_101.BackgroundTransparency = 1
G.Frame_101.BorderSizePixel = 0
G.Frame_101.LayoutOrder = 7
G.Frame_101.Size = UDim2.new(1, 0, 0, 2)
G.Frame_101.Parent = G.Movement

-- Frame_102 (Frame)
G.Frame_102 = Instance.new("Frame")
G.Frame_102.BackgroundColor3 = Color3.fromRGB(19, 33, 26)
G.Frame_102.BorderSizePixel = 0
G.Frame_102.ClipsDescendants = true
G.Frame_102.LayoutOrder = 8
G.Frame_102.Size = UDim2.new(1, -16, 0, 42)
G.Frame_102.Parent = G.Movement

-- UICorner_100 (UICorner)
G.UICorner_100 = Instance.new("UICorner")
G.UICorner_100.CornerRadius = UDim.new(0, 9)
G.UICorner_100.Parent = G.Frame_102

-- UIStroke_50 (UIStroke)
G.UIStroke_50 = Instance.new("UIStroke")
G.UIStroke_50.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
G.UIStroke_50.Color = Color3.fromRGB(31, 54, 40)
G.UIStroke_50.Transparency = 0.5
G.UIStroke_50.Parent = G.Frame_102

-- TextLabel_38 (TextLabel)
G.TextLabel_38 = Instance.new("TextLabel")
G.TextLabel_38.BackgroundTransparency = 1
G.TextLabel_38.Position = UDim2.new(0, 14, 0, 0)
G.TextLabel_38.Size = UDim2.new(1, -78, 0, 42)
G.TextLabel_38.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal)
G.TextLabel_38.Text = "Jump Mode"
G.TextLabel_38.TextColor3 = Color3.fromRGB(220, 239, 228)
G.TextLabel_38.TextSize = 13
G.TextLabel_38.TextXAlignment = Enum.TextXAlignment.Left
G.TextLabel_38.Parent = G.Frame_102

-- TextButton_34 (TextButton)
G.TextButton_34 = Instance.new("TextButton")
G.TextButton_34.BackgroundColor3 = Color3.fromRGB(10, 14, 12)
G.TextButton_34.BorderSizePixel = 0
G.TextButton_34.Position = UDim2.new(1, -50, 0, 7)
G.TextButton_34.Size = UDim2.new(0, 42, 0, 28)
G.TextButton_34.ZIndex = 33
G.TextButton_34.AutoButtonColor = false
G.TextButton_34.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Heavy, Enum.FontStyle.Normal)
G.TextButton_34.Text = "â–¼"
G.TextButton_34.TextColor3 = Color3.fromRGB(235, 245, 238)
G.TextButton_34.TextSize = 12
G.TextButton_34.Parent = G.Frame_102

-- UICorner_101 (UICorner)
G.UICorner_101 = Instance.new("UICorner")
G.UICorner_101.CornerRadius = UDim.new(0, 9)
G.UICorner_101.Parent = G.TextButton_34

-- UIStroke_51 (UIStroke)
G.UIStroke_51 = Instance.new("UIStroke")
G.UIStroke_51.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
G.UIStroke_51.Color = Color3.fromRGB(28, 48, 36)
G.UIStroke_51.Transparency = 0.34999999403953552
G.UIStroke_51.Parent = G.TextButton_34

-- Frame_103 (Frame)
G.Frame_103 = Instance.new("Frame")
G.Frame_103.BackgroundColor3 = Color3.fromRGB(7, 9, 8)
G.Frame_103.BorderSizePixel = 0
G.Frame_103.Position = UDim2.new(0, 4, 0, 42)
G.Frame_103.Size = UDim2.new(1, -8, 0, 34)
G.Frame_103.Visible = false
G.Frame_103.ZIndex = 30
G.Frame_103.Parent = G.Frame_102

-- UICorner_102 (UICorner)
G.UICorner_102 = Instance.new("UICorner")
G.UICorner_102.Parent = G.Frame_103

-- TextButton_35 (TextButton)
G.TextButton_35 = Instance.new("TextButton")
G.TextButton_35.BackgroundColor3 = Color3.fromRGB(14, 76, 38)
G.TextButton_35.BorderSizePixel = 0
G.TextButton_35.Position = UDim2.new(0, 4, 0, 4)
G.TextButton_35.Size = UDim2.new(0.5, -5, 1, -8)
G.TextButton_35.ZIndex = 32
G.TextButton_35.AutoButtonColor = false
G.TextButton_35.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Heavy, Enum.FontStyle.Normal)
G.TextButton_35.Text = "Hold Infinite Jump"
G.TextButton_35.TextColor3 = Color3.fromRGB(145, 255, 185)
G.TextButton_35.TextSize = 11
G.TextButton_35.TextWrapped = true
G.TextButton_35:SetAttribute("SelectorActive", true)
G.TextButton_35.Parent = G.Frame_103

-- UICorner_103 (UICorner)
G.UICorner_103 = Instance.new("UICorner")
G.UICorner_103.CornerRadius = UDim.new(0, 7)
G.UICorner_103.Parent = G.TextButton_35

-- UICorner_104 (UICorner)
G.UICorner_104 = Instance.new("UICorner")
G.UICorner_104.Parent = G.TextButton_35

-- SelectorStroke_3 (UIStroke)
G.SelectorStroke_3 = Instance.new("UIStroke")
G.SelectorStroke_3.Name = "SelectorStroke"
G.SelectorStroke_3.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
G.SelectorStroke_3.Color = Color3.fromRGB(80, 255, 145)
G.SelectorStroke_3.Thickness = 1.6000000238418579
G.SelectorStroke_3.Transparency = 0.019999999552965164
G.SelectorStroke_3.Parent = G.TextButton_35

-- SelectorShine_3 (Frame)
G.SelectorShine_3 = Instance.new("Frame")
G.SelectorShine_3.Name = "SelectorShine"
G.SelectorShine_3.BackgroundColor3 = Color3.fromRGB(180, 255, 205)
G.SelectorShine_3.BackgroundTransparency = 1
G.SelectorShine_3.BorderSizePixel = 0
G.SelectorShine_3.Size = UDim2.new(1, 0, 0, 10)
G.SelectorShine_3.ZIndex = 33
G.SelectorShine_3.Parent = G.TextButton_35

-- UICorner_105 (UICorner)
G.UICorner_105 = Instance.new("UICorner")
G.UICorner_105.Parent = G.SelectorShine_3

-- TextButton_36 (TextButton)
G.TextButton_36 = Instance.new("TextButton")
G.TextButton_36.BackgroundColor3 = Color3.fromRGB(6, 14, 10)
G.TextButton_36.BorderSizePixel = 0
G.TextButton_36.Position = UDim2.new(0.5, 1, 0, 4)
G.TextButton_36.Size = UDim2.new(0.5, -5, 1, -8)
G.TextButton_36.ZIndex = 32
G.TextButton_36.AutoButtonColor = false
G.TextButton_36.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Heavy, Enum.FontStyle.Normal)
G.TextButton_36.Text = "Tap Jump"
G.TextButton_36.TextColor3 = Color3.fromRGB(225, 240, 230)
G.TextButton_36.TextSize = 11
G.TextButton_36.TextWrapped = true
G.TextButton_36:SetAttribute("SelectorActive", false)
G.TextButton_36.Parent = G.Frame_103

-- UICorner_106 (UICorner)
G.UICorner_106 = Instance.new("UICorner")
G.UICorner_106.CornerRadius = UDim.new(0, 7)
G.UICorner_106.Parent = G.TextButton_36

-- UICorner_107 (UICorner)
G.UICorner_107 = Instance.new("UICorner")
G.UICorner_107.Parent = G.TextButton_36

-- SelectorStroke_4 (UIStroke)
G.SelectorStroke_4 = Instance.new("UIStroke")
G.SelectorStroke_4.Name = "SelectorStroke"
G.SelectorStroke_4.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
G.SelectorStroke_4.Color = Color3.fromRGB(24, 54, 34)
G.SelectorStroke_4.Transparency = 0.64999997615814209
G.SelectorStroke_4.Parent = G.TextButton_36

-- SelectorShine_4 (Frame)
G.SelectorShine_4 = Instance.new("Frame")
G.SelectorShine_4.Name = "SelectorShine"
G.SelectorShine_4.BackgroundColor3 = Color3.fromRGB(180, 255, 205)
G.SelectorShine_4.BackgroundTransparency = 1
G.SelectorShine_4.BorderSizePixel = 0
G.SelectorShine_4.Size = UDim2.new(1, 0, 0, 10)
G.SelectorShine_4.ZIndex = 33
G.SelectorShine_4.Parent = G.TextButton_36

-- UICorner_108 (UICorner)
G.UICorner_108 = Instance.new("UICorner")
G.UICorner_108.Parent = G.SelectorShine_4

-- Frame_104 (Frame)
G.Frame_104 = Instance.new("Frame")
G.Frame_104.BackgroundTransparency = 1
G.Frame_104.BorderSizePixel = 0
G.Frame_104.LayoutOrder = 9
G.Frame_104.Size = UDim2.new(1, 0, 0, 8)
G.Frame_104.Parent = G.Movement

-- Frame_105 (Frame)
G.Frame_105 = Instance.new("Frame")
G.Frame_105.BackgroundColor3 = Color3.fromRGB(40, 92, 64)
G.Frame_105.BackgroundTransparency = 0.25
G.Frame_105.BorderSizePixel = 0
G.Frame_105.LayoutOrder = 10
G.Frame_105.Size = UDim2.new(1, -10, 0, 32)
G.Frame_105.Parent = G.Movement

-- UICorner_109 (UICorner)
G.UICorner_109 = Instance.new("UICorner")
G.UICorner_109.CornerRadius = UDim.new(0, 10)
G.UICorner_109.Parent = G.Frame_105

-- UIStroke_52 (UIStroke)
G.UIStroke_52 = Instance.new("UIStroke")
G.UIStroke_52.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
G.UIStroke_52.Color = Color3.fromRGB(24, 65, 38)
G.UIStroke_52.Transparency = 0.40000000596046448
G.UIStroke_52.Parent = G.Frame_105

-- Frame_106 (Frame)
G.Frame_106 = Instance.new("Frame")
G.Frame_106.BackgroundColor3 = Color3.fromRGB(42, 230, 123)
G.Frame_106.BorderSizePixel = 0
G.Frame_106.Position = UDim2.new(0, 10, 0, 9)
G.Frame_106.Size = UDim2.new(0, 4, 1, -18)
G.Frame_106.Parent = G.Frame_105

-- UICorner_110 (UICorner)
G.UICorner_110 = Instance.new("UICorner")
G.UICorner_110.CornerRadius = UDim.new(0, 2)
G.UICorner_110.Parent = G.Frame_106

-- TextLabel_39 (TextLabel)
G.TextLabel_39 = Instance.new("TextLabel")
G.TextLabel_39.BackgroundTransparency = 1
G.TextLabel_39.Position = UDim2.new(0, 22, 0, 0)
G.TextLabel_39.Size = UDim2.new(1, -30, 1, 0)
G.TextLabel_39.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal)
G.TextLabel_39.Text = "DEFENSE"
G.TextLabel_39.TextColor3 = Color3.fromRGB(218, 255, 233)
G.TextLabel_39.TextSize = 13
G.TextLabel_39.TextXAlignment = Enum.TextXAlignment.Left
G.TextLabel_39.Parent = G.Frame_105

-- Frame_107 (Frame)
G.Frame_107 = Instance.new("Frame")
G.Frame_107.BackgroundTransparency = 1
G.Frame_107.BorderSizePixel = 0
G.Frame_107.LayoutOrder = 11
G.Frame_107.Size = UDim2.new(1, 0, 0, 2)
G.Frame_107.Parent = G.Movement

-- Frame_108 (Frame)
G.Frame_108 = Instance.new("Frame")
G.Frame_108.BackgroundColor3 = Color3.fromRGB(19, 33, 26)
G.Frame_108.BackgroundTransparency = 0.11999999731779099
G.Frame_108.BorderSizePixel = 0
G.Frame_108.LayoutOrder = 12
G.Frame_108.Size = UDim2.new(1, -16, 0, 42)
G.Frame_108.Parent = G.Movement

-- UICorner_111 (UICorner)
G.UICorner_111 = Instance.new("UICorner")
G.UICorner_111.CornerRadius = UDim.new(0, 16)
G.UICorner_111.Parent = G.Frame_108

-- UIStroke_53 (UIStroke)
G.UIStroke_53 = Instance.new("UIStroke")
G.UIStroke_53.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
G.UIStroke_53.Color = Color3.fromRGB(31, 54, 40)
G.UIStroke_53.Transparency = 0.5
G.UIStroke_53.Parent = G.Frame_108

-- TextLabel_40 (TextLabel)
G.TextLabel_40 = Instance.new("TextLabel")
G.TextLabel_40.BackgroundTransparency = 1
G.TextLabel_40.Position = UDim2.new(0, 12, 0, 0)
G.TextLabel_40.Size = UDim2.new(1, -70, 1, 0)
G.TextLabel_40.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Medium, Enum.FontStyle.Normal)
G.TextLabel_40.Text = "Anti Ragdoll"
G.TextLabel_40.TextColor3 = Color3.fromRGB(220, 239, 228)
G.TextLabel_40.TextSize = 13
G.TextLabel_40.TextXAlignment = Enum.TextXAlignment.Left
G.TextLabel_40.Parent = G.Frame_108

-- Frame_109 (Frame)
G.Frame_109 = Instance.new("Frame")
G.Frame_109.BackgroundColor3 = Color3.fromRGB(35, 48, 41)
G.Frame_109.BorderSizePixel = 0
G.Frame_109.Position = UDim2.new(1, -62, 0.5, -12)
G.Frame_109.Size = UDim2.new(0, 48, 0, 24)
G.Frame_109.ZIndex = 7
G.Frame_109.Parent = G.Frame_108

-- UICorner_112 (UICorner)
G.UICorner_112 = Instance.new("UICorner")
G.UICorner_112.CornerRadius = UDim.new(0, 11)
G.UICorner_112.Parent = G.Frame_109

-- Frame_110 (Frame)
G.Frame_110 = Instance.new("Frame")
G.Frame_110.BackgroundColor3 = Color3.fromRGB(119, 149, 130)
G.Frame_110.BorderSizePixel = 0
G.Frame_110.Position = UDim2.new(0, 4, 0.5, -7)
G.Frame_110.Size = UDim2.new(0, 14, 0, 14)
G.Frame_110.ZIndex = 8
G.Frame_110.Parent = G.Frame_109

-- UICorner_113 (UICorner)
G.UICorner_113 = Instance.new("UICorner")
G.UICorner_113.CornerRadius = UDim.new(0, 7)
G.UICorner_113.Parent = G.Frame_110

-- TextButton_37 (TextButton)
G.TextButton_37 = Instance.new("TextButton")
G.TextButton_37.BackgroundTransparency = 1
G.TextButton_37.BorderSizePixel = 0
G.TextButton_37.Size = UDim2.new(1, 0, 1, 0)
G.TextButton_37.ZIndex = 9
G.TextButton_37.Text = ""
G.TextButton_37.Parent = G.Frame_109

-- TextButton_38 (TextButton)
G.TextButton_38 = Instance.new("TextButton")
G.TextButton_38.BackgroundTransparency = 1
G.TextButton_38.BorderSizePixel = 0
G.TextButton_38.Size = UDim2.new(1, -56, 1, 0)
G.TextButton_38.ZIndex = 5
G.TextButton_38.Text = ""
G.TextButton_38.Parent = G.Frame_108

-- Frame_111 (Frame)
G.Frame_111 = Instance.new("Frame")
G.Frame_111.BackgroundColor3 = Color3.fromRGB(19, 33, 26)
G.Frame_111.BackgroundTransparency = 0.11999999731779099
G.Frame_111.BorderSizePixel = 0
G.Frame_111.LayoutOrder = 13
G.Frame_111.Size = UDim2.new(1, -16, 0, 42)
G.Frame_111.Parent = G.Movement

-- UICorner_114 (UICorner)
G.UICorner_114 = Instance.new("UICorner")
G.UICorner_114.CornerRadius = UDim.new(0, 16)
G.UICorner_114.Parent = G.Frame_111

-- UIStroke_54 (UIStroke)
G.UIStroke_54 = Instance.new("UIStroke")
G.UIStroke_54.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
G.UIStroke_54.Color = Color3.fromRGB(31, 54, 40)
G.UIStroke_54.Transparency = 0.5
G.UIStroke_54.Parent = G.Frame_111

-- TextLabel_41 (TextLabel)
G.TextLabel_41 = Instance.new("TextLabel")
G.TextLabel_41.BackgroundTransparency = 1
G.TextLabel_41.Position = UDim2.new(0, 12, 0, 0)
G.TextLabel_41.Size = UDim2.new(1, -70, 1, 0)
G.TextLabel_41.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Medium, Enum.FontStyle.Normal)
G.TextLabel_41.Text = "Safe Mode"
G.TextLabel_41.TextColor3 = Color3.fromRGB(220, 239, 228)
G.TextLabel_41.TextSize = 13
G.TextLabel_41.TextXAlignment = Enum.TextXAlignment.Left
G.TextLabel_41.Parent = G.Frame_111

-- Frame_112 (Frame)
G.Frame_112 = Instance.new("Frame")
G.Frame_112.BackgroundColor3 = Color3.fromRGB(35, 48, 41)
G.Frame_112.BorderSizePixel = 0
G.Frame_112.Position = UDim2.new(1, -62, 0.5, -12)
G.Frame_112.Size = UDim2.new(0, 48, 0, 24)
G.Frame_112.ZIndex = 7
G.Frame_112.Parent = G.Frame_111

-- UICorner_115 (UICorner)
G.UICorner_115 = Instance.new("UICorner")
G.UICorner_115.CornerRadius = UDim.new(0, 11)
G.UICorner_115.Parent = G.Frame_112

-- Frame_113 (Frame)
G.Frame_113 = Instance.new("Frame")
G.Frame_113.BackgroundColor3 = Color3.fromRGB(119, 149, 130)
G.Frame_113.BorderSizePixel = 0
G.Frame_113.Position = UDim2.new(0, 4, 0.5, -7)
G.Frame_113.Size = UDim2.new(0, 14, 0, 14)
G.Frame_113.ZIndex = 8
G.Frame_113.Parent = G.Frame_112

-- UICorner_116 (UICorner)
G.UICorner_116 = Instance.new("UICorner")
G.UICorner_116.CornerRadius = UDim.new(0, 7)
G.UICorner_116.Parent = G.Frame_113

-- TextButton_39 (TextButton)
G.TextButton_39 = Instance.new("TextButton")
G.TextButton_39.BackgroundTransparency = 1
G.TextButton_39.BorderSizePixel = 0
G.TextButton_39.Size = UDim2.new(1, 0, 1, 0)
G.TextButton_39.ZIndex = 9
G.TextButton_39.Text = ""
G.TextButton_39.Parent = G.Frame_112

-- TextButton_40 (TextButton)
G.TextButton_40 = Instance.new("TextButton")
G.TextButton_40.BackgroundTransparency = 1
G.TextButton_40.BorderSizePixel = 0
G.TextButton_40.Size = UDim2.new(1, -56, 1, 0)
G.TextButton_40.ZIndex = 5
G.TextButton_40.Text = ""
G.TextButton_40.Parent = G.Frame_111

-- Frame_114 (Frame)
G.Frame_114 = Instance.new("Frame")
G.Frame_114.BackgroundColor3 = Color3.fromRGB(19, 33, 26)
G.Frame_114.BackgroundTransparency = 0.11999999731779099
G.Frame_114.BorderSizePixel = 0
G.Frame_114.LayoutOrder = 14
G.Frame_114.Size = UDim2.new(1, -16, 0, 42)
G.Frame_114.Parent = G.Movement

-- UICorner_117 (UICorner)
G.UICorner_117 = Instance.new("UICorner")
G.UICorner_117.CornerRadius = UDim.new(0, 16)
G.UICorner_117.Parent = G.Frame_114

-- UIStroke_55 (UIStroke)
G.UIStroke_55 = Instance.new("UIStroke")
G.UIStroke_55.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
G.UIStroke_55.Color = Color3.fromRGB(31, 54, 40)
G.UIStroke_55.Transparency = 0.5
G.UIStroke_55.Parent = G.Frame_114

-- TextLabel_42 (TextLabel)
G.TextLabel_42 = Instance.new("TextLabel")
G.TextLabel_42.BackgroundTransparency = 1
G.TextLabel_42.Position = UDim2.new(0, 12, 0, 0)
G.TextLabel_42.Size = UDim2.new(1, -70, 1, 0)
G.TextLabel_42.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Medium, Enum.FontStyle.Normal)
G.TextLabel_42.Text = "Anti Crasher (Only If Happening)"
G.TextLabel_42.TextColor3 = Color3.fromRGB(220, 239, 228)
G.TextLabel_42.TextSize = 13
G.TextLabel_42.TextXAlignment = Enum.TextXAlignment.Left
G.TextLabel_42.Parent = G.Frame_114

-- Frame_115 (Frame)
G.Frame_115 = Instance.new("Frame")
G.Frame_115.BackgroundColor3 = Color3.fromRGB(35, 48, 41)
G.Frame_115.BorderSizePixel = 0
G.Frame_115.Position = UDim2.new(1, -62, 0.5, -12)
G.Frame_115.Size = UDim2.new(0, 48, 0, 24)
G.Frame_115.ZIndex = 7
G.Frame_115.Parent = G.Frame_114

-- UICorner_118 (UICorner)
G.UICorner_118 = Instance.new("UICorner")
G.UICorner_118.CornerRadius = UDim.new(0, 11)
G.UICorner_118.Parent = G.Frame_115

-- Frame_116 (Frame)
G.Frame_116 = Instance.new("Frame")
G.Frame_116.BackgroundColor3 = Color3.fromRGB(119, 149, 130)
G.Frame_116.BorderSizePixel = 0
G.Frame_116.Position = UDim2.new(0, 4, 0.5, -7)
G.Frame_116.Size = UDim2.new(0, 14, 0, 14)
G.Frame_116.ZIndex = 8
G.Frame_116.Parent = G.Frame_115

-- UICorner_119 (UICorner)
G.UICorner_119 = Instance.new("UICorner")
G.UICorner_119.CornerRadius = UDim.new(0, 7)
G.UICorner_119.Parent = G.Frame_116

-- TextButton_41 (TextButton)
G.TextButton_41 = Instance.new("TextButton")
G.TextButton_41.BackgroundTransparency = 1
G.TextButton_41.BorderSizePixel = 0
G.TextButton_41.Size = UDim2.new(1, 0, 1, 0)
G.TextButton_41.ZIndex = 9
G.TextButton_41.Text = ""
G.TextButton_41.Parent = G.Frame_115

-- TextButton_42 (TextButton)
G.TextButton_42 = Instance.new("TextButton")
G.TextButton_42.BackgroundTransparency = 1
G.TextButton_42.BorderSizePixel = 0
G.TextButton_42.Size = UDim2.new(1, -56, 1, 0)
G.TextButton_42.ZIndex = 5
G.TextButton_42.Text = ""
G.TextButton_42.Parent = G.Frame_114

-- Frame_117 (Frame)
G.Frame_117 = Instance.new("Frame")
G.Frame_117.BackgroundColor3 = Color3.fromRGB(19, 33, 26)
G.Frame_117.BackgroundTransparency = 0.11999999731779099
G.Frame_117.BorderSizePixel = 0
G.Frame_117.LayoutOrder = 15
G.Frame_117.Size = UDim2.new(1, -16, 0, 42)
G.Frame_117.Parent = G.Movement

-- UICorner_120 (UICorner)
G.UICorner_120 = Instance.new("UICorner")
G.UICorner_120.CornerRadius = UDim.new(0, 16)
G.UICorner_120.Parent = G.Frame_117

-- UIStroke_56 (UIStroke)
G.UIStroke_56 = Instance.new("UIStroke")
G.UIStroke_56.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
G.UIStroke_56.Color = Color3.fromRGB(31, 54, 40)
G.UIStroke_56.Transparency = 0.5
G.UIStroke_56.Parent = G.Frame_117

-- TextLabel_43 (TextLabel)
G.TextLabel_43 = Instance.new("TextLabel")
G.TextLabel_43.BackgroundTransparency = 1
G.TextLabel_43.Position = UDim2.new(0, 12, 0, 0)
G.TextLabel_43.Size = UDim2.new(1, -70, 1, 0)
G.TextLabel_43.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Medium, Enum.FontStyle.Normal)
G.TextLabel_43.Text = "Unwalk"
G.TextLabel_43.TextColor3 = Color3.fromRGB(220, 239, 228)
G.TextLabel_43.TextSize = 13
G.TextLabel_43.TextXAlignment = Enum.TextXAlignment.Left
G.TextLabel_43.Parent = G.Frame_117

-- Frame_118 (Frame)
G.Frame_118 = Instance.new("Frame")
G.Frame_118.BackgroundColor3 = Color3.fromRGB(35, 48, 41)
G.Frame_118.BorderSizePixel = 0
G.Frame_118.Position = UDim2.new(1, -62, 0.5, -12)
G.Frame_118.Size = UDim2.new(0, 48, 0, 24)
G.Frame_118.ZIndex = 7
G.Frame_118.Parent = G.Frame_117

-- UICorner_121 (UICorner)
G.UICorner_121 = Instance.new("UICorner")
G.UICorner_121.CornerRadius = UDim.new(0, 11)
G.UICorner_121.Parent = G.Frame_118

-- Frame_119 (Frame)
G.Frame_119 = Instance.new("Frame")
G.Frame_119.BackgroundColor3 = Color3.fromRGB(119, 149, 130)
G.Frame_119.BorderSizePixel = 0
G.Frame_119.Position = UDim2.new(0, 4, 0.5, -7)
G.Frame_119.Size = UDim2.new(0, 14, 0, 14)
G.Frame_119.ZIndex = 8
G.Frame_119.Parent = G.Frame_118

-- UICorner_122 (UICorner)
G.UICorner_122 = Instance.new("UICorner")
G.UICorner_122.CornerRadius = UDim.new(0, 7)
G.UICorner_122.Parent = G.Frame_119

-- TextButton_43 (TextButton)
G.TextButton_43 = Instance.new("TextButton")
G.TextButton_43.BackgroundTransparency = 1
G.TextButton_43.BorderSizePixel = 0
G.TextButton_43.Size = UDim2.new(1, 0, 1, 0)
G.TextButton_43.ZIndex = 9
G.TextButton_43.Text = ""
G.TextButton_43.Parent = G.Frame_118

-- TextButton_44 (TextButton)
G.TextButton_44 = Instance.new("TextButton")
G.TextButton_44.BackgroundTransparency = 1
G.TextButton_44.BorderSizePixel = 0
G.TextButton_44.Size = UDim2.new(1, -56, 1, 0)
G.TextButton_44.ZIndex = 5
G.TextButton_44.Text = ""
G.TextButton_44.Parent = G.Frame_117

-- Frame_120 (Frame)
G.Frame_120 = Instance.new("Frame")
G.Frame_120.BackgroundTransparency = 1
G.Frame_120.BorderSizePixel = 0
G.Frame_120.LayoutOrder = 16
G.Frame_120.Size = UDim2.new(1, 0, 0, 8)
G.Frame_120.Parent = G.Movement

-- Frame_121 (Frame)
G.Frame_121 = Instance.new("Frame")
G.Frame_121.BackgroundColor3 = Color3.fromRGB(40, 92, 64)
G.Frame_121.BackgroundTransparency = 0.25
G.Frame_121.BorderSizePixel = 0
G.Frame_121.LayoutOrder = 17
G.Frame_121.Size = UDim2.new(1, -10, 0, 32)
G.Frame_121.Parent = G.Movement

-- UICorner_123 (UICorner)
G.UICorner_123 = Instance.new("UICorner")
G.UICorner_123.CornerRadius = UDim.new(0, 10)
G.UICorner_123.Parent = G.Frame_121

-- UIStroke_57 (UIStroke)
G.UIStroke_57 = Instance.new("UIStroke")
G.UIStroke_57.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
G.UIStroke_57.Color = Color3.fromRGB(24, 65, 38)
G.UIStroke_57.Transparency = 0.40000000596046448
G.UIStroke_57.Parent = G.Frame_121

-- Frame_122 (Frame)
G.Frame_122 = Instance.new("Frame")
G.Frame_122.BackgroundColor3 = Color3.fromRGB(42, 230, 123)
G.Frame_122.BorderSizePixel = 0
G.Frame_122.Position = UDim2.new(0, 10, 0, 9)
G.Frame_122.Size = UDim2.new(0, 4, 1, -18)
G.Frame_122.Parent = G.Frame_121

-- UICorner_124 (UICorner)
G.UICorner_124 = Instance.new("UICorner")
G.UICorner_124.CornerRadius = UDim.new(0, 2)
G.UICorner_124.Parent = G.Frame_122

-- TextLabel_44 (TextLabel)
G.TextLabel_44 = Instance.new("TextLabel")
G.TextLabel_44.BackgroundTransparency = 1
G.TextLabel_44.Position = UDim2.new(0, 22, 0, 0)
G.TextLabel_44.Size = UDim2.new(1, -30, 1, 0)
G.TextLabel_44.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal)
G.TextLabel_44.Text = "AUTO MOVEMENT"
G.TextLabel_44.TextColor3 = Color3.fromRGB(218, 255, 233)
G.TextLabel_44.TextSize = 13
G.TextLabel_44.TextXAlignment = Enum.TextXAlignment.Left
G.TextLabel_44.Parent = G.Frame_121

-- Frame_123 (Frame)
G.Frame_123 = Instance.new("Frame")
G.Frame_123.BackgroundTransparency = 1
G.Frame_123.BorderSizePixel = 0
G.Frame_123.LayoutOrder = 18
G.Frame_123.Size = UDim2.new(1, 0, 0, 2)
G.Frame_123.Parent = G.Movement

-- Frame_124 (Frame)
G.Frame_124 = Instance.new("Frame")
G.Frame_124.BackgroundColor3 = Color3.fromRGB(19, 33, 26)
G.Frame_124.BackgroundTransparency = 0.11999999731779099
G.Frame_124.BorderSizePixel = 0
G.Frame_124.LayoutOrder = 19
G.Frame_124.Size = UDim2.new(1, -16, 0, 40)
G.Frame_124.Parent = G.Movement

-- UICorner_125 (UICorner)
G.UICorner_125 = Instance.new("UICorner")
G.UICorner_125.CornerRadius = UDim.new(0, 16)
G.UICorner_125.Parent = G.Frame_124

-- UIStroke_58 (UIStroke)
G.UIStroke_58 = Instance.new("UIStroke")
G.UIStroke_58.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
G.UIStroke_58.Color = Color3.fromRGB(31, 54, 40)
G.UIStroke_58.Transparency = 0.55000001192092896
G.UIStroke_58.Parent = G.Frame_124

-- TextLabel_45 (TextLabel)
G.TextLabel_45 = Instance.new("TextLabel")
G.TextLabel_45.BackgroundTransparency = 1
G.TextLabel_45.Position = UDim2.new(0, 12, 0, 0)
G.TextLabel_45.Size = UDim2.new(1, -96, 1, 0)
G.TextLabel_45.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Medium, Enum.FontStyle.Normal)
G.TextLabel_45.Text = "Auto Left"
G.TextLabel_45.TextColor3 = Color3.fromRGB(220, 239, 228)
G.TextLabel_45.TextSize = 13
G.TextLabel_45.TextXAlignment = Enum.TextXAlignment.Left
G.TextLabel_45.Parent = G.Frame_124

-- TextButton_45 (TextButton)
G.TextButton_45 = Instance.new("TextButton")
G.TextButton_45.BackgroundColor3 = Color3.fromRGB(22, 76, 43)
G.TextButton_45.BorderSizePixel = 0
G.TextButton_45.Position = UDim2.new(1, -72, 0.5, -14)
G.TextButton_45.Size = UDim2.new(0, 62, 0, 28)
G.TextButton_45.ZIndex = 8
G.TextButton_45.AutoButtonColor = false
G.TextButton_45.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Heavy, Enum.FontStyle.Normal)
G.TextButton_45.Text = "L"
G.TextButton_45.TextColor3 = Color3.fromRGB(42, 230, 123)
G.TextButton_45.TextSize = 11
G.TextButton_45.TextWrapped = true
G.TextButton_45.Parent = G.Frame_124

-- UICorner_126 (UICorner)
G.UICorner_126 = Instance.new("UICorner")
G.UICorner_126.CornerRadius = UDim.new(0, 9)
G.UICorner_126.Parent = G.TextButton_45

-- KeybindStroke_5 (UIStroke)
G.KeybindStroke_5 = Instance.new("UIStroke")
G.KeybindStroke_5.Name = "KeybindStroke"
G.KeybindStroke_5.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
G.KeybindStroke_5.Color = Color3.fromRGB(92, 255, 150)
G.KeybindStroke_5.Transparency = 0.079999998211860657
G.KeybindStroke_5.Parent = G.TextButton_45

-- KeybindShine_3 (Frame)
G.KeybindShine_3 = Instance.new("Frame")
G.KeybindShine_3.Name = "KeybindShine"
G.KeybindShine_3.BackgroundColor3 = Color3.fromRGB(180, 255, 205)
G.KeybindShine_3.BackgroundTransparency = 1
G.KeybindShine_3.BorderSizePixel = 0
G.KeybindShine_3.Size = UDim2.new(1, 0, 0, 10)
G.KeybindShine_3.ZIndex = 9
G.KeybindShine_3.Parent = G.TextButton_45

-- UICorner_127 (UICorner)
G.UICorner_127 = Instance.new("UICorner")
G.UICorner_127.CornerRadius = UDim.new(0, 9)
G.UICorner_127.Parent = G.KeybindShine_3

-- Frame_125 (Frame)
G.Frame_125 = Instance.new("Frame")
G.Frame_125.BackgroundColor3 = Color3.fromRGB(19, 33, 26)
G.Frame_125.BackgroundTransparency = 0.11999999731779099
G.Frame_125.BorderSizePixel = 0
G.Frame_125.LayoutOrder = 20
G.Frame_125.Size = UDim2.new(1, -16, 0, 40)
G.Frame_125.Parent = G.Movement

-- UICorner_128 (UICorner)
G.UICorner_128 = Instance.new("UICorner")
G.UICorner_128.CornerRadius = UDim.new(0, 16)
G.UICorner_128.Parent = G.Frame_125

-- UIStroke_59 (UIStroke)
G.UIStroke_59 = Instance.new("UIStroke")
G.UIStroke_59.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
G.UIStroke_59.Color = Color3.fromRGB(31, 54, 40)
G.UIStroke_59.Transparency = 0.55000001192092896
G.UIStroke_59.Parent = G.Frame_125

-- TextLabel_46 (TextLabel)
G.TextLabel_46 = Instance.new("TextLabel")
G.TextLabel_46.BackgroundTransparency = 1
G.TextLabel_46.Position = UDim2.new(0, 12, 0, 0)
G.TextLabel_46.Size = UDim2.new(1, -96, 1, 0)
G.TextLabel_46.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Medium, Enum.FontStyle.Normal)
G.TextLabel_46.Text = "Auto Right"
G.TextLabel_46.TextColor3 = Color3.fromRGB(220, 239, 228)
G.TextLabel_46.TextSize = 13
G.TextLabel_46.TextXAlignment = Enum.TextXAlignment.Left
G.TextLabel_46.Parent = G.Frame_125

-- TextButton_46 (TextButton)
G.TextButton_46 = Instance.new("TextButton")
G.TextButton_46.BackgroundColor3 = Color3.fromRGB(22, 76, 43)
G.TextButton_46.BorderSizePixel = 0
G.TextButton_46.Position = UDim2.new(1, -72, 0.5, -14)
G.TextButton_46.Size = UDim2.new(0, 62, 0, 28)
G.TextButton_46.ZIndex = 8
G.TextButton_46.AutoButtonColor = false
G.TextButton_46.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Heavy, Enum.FontStyle.Normal)
G.TextButton_46.Text = "R"
G.TextButton_46.TextColor3 = Color3.fromRGB(42, 230, 123)
G.TextButton_46.TextSize = 11
G.TextButton_46.TextWrapped = true
G.TextButton_46.Parent = G.Frame_125

-- UICorner_129 (UICorner)
G.UICorner_129 = Instance.new("UICorner")
G.UICorner_129.CornerRadius = UDim.new(0, 9)
G.UICorner_129.Parent = G.TextButton_46

-- KeybindStroke_6 (UIStroke)
G.KeybindStroke_6 = Instance.new("UIStroke")
G.KeybindStroke_6.Name = "KeybindStroke"
G.KeybindStroke_6.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
G.KeybindStroke_6.Color = Color3.fromRGB(92, 255, 150)
G.KeybindStroke_6.Transparency = 0.079999998211860657
G.KeybindStroke_6.Parent = G.TextButton_46

-- KeybindShine_4 (Frame)
G.KeybindShine_4 = Instance.new("Frame")
G.KeybindShine_4.Name = "KeybindShine"
G.KeybindShine_4.BackgroundColor3 = Color3.fromRGB(180, 255, 205)
G.KeybindShine_4.BackgroundTransparency = 1
G.KeybindShine_4.BorderSizePixel = 0
G.KeybindShine_4.Size = UDim2.new(1, 0, 0, 10)
G.KeybindShine_4.ZIndex = 9
G.KeybindShine_4.Parent = G.TextButton_46

-- UICorner_130 (UICorner)
G.UICorner_130 = Instance.new("UICorner")
G.UICorner_130.CornerRadius = UDim.new(0, 9)
G.UICorner_130.Parent = G.KeybindShine_4

-- Frame_126 (Frame)
G.Frame_126 = Instance.new("Frame")
G.Frame_126.BackgroundTransparency = 1
G.Frame_126.BorderSizePixel = 0
G.Frame_126.LayoutOrder = 21
G.Frame_126.Size = UDim2.new(1, 0, 0, 6)
G.Frame_126.Parent = G.Movement

-- Frame_127 (Frame)
G.Frame_127 = Instance.new("Frame")
G.Frame_127.BackgroundColor3 = Color3.fromRGB(40, 92, 64)
G.Frame_127.BackgroundTransparency = 0.25
G.Frame_127.BorderSizePixel = 0
G.Frame_127.LayoutOrder = 22
G.Frame_127.Size = UDim2.new(1, -10, 0, 32)
G.Frame_127.Parent = G.Movement

-- UICorner_131 (UICorner)
G.UICorner_131 = Instance.new("UICorner")
G.UICorner_131.CornerRadius = UDim.new(0, 10)
G.UICorner_131.Parent = G.Frame_127

-- UIStroke_60 (UIStroke)
G.UIStroke_60 = Instance.new("UIStroke")
G.UIStroke_60.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
G.UIStroke_60.Color = Color3.fromRGB(24, 65, 38)
G.UIStroke_60.Transparency = 0.40000000596046448
G.UIStroke_60.Parent = G.Frame_127

-- Frame_128 (Frame)
G.Frame_128 = Instance.new("Frame")
G.Frame_128.BackgroundColor3 = Color3.fromRGB(42, 230, 123)
G.Frame_128.BorderSizePixel = 0
G.Frame_128.Position = UDim2.new(0, 10, 0, 9)
G.Frame_128.Size = UDim2.new(0, 4, 1, -18)
G.Frame_128.Parent = G.Frame_127

-- UICorner_132 (UICorner)
G.UICorner_132 = Instance.new("UICorner")
G.UICorner_132.CornerRadius = UDim.new(0, 2)
G.UICorner_132.Parent = G.Frame_128

-- TextLabel_47 (TextLabel)
G.TextLabel_47 = Instance.new("TextLabel")
G.TextLabel_47.BackgroundTransparency = 1
G.TextLabel_47.Position = UDim2.new(0, 22, 0, 0)
G.TextLabel_47.Size = UDim2.new(1, -30, 1, 0)
G.TextLabel_47.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal)
G.TextLabel_47.Text = "AUTO TP DOWN"
G.TextLabel_47.TextColor3 = Color3.fromRGB(218, 255, 233)
G.TextLabel_47.TextSize = 13
G.TextLabel_47.TextXAlignment = Enum.TextXAlignment.Left
G.TextLabel_47.Parent = G.Frame_127

-- Frame_129 (Frame)
G.Frame_129 = Instance.new("Frame")
G.Frame_129.BackgroundTransparency = 1
G.Frame_129.BorderSizePixel = 0
G.Frame_129.LayoutOrder = 23
G.Frame_129.Size = UDim2.new(1, 0, 0, 2)
G.Frame_129.Parent = G.Movement

-- Frame_130 (Frame)
G.Frame_130 = Instance.new("Frame")
G.Frame_130.BackgroundColor3 = Color3.fromRGB(19, 33, 26)
G.Frame_130.BackgroundTransparency = 0.11999999731779099
G.Frame_130.BorderSizePixel = 0
G.Frame_130.LayoutOrder = 24
G.Frame_130.Size = UDim2.new(1, -16, 0, 40)
G.Frame_130.Parent = G.Movement

-- UICorner_133 (UICorner)
G.UICorner_133 = Instance.new("UICorner")
G.UICorner_133.CornerRadius = UDim.new(0, 16)
G.UICorner_133.Parent = G.Frame_130

-- UIStroke_61 (UIStroke)
G.UIStroke_61 = Instance.new("UIStroke")
G.UIStroke_61.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
G.UIStroke_61.Color = Color3.fromRGB(31, 54, 40)
G.UIStroke_61.Transparency = 0.55000001192092896
G.UIStroke_61.Parent = G.Frame_130

-- TextLabel_48 (TextLabel)
G.TextLabel_48 = Instance.new("TextLabel")
G.TextLabel_48.BackgroundTransparency = 1
G.TextLabel_48.Position = UDim2.new(0, 12, 0, 0)
G.TextLabel_48.Size = UDim2.new(1, -96, 1, 0)
G.TextLabel_48.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Medium, Enum.FontStyle.Normal)
G.TextLabel_48.Text = "TP Down Key"
G.TextLabel_48.TextColor3 = Color3.fromRGB(220, 239, 228)
G.TextLabel_48.TextSize = 13
G.TextLabel_48.TextXAlignment = Enum.TextXAlignment.Left
G.TextLabel_48.Parent = G.Frame_130

-- TextButton_47 (TextButton)
G.TextButton_47 = Instance.new("TextButton")
G.TextButton_47.BackgroundColor3 = Color3.fromRGB(18, 26, 20)
G.TextButton_47.BorderSizePixel = 0
G.TextButton_47.Position = UDim2.new(1, -72, 0.5, -14)
G.TextButton_47.Size = UDim2.new(0, 62, 0, 28)
G.TextButton_47.ZIndex = 8
G.TextButton_47.AutoButtonColor = false
G.TextButton_47.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Heavy, Enum.FontStyle.Normal)
G.TextButton_47.Text = "None"
G.TextButton_47.TextColor3 = Color3.fromRGB(105, 150, 120)
G.TextButton_47.TextSize = 11
G.TextButton_47.TextWrapped = true
G.TextButton_47.Parent = G.Frame_130

-- UICorner_134 (UICorner)
G.UICorner_134 = Instance.new("UICorner")
G.UICorner_134.CornerRadius = UDim.new(0, 9)
G.UICorner_134.Parent = G.TextButton_47

-- KeybindStroke_7 (UIStroke)
G.KeybindStroke_7 = Instance.new("UIStroke")
G.KeybindStroke_7.Name = "KeybindStroke"
G.KeybindStroke_7.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
G.KeybindStroke_7.Color = Color3.fromRGB(35, 75, 48)
G.KeybindStroke_7.Transparency = 0.44999998807907104
G.KeybindStroke_7.Parent = G.TextButton_47

-- KeybindShine_5 (Frame)
G.KeybindShine_5 = Instance.new("Frame")
G.KeybindShine_5.Name = "KeybindShine"
G.KeybindShine_5.BackgroundColor3 = Color3.fromRGB(180, 255, 205)
G.KeybindShine_5.BackgroundTransparency = 1
G.KeybindShine_5.BorderSizePixel = 0
G.KeybindShine_5.Size = UDim2.new(1, 0, 0, 10)
G.KeybindShine_5.ZIndex = 9
G.KeybindShine_5.Parent = G.TextButton_47

-- UICorner_135 (UICorner)
G.UICorner_135 = Instance.new("UICorner")
G.UICorner_135.CornerRadius = UDim.new(0, 9)
G.UICorner_135.Parent = G.KeybindShine_5

-- Frame_131 (Frame)
G.Frame_131 = Instance.new("Frame")
G.Frame_131.BackgroundColor3 = Color3.fromRGB(19, 33, 26)
G.Frame_131.BackgroundTransparency = 0.11999999731779099
G.Frame_131.BorderSizePixel = 0
G.Frame_131.LayoutOrder = 25
G.Frame_131.Size = UDim2.new(1, -16, 0, 42)
G.Frame_131.Parent = G.Movement

-- UICorner_136 (UICorner)
G.UICorner_136 = Instance.new("UICorner")
G.UICorner_136.CornerRadius = UDim.new(0, 16)
G.UICorner_136.Parent = G.Frame_131

-- UIStroke_62 (UIStroke)
G.UIStroke_62 = Instance.new("UIStroke")
G.UIStroke_62.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
G.UIStroke_62.Color = Color3.fromRGB(31, 54, 40)
G.UIStroke_62.Transparency = 0.5
G.UIStroke_62.Parent = G.Frame_131

-- TextLabel_49 (TextLabel)
G.TextLabel_49 = Instance.new("TextLabel")
G.TextLabel_49.BackgroundTransparency = 1
G.TextLabel_49.Position = UDim2.new(0, 12, 0, 0)
G.TextLabel_49.Size = UDim2.new(1, -70, 1, 0)
G.TextLabel_49.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Medium, Enum.FontStyle.Normal)
G.TextLabel_49.Text = "Auto TP Down"
G.TextLabel_49.TextColor3 = Color3.fromRGB(220, 239, 228)
G.TextLabel_49.TextSize = 13
G.TextLabel_49.TextXAlignment = Enum.TextXAlignment.Left
G.TextLabel_49.Parent = G.Frame_131

-- Frame_132 (Frame)
G.Frame_132 = Instance.new("Frame")
G.Frame_132.BackgroundColor3 = Color3.fromRGB(35, 48, 41)
G.Frame_132.BorderSizePixel = 0
G.Frame_132.Position = UDim2.new(1, -62, 0.5, -12)
G.Frame_132.Size = UDim2.new(0, 48, 0, 24)
G.Frame_132.ZIndex = 7
G.Frame_132.Parent = G.Frame_131

-- UICorner_137 (UICorner)
G.UICorner_137 = Instance.new("UICorner")
G.UICorner_137.CornerRadius = UDim.new(0, 11)
G.UICorner_137.Parent = G.Frame_132

-- Frame_133 (Frame)
G.Frame_133 = Instance.new("Frame")
G.Frame_133.BackgroundColor3 = Color3.fromRGB(119, 149, 130)
G.Frame_133.BorderSizePixel = 0
G.Frame_133.Position = UDim2.new(0, 4, 0.5, -7)
G.Frame_133.Size = UDim2.new(0, 14, 0, 14)
G.Frame_133.ZIndex = 8
G.Frame_133.Parent = G.Frame_132

-- UICorner_138 (UICorner)
G.UICorner_138 = Instance.new("UICorner")
G.UICorner_138.CornerRadius = UDim.new(0, 7)
G.UICorner_138.Parent = G.Frame_133

-- TextButton_48 (TextButton)
G.TextButton_48 = Instance.new("TextButton")
G.TextButton_48.BackgroundTransparency = 1
G.TextButton_48.BorderSizePixel = 0
G.TextButton_48.Size = UDim2.new(1, 0, 1, 0)
G.TextButton_48.ZIndex = 9
G.TextButton_48.Text = ""
G.TextButton_48.Parent = G.Frame_132

-- TextButton_49 (TextButton)
G.TextButton_49 = Instance.new("TextButton")
G.TextButton_49.BackgroundTransparency = 1
G.TextButton_49.BorderSizePixel = 0
G.TextButton_49.Size = UDim2.new(1, -56, 1, 0)
G.TextButton_49.ZIndex = 5
G.TextButton_49.Text = ""
G.TextButton_49.Parent = G.Frame_131

-- Frame_134 (Frame)
G.Frame_134 = Instance.new("Frame")
G.Frame_134.BackgroundColor3 = Color3.fromRGB(19, 33, 26)
G.Frame_134.BackgroundTransparency = 0.11999999731779099
G.Frame_134.BorderSizePixel = 0
G.Frame_134.LayoutOrder = 26
G.Frame_134.Size = UDim2.new(1, -16, 0, 42)
G.Frame_134.Parent = G.Movement

-- UICorner_139 (UICorner)
G.UICorner_139 = Instance.new("UICorner")
G.UICorner_139.CornerRadius = UDim.new(0, 16)
G.UICorner_139.Parent = G.Frame_134

-- UIStroke_63 (UIStroke)
G.UIStroke_63 = Instance.new("UIStroke")
G.UIStroke_63.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
G.UIStroke_63.Color = Color3.fromRGB(31, 54, 40)
G.UIStroke_63.Transparency = 0.5
G.UIStroke_63.Parent = G.Frame_134

-- TextLabel_50 (TextLabel)
G.TextLabel_50 = Instance.new("TextLabel")
G.TextLabel_50.BackgroundTransparency = 1
G.TextLabel_50.Position = UDim2.new(0, 12, 0, 0)
G.TextLabel_50.Size = UDim2.new(1, -100, 1, 0)
G.TextLabel_50.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Medium, Enum.FontStyle.Normal)
G.TextLabel_50.Text = "Auto TP Height"
G.TextLabel_50.TextColor3 = Color3.fromRGB(220, 239, 228)
G.TextLabel_50.TextSize = 13
G.TextLabel_50.TextXAlignment = Enum.TextXAlignment.Left
G.TextLabel_50.Parent = G.Frame_134

-- Frame_135 (Frame)
G.Frame_135 = Instance.new("Frame")
G.Frame_135.BackgroundColor3 = Color3.fromRGB(9, 23, 15)
G.Frame_135.BorderSizePixel = 0
G.Frame_135.Position = UDim2.new(1, -88, 0.5, -15)
G.Frame_135.Size = UDim2.new(0, 76, 0, 30)
G.Frame_135.Parent = G.Frame_134

-- UICorner_140 (UICorner)
G.UICorner_140 = Instance.new("UICorner")
G.UICorner_140.CornerRadius = UDim.new(0, 13)
G.UICorner_140.Parent = G.Frame_135

-- UIStroke_64 (UIStroke)
G.UIStroke_64 = Instance.new("UIStroke")
G.UIStroke_64.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
G.UIStroke_64.Color = Color3.fromRGB(31, 54, 40)
G.UIStroke_64.Transparency = 0.30000001192092896
G.UIStroke_64.Parent = G.Frame_135

-- TextBox_10 (TextBox)
G.TextBox_10 = Instance.new("TextBox")
G.TextBox_10.BackgroundTransparency = 1
G.TextBox_10.Position = UDim2.new(0, 4, 0, 0)
G.TextBox_10.Size = UDim2.new(1, -8, 1, 0)
G.TextBox_10.ZIndex = 8
G.TextBox_10.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal)
G.TextBox_10.Text = "15"
G.TextBox_10.TextColor3 = Color3.fromRGB(154, 255, 191)
G.TextBox_10.TextSize = 14
G.TextBox_10.ClearTextOnFocus = false
G.TextBox_10.Parent = G.Frame_135

-- Frame_136 (Frame)
G.Frame_136 = Instance.new("Frame")
G.Frame_136.BackgroundTransparency = 1
G.Frame_136.BorderSizePixel = 0
G.Frame_136.LayoutOrder = 27
G.Frame_136.Size = UDim2.new(1, 0, 0, 6)
G.Frame_136.Parent = G.Movement

-- Frame_137 (Frame)
G.Frame_137 = Instance.new("Frame")
G.Frame_137.BackgroundColor3 = Color3.fromRGB(40, 92, 64)
G.Frame_137.BackgroundTransparency = 0.25
G.Frame_137.BorderSizePixel = 0
G.Frame_137.LayoutOrder = 28
G.Frame_137.Size = UDim2.new(1, -10, 0, 32)
G.Frame_137.Parent = G.Movement

-- UICorner_141 (UICorner)
G.UICorner_141 = Instance.new("UICorner")
G.UICorner_141.CornerRadius = UDim.new(0, 10)
G.UICorner_141.Parent = G.Frame_137

-- UIStroke_65 (UIStroke)
G.UIStroke_65 = Instance.new("UIStroke")
G.UIStroke_65.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
G.UIStroke_65.Color = Color3.fromRGB(24, 65, 38)
G.UIStroke_65.Transparency = 0.40000000596046448
G.UIStroke_65.Parent = G.Frame_137

-- Frame_138 (Frame)
G.Frame_138 = Instance.new("Frame")
G.Frame_138.BackgroundColor3 = Color3.fromRGB(42, 230, 123)
G.Frame_138.BorderSizePixel = 0
G.Frame_138.Position = UDim2.new(0, 10, 0, 9)
G.Frame_138.Size = UDim2.new(0, 4, 1, -18)
G.Frame_138.Parent = G.Frame_137

-- UICorner_142 (UICorner)
G.UICorner_142 = Instance.new("UICorner")
G.UICorner_142.CornerRadius = UDim.new(0, 2)
G.UICorner_142.Parent = G.Frame_138

-- TextLabel_51 (TextLabel)
G.TextLabel_51 = Instance.new("TextLabel")
G.TextLabel_51.BackgroundTransparency = 1
G.TextLabel_51.Position = UDim2.new(0, 22, 0, 0)
G.TextLabel_51.Size = UDim2.new(1, -30, 1, 0)
G.TextLabel_51.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal)
G.TextLabel_51.Text = "DROP SETTINGS"
G.TextLabel_51.TextColor3 = Color3.fromRGB(218, 255, 233)
G.TextLabel_51.TextSize = 13
G.TextLabel_51.TextXAlignment = Enum.TextXAlignment.Left
G.TextLabel_51.Parent = G.Frame_137

-- Frame_139 (Frame)
G.Frame_139 = Instance.new("Frame")
G.Frame_139.BackgroundTransparency = 1
G.Frame_139.BorderSizePixel = 0
G.Frame_139.LayoutOrder = 29
G.Frame_139.Size = UDim2.new(1, 0, 0, 2)
G.Frame_139.Parent = G.Movement

-- Frame_140 (Frame)
G.Frame_140 = Instance.new("Frame")
G.Frame_140.BackgroundColor3 = Color3.fromRGB(19, 33, 26)
G.Frame_140.BackgroundTransparency = 0.11999999731779099
G.Frame_140.BorderSizePixel = 0
G.Frame_140.LayoutOrder = 30
G.Frame_140.Size = UDim2.new(1, -16, 0, 40)
G.Frame_140.Parent = G.Movement

-- UICorner_143 (UICorner)
G.UICorner_143 = Instance.new("UICorner")
G.UICorner_143.CornerRadius = UDim.new(0, 16)
G.UICorner_143.Parent = G.Frame_140

-- UIStroke_66 (UIStroke)
G.UIStroke_66 = Instance.new("UIStroke")
G.UIStroke_66.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
G.UIStroke_66.Color = Color3.fromRGB(31, 54, 40)
G.UIStroke_66.Transparency = 0.55000001192092896
G.UIStroke_66.Parent = G.Frame_140

-- TextLabel_52 (TextLabel)
G.TextLabel_52 = Instance.new("TextLabel")
G.TextLabel_52.BackgroundTransparency = 1
G.TextLabel_52.Position = UDim2.new(0, 12, 0, 0)
G.TextLabel_52.Size = UDim2.new(1, -96, 1, 0)
G.TextLabel_52.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Medium, Enum.FontStyle.Normal)
G.TextLabel_52.Text = "Drop Key"
G.TextLabel_52.TextColor3 = Color3.fromRGB(220, 239, 228)
G.TextLabel_52.TextSize = 13
G.TextLabel_52.TextXAlignment = Enum.TextXAlignment.Left
G.TextLabel_52.Parent = G.Frame_140

-- TextButton_50 (TextButton)
G.TextButton_50 = Instance.new("TextButton")
G.TextButton_50.BackgroundColor3 = Color3.fromRGB(22, 76, 43)
G.TextButton_50.BorderSizePixel = 0
G.TextButton_50.Position = UDim2.new(1, -72, 0.5, -14)
G.TextButton_50.Size = UDim2.new(0, 62, 0, 28)
G.TextButton_50.ZIndex = 8
G.TextButton_50.AutoButtonColor = false
G.TextButton_50.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Heavy, Enum.FontStyle.Normal)
G.TextButton_50.Text = "H"
G.TextButton_50.TextColor3 = Color3.fromRGB(42, 230, 123)
G.TextButton_50.TextSize = 11
G.TextButton_50.TextWrapped = true
G.TextButton_50.Parent = G.Frame_140

-- UICorner_144 (UICorner)
G.UICorner_144 = Instance.new("UICorner")
G.UICorner_144.CornerRadius = UDim.new(0, 9)
G.UICorner_144.Parent = G.TextButton_50

-- KeybindStroke_8 (UIStroke)
G.KeybindStroke_8 = Instance.new("UIStroke")
G.KeybindStroke_8.Name = "KeybindStroke"
G.KeybindStroke_8.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
G.KeybindStroke_8.Color = Color3.fromRGB(92, 255, 150)
G.KeybindStroke_8.Transparency = 0.079999998211860657
G.KeybindStroke_8.Parent = G.TextButton_50

-- KeybindShine_6 (Frame)
G.KeybindShine_6 = Instance.new("Frame")
G.KeybindShine_6.Name = "KeybindShine"
G.KeybindShine_6.BackgroundColor3 = Color3.fromRGB(180, 255, 205)
G.KeybindShine_6.BackgroundTransparency = 1
G.KeybindShine_6.BorderSizePixel = 0
G.KeybindShine_6.Size = UDim2.new(1, 0, 0, 10)
G.KeybindShine_6.ZIndex = 9
G.KeybindShine_6.Parent = G.TextButton_50

-- UICorner_145 (UICorner)
G.UICorner_145 = Instance.new("UICorner")
G.UICorner_145.CornerRadius = UDim.new(0, 9)
G.UICorner_145.Parent = G.KeybindShine_6

-- Frame_141 (Frame)
G.Frame_141 = Instance.new("Frame")
G.Frame_141.BackgroundColor3 = Color3.fromRGB(19, 33, 26)
G.Frame_141.BackgroundTransparency = 0.11999999731779099
G.Frame_141.BorderSizePixel = 0
G.Frame_141.LayoutOrder = 31
G.Frame_141.Size = UDim2.new(1, -16, 0, 40)
G.Frame_141.Parent = G.Movement

-- UICorner_146 (UICorner)
G.UICorner_146 = Instance.new("UICorner")
G.UICorner_146.CornerRadius = UDim.new(0, 16)
G.UICorner_146.Parent = G.Frame_141

-- UIStroke_67 (UIStroke)
G.UIStroke_67 = Instance.new("UIStroke")
G.UIStroke_67.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
G.UIStroke_67.Color = Color3.fromRGB(31, 54, 40)
G.UIStroke_67.Transparency = 0.55000001192092896
G.UIStroke_67.Parent = G.Frame_141

-- TextLabel_53 (TextLabel)
G.TextLabel_53 = Instance.new("TextLabel")
G.TextLabel_53.BackgroundTransparency = 1
G.TextLabel_53.Position = UDim2.new(0, 12, 0, 0)
G.TextLabel_53.Size = UDim2.new(1, -96, 1, 0)
G.TextLabel_53.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Medium, Enum.FontStyle.Normal)
G.TextLabel_53.Text = "Insta Reset Key"
G.TextLabel_53.TextColor3 = Color3.fromRGB(220, 239, 228)
G.TextLabel_53.TextSize = 13
G.TextLabel_53.TextXAlignment = Enum.TextXAlignment.Left
G.TextLabel_53.Parent = G.Frame_141

-- TextButton_51 (TextButton)
G.TextButton_51 = Instance.new("TextButton")
G.TextButton_51.BackgroundColor3 = Color3.fromRGB(22, 76, 43)
G.TextButton_51.BorderSizePixel = 0
G.TextButton_51.Position = UDim2.new(1, -72, 0.5, -14)
G.TextButton_51.Size = UDim2.new(0, 62, 0, 28)
G.TextButton_51.ZIndex = 8
G.TextButton_51.AutoButtonColor = false
G.TextButton_51.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Heavy, Enum.FontStyle.Normal)
G.TextButton_51.Text = "T"
G.TextButton_51.TextColor3 = Color3.fromRGB(42, 230, 123)
G.TextButton_51.TextSize = 11
G.TextButton_51.TextWrapped = true
G.TextButton_51.Parent = G.Frame_141

-- UICorner_147 (UICorner)
G.UICorner_147 = Instance.new("UICorner")
G.UICorner_147.CornerRadius = UDim.new(0, 9)
G.UICorner_147.Parent = G.TextButton_51

-- KeybindStroke_9 (UIStroke)
G.KeybindStroke_9 = Instance.new("UIStroke")
G.KeybindStroke_9.Name = "KeybindStroke"
G.KeybindStroke_9.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
G.KeybindStroke_9.Color = Color3.fromRGB(92, 255, 150)
G.KeybindStroke_9.Transparency = 0.079999998211860657
G.KeybindStroke_9.Parent = G.TextButton_51

-- KeybindShine_7 (Frame)
G.KeybindShine_7 = Instance.new("Frame")
G.KeybindShine_7.Name = "KeybindShine"
G.KeybindShine_7.BackgroundColor3 = Color3.fromRGB(180, 255, 205)
G.KeybindShine_7.BackgroundTransparency = 1
G.KeybindShine_7.BorderSizePixel = 0
G.KeybindShine_7.Size = UDim2.new(1, 0, 0, 10)
G.KeybindShine_7.ZIndex = 9
G.KeybindShine_7.Parent = G.TextButton_51

-- UICorner_148 (UICorner)
G.UICorner_148 = Instance.new("UICorner")
G.UICorner_148.CornerRadius = UDim.new(0, 9)
G.UICorner_148.Parent = G.KeybindShine_7

-- Frame_142 (Frame)
G.Frame_142 = Instance.new("Frame")
G.Frame_142.BackgroundColor3 = Color3.fromRGB(19, 33, 26)
G.Frame_142.BorderSizePixel = 0
G.Frame_142.ClipsDescendants = true
G.Frame_142.LayoutOrder = 32
G.Frame_142.Size = UDim2.new(1, -16, 0, 42)
G.Frame_142.Parent = G.Movement

-- UICorner_149 (UICorner)
G.UICorner_149 = Instance.new("UICorner")
G.UICorner_149.CornerRadius = UDim.new(0, 12)
G.UICorner_149.Parent = G.Frame_142

-- UIStroke_68 (UIStroke)
G.UIStroke_68 = Instance.new("UIStroke")
G.UIStroke_68.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
G.UIStroke_68.Color = Color3.fromRGB(31, 54, 40)
G.UIStroke_68.Transparency = 0.5
G.UIStroke_68.Parent = G.Frame_142

-- TextLabel_54 (TextLabel)
G.TextLabel_54 = Instance.new("TextLabel")
G.TextLabel_54.BackgroundTransparency = 1
G.TextLabel_54.Position = UDim2.new(0, 14, 0, 0)
G.TextLabel_54.Size = UDim2.new(1, -78, 0, 42)
G.TextLabel_54.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal)
G.TextLabel_54.Text = "Drop Type"
G.TextLabel_54.TextColor3 = Color3.fromRGB(220, 239, 228)
G.TextLabel_54.TextSize = 13
G.TextLabel_54.TextXAlignment = Enum.TextXAlignment.Left
G.TextLabel_54.Parent = G.Frame_142

-- TextButton_52 (TextButton)
G.TextButton_52 = Instance.new("TextButton")
G.TextButton_52.BackgroundColor3 = Color3.fromRGB(10, 14, 12)
G.TextButton_52.BorderSizePixel = 0
G.TextButton_52.Position = UDim2.new(1, -50, 0, 7)
G.TextButton_52.Size = UDim2.new(0, 42, 0, 28)
G.TextButton_52.ZIndex = 33
G.TextButton_52.AutoButtonColor = false
G.TextButton_52.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Heavy, Enum.FontStyle.Normal)
G.TextButton_52.Text = "â–¼"
G.TextButton_52.TextColor3 = Color3.fromRGB(235, 245, 238)
G.TextButton_52.TextSize = 12
G.TextButton_52.Parent = G.Frame_142

-- UICorner_150 (UICorner)
G.UICorner_150 = Instance.new("UICorner")
G.UICorner_150.CornerRadius = UDim.new(0, 9)
G.UICorner_150.Parent = G.TextButton_52

-- UIStroke_69 (UIStroke)
G.UIStroke_69 = Instance.new("UIStroke")
G.UIStroke_69.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
G.UIStroke_69.Color = Color3.fromRGB(28, 48, 36)
G.UIStroke_69.Transparency = 0.34999999403953552
G.UIStroke_69.Parent = G.TextButton_52

-- Frame_143 (Frame)
G.Frame_143 = Instance.new("Frame")
G.Frame_143.BackgroundColor3 = Color3.fromRGB(7, 9, 8)
G.Frame_143.BorderSizePixel = 0
G.Frame_143.Position = UDim2.new(0, 4, 0, 42)
G.Frame_143.Size = UDim2.new(1, -8, 0, 34)
G.Frame_143.Visible = false
G.Frame_143.ZIndex = 30
G.Frame_143.Parent = G.Frame_142

-- UICorner_151 (UICorner)
G.UICorner_151 = Instance.new("UICorner")
G.UICorner_151.Parent = G.Frame_143

-- TextButton_53 (TextButton)
G.TextButton_53 = Instance.new("TextButton")
G.TextButton_53.BackgroundColor3 = Color3.fromRGB(14, 76, 38)
G.TextButton_53.BorderSizePixel = 0
G.TextButton_53.Position = UDim2.new(0, 4, 0, 4)
G.TextButton_53.Size = UDim2.new(0.5, -5, 1, -8)
G.TextButton_53.ZIndex = 32
G.TextButton_53.AutoButtonColor = false
G.TextButton_53.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Heavy, Enum.FontStyle.Normal)
G.TextButton_53.Text = "Stand Drop"
G.TextButton_53.TextColor3 = Color3.fromRGB(145, 255, 185)
G.TextButton_53.TextSize = 11
G.TextButton_53.TextWrapped = true
G.TextButton_53:SetAttribute("SelectorActive", true)
G.TextButton_53.Parent = G.Frame_143

-- UICorner_152 (UICorner)
G.UICorner_152 = Instance.new("UICorner")
G.UICorner_152.CornerRadius = UDim.new(0, 7)
G.UICorner_152.Parent = G.TextButton_53

-- UICorner_153 (UICorner)
G.UICorner_153 = Instance.new("UICorner")
G.UICorner_153.Parent = G.TextButton_53

-- SelectorStroke_5 (UIStroke)
G.SelectorStroke_5 = Instance.new("UIStroke")
G.SelectorStroke_5.Name = "SelectorStroke"
G.SelectorStroke_5.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
G.SelectorStroke_5.Color = Color3.fromRGB(80, 255, 145)
G.SelectorStroke_5.Thickness = 1.6000000238418579
G.SelectorStroke_5.Transparency = 0.019999999552965164
G.SelectorStroke_5.Parent = G.TextButton_53

-- SelectorShine_5 (Frame)
G.SelectorShine_5 = Instance.new("Frame")
G.SelectorShine_5.Name = "SelectorShine"
G.SelectorShine_5.BackgroundColor3 = Color3.fromRGB(180, 255, 205)
G.SelectorShine_5.BackgroundTransparency = 1
G.SelectorShine_5.BorderSizePixel = 0
G.SelectorShine_5.Size = UDim2.new(1, 0, 0, 10)
G.SelectorShine_5.ZIndex = 33
G.SelectorShine_5.Parent = G.TextButton_53

-- UICorner_154 (UICorner)
G.UICorner_154 = Instance.new("UICorner")
G.UICorner_154.Parent = G.SelectorShine_5

-- TextButton_54 (TextButton)
G.TextButton_54 = Instance.new("TextButton")
G.TextButton_54.BackgroundColor3 = Color3.fromRGB(6, 14, 10)
G.TextButton_54.BorderSizePixel = 0
G.TextButton_54.Position = UDim2.new(0.5, 1, 0, 4)
G.TextButton_54.Size = UDim2.new(0.5, -5, 1, -8)
G.TextButton_54.ZIndex = 32
G.TextButton_54.AutoButtonColor = false
G.TextButton_54.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Heavy, Enum.FontStyle.Normal)
G.TextButton_54.Text = "Jump Drop"
G.TextButton_54.TextColor3 = Color3.fromRGB(225, 240, 230)
G.TextButton_54.TextSize = 11
G.TextButton_54.TextWrapped = true
G.TextButton_54:SetAttribute("SelectorActive", false)
G.TextButton_54.Parent = G.Frame_143

-- UICorner_155 (UICorner)
G.UICorner_155 = Instance.new("UICorner")
G.UICorner_155.CornerRadius = UDim.new(0, 7)
G.UICorner_155.Parent = G.TextButton_54

-- UICorner_156 (UICorner)
G.UICorner_156 = Instance.new("UICorner")
G.UICorner_156.Parent = G.TextButton_54

-- SelectorStroke_6 (UIStroke)
G.SelectorStroke_6 = Instance.new("UIStroke")
G.SelectorStroke_6.Name = "SelectorStroke"
G.SelectorStroke_6.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
G.SelectorStroke_6.Color = Color3.fromRGB(24, 54, 34)
G.SelectorStroke_6.Transparency = 0.64999997615814209
G.SelectorStroke_6.Parent = G.TextButton_54

-- SelectorShine_6 (Frame)
G.SelectorShine_6 = Instance.new("Frame")
G.SelectorShine_6.Name = "SelectorShine"
G.SelectorShine_6.BackgroundColor3 = Color3.fromRGB(180, 255, 205)
G.SelectorShine_6.BackgroundTransparency = 1
G.SelectorShine_6.BorderSizePixel = 0
G.SelectorShine_6.Size = UDim2.new(1, 0, 0, 10)
G.SelectorShine_6.ZIndex = 33
G.SelectorShine_6.Parent = G.TextButton_54

-- UICorner_157 (UICorner)
G.UICorner_157 = Instance.new("UICorner")
G.UICorner_157.Parent = G.SelectorShine_6

-- Visual (Frame)
G.Visual = Instance.new("Frame")
G.Visual.Name = "Visual"
G.Visual.AutomaticSize = Enum.AutomaticSize.Y
G.Visual.BackgroundTransparency = 1
G.Visual.BorderSizePixel = 0
G.Visual.LayoutOrder = 5
G.Visual.Size = UDim2.new(1, 0, 0, 0)
G.Visual.Visible = false
G.Visual.Parent = G.MainScroll

-- UIListLayout_6 (UIListLayout)
G.UIListLayout_6 = Instance.new("UIListLayout")
G.UIListLayout_6.HorizontalAlignment = Enum.HorizontalAlignment.Center
G.UIListLayout_6.Padding = UDim.new(0, 6)
G.UIListLayout_6.SortOrder = Enum.SortOrder.LayoutOrder
G.UIListLayout_6.Parent = G.Visual

-- Frame_144 (Frame)
G.Frame_144 = Instance.new("Frame")
G.Frame_144.BackgroundTransparency = 1
G.Frame_144.BorderSizePixel = 0
G.Frame_144.LayoutOrder = 1
G.Frame_144.Size = UDim2.new(1, 0, 0, 2)
G.Frame_144.Parent = G.Visual

-- Frame_145 (Frame)
G.Frame_145 = Instance.new("Frame")
G.Frame_145.BackgroundColor3 = Color3.fromRGB(40, 92, 64)
G.Frame_145.BackgroundTransparency = 0.25
G.Frame_145.BorderSizePixel = 0
G.Frame_145.LayoutOrder = 2
G.Frame_145.Size = UDim2.new(1, -10, 0, 32)
G.Frame_145.Parent = G.Visual

-- UICorner_158 (UICorner)
G.UICorner_158 = Instance.new("UICorner")
G.UICorner_158.CornerRadius = UDim.new(0, 10)
G.UICorner_158.Parent = G.Frame_145

-- UIStroke_70 (UIStroke)
G.UIStroke_70 = Instance.new("UIStroke")
G.UIStroke_70.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
G.UIStroke_70.Color = Color3.fromRGB(24, 65, 38)
G.UIStroke_70.Transparency = 0.40000000596046448
G.UIStroke_70.Parent = G.Frame_145

-- Frame_146 (Frame)
G.Frame_146 = Instance.new("Frame")
G.Frame_146.BackgroundColor3 = Color3.fromRGB(42, 230, 123)
G.Frame_146.BorderSizePixel = 0
G.Frame_146.Position = UDim2.new(0, 10, 0, 9)
G.Frame_146.Size = UDim2.new(0, 4, 1, -18)
G.Frame_146.Parent = G.Frame_145

-- UICorner_159 (UICorner)
G.UICorner_159 = Instance.new("UICorner")
G.UICorner_159.CornerRadius = UDim.new(0, 2)
G.UICorner_159.Parent = G.Frame_146

-- TextLabel_55 (TextLabel)
G.TextLabel_55 = Instance.new("TextLabel")
G.TextLabel_55.BackgroundTransparency = 1
G.TextLabel_55.Position = UDim2.new(0, 22, 0, 0)
G.TextLabel_55.Size = UDim2.new(1, -30, 1, 0)
G.TextLabel_55.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal)
G.TextLabel_55.Text = "PERFORMANCE"
G.TextLabel_55.TextColor3 = Color3.fromRGB(218, 255, 233)
G.TextLabel_55.TextSize = 13
G.TextLabel_55.TextXAlignment = Enum.TextXAlignment.Left
G.TextLabel_55.Parent = G.Frame_145

-- Frame_147 (Frame)
G.Frame_147 = Instance.new("Frame")
G.Frame_147.BackgroundTransparency = 1
G.Frame_147.BorderSizePixel = 0
G.Frame_147.LayoutOrder = 3
G.Frame_147.Size = UDim2.new(1, 0, 0, 2)
G.Frame_147.Parent = G.Visual

-- Frame_148 (Frame)
G.Frame_148 = Instance.new("Frame")
G.Frame_148.BackgroundColor3 = Color3.fromRGB(19, 33, 26)
G.Frame_148.BackgroundTransparency = 0.11999999731779099
G.Frame_148.BorderSizePixel = 0
G.Frame_148.LayoutOrder = 4
G.Frame_148.Size = UDim2.new(1, -16, 0, 42)
G.Frame_148.Parent = G.Visual

-- UICorner_160 (UICorner)
G.UICorner_160 = Instance.new("UICorner")
G.UICorner_160.CornerRadius = UDim.new(0, 16)
G.UICorner_160.Parent = G.Frame_148

-- UIStroke_71 (UIStroke)
G.UIStroke_71 = Instance.new("UIStroke")
G.UIStroke_71.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
G.UIStroke_71.Color = Color3.fromRGB(31, 54, 40)
G.UIStroke_71.Transparency = 0.5
G.UIStroke_71.Parent = G.Frame_148

-- TextLabel_56 (TextLabel)
G.TextLabel_56 = Instance.new("TextLabel")
G.TextLabel_56.BackgroundTransparency = 1
G.TextLabel_56.Position = UDim2.new(0, 12, 0, 0)
G.TextLabel_56.Size = UDim2.new(1, -70, 1, 0)
G.TextLabel_56.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Medium, Enum.FontStyle.Normal)
G.TextLabel_56.Text = "Anti-Lag (recommended)"
G.TextLabel_56.TextColor3 = Color3.fromRGB(220, 239, 228)
G.TextLabel_56.TextSize = 13
G.TextLabel_56.TextXAlignment = Enum.TextXAlignment.Left
G.TextLabel_56.Parent = G.Frame_148

-- Frame_149 (Frame)
G.Frame_149 = Instance.new("Frame")
G.Frame_149.BackgroundColor3 = Color3.fromRGB(35, 48, 41)
G.Frame_149.BorderSizePixel = 0
G.Frame_149.Position = UDim2.new(1, -62, 0.5, -12)
G.Frame_149.Size = UDim2.new(0, 48, 0, 24)
G.Frame_149.ZIndex = 7
G.Frame_149.Parent = G.Frame_148

-- UICorner_161 (UICorner)
G.UICorner_161 = Instance.new("UICorner")
G.UICorner_161.CornerRadius = UDim.new(0, 11)
G.UICorner_161.Parent = G.Frame_149

-- Frame_150 (Frame)
G.Frame_150 = Instance.new("Frame")
G.Frame_150.BackgroundColor3 = Color3.fromRGB(119, 149, 130)
G.Frame_150.BorderSizePixel = 0
G.Frame_150.Position = UDim2.new(0, 4, 0.5, -7)
G.Frame_150.Size = UDim2.new(0, 14, 0, 14)
G.Frame_150.ZIndex = 8
G.Frame_150.Parent = G.Frame_149

-- UICorner_162 (UICorner)
G.UICorner_162 = Instance.new("UICorner")
G.UICorner_162.CornerRadius = UDim.new(0, 7)
G.UICorner_162.Parent = G.Frame_150

-- TextButton_55 (TextButton)
G.TextButton_55 = Instance.new("TextButton")
G.TextButton_55.BackgroundTransparency = 1
G.TextButton_55.BorderSizePixel = 0
G.TextButton_55.Size = UDim2.new(1, 0, 1, 0)
G.TextButton_55.ZIndex = 9
G.TextButton_55.Text = ""
G.TextButton_55.Parent = G.Frame_149

-- TextButton_56 (TextButton)
G.TextButton_56 = Instance.new("TextButton")
G.TextButton_56.BackgroundTransparency = 1
G.TextButton_56.BorderSizePixel = 0
G.TextButton_56.Size = UDim2.new(1, -56, 1, 0)
G.TextButton_56.ZIndex = 5
G.TextButton_56.Text = ""
G.TextButton_56.Parent = G.Frame_148

-- Frame_151 (Frame)
G.Frame_151 = Instance.new("Frame")
G.Frame_151.BackgroundColor3 = Color3.fromRGB(19, 33, 26)
G.Frame_151.BackgroundTransparency = 0.11999999731779099
G.Frame_151.BorderSizePixel = 0
G.Frame_151.LayoutOrder = 5
G.Frame_151.Size = UDim2.new(1, -16, 0, 42)
G.Frame_151.Parent = G.Visual

-- UICorner_163 (UICorner)
G.UICorner_163 = Instance.new("UICorner")
G.UICorner_163.CornerRadius = UDim.new(0, 16)
G.UICorner_163.Parent = G.Frame_151

-- UIStroke_72 (UIStroke)
G.UIStroke_72 = Instance.new("UIStroke")
G.UIStroke_72.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
G.UIStroke_72.Color = Color3.fromRGB(31, 54, 40)
G.UIStroke_72.Transparency = 0.5
G.UIStroke_72.Parent = G.Frame_151

-- TextLabel_57 (TextLabel)
G.TextLabel_57 = Instance.new("TextLabel")
G.TextLabel_57.BackgroundTransparency = 1
G.TextLabel_57.Position = UDim2.new(0, 12, 0, 0)
G.TextLabel_57.Size = UDim2.new(1, -70, 1, 0)
G.TextLabel_57.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Medium, Enum.FontStyle.Normal)
G.TextLabel_57.Text = "Low Graphics"
G.TextLabel_57.TextColor3 = Color3.fromRGB(220, 239, 228)
G.TextLabel_57.TextSize = 13
G.TextLabel_57.TextXAlignment = Enum.TextXAlignment.Left
G.TextLabel_57.Parent = G.Frame_151

-- Frame_152 (Frame)
G.Frame_152 = Instance.new("Frame")
G.Frame_152.BackgroundColor3 = Color3.fromRGB(35, 48, 41)
G.Frame_152.BorderSizePixel = 0
G.Frame_152.Position = UDim2.new(1, -62, 0.5, -12)
G.Frame_152.Size = UDim2.new(0, 48, 0, 24)
G.Frame_152.ZIndex = 7
G.Frame_152.Parent = G.Frame_151

-- UICorner_164 (UICorner)
G.UICorner_164 = Instance.new("UICorner")
G.UICorner_164.CornerRadius = UDim.new(0, 11)
G.UICorner_164.Parent = G.Frame_152

-- Frame_153 (Frame)
G.Frame_153 = Instance.new("Frame")
G.Frame_153.BackgroundColor3 = Color3.fromRGB(119, 149, 130)
G.Frame_153.BorderSizePixel = 0
G.Frame_153.Position = UDim2.new(0, 4, 0.5, -7)
G.Frame_153.Size = UDim2.new(0, 14, 0, 14)
G.Frame_153.ZIndex = 8
G.Frame_153.Parent = G.Frame_152

-- UICorner_165 (UICorner)
G.UICorner_165 = Instance.new("UICorner")
G.UICorner_165.CornerRadius = UDim.new(0, 7)
G.UICorner_165.Parent = G.Frame_153

-- TextButton_57 (TextButton)
G.TextButton_57 = Instance.new("TextButton")
G.TextButton_57.BackgroundTransparency = 1
G.TextButton_57.BorderSizePixel = 0
G.TextButton_57.Size = UDim2.new(1, 0, 1, 0)
G.TextButton_57.ZIndex = 9
G.TextButton_57.Text = ""
G.TextButton_57.Parent = G.Frame_152

-- TextButton_58 (TextButton)
G.TextButton_58 = Instance.new("TextButton")
G.TextButton_58.BackgroundTransparency = 1
G.TextButton_58.BorderSizePixel = 0
G.TextButton_58.Size = UDim2.new(1, -56, 1, 0)
G.TextButton_58.ZIndex = 5
G.TextButton_58.Text = ""
G.TextButton_58.Parent = G.Frame_151

-- Frame_154 (Frame)
G.Frame_154 = Instance.new("Frame")
G.Frame_154.BackgroundColor3 = Color3.fromRGB(19, 33, 26)
G.Frame_154.BackgroundTransparency = 0.11999999731779099
G.Frame_154.BorderSizePixel = 0
G.Frame_154.LayoutOrder = 6
G.Frame_154.Size = UDim2.new(1, -16, 0, 42)
G.Frame_154.Parent = G.Visual

-- UICorner_166 (UICorner)
G.UICorner_166 = Instance.new("UICorner")
G.UICorner_166.CornerRadius = UDim.new(0, 16)
G.UICorner_166.Parent = G.Frame_154

-- UIStroke_73 (UIStroke)
G.UIStroke_73 = Instance.new("UIStroke")
G.UIStroke_73.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
G.UIStroke_73.Color = Color3.fromRGB(31, 54, 40)
G.UIStroke_73.Transparency = 0.5
G.UIStroke_73.Parent = G.Frame_154

-- TextLabel_58 (TextLabel)
G.TextLabel_58 = Instance.new("TextLabel")
G.TextLabel_58.BackgroundTransparency = 1
G.TextLabel_58.Position = UDim2.new(0, 12, 0, 0)
G.TextLabel_58.Size = UDim2.new(1, -70, 1, 0)
G.TextLabel_58.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Medium, Enum.FontStyle.Normal)
G.TextLabel_58.Text = "Stretch Rez"
G.TextLabel_58.TextColor3 = Color3.fromRGB(220, 239, 228)
G.TextLabel_58.TextSize = 13
G.TextLabel_58.TextXAlignment = Enum.TextXAlignment.Left
G.TextLabel_58.Parent = G.Frame_154

-- Frame_155 (Frame)
G.Frame_155 = Instance.new("Frame")
G.Frame_155.BackgroundColor3 = Color3.fromRGB(35, 48, 41)
G.Frame_155.BorderSizePixel = 0
G.Frame_155.Position = UDim2.new(1, -62, 0.5, -12)
G.Frame_155.Size = UDim2.new(0, 48, 0, 24)
G.Frame_155.ZIndex = 7
G.Frame_155.Parent = G.Frame_154

-- UICorner_167 (UICorner)
G.UICorner_167 = Instance.new("UICorner")
G.UICorner_167.CornerRadius = UDim.new(0, 11)
G.UICorner_167.Parent = G.Frame_155

-- Frame_156 (Frame)
G.Frame_156 = Instance.new("Frame")
G.Frame_156.BackgroundColor3 = Color3.fromRGB(119, 149, 130)
G.Frame_156.BorderSizePixel = 0
G.Frame_156.Position = UDim2.new(0, 4, 0.5, -7)
G.Frame_156.Size = UDim2.new(0, 14, 0, 14)
G.Frame_156.ZIndex = 8
G.Frame_156.Parent = G.Frame_155

-- UICorner_168 (UICorner)
G.UICorner_168 = Instance.new("UICorner")
G.UICorner_168.CornerRadius = UDim.new(0, 7)
G.UICorner_168.Parent = G.Frame_156

-- TextButton_59 (TextButton)
G.TextButton_59 = Instance.new("TextButton")
G.TextButton_59.BackgroundTransparency = 1
G.TextButton_59.BorderSizePixel = 0
G.TextButton_59.Size = UDim2.new(1, 0, 1, 0)
G.TextButton_59.ZIndex = 9
G.TextButton_59.Text = ""
G.TextButton_59.Parent = G.Frame_155

-- TextButton_60 (TextButton)
G.TextButton_60 = Instance.new("TextButton")
G.TextButton_60.BackgroundTransparency = 1
G.TextButton_60.BorderSizePixel = 0
G.TextButton_60.Size = UDim2.new(1, -56, 1, 0)
G.TextButton_60.ZIndex = 5
G.TextButton_60.Text = ""
G.TextButton_60.Parent = G.Frame_154

-- Frame_157 (Frame)
G.Frame_157 = Instance.new("Frame")
G.Frame_157.BackgroundTransparency = 1
G.Frame_157.BorderSizePixel = 0
G.Frame_157.LayoutOrder = 7
G.Frame_157.Size = UDim2.new(1, 0, 0, 4)
G.Frame_157.Parent = G.Visual

-- Frame_158 (Frame)
G.Frame_158 = Instance.new("Frame")
G.Frame_158.BackgroundColor3 = Color3.fromRGB(19, 33, 26)
G.Frame_158.BackgroundTransparency = 0.11999999731779099
G.Frame_158.BorderSizePixel = 0
G.Frame_158.LayoutOrder = 8
G.Frame_158.Size = UDim2.new(1, -16, 0, 42)
G.Frame_158.Parent = G.Visual

-- UICorner_169 (UICorner)
G.UICorner_169 = Instance.new("UICorner")
G.UICorner_169.CornerRadius = UDim.new(0, 16)
G.UICorner_169.Parent = G.Frame_158

-- UIStroke_74 (UIStroke)
G.UIStroke_74 = Instance.new("UIStroke")
G.UIStroke_74.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
G.UIStroke_74.Color = Color3.fromRGB(31, 54, 40)
G.UIStroke_74.Transparency = 0.5
G.UIStroke_74.Parent = G.Frame_158

-- TextLabel_59 (TextLabel)
G.TextLabel_59 = Instance.new("TextLabel")
G.TextLabel_59.BackgroundTransparency = 1
G.TextLabel_59.Position = UDim2.new(0, 12, 0, 0)
G.TextLabel_59.Size = UDim2.new(1, -70, 1, 0)
G.TextLabel_59.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Medium, Enum.FontStyle.Normal)
G.TextLabel_59.Text = "FOV"
G.TextLabel_59.TextColor3 = Color3.fromRGB(220, 239, 228)
G.TextLabel_59.TextSize = 13
G.TextLabel_59.TextXAlignment = Enum.TextXAlignment.Left
G.TextLabel_59.Parent = G.Frame_158

-- Frame_159 (Frame)
G.Frame_159 = Instance.new("Frame")
G.Frame_159.BackgroundColor3 = Color3.fromRGB(35, 48, 41)
G.Frame_159.BorderSizePixel = 0
G.Frame_159.Position = UDim2.new(1, -62, 0.5, -12)
G.Frame_159.Size = UDim2.new(0, 48, 0, 24)
G.Frame_159.ZIndex = 7
G.Frame_159.Parent = G.Frame_158

-- UICorner_170 (UICorner)
G.UICorner_170 = Instance.new("UICorner")
G.UICorner_170.CornerRadius = UDim.new(0, 11)
G.UICorner_170.Parent = G.Frame_159

-- Frame_160 (Frame)
G.Frame_160 = Instance.new("Frame")
G.Frame_160.BackgroundColor3 = Color3.fromRGB(119, 149, 130)
G.Frame_160.BorderSizePixel = 0
G.Frame_160.Position = UDim2.new(0, 4, 0.5, -7)
G.Frame_160.Size = UDim2.new(0, 14, 0, 14)
G.Frame_160.ZIndex = 8
G.Frame_160.Parent = G.Frame_159

-- UICorner_171 (UICorner)
G.UICorner_171 = Instance.new("UICorner")
G.UICorner_171.CornerRadius = UDim.new(0, 7)
G.UICorner_171.Parent = G.Frame_160

-- TextButton_61 (TextButton)
G.TextButton_61 = Instance.new("TextButton")
G.TextButton_61.BackgroundTransparency = 1
G.TextButton_61.BorderSizePixel = 0
G.TextButton_61.Size = UDim2.new(1, 0, 1, 0)
G.TextButton_61.ZIndex = 9
G.TextButton_61.Text = ""
G.TextButton_61.Parent = G.Frame_159

-- TextButton_62 (TextButton)
G.TextButton_62 = Instance.new("TextButton")
G.TextButton_62.BackgroundTransparency = 1
G.TextButton_62.BorderSizePixel = 0
G.TextButton_62.Size = UDim2.new(1, -56, 1, 0)
G.TextButton_62.ZIndex = 5
G.TextButton_62.Text = ""
G.TextButton_62.Parent = G.Frame_158

-- Frame_161 (Frame)
G.Frame_161 = Instance.new("Frame")
G.Frame_161.BackgroundColor3 = Color3.fromRGB(19, 33, 26)
G.Frame_161.BackgroundTransparency = 0.11999999731779099
G.Frame_161.BorderSizePixel = 0
G.Frame_161.LayoutOrder = 9
G.Frame_161.Size = UDim2.new(1, -16, 0, 42)
G.Frame_161.Parent = G.Visual

-- UICorner_172 (UICorner)
G.UICorner_172 = Instance.new("UICorner")
G.UICorner_172.CornerRadius = UDim.new(0, 16)
G.UICorner_172.Parent = G.Frame_161

-- UIStroke_75 (UIStroke)
G.UIStroke_75 = Instance.new("UIStroke")
G.UIStroke_75.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
G.UIStroke_75.Color = Color3.fromRGB(31, 54, 40)
G.UIStroke_75.Transparency = 0.5
G.UIStroke_75.Parent = G.Frame_161

-- TextLabel_60 (TextLabel)
G.TextLabel_60 = Instance.new("TextLabel")
G.TextLabel_60.BackgroundTransparency = 1
G.TextLabel_60.Position = UDim2.new(0, 16, 0.5, -7)
G.TextLabel_60.Size = UDim2.new(0, 60, 0, 14)
G.TextLabel_60.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Heavy, Enum.FontStyle.Normal)
G.TextLabel_60.Text = "FOV:"
G.TextLabel_60.TextColor3 = Color3.fromRGB(125, 164, 142)
G.TextLabel_60.TextSize = 11
G.TextLabel_60.TextXAlignment = Enum.TextXAlignment.Left
G.TextLabel_60.Parent = G.Frame_161

-- TextLabel_61 (TextLabel)
G.TextLabel_61 = Instance.new("TextLabel")
G.TextLabel_61.BackgroundTransparency = 1
G.TextLabel_61.Position = UDim2.new(1, -50, 0.5, -7)
G.TextLabel_61.Size = UDim2.new(0, 30, 0, 14)
G.TextLabel_61.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Heavy, Enum.FontStyle.Normal)
G.TextLabel_61.Text = "70"
G.TextLabel_61.TextColor3 = Color3.fromRGB(93, 207, 141)
G.TextLabel_61.TextSize = 10
G.TextLabel_61.TextXAlignment = Enum.TextXAlignment.Right
G.TextLabel_61.Parent = G.Frame_161

-- Frame_162 (Frame)
G.Frame_162 = Instance.new("Frame")
G.Frame_162.BackgroundColor3 = Color3.fromRGB(14, 30, 65)
G.Frame_162.BorderSizePixel = 0
G.Frame_162.Position = UDim2.new(0, 66, 0.5, -3)
G.Frame_162.Size = UDim2.new(1, -132, 0, 6)
G.Frame_162.Parent = G.Frame_161

-- UICorner_173 (UICorner)
G.UICorner_173 = Instance.new("UICorner")
G.UICorner_173.CornerRadius = UDim.new(0, 3)
G.UICorner_173.Parent = G.Frame_162

-- Frame_163 (Frame)
G.Frame_163 = Instance.new("Frame")
G.Frame_163.BackgroundColor3 = Color3.fromRGB(93, 207, 141)
G.Frame_163.BorderSizePixel = 0
G.Frame_163.Size = UDim2.new(0, 0, 1, 0)
G.Frame_163.Parent = G.Frame_162

-- UICorner_174 (UICorner)
G.UICorner_174 = Instance.new("UICorner")
G.UICorner_174.CornerRadius = UDim.new(0, 3)
G.UICorner_174.Parent = G.Frame_163

-- Frame_164 (Frame)
G.Frame_164 = Instance.new("Frame")
G.Frame_164.BackgroundColor3 = Color3.fromRGB(42, 230, 123)
G.Frame_164.BorderSizePixel = 0
G.Frame_164.Position = UDim2.new(0, -6, 0.5, -6)
G.Frame_164.Size = UDim2.new(0, 12, 0, 12)
G.Frame_164.ZIndex = 3
G.Frame_164.Parent = G.Frame_162

-- UICorner_175 (UICorner)
G.UICorner_175 = Instance.new("UICorner")
G.UICorner_175.CornerRadius = UDim.new(0, 6)
G.UICorner_175.Parent = G.Frame_164

-- TextButton_63 (TextButton)
G.TextButton_63 = Instance.new("TextButton")
G.TextButton_63.BackgroundTransparency = 1
G.TextButton_63.Position = UDim2.new(0, 0, 0, -12)
G.TextButton_63.Size = UDim2.new(1, 0, 1, 24)
G.TextButton_63.ZIndex = 4
G.TextButton_63.Text = ""
G.TextButton_63.Parent = G.Frame_162

-- Frame_165 (Frame)
G.Frame_165 = Instance.new("Frame")
G.Frame_165.BackgroundTransparency = 1
G.Frame_165.BorderSizePixel = 0
G.Frame_165.LayoutOrder = 10
G.Frame_165.Size = UDim2.new(1, 0, 0, 8)
G.Frame_165.Parent = G.Visual

-- Frame_166 (Frame)
G.Frame_166 = Instance.new("Frame")
G.Frame_166.BackgroundColor3 = Color3.fromRGB(40, 92, 64)
G.Frame_166.BackgroundTransparency = 0.25
G.Frame_166.BorderSizePixel = 0
G.Frame_166.LayoutOrder = 11
G.Frame_166.Size = UDim2.new(1, -10, 0, 32)
G.Frame_166.Parent = G.Visual

-- UICorner_176 (UICorner)
G.UICorner_176 = Instance.new("UICorner")
G.UICorner_176.CornerRadius = UDim.new(0, 10)
G.UICorner_176.Parent = G.Frame_166

-- UIStroke_76 (UIStroke)
G.UIStroke_76 = Instance.new("UIStroke")
G.UIStroke_76.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
G.UIStroke_76.Color = Color3.fromRGB(24, 65, 38)
G.UIStroke_76.Transparency = 0.40000000596046448
G.UIStroke_76.Parent = G.Frame_166

-- Frame_167 (Frame)
G.Frame_167 = Instance.new("Frame")
G.Frame_167.BackgroundColor3 = Color3.fromRGB(42, 230, 123)
G.Frame_167.BorderSizePixel = 0
G.Frame_167.Position = UDim2.new(0, 10, 0, 9)
G.Frame_167.Size = UDim2.new(0, 4, 1, -18)
G.Frame_167.Parent = G.Frame_166

-- UICorner_177 (UICorner)
G.UICorner_177 = Instance.new("UICorner")
G.UICorner_177.CornerRadius = UDim.new(0, 2)
G.UICorner_177.Parent = G.Frame_167

-- TextLabel_62 (TextLabel)
G.TextLabel_62 = Instance.new("TextLabel")
G.TextLabel_62.BackgroundTransparency = 1
G.TextLabel_62.Position = UDim2.new(0, 22, 0, 0)
G.TextLabel_62.Size = UDim2.new(1, -30, 1, 0)
G.TextLabel_62.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal)
G.TextLabel_62.Text = "OTHER VISUALS"
G.TextLabel_62.TextColor3 = Color3.fromRGB(218, 255, 233)
G.TextLabel_62.TextSize = 13
G.TextLabel_62.TextXAlignment = Enum.TextXAlignment.Left
G.TextLabel_62.Parent = G.Frame_166

-- Frame_168 (Frame)
G.Frame_168 = Instance.new("Frame")
G.Frame_168.BackgroundTransparency = 1
G.Frame_168.BorderSizePixel = 0
G.Frame_168.LayoutOrder = 12
G.Frame_168.Size = UDim2.new(1, 0, 0, 2)
G.Frame_168.Parent = G.Visual

-- Frame_169 (Frame)
G.Frame_169 = Instance.new("Frame")
G.Frame_169.BackgroundColor3 = Color3.fromRGB(19, 33, 26)
G.Frame_169.BackgroundTransparency = 0.11999999731779099
G.Frame_169.BorderSizePixel = 0
G.Frame_169.LayoutOrder = 13
G.Frame_169.Size = UDim2.new(1, -16, 0, 42)
G.Frame_169.Parent = G.Visual

-- UICorner_178 (UICorner)
G.UICorner_178 = Instance.new("UICorner")
G.UICorner_178.CornerRadius = UDim.new(0, 16)
G.UICorner_178.Parent = G.Frame_169

-- UIStroke_77 (UIStroke)
G.UIStroke_77 = Instance.new("UIStroke")
G.UIStroke_77.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
G.UIStroke_77.Color = Color3.fromRGB(31, 54, 40)
G.UIStroke_77.Transparency = 0.5
G.UIStroke_77.Parent = G.Frame_169

-- TextLabel_63 (TextLabel)
G.TextLabel_63 = Instance.new("TextLabel")
G.TextLabel_63.BackgroundTransparency = 1
G.TextLabel_63.Position = UDim2.new(0, 12, 0, 0)
G.TextLabel_63.Size = UDim2.new(1, -70, 1, 0)
G.TextLabel_63.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Medium, Enum.FontStyle.Normal)
G.TextLabel_63.Text = "Remove Accessories"
G.TextLabel_63.TextColor3 = Color3.fromRGB(220, 239, 228)
G.TextLabel_63.TextSize = 13
G.TextLabel_63.TextXAlignment = Enum.TextXAlignment.Left
G.TextLabel_63.Parent = G.Frame_169

-- Frame_170 (Frame)
G.Frame_170 = Instance.new("Frame")
G.Frame_170.BackgroundColor3 = Color3.fromRGB(35, 48, 41)
G.Frame_170.BorderSizePixel = 0
G.Frame_170.Position = UDim2.new(1, -62, 0.5, -12)
G.Frame_170.Size = UDim2.new(0, 48, 0, 24)
G.Frame_170.ZIndex = 7
G.Frame_170.Parent = G.Frame_169

-- UICorner_179 (UICorner)
G.UICorner_179 = Instance.new("UICorner")
G.UICorner_179.CornerRadius = UDim.new(0, 11)
G.UICorner_179.Parent = G.Frame_170

-- Frame_171 (Frame)
G.Frame_171 = Instance.new("Frame")
G.Frame_171.BackgroundColor3 = Color3.fromRGB(119, 149, 130)
G.Frame_171.BorderSizePixel = 0
G.Frame_171.Position = UDim2.new(0, 4, 0.5, -7)
G.Frame_171.Size = UDim2.new(0, 14, 0, 14)
G.Frame_171.ZIndex = 8
G.Frame_171.Parent = G.Frame_170

-- UICorner_180 (UICorner)
G.UICorner_180 = Instance.new("UICorner")
G.UICorner_180.CornerRadius = UDim.new(0, 7)
G.UICorner_180.Parent = G.Frame_171

-- TextButton_64 (TextButton)
G.TextButton_64 = Instance.new("TextButton")
G.TextButton_64.BackgroundTransparency = 1
G.TextButton_64.BorderSizePixel = 0
G.TextButton_64.Size = UDim2.new(1, 0, 1, 0)
G.TextButton_64.ZIndex = 9
G.TextButton_64.Text = ""
G.TextButton_64.Parent = G.Frame_170

-- TextButton_65 (TextButton)
G.TextButton_65 = Instance.new("TextButton")
G.TextButton_65.BackgroundTransparency = 1
G.TextButton_65.BorderSizePixel = 0
G.TextButton_65.Size = UDim2.new(1, -56, 1, 0)
G.TextButton_65.ZIndex = 5
G.TextButton_65.Text = ""
G.TextButton_65.Parent = G.Frame_169

-- Frame_172 (Frame)
G.Frame_172 = Instance.new("Frame")
G.Frame_172.BackgroundColor3 = Color3.fromRGB(19, 33, 26)
G.Frame_172.BackgroundTransparency = 0.11999999731779099
G.Frame_172.BorderSizePixel = 0
G.Frame_172.LayoutOrder = 14
G.Frame_172.Size = UDim2.new(1, -16, 0, 42)
G.Frame_172.Parent = G.Visual

-- UICorner_181 (UICorner)
G.UICorner_181 = Instance.new("UICorner")
G.UICorner_181.CornerRadius = UDim.new(0, 16)
G.UICorner_181.Parent = G.Frame_172

-- UIStroke_78 (UIStroke)
G.UIStroke_78 = Instance.new("UIStroke")
G.UIStroke_78.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
G.UIStroke_78.Color = Color3.fromRGB(31, 54, 40)
G.UIStroke_78.Transparency = 0.5
G.UIStroke_78.Parent = G.Frame_172

-- TextLabel_64 (TextLabel)
G.TextLabel_64 = Instance.new("TextLabel")
G.TextLabel_64.BackgroundTransparency = 1
G.TextLabel_64.Position = UDim2.new(0, 12, 0, 0)
G.TextLabel_64.Size = UDim2.new(1, -70, 1, 0)
G.TextLabel_64.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Medium, Enum.FontStyle.Normal)
G.TextLabel_64.Text = "Amazon Unboxed Animation"
G.TextLabel_64.TextColor3 = Color3.fromRGB(220, 239, 228)
G.TextLabel_64.TextSize = 13
G.TextLabel_64.TextXAlignment = Enum.TextXAlignment.Left
G.TextLabel_64.Parent = G.Frame_172

-- Frame_173 (Frame)
G.Frame_173 = Instance.new("Frame")
G.Frame_173.BackgroundColor3 = Color3.fromRGB(35, 48, 41)
G.Frame_173.BorderSizePixel = 0
G.Frame_173.Position = UDim2.new(1, -62, 0.5, -12)
G.Frame_173.Size = UDim2.new(0, 48, 0, 24)
G.Frame_173.ZIndex = 7
G.Frame_173.Parent = G.Frame_172

-- UICorner_182 (UICorner)
G.UICorner_182 = Instance.new("UICorner")
G.UICorner_182.CornerRadius = UDim.new(0, 11)
G.UICorner_182.Parent = G.Frame_173

-- Frame_174 (Frame)
G.Frame_174 = Instance.new("Frame")
G.Frame_174.BackgroundColor3 = Color3.fromRGB(119, 149, 130)
G.Frame_174.BorderSizePixel = 0
G.Frame_174.Position = UDim2.new(0, 4, 0.5, -7)
G.Frame_174.Size = UDim2.new(0, 14, 0, 14)
G.Frame_174.ZIndex = 8
G.Frame_174.Parent = G.Frame_173

-- UICorner_183 (UICorner)
G.UICorner_183 = Instance.new("UICorner")
G.UICorner_183.CornerRadius = UDim.new(0, 7)
G.UICorner_183.Parent = G.Frame_174

-- TextButton_66 (TextButton)
G.TextButton_66 = Instance.new("TextButton")
G.TextButton_66.BackgroundTransparency = 1
G.TextButton_66.BorderSizePixel = 0
G.TextButton_66.Size = UDim2.new(1, 0, 1, 0)
G.TextButton_66.ZIndex = 9
G.TextButton_66.Text = ""
G.TextButton_66.Parent = G.Frame_173

-- TextButton_67 (TextButton)
G.TextButton_67 = Instance.new("TextButton")
G.TextButton_67.BackgroundTransparency = 1
G.TextButton_67.BorderSizePixel = 0
G.TextButton_67.Size = UDim2.new(1, -56, 1, 0)
G.TextButton_67.ZIndex = 5
G.TextButton_67.Text = ""
G.TextButton_67.Parent = G.Frame_172

-- Frame_175 (Frame)
G.Frame_175 = Instance.new("Frame")
G.Frame_175.BackgroundColor3 = Color3.fromRGB(19, 33, 26)
G.Frame_175.BackgroundTransparency = 0.11999999731779099
G.Frame_175.BorderSizePixel = 0
G.Frame_175.LayoutOrder = 15
G.Frame_175.Size = UDim2.new(1, -16, 0, 42)
G.Frame_175.Parent = G.Visual

-- UICorner_184 (UICorner)
G.UICorner_184 = Instance.new("UICorner")
G.UICorner_184.CornerRadius = UDim.new(0, 16)
G.UICorner_184.Parent = G.Frame_175

-- UIStroke_79 (UIStroke)
G.UIStroke_79 = Instance.new("UIStroke")
G.UIStroke_79.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
G.UIStroke_79.Color = Color3.fromRGB(31, 54, 40)
G.UIStroke_79.Transparency = 0.5
G.UIStroke_79.Parent = G.Frame_175

-- TextLabel_65 (TextLabel)
G.TextLabel_65 = Instance.new("TextLabel")
G.TextLabel_65.BackgroundTransparency = 1
G.TextLabel_65.Position = UDim2.new(0, 12, 0, 0)
G.TextLabel_65.Size = UDim2.new(1, -70, 1, 0)
G.TextLabel_65.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Medium, Enum.FontStyle.Normal)
G.TextLabel_65.Text = "Kick Warning"
G.TextLabel_65.TextColor3 = Color3.fromRGB(220, 239, 228)
G.TextLabel_65.TextSize = 13
G.TextLabel_65.TextXAlignment = Enum.TextXAlignment.Left
G.TextLabel_65.Parent = G.Frame_175

-- Frame_176 (Frame)
G.Frame_176 = Instance.new("Frame")
G.Frame_176.BackgroundColor3 = Color3.fromRGB(35, 48, 41)
G.Frame_176.BorderSizePixel = 0
G.Frame_176.Position = UDim2.new(1, -62, 0.5, -12)
G.Frame_176.Size = UDim2.new(0, 48, 0, 24)
G.Frame_176.ZIndex = 7
G.Frame_176.Parent = G.Frame_175

-- UICorner_185 (UICorner)
G.UICorner_185 = Instance.new("UICorner")
G.UICorner_185.CornerRadius = UDim.new(0, 11)
G.UICorner_185.Parent = G.Frame_176

-- Frame_177 (Frame)
G.Frame_177 = Instance.new("Frame")
G.Frame_177.BackgroundColor3 = Color3.fromRGB(119, 149, 130)
G.Frame_177.BorderSizePixel = 0
G.Frame_177.Position = UDim2.new(0, 4, 0.5, -7)
G.Frame_177.Size = UDim2.new(0, 14, 0, 14)
G.Frame_177.ZIndex = 8
G.Frame_177.Parent = G.Frame_176

-- UICorner_186 (UICorner)
G.UICorner_186 = Instance.new("UICorner")
G.UICorner_186.CornerRadius = UDim.new(0, 7)
G.UICorner_186.Parent = G.Frame_177

-- TextButton_68 (TextButton)
G.TextButton_68 = Instance.new("TextButton")
G.TextButton_68.BackgroundTransparency = 1
G.TextButton_68.BorderSizePixel = 0
G.TextButton_68.Size = UDim2.new(1, 0, 1, 0)
G.TextButton_68.ZIndex = 9
G.TextButton_68.Text = ""
G.TextButton_68.Parent = G.Frame_176

-- TextButton_69 (TextButton)
G.TextButton_69 = Instance.new("TextButton")
G.TextButton_69.BackgroundTransparency = 1
G.TextButton_69.BorderSizePixel = 0
G.TextButton_69.Size = UDim2.new(1, -56, 1, 0)
G.TextButton_69.ZIndex = 5
G.TextButton_69.Text = ""
G.TextButton_69.Parent = G.Frame_175

-- Frame_178 (Frame)
G.Frame_178 = Instance.new("Frame")
G.Frame_178.BackgroundTransparency = 1
G.Frame_178.BorderSizePixel = 0
G.Frame_178.LayoutOrder = 16
G.Frame_178.Size = UDim2.new(1, 0, 0, 6)
G.Frame_178.Parent = G.Visual

-- Frame_179 (Frame)
G.Frame_179 = Instance.new("Frame")
G.Frame_179.BackgroundColor3 = Color3.fromRGB(40, 92, 64)
G.Frame_179.BackgroundTransparency = 0.25
G.Frame_179.BorderSizePixel = 0
G.Frame_179.LayoutOrder = 17
G.Frame_179.Size = UDim2.new(1, -10, 0, 32)
G.Frame_179.Parent = G.Visual

-- UICorner_187 (UICorner)
G.UICorner_187 = Instance.new("UICorner")
G.UICorner_187.CornerRadius = UDim.new(0, 10)
G.UICorner_187.Parent = G.Frame_179

-- UIStroke_80 (UIStroke)
G.UIStroke_80 = Instance.new("UIStroke")
G.UIStroke_80.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
G.UIStroke_80.Color = Color3.fromRGB(24, 65, 38)
G.UIStroke_80.Transparency = 0.40000000596046448
G.UIStroke_80.Parent = G.Frame_179

-- Frame_180 (Frame)
G.Frame_180 = Instance.new("Frame")
G.Frame_180.BackgroundColor3 = Color3.fromRGB(42, 230, 123)
G.Frame_180.BorderSizePixel = 0
G.Frame_180.Position = UDim2.new(0, 10, 0, 9)
G.Frame_180.Size = UDim2.new(0, 4, 1, -18)
G.Frame_180.Parent = G.Frame_179

-- UICorner_188 (UICorner)
G.UICorner_188 = Instance.new("UICorner")
G.UICorner_188.CornerRadius = UDim.new(0, 2)
G.UICorner_188.Parent = G.Frame_180

-- TextLabel_66 (TextLabel)
G.TextLabel_66 = Instance.new("TextLabel")
G.TextLabel_66.BackgroundTransparency = 1
G.TextLabel_66.Position = UDim2.new(0, 22, 0, 0)
G.TextLabel_66.Size = UDim2.new(1, -30, 1, 0)
G.TextLabel_66.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal)
G.TextLabel_66.Text = "AVATAR COSMETICS"
G.TextLabel_66.TextColor3 = Color3.fromRGB(218, 255, 233)
G.TextLabel_66.TextSize = 13
G.TextLabel_66.TextXAlignment = Enum.TextXAlignment.Left
G.TextLabel_66.Parent = G.Frame_179

-- Frame_181 (Frame)
G.Frame_181 = Instance.new("Frame")
G.Frame_181.BackgroundTransparency = 1
G.Frame_181.BorderSizePixel = 0
G.Frame_181.LayoutOrder = 18
G.Frame_181.Size = UDim2.new(1, 0, 0, 2)
G.Frame_181.Parent = G.Visual

-- Frame_182 (Frame)
G.Frame_182 = Instance.new("Frame")
G.Frame_182.BackgroundColor3 = Color3.fromRGB(19, 33, 26)
G.Frame_182.BackgroundTransparency = 0.11999999731779099
G.Frame_182.BorderSizePixel = 0
G.Frame_182.LayoutOrder = 19
G.Frame_182.Size = UDim2.new(1, -16, 0, 42)
G.Frame_182.Parent = G.Visual

-- UICorner_189 (UICorner)
G.UICorner_189 = Instance.new("UICorner")
G.UICorner_189.CornerRadius = UDim.new(0, 16)
G.UICorner_189.Parent = G.Frame_182

-- UIStroke_81 (UIStroke)
G.UIStroke_81 = Instance.new("UIStroke")
G.UIStroke_81.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
G.UIStroke_81.Color = Color3.fromRGB(31, 54, 40)
G.UIStroke_81.Transparency = 0.5
G.UIStroke_81.Parent = G.Frame_182

-- TextLabel_67 (TextLabel)
G.TextLabel_67 = Instance.new("TextLabel")
G.TextLabel_67.BackgroundTransparency = 1
G.TextLabel_67.Position = UDim2.new(0, 12, 0, 0)
G.TextLabel_67.Size = UDim2.new(1, -70, 1, 0)
G.TextLabel_67.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Medium, Enum.FontStyle.Normal)
G.TextLabel_67.Text = "Headless"
G.TextLabel_67.TextColor3 = Color3.fromRGB(220, 239, 228)
G.TextLabel_67.TextSize = 13
G.TextLabel_67.TextXAlignment = Enum.TextXAlignment.Left
G.TextLabel_67.Parent = G.Frame_182

-- Frame_183 (Frame)
G.Frame_183 = Instance.new("Frame")
G.Frame_183.BackgroundColor3 = Color3.fromRGB(35, 48, 41)
G.Frame_183.BorderSizePixel = 0
G.Frame_183.Position = UDim2.new(1, -62, 0.5, -12)
G.Frame_183.Size = UDim2.new(0, 48, 0, 24)
G.Frame_183.ZIndex = 7
G.Frame_183.Parent = G.Frame_182

-- UICorner_190 (UICorner)
G.UICorner_190 = Instance.new("UICorner")
G.UICorner_190.CornerRadius = UDim.new(0, 11)
G.UICorner_190.Parent = G.Frame_183

-- Frame_184 (Frame)
G.Frame_184 = Instance.new("Frame")
G.Frame_184.BackgroundColor3 = Color3.fromRGB(119, 149, 130)
G.Frame_184.BorderSizePixel = 0
G.Frame_184.Position = UDim2.new(0, 4, 0.5, -7)
G.Frame_184.Size = UDim2.new(0, 14, 0, 14)
G.Frame_184.ZIndex = 8
G.Frame_184.Parent = G.Frame_183

-- UICorner_191 (UICorner)
G.UICorner_191 = Instance.new("UICorner")
G.UICorner_191.CornerRadius = UDim.new(0, 7)
G.UICorner_191.Parent = G.Frame_184

-- TextButton_70 (TextButton)
G.TextButton_70 = Instance.new("TextButton")
G.TextButton_70.BackgroundTransparency = 1
G.TextButton_70.BorderSizePixel = 0
G.TextButton_70.Size = UDim2.new(1, 0, 1, 0)
G.TextButton_70.ZIndex = 9
G.TextButton_70.Text = ""
G.TextButton_70.Parent = G.Frame_183

-- TextButton_71 (TextButton)
G.TextButton_71 = Instance.new("TextButton")
G.TextButton_71.BackgroundTransparency = 1
G.TextButton_71.BorderSizePixel = 0
G.TextButton_71.Size = UDim2.new(1, -56, 1, 0)
G.TextButton_71.ZIndex = 5
G.TextButton_71.Text = ""
G.TextButton_71.Parent = G.Frame_182

-- Frame_185 (Frame)
G.Frame_185 = Instance.new("Frame")
G.Frame_185.BackgroundColor3 = Color3.fromRGB(19, 33, 26)
G.Frame_185.BackgroundTransparency = 0.11999999731779099
G.Frame_185.BorderSizePixel = 0
G.Frame_185.LayoutOrder = 20
G.Frame_185.Size = UDim2.new(1, -16, 0, 42)
G.Frame_185.Parent = G.Visual

-- UICorner_192 (UICorner)
G.UICorner_192 = Instance.new("UICorner")
G.UICorner_192.CornerRadius = UDim.new(0, 16)
G.UICorner_192.Parent = G.Frame_185

-- UIStroke_82 (UIStroke)
G.UIStroke_82 = Instance.new("UIStroke")
G.UIStroke_82.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
G.UIStroke_82.Color = Color3.fromRGB(31, 54, 40)
G.UIStroke_82.Transparency = 0.5
G.UIStroke_82.Parent = G.Frame_185

-- TextLabel_68 (TextLabel)
G.TextLabel_68 = Instance.new("TextLabel")
G.TextLabel_68.BackgroundTransparency = 1
G.TextLabel_68.Position = UDim2.new(0, 12, 0, 0)
G.TextLabel_68.Size = UDim2.new(1, -155, 1, 0)
G.TextLabel_68.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Medium, Enum.FontStyle.Normal)
G.TextLabel_68.Text = "Korblox"
G.TextLabel_68.TextColor3 = Color3.fromRGB(220, 239, 228)
G.TextLabel_68.TextSize = 13
G.TextLabel_68.TextXAlignment = Enum.TextXAlignment.Left
G.TextLabel_68.Parent = G.Frame_185

-- TextButton_72 (TextButton)
G.TextButton_72 = Instance.new("TextButton")
G.TextButton_72.BackgroundColor3 = Color3.fromRGB(9, 23, 15)
G.TextButton_72.BorderSizePixel = 0
G.TextButton_72.Position = UDim2.new(1, -142, 0.5, -14)
G.TextButton_72.Size = UDim2.new(0, 132, 0, 28)
G.TextButton_72.ZIndex = 8
G.TextButton_72.AutoButtonColor = false
G.TextButton_72.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Heavy, Enum.FontStyle.Normal)
G.TextButton_72.Text = "Off"
G.TextButton_72.TextColor3 = Color3.fromRGB(154, 255, 191)
G.TextButton_72.TextSize = 10
G.TextButton_72.TextWrapped = true
G.TextButton_72.Parent = G.Frame_185

-- UICorner_193 (UICorner)
G.UICorner_193 = Instance.new("UICorner")
G.UICorner_193.CornerRadius = UDim.new(0, 9)
G.UICorner_193.Parent = G.TextButton_72

-- UIStroke_83 (UIStroke)
G.UIStroke_83 = Instance.new("UIStroke")
G.UIStroke_83.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
G.UIStroke_83.Color = Color3.fromRGB(42, 230, 123)
G.UIStroke_83.Transparency = 0.2199999988079071
G.UIStroke_83.Parent = G.TextButton_72

-- Frame_186 (Frame)
G.Frame_186 = Instance.new("Frame")
G.Frame_186.BackgroundColor3 = Color3.fromRGB(19, 33, 26)
G.Frame_186.BackgroundTransparency = 0.11999999731779099
G.Frame_186.BorderSizePixel = 0
G.Frame_186.LayoutOrder = 21
G.Frame_186.Size = UDim2.new(1, -16, 0, 42)
G.Frame_186.Parent = G.Visual

-- UICorner_194 (UICorner)
G.UICorner_194 = Instance.new("UICorner")
G.UICorner_194.CornerRadius = UDim.new(0, 16)
G.UICorner_194.Parent = G.Frame_186

-- UIStroke_84 (UIStroke)
G.UIStroke_84 = Instance.new("UIStroke")
G.UIStroke_84.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
G.UIStroke_84.Color = Color3.fromRGB(31, 54, 40)
G.UIStroke_84.Transparency = 0.5
G.UIStroke_84.Parent = G.Frame_186

-- TextLabel_69 (TextLabel)
G.TextLabel_69 = Instance.new("TextLabel")
G.TextLabel_69.BackgroundTransparency = 1
G.TextLabel_69.Position = UDim2.new(0, 12, 0, 0)
G.TextLabel_69.Size = UDim2.new(1, -155, 1, 0)
G.TextLabel_69.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Medium, Enum.FontStyle.Normal)
G.TextLabel_69.Text = "Hats"
G.TextLabel_69.TextColor3 = Color3.fromRGB(220, 239, 228)
G.TextLabel_69.TextSize = 13
G.TextLabel_69.TextXAlignment = Enum.TextXAlignment.Left
G.TextLabel_69.Parent = G.Frame_186

-- TextButton_73 (TextButton)
G.TextButton_73 = Instance.new("TextButton")
G.TextButton_73.BackgroundColor3 = Color3.fromRGB(9, 23, 15)
G.TextButton_73.BorderSizePixel = 0
G.TextButton_73.Position = UDim2.new(1, -142, 0.5, -14)
G.TextButton_73.Size = UDim2.new(0, 132, 0, 28)
G.TextButton_73.ZIndex = 8
G.TextButton_73.AutoButtonColor = false
G.TextButton_73.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Heavy, Enum.FontStyle.Normal)
G.TextButton_73.Text = "Off"
G.TextButton_73.TextColor3 = Color3.fromRGB(154, 255, 191)
G.TextButton_73.TextSize = 10
G.TextButton_73.TextWrapped = true
G.TextButton_73.Parent = G.Frame_186

-- UICorner_195 (UICorner)
G.UICorner_195 = Instance.new("UICorner")
G.UICorner_195.CornerRadius = UDim.new(0, 9)
G.UICorner_195.Parent = G.TextButton_73

-- UIStroke_85 (UIStroke)
G.UIStroke_85 = Instance.new("UIStroke")
G.UIStroke_85.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
G.UIStroke_85.Color = Color3.fromRGB(42, 230, 123)
G.UIStroke_85.Transparency = 0.2199999988079071
G.UIStroke_85.Parent = G.TextButton_73

-- Frame_187 (Frame)
G.Frame_187 = Instance.new("Frame")
G.Frame_187.BackgroundTransparency = 1
G.Frame_187.BorderSizePixel = 0
G.Frame_187.LayoutOrder = 22
G.Frame_187.Size = UDim2.new(1, 0, 0, 8)
G.Frame_187.Parent = G.Visual

-- Frame_188 (Frame)
G.Frame_188 = Instance.new("Frame")
G.Frame_188.BackgroundColor3 = Color3.fromRGB(40, 92, 64)
G.Frame_188.BackgroundTransparency = 0.25
G.Frame_188.BorderSizePixel = 0
G.Frame_188.LayoutOrder = 23
G.Frame_188.Size = UDim2.new(1, -10, 0, 32)
G.Frame_188.Parent = G.Visual

-- UICorner_196 (UICorner)
G.UICorner_196 = Instance.new("UICorner")
G.UICorner_196.CornerRadius = UDim.new(0, 10)
G.UICorner_196.Parent = G.Frame_188

-- UIStroke_86 (UIStroke)
G.UIStroke_86 = Instance.new("UIStroke")
G.UIStroke_86.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
G.UIStroke_86.Color = Color3.fromRGB(24, 65, 38)
G.UIStroke_86.Transparency = 0.40000000596046448
G.UIStroke_86.Parent = G.Frame_188

-- Frame_189 (Frame)
G.Frame_189 = Instance.new("Frame")
G.Frame_189.BackgroundColor3 = Color3.fromRGB(42, 230, 123)
G.Frame_189.BorderSizePixel = 0
G.Frame_189.Position = UDim2.new(0, 10, 0, 9)
G.Frame_189.Size = UDim2.new(0, 4, 1, -18)
G.Frame_189.Parent = G.Frame_188

-- UICorner_197 (UICorner)
G.UICorner_197 = Instance.new("UICorner")
G.UICorner_197.CornerRadius = UDim.new(0, 2)
G.UICorner_197.Parent = G.Frame_189

-- TextLabel_70 (TextLabel)
G.TextLabel_70 = Instance.new("TextLabel")
G.TextLabel_70.BackgroundTransparency = 1
G.TextLabel_70.Position = UDim2.new(0, 22, 0, 0)
G.TextLabel_70.Size = UDim2.new(1, -30, 1, 0)
G.TextLabel_70.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal)
G.TextLabel_70.Text = "ESP"
G.TextLabel_70.TextColor3 = Color3.fromRGB(218, 255, 233)
G.TextLabel_70.TextSize = 13
G.TextLabel_70.TextXAlignment = Enum.TextXAlignment.Left
G.TextLabel_70.Parent = G.Frame_188

-- Frame_190 (Frame)
G.Frame_190 = Instance.new("Frame")
G.Frame_190.BackgroundTransparency = 1
G.Frame_190.BorderSizePixel = 0
G.Frame_190.LayoutOrder = 24
G.Frame_190.Size = UDim2.new(1, 0, 0, 2)
G.Frame_190.Parent = G.Visual

-- Frame_191 (Frame)
G.Frame_191 = Instance.new("Frame")
G.Frame_191.BackgroundColor3 = Color3.fromRGB(19, 33, 26)
G.Frame_191.BackgroundTransparency = 0.11999999731779099
G.Frame_191.BorderSizePixel = 0
G.Frame_191.LayoutOrder = 25
G.Frame_191.Size = UDim2.new(1, -16, 0, 42)
G.Frame_191.Parent = G.Visual

-- UICorner_198 (UICorner)
G.UICorner_198 = Instance.new("UICorner")
G.UICorner_198.CornerRadius = UDim.new(0, 16)
G.UICorner_198.Parent = G.Frame_191

-- UIStroke_87 (UIStroke)
G.UIStroke_87 = Instance.new("UIStroke")
G.UIStroke_87.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
G.UIStroke_87.Color = Color3.fromRGB(31, 54, 40)
G.UIStroke_87.Transparency = 0.5
G.UIStroke_87.Parent = G.Frame_191

-- TextLabel_71 (TextLabel)
G.TextLabel_71 = Instance.new("TextLabel")
G.TextLabel_71.BackgroundTransparency = 1
G.TextLabel_71.Position = UDim2.new(0, 12, 0, 0)
G.TextLabel_71.Size = UDim2.new(1, -70, 1, 0)
G.TextLabel_71.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Medium, Enum.FontStyle.Normal)
G.TextLabel_71.Text = "ESP (Green Highlight + Speed label)"
G.TextLabel_71.TextColor3 = Color3.fromRGB(220, 239, 228)
G.TextLabel_71.TextSize = 13
G.TextLabel_71.TextXAlignment = Enum.TextXAlignment.Left
G.TextLabel_71.Parent = G.Frame_191

-- Frame_192 (Frame)
G.Frame_192 = Instance.new("Frame")
G.Frame_192.BackgroundColor3 = Color3.fromRGB(24, 168, 84)
G.Frame_192.BorderSizePixel = 0
G.Frame_192.Position = UDim2.new(1, -62, 0.5, -12)
G.Frame_192.Size = UDim2.new(0, 48, 0, 24)
G.Frame_192.ZIndex = 7
G.Frame_192.Parent = G.Frame_191

-- UICorner_199 (UICorner)
G.UICorner_199 = Instance.new("UICorner")
G.UICorner_199.CornerRadius = UDim.new(0, 11)
G.UICorner_199.Parent = G.Frame_192

-- Frame_193 (Frame)
G.Frame_193 = Instance.new("Frame")
G.Frame_193.BackgroundColor3 = Color3.fromRGB(219, 255, 232)
G.Frame_193.BorderSizePixel = 0
G.Frame_193.Position = UDim2.new(1, -18, 0.5, -7)
G.Frame_193.Size = UDim2.new(0, 14, 0, 14)
G.Frame_193.ZIndex = 8
G.Frame_193.Parent = G.Frame_192

-- UICorner_200 (UICorner)
G.UICorner_200 = Instance.new("UICorner")
G.UICorner_200.CornerRadius = UDim.new(0, 7)
G.UICorner_200.Parent = G.Frame_193

-- TextButton_74 (TextButton)
G.TextButton_74 = Instance.new("TextButton")
G.TextButton_74.BackgroundTransparency = 1
G.TextButton_74.BorderSizePixel = 0
G.TextButton_74.Size = UDim2.new(1, 0, 1, 0)
G.TextButton_74.ZIndex = 9
G.TextButton_74.Text = ""
G.TextButton_74.Parent = G.Frame_192

-- TextButton_75 (TextButton)
G.TextButton_75 = Instance.new("TextButton")
G.TextButton_75.BackgroundTransparency = 1
G.TextButton_75.BorderSizePixel = 0
G.TextButton_75.Size = UDim2.new(1, -56, 1, 0)
G.TextButton_75.ZIndex = 5
G.TextButton_75.Text = ""
G.TextButton_75.Parent = G.Frame_191

-- Frame_194 (Frame)
G.Frame_194 = Instance.new("Frame")
G.Frame_194.BackgroundColor3 = Color3.fromRGB(19, 33, 26)
G.Frame_194.BackgroundTransparency = 0.11999999731779099
G.Frame_194.BorderSizePixel = 0
G.Frame_194.LayoutOrder = 26
G.Frame_194.Size = UDim2.new(1, -16, 0, 42)
G.Frame_194.Parent = G.Visual

-- UICorner_201 (UICorner)
G.UICorner_201 = Instance.new("UICorner")
G.UICorner_201.CornerRadius = UDim.new(0, 16)
G.UICorner_201.Parent = G.Frame_194

-- UIStroke_88 (UIStroke)
G.UIStroke_88 = Instance.new("UIStroke")
G.UIStroke_88.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
G.UIStroke_88.Color = Color3.fromRGB(31, 54, 40)
G.UIStroke_88.Transparency = 0.5
G.UIStroke_88.Parent = G.Frame_194

-- TextLabel_72 (TextLabel)
G.TextLabel_72 = Instance.new("TextLabel")
G.TextLabel_72.BackgroundTransparency = 1
G.TextLabel_72.Position = UDim2.new(0, 12, 0, 0)
G.TextLabel_72.Size = UDim2.new(1, -70, 1, 0)
G.TextLabel_72.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Medium, Enum.FontStyle.Normal)
G.TextLabel_72.Text = "Line ESP"
G.TextLabel_72.TextColor3 = Color3.fromRGB(220, 239, 228)
G.TextLabel_72.TextSize = 13
G.TextLabel_72.TextXAlignment = Enum.TextXAlignment.Left
G.TextLabel_72.Parent = G.Frame_194

-- Frame_195 (Frame)
G.Frame_195 = Instance.new("Frame")
G.Frame_195.BackgroundColor3 = Color3.fromRGB(24, 168, 84)
G.Frame_195.BorderSizePixel = 0
G.Frame_195.Position = UDim2.new(1, -62, 0.5, -12)
G.Frame_195.Size = UDim2.new(0, 48, 0, 24)
G.Frame_195.ZIndex = 7
G.Frame_195.Parent = G.Frame_194

-- UICorner_202 (UICorner)
G.UICorner_202 = Instance.new("UICorner")
G.UICorner_202.CornerRadius = UDim.new(0, 11)
G.UICorner_202.Parent = G.Frame_195

-- Frame_196 (Frame)
G.Frame_196 = Instance.new("Frame")
G.Frame_196.BackgroundColor3 = Color3.fromRGB(219, 255, 232)
G.Frame_196.BorderSizePixel = 0
G.Frame_196.Position = UDim2.new(1, -18, 0.5, -7)
G.Frame_196.Size = UDim2.new(0, 14, 0, 14)
G.Frame_196.ZIndex = 8
G.Frame_196.Parent = G.Frame_195

-- UICorner_203 (UICorner)
G.UICorner_203 = Instance.new("UICorner")
G.UICorner_203.CornerRadius = UDim.new(0, 7)
G.UICorner_203.Parent = G.Frame_196

-- TextButton_76 (TextButton)
G.TextButton_76 = Instance.new("TextButton")
G.TextButton_76.BackgroundTransparency = 1
G.TextButton_76.BorderSizePixel = 0
G.TextButton_76.Size = UDim2.new(1, 0, 1, 0)
G.TextButton_76.ZIndex = 9
G.TextButton_76.Text = ""
G.TextButton_76.Parent = G.Frame_195

-- TextButton_77 (TextButton)
G.TextButton_77 = Instance.new("TextButton")
G.TextButton_77.BackgroundTransparency = 1
G.TextButton_77.BorderSizePixel = 0
G.TextButton_77.Size = UDim2.new(1, -56, 1, 0)
G.TextButton_77.ZIndex = 5
G.TextButton_77.Text = ""
G.TextButton_77.Parent = G.Frame_194

-- Settings (Frame)
G.Settings = Instance.new("Frame")
G.Settings.Name = "Settings"
G.Settings.AutomaticSize = Enum.AutomaticSize.Y
G.Settings.BackgroundTransparency = 1
G.Settings.BorderSizePixel = 0
G.Settings.LayoutOrder = 6
G.Settings.Size = UDim2.new(1, 0, 0, 0)
G.Settings.Parent = G.MainScroll

-- UIListLayout_7 (UIListLayout)
G.UIListLayout_7 = Instance.new("UIListLayout")
G.UIListLayout_7.HorizontalAlignment = Enum.HorizontalAlignment.Center
G.UIListLayout_7.Padding = UDim.new(0, 6)
G.UIListLayout_7.SortOrder = Enum.SortOrder.LayoutOrder
G.UIListLayout_7.Parent = G.Settings

-- Frame_197 (Frame)
G.Frame_197 = Instance.new("Frame")
G.Frame_197.BackgroundTransparency = 1
G.Frame_197.BorderSizePixel = 0
G.Frame_197.LayoutOrder = 1
G.Frame_197.Size = UDim2.new(1, 0, 0, 2)
G.Frame_197.Parent = G.Settings

-- Frame_198 (Frame)
G.Frame_198 = Instance.new("Frame")
G.Frame_198.BackgroundColor3 = Color3.fromRGB(40, 92, 64)
G.Frame_198.BackgroundTransparency = 0.25
G.Frame_198.BorderSizePixel = 0
G.Frame_198.LayoutOrder = 2
G.Frame_198.Size = UDim2.new(1, -10, 0, 32)
G.Frame_198.Parent = G.Settings

-- UICorner_204 (UICorner)
G.UICorner_204 = Instance.new("UICorner")
G.UICorner_204.CornerRadius = UDim.new(0, 10)
G.UICorner_204.Parent = G.Frame_198

-- UIStroke_89 (UIStroke)
G.UIStroke_89 = Instance.new("UIStroke")
G.UIStroke_89.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
G.UIStroke_89.Color = Color3.fromRGB(24, 65, 38)
G.UIStroke_89.Transparency = 0.40000000596046448
G.UIStroke_89.Parent = G.Frame_198

-- Frame_199 (Frame)
G.Frame_199 = Instance.new("Frame")
G.Frame_199.BackgroundColor3 = Color3.fromRGB(42, 230, 123)
G.Frame_199.BorderSizePixel = 0
G.Frame_199.Position = UDim2.new(0, 10, 0, 9)
G.Frame_199.Size = UDim2.new(0, 4, 1, -18)
G.Frame_199.Parent = G.Frame_198

-- UICorner_205 (UICorner)
G.UICorner_205 = Instance.new("UICorner")
G.UICorner_205.CornerRadius = UDim.new(0, 2)
G.UICorner_205.Parent = G.Frame_199

-- TextLabel_73 (TextLabel)
G.TextLabel_73 = Instance.new("TextLabel")
G.TextLabel_73.BackgroundTransparency = 1
G.TextLabel_73.Position = UDim2.new(0, 22, 0, 0)
G.TextLabel_73.Size = UDim2.new(1, -30, 1, 0)
G.TextLabel_73.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal)
G.TextLabel_73.Text = "INTERFACE"
G.TextLabel_73.TextColor3 = Color3.fromRGB(218, 255, 233)
G.TextLabel_73.TextSize = 13
G.TextLabel_73.TextXAlignment = Enum.TextXAlignment.Left
G.TextLabel_73.Parent = G.Frame_198

-- Frame_200 (Frame)
G.Frame_200 = Instance.new("Frame")
G.Frame_200.BackgroundTransparency = 1
G.Frame_200.BorderSizePixel = 0
G.Frame_200.LayoutOrder = 3
G.Frame_200.Size = UDim2.new(1, 0, 0, 2)
G.Frame_200.Parent = G.Settings

-- Frame_201 (Frame)
G.Frame_201 = Instance.new("Frame")
G.Frame_201.BackgroundColor3 = Color3.fromRGB(19, 33, 26)
G.Frame_201.BackgroundTransparency = 0.11999999731779099
G.Frame_201.BorderSizePixel = 0
G.Frame_201.LayoutOrder = 4
G.Frame_201.Size = UDim2.new(1, -16, 0, 40)
G.Frame_201.Parent = G.Settings

-- UICorner_206 (UICorner)
G.UICorner_206 = Instance.new("UICorner")
G.UICorner_206.CornerRadius = UDim.new(0, 16)
G.UICorner_206.Parent = G.Frame_201

-- UIStroke_90 (UIStroke)
G.UIStroke_90 = Instance.new("UIStroke")
G.UIStroke_90.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
G.UIStroke_90.Color = Color3.fromRGB(31, 54, 40)
G.UIStroke_90.Transparency = 0.55000001192092896
G.UIStroke_90.Parent = G.Frame_201

-- TextLabel_74 (TextLabel)
G.TextLabel_74 = Instance.new("TextLabel")
G.TextLabel_74.BackgroundTransparency = 1
G.TextLabel_74.Position = UDim2.new(0, 12, 0, 0)
G.TextLabel_74.Size = UDim2.new(1, -96, 1, 0)
G.TextLabel_74.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Medium, Enum.FontStyle.Normal)
G.TextLabel_74.Text = "Hide GUI"
G.TextLabel_74.TextColor3 = Color3.fromRGB(220, 239, 228)
G.TextLabel_74.TextSize = 13
G.TextLabel_74.TextXAlignment = Enum.TextXAlignment.Left
G.TextLabel_74.Parent = G.Frame_201

-- TextButton_78 (TextButton)
G.TextButton_78 = Instance.new("TextButton")
G.TextButton_78.BackgroundColor3 = Color3.fromRGB(22, 76, 43)
G.TextButton_78.BorderSizePixel = 0
G.TextButton_78.Position = UDim2.new(1, -72, 0.5, -14)
G.TextButton_78.Size = UDim2.new(0, 62, 0, 28)
G.TextButton_78.ZIndex = 8
G.TextButton_78.AutoButtonColor = false
G.TextButton_78.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Heavy, Enum.FontStyle.Normal)
G.TextButton_78.Text = "LeftC"
G.TextButton_78.TextColor3 = Color3.fromRGB(42, 230, 123)
G.TextButton_78.TextSize = 11
G.TextButton_78.TextWrapped = true
G.TextButton_78.Parent = G.Frame_201

-- UICorner_207 (UICorner)
G.UICorner_207 = Instance.new("UICorner")
G.UICorner_207.CornerRadius = UDim.new(0, 9)
G.UICorner_207.Parent = G.TextButton_78

-- KeybindStroke_10 (UIStroke)
G.KeybindStroke_10 = Instance.new("UIStroke")
G.KeybindStroke_10.Name = "KeybindStroke"
G.KeybindStroke_10.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
G.KeybindStroke_10.Color = Color3.fromRGB(92, 255, 150)
G.KeybindStroke_10.Transparency = 0.079999998211860657
G.KeybindStroke_10.Parent = G.TextButton_78

-- KeybindShine_8 (Frame)
G.KeybindShine_8 = Instance.new("Frame")
G.KeybindShine_8.Name = "KeybindShine"
G.KeybindShine_8.BackgroundColor3 = Color3.fromRGB(180, 255, 205)
G.KeybindShine_8.BackgroundTransparency = 1
G.KeybindShine_8.BorderSizePixel = 0
G.KeybindShine_8.Size = UDim2.new(1, 0, 0, 10)
G.KeybindShine_8.ZIndex = 9
G.KeybindShine_8.Parent = G.TextButton_78

-- UICorner_208 (UICorner)
G.UICorner_208 = Instance.new("UICorner")
G.UICorner_208.CornerRadius = UDim.new(0, 9)
G.UICorner_208.Parent = G.KeybindShine_8

-- Frame_202 (Frame)
G.Frame_202 = Instance.new("Frame")
G.Frame_202.BackgroundColor3 = Color3.fromRGB(19, 33, 26)
G.Frame_202.BackgroundTransparency = 0.11999999731779099
G.Frame_202.BorderSizePixel = 0
G.Frame_202.LayoutOrder = 5
G.Frame_202.Size = UDim2.new(1, -16, 0, 42)
G.Frame_202.Parent = G.Settings

-- UICorner_209 (UICorner)
G.UICorner_209 = Instance.new("UICorner")
G.UICorner_209.CornerRadius = UDim.new(0, 16)
G.UICorner_209.Parent = G.Frame_202

-- UIStroke_91 (UIStroke)
G.UIStroke_91 = Instance.new("UIStroke")
G.UIStroke_91.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
G.UIStroke_91.Color = Color3.fromRGB(31, 54, 40)
G.UIStroke_91.Transparency = 0.5
G.UIStroke_91.Parent = G.Frame_202

-- TextLabel_75 (TextLabel)
G.TextLabel_75 = Instance.new("TextLabel")
G.TextLabel_75.BackgroundTransparency = 1
G.TextLabel_75.Position = UDim2.new(0, 12, 0, 0)
G.TextLabel_75.Size = UDim2.new(1, -100, 1, 0)
G.TextLabel_75.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Medium, Enum.FontStyle.Normal)
G.TextLabel_75.Text = "UI Scale"
G.TextLabel_75.TextColor3 = Color3.fromRGB(220, 239, 228)
G.TextLabel_75.TextSize = 13
G.TextLabel_75.TextXAlignment = Enum.TextXAlignment.Left
G.TextLabel_75.Parent = G.Frame_202

-- Frame_203 (Frame)
G.Frame_203 = Instance.new("Frame")
G.Frame_203.BackgroundColor3 = Color3.fromRGB(9, 23, 15)
G.Frame_203.BorderSizePixel = 0
G.Frame_203.Position = UDim2.new(1, -88, 0.5, -15)
G.Frame_203.Size = UDim2.new(0, 76, 0, 30)
G.Frame_203.Parent = G.Frame_202

-- UICorner_210 (UICorner)
G.UICorner_210 = Instance.new("UICorner")
G.UICorner_210.CornerRadius = UDim.new(0, 13)
G.UICorner_210.Parent = G.Frame_203

-- UIStroke_92 (UIStroke)
G.UIStroke_92 = Instance.new("UIStroke")
G.UIStroke_92.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
G.UIStroke_92.Color = Color3.fromRGB(31, 54, 40)
G.UIStroke_92.Transparency = 0.30000001192092896
G.UIStroke_92.Parent = G.Frame_203

-- TextBox_11 (TextBox)
G.TextBox_11 = Instance.new("TextBox")
G.TextBox_11.BackgroundTransparency = 1
G.TextBox_11.Position = UDim2.new(0, 4, 0, 0)
G.TextBox_11.Size = UDim2.new(1, -8, 1, 0)
G.TextBox_11.ZIndex = 8
G.TextBox_11.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal)
G.TextBox_11.Text = "1"
G.TextBox_11.TextColor3 = Color3.fromRGB(154, 255, 191)
G.TextBox_11.TextSize = 14
G.TextBox_11.ClearTextOnFocus = false
G.TextBox_11.Parent = G.Frame_203

-- Frame_204 (Frame)
G.Frame_204 = Instance.new("Frame")
G.Frame_204.BackgroundColor3 = Color3.fromRGB(19, 33, 26)
G.Frame_204.BackgroundTransparency = 0.11999999731779099
G.Frame_204.BorderSizePixel = 0
G.Frame_204.LayoutOrder = 6
G.Frame_204.Size = UDim2.new(1, -16, 0, 42)
G.Frame_204.Parent = G.Settings

-- UICorner_211 (UICorner)
G.UICorner_211 = Instance.new("UICorner")
G.UICorner_211.CornerRadius = UDim.new(0, 16)
G.UICorner_211.Parent = G.Frame_204

-- UIStroke_93 (UIStroke)
G.UIStroke_93 = Instance.new("UIStroke")
G.UIStroke_93.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
G.UIStroke_93.Color = Color3.fromRGB(31, 54, 40)
G.UIStroke_93.Transparency = 0.5
G.UIStroke_93.Parent = G.Frame_204

-- TextLabel_76 (TextLabel)
G.TextLabel_76 = Instance.new("TextLabel")
G.TextLabel_76.BackgroundTransparency = 1
G.TextLabel_76.Position = UDim2.new(0, 12, 0, 0)
G.TextLabel_76.Size = UDim2.new(1, -100, 1, 0)
G.TextLabel_76.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Medium, Enum.FontStyle.Normal)
G.TextLabel_76.Text = "Mobile Buttons Size"
G.TextLabel_76.TextColor3 = Color3.fromRGB(220, 239, 228)
G.TextLabel_76.TextSize = 13
G.TextLabel_76.TextXAlignment = Enum.TextXAlignment.Left
G.TextLabel_76.Parent = G.Frame_204

-- Frame_205 (Frame)
G.Frame_205 = Instance.new("Frame")
G.Frame_205.BackgroundColor3 = Color3.fromRGB(9, 23, 15)
G.Frame_205.BorderSizePixel = 0
G.Frame_205.Position = UDim2.new(1, -88, 0.5, -15)
G.Frame_205.Size = UDim2.new(0, 76, 0, 30)
G.Frame_205.Parent = G.Frame_204

-- UICorner_212 (UICorner)
G.UICorner_212 = Instance.new("UICorner")
G.UICorner_212.CornerRadius = UDim.new(0, 13)
G.UICorner_212.Parent = G.Frame_205

-- UIStroke_94 (UIStroke)
G.UIStroke_94 = Instance.new("UIStroke")
G.UIStroke_94.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
G.UIStroke_94.Color = Color3.fromRGB(31, 54, 40)
G.UIStroke_94.Transparency = 0.30000001192092896
G.UIStroke_94.Parent = G.Frame_205

-- TextBox_12 (TextBox)
G.TextBox_12 = Instance.new("TextBox")
G.TextBox_12.BackgroundTransparency = 1
G.TextBox_12.Position = UDim2.new(0, 4, 0, 0)
G.TextBox_12.Size = UDim2.new(1, -8, 1, 0)
G.TextBox_12.ZIndex = 8
G.TextBox_12.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal)
G.TextBox_12.Text = "1"
G.TextBox_12.TextColor3 = Color3.fromRGB(154, 255, 191)
G.TextBox_12.TextSize = 14
G.TextBox_12.ClearTextOnFocus = false
G.TextBox_12.Parent = G.Frame_205

-- Frame_206 (Frame)
G.Frame_206 = Instance.new("Frame")
G.Frame_206.BackgroundColor3 = Color3.fromRGB(19, 33, 26)
G.Frame_206.BackgroundTransparency = 0.11999999731779099
G.Frame_206.BorderSizePixel = 0
G.Frame_206.LayoutOrder = 7
G.Frame_206.Size = UDim2.new(1, -16, 0, 42)
G.Frame_206.Parent = G.Settings

-- UICorner_213 (UICorner)
G.UICorner_213 = Instance.new("UICorner")
G.UICorner_213.CornerRadius = UDim.new(0, 16)
G.UICorner_213.Parent = G.Frame_206

-- UIStroke_95 (UIStroke)
G.UIStroke_95 = Instance.new("UIStroke")
G.UIStroke_95.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
G.UIStroke_95.Color = Color3.fromRGB(31, 54, 40)
G.UIStroke_95.Transparency = 0.5
G.UIStroke_95.Parent = G.Frame_206

-- TextLabel_77 (TextLabel)
G.TextLabel_77 = Instance.new("TextLabel")
G.TextLabel_77.BackgroundTransparency = 1
G.TextLabel_77.Position = UDim2.new(0, 12, 0, 0)
G.TextLabel_77.Size = UDim2.new(1, -100, 1, 0)
G.TextLabel_77.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Medium, Enum.FontStyle.Normal)
G.TextLabel_77.Text = "Steal Bar Size"
G.TextLabel_77.TextColor3 = Color3.fromRGB(220, 239, 228)
G.TextLabel_77.TextSize = 13
G.TextLabel_77.TextXAlignment = Enum.TextXAlignment.Left
G.TextLabel_77.Parent = G.Frame_206

-- Frame_207 (Frame)
G.Frame_207 = Instance.new("Frame")
G.Frame_207.BackgroundColor3 = Color3.fromRGB(9, 23, 15)
G.Frame_207.BorderSizePixel = 0
G.Frame_207.Position = UDim2.new(1, -88, 0.5, -15)
G.Frame_207.Size = UDim2.new(0, 76, 0, 30)
G.Frame_207.Parent = G.Frame_206

-- UICorner_214 (UICorner)
G.UICorner_214 = Instance.new("UICorner")
G.UICorner_214.CornerRadius = UDim.new(0, 13)
G.UICorner_214.Parent = G.Frame_207

-- UIStroke_96 (UIStroke)
G.UIStroke_96 = Instance.new("UIStroke")
G.UIStroke_96.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
G.UIStroke_96.Color = Color3.fromRGB(31, 54, 40)
G.UIStroke_96.Transparency = 0.30000001192092896
G.UIStroke_96.Parent = G.Frame_207

-- TextBox_13 (TextBox)
G.TextBox_13 = Instance.new("TextBox")
G.TextBox_13.BackgroundTransparency = 1
G.TextBox_13.Position = UDim2.new(0, 4, 0, 0)
G.TextBox_13.Size = UDim2.new(1, -8, 1, 0)
G.TextBox_13.ZIndex = 8
G.TextBox_13.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal)
G.TextBox_13.Text = "1"
G.TextBox_13.TextColor3 = Color3.fromRGB(154, 255, 191)
G.TextBox_13.TextSize = 14
G.TextBox_13.ClearTextOnFocus = false
G.TextBox_13.Parent = G.Frame_207

-- Frame_208 (Frame)
G.Frame_208 = Instance.new("Frame")
G.Frame_208.BackgroundColor3 = Color3.fromRGB(19, 33, 26)
G.Frame_208.BackgroundTransparency = 0.11999999731779099
G.Frame_208.BorderSizePixel = 0
G.Frame_208.LayoutOrder = 8
G.Frame_208.Size = UDim2.new(1, -16, 0, 42)
G.Frame_208.Parent = G.Settings

-- UICorner_215 (UICorner)
G.UICorner_215 = Instance.new("UICorner")
G.UICorner_215.CornerRadius = UDim.new(0, 16)
G.UICorner_215.Parent = G.Frame_208

-- UIStroke_97 (UIStroke)
G.UIStroke_97 = Instance.new("UIStroke")
G.UIStroke_97.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
G.UIStroke_97.Color = Color3.fromRGB(31, 54, 40)
G.UIStroke_97.Transparency = 0.5
G.UIStroke_97.Parent = G.Frame_208

-- TextLabel_78 (TextLabel)
G.TextLabel_78 = Instance.new("TextLabel")
G.TextLabel_78.BackgroundTransparency = 1
G.TextLabel_78.Position = UDim2.new(0, 12, 0, 0)
G.TextLabel_78.Size = UDim2.new(1, -70, 1, 0)
G.TextLabel_78.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Medium, Enum.FontStyle.Normal)
G.TextLabel_78.Text = "Hide Buttons"
G.TextLabel_78.TextColor3 = Color3.fromRGB(220, 239, 228)
G.TextLabel_78.TextSize = 13
G.TextLabel_78.TextXAlignment = Enum.TextXAlignment.Left
G.TextLabel_78.Parent = G.Frame_208

-- Frame_209 (Frame)
G.Frame_209 = Instance.new("Frame")
G.Frame_209.BackgroundColor3 = Color3.fromRGB(35, 48, 41)
G.Frame_209.BorderSizePixel = 0
G.Frame_209.Position = UDim2.new(1, -62, 0.5, -12)
G.Frame_209.Size = UDim2.new(0, 48, 0, 24)
G.Frame_209.ZIndex = 7
G.Frame_209.Parent = G.Frame_208

-- UICorner_216 (UICorner)
G.UICorner_216 = Instance.new("UICorner")
G.UICorner_216.CornerRadius = UDim.new(0, 11)
G.UICorner_216.Parent = G.Frame_209

-- Frame_210 (Frame)
G.Frame_210 = Instance.new("Frame")
G.Frame_210.BackgroundColor3 = Color3.fromRGB(119, 149, 130)
G.Frame_210.BorderSizePixel = 0
G.Frame_210.Position = UDim2.new(0, 4, 0.5, -7)
G.Frame_210.Size = UDim2.new(0, 14, 0, 14)
G.Frame_210.ZIndex = 8
G.Frame_210.Parent = G.Frame_209

-- UICorner_217 (UICorner)
G.UICorner_217 = Instance.new("UICorner")
G.UICorner_217.CornerRadius = UDim.new(0, 7)
G.UICorner_217.Parent = G.Frame_210

-- TextButton_79 (TextButton)
G.TextButton_79 = Instance.new("TextButton")
G.TextButton_79.BackgroundTransparency = 1
G.TextButton_79.BorderSizePixel = 0
G.TextButton_79.Size = UDim2.new(1, 0, 1, 0)
G.TextButton_79.ZIndex = 9
G.TextButton_79.Text = ""
G.TextButton_79.Parent = G.Frame_209

-- TextButton_80 (TextButton)
G.TextButton_80 = Instance.new("TextButton")
G.TextButton_80.BackgroundTransparency = 1
G.TextButton_80.BorderSizePixel = 0
G.TextButton_80.Size = UDim2.new(1, -56, 1, 0)
G.TextButton_80.ZIndex = 5
G.TextButton_80.Text = ""
G.TextButton_80.Parent = G.Frame_208

-- Frame_211 (Frame)
G.Frame_211 = Instance.new("Frame")
G.Frame_211.BackgroundColor3 = Color3.fromRGB(19, 33, 26)
G.Frame_211.BackgroundTransparency = 0.11999999731779099
G.Frame_211.BorderSizePixel = 0
G.Frame_211.LayoutOrder = 9
G.Frame_211.Size = UDim2.new(1, -16, 0, 42)
G.Frame_211.Parent = G.Settings

-- UICorner_218 (UICorner)
G.UICorner_218 = Instance.new("UICorner")
G.UICorner_218.CornerRadius = UDim.new(0, 16)
G.UICorner_218.Parent = G.Frame_211

-- UIStroke_98 (UIStroke)
G.UIStroke_98 = Instance.new("UIStroke")
G.UIStroke_98.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
G.UIStroke_98.Color = Color3.fromRGB(31, 54, 40)
G.UIStroke_98.Transparency = 0.5
G.UIStroke_98.Parent = G.Frame_211

-- TextLabel_79 (TextLabel)
G.TextLabel_79 = Instance.new("TextLabel")
G.TextLabel_79.BackgroundTransparency = 1
G.TextLabel_79.Position = UDim2.new(0, 12, 0, 0)
G.TextLabel_79.Size = UDim2.new(1, -70, 1, 0)
G.TextLabel_79.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Medium, Enum.FontStyle.Normal)
G.TextLabel_79.Text = "Lock Buttons"
G.TextLabel_79.TextColor3 = Color3.fromRGB(220, 239, 228)
G.TextLabel_79.TextSize = 13
G.TextLabel_79.TextXAlignment = Enum.TextXAlignment.Left
G.TextLabel_79.Parent = G.Frame_211

-- Frame_212 (Frame)
G.Frame_212 = Instance.new("Frame")
G.Frame_212.BackgroundColor3 = Color3.fromRGB(35, 48, 41)
G.Frame_212.BorderSizePixel = 0
G.Frame_212.Position = UDim2.new(1, -62, 0.5, -12)
G.Frame_212.Size = UDim2.new(0, 48, 0, 24)
G.Frame_212.ZIndex = 7
G.Frame_212.Parent = G.Frame_211

-- UICorner_219 (UICorner)
G.UICorner_219 = Instance.new("UICorner")
G.UICorner_219.CornerRadius = UDim.new(0, 11)
G.UICorner_219.Parent = G.Frame_212

-- Frame_213 (Frame)
G.Frame_213 = Instance.new("Frame")
G.Frame_213.BackgroundColor3 = Color3.fromRGB(119, 149, 130)
G.Frame_213.BorderSizePixel = 0
G.Frame_213.Position = UDim2.new(0, 4, 0.5, -7)
G.Frame_213.Size = UDim2.new(0, 14, 0, 14)
G.Frame_213.ZIndex = 8
G.Frame_213.Parent = G.Frame_212

-- UICorner_220 (UICorner)
G.UICorner_220 = Instance.new("UICorner")
G.UICorner_220.CornerRadius = UDim.new(0, 7)
G.UICorner_220.Parent = G.Frame_213

-- TextButton_81 (TextButton)
G.TextButton_81 = Instance.new("TextButton")
G.TextButton_81.BackgroundTransparency = 1
G.TextButton_81.BorderSizePixel = 0
G.TextButton_81.Size = UDim2.new(1, 0, 1, 0)
G.TextButton_81.ZIndex = 9
G.TextButton_81.Text = ""
G.TextButton_81.Parent = G.Frame_212

-- TextButton_82 (TextButton)
G.TextButton_82 = Instance.new("TextButton")
G.TextButton_82.BackgroundTransparency = 1
G.TextButton_82.BorderSizePixel = 0
G.TextButton_82.Size = UDim2.new(1, -56, 1, 0)
G.TextButton_82.ZIndex = 5
G.TextButton_82.Text = ""
G.TextButton_82.Parent = G.Frame_211

-- Frame_214 (Frame)
G.Frame_214 = Instance.new("Frame")
G.Frame_214.BackgroundColor3 = Color3.fromRGB(19, 33, 26)
G.Frame_214.BackgroundTransparency = 0.11999999731779099
G.Frame_214.BorderSizePixel = 0
G.Frame_214.LayoutOrder = 10
G.Frame_214.Size = UDim2.new(1, -16, 0, 42)
G.Frame_214.Parent = G.Settings

-- UICorner_221 (UICorner)
G.UICorner_221 = Instance.new("UICorner")
G.UICorner_221.CornerRadius = UDim.new(0, 16)
G.UICorner_221.Parent = G.Frame_214

-- UIStroke_99 (UIStroke)
G.UIStroke_99 = Instance.new("UIStroke")
G.UIStroke_99.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
G.UIStroke_99.Color = Color3.fromRGB(31, 54, 40)
G.UIStroke_99.Transparency = 0.5
G.UIStroke_99.Parent = G.Frame_214

-- TextLabel_80 (TextLabel)
G.TextLabel_80 = Instance.new("TextLabel")
G.TextLabel_80.BackgroundTransparency = 1
G.TextLabel_80.Position = UDim2.new(0, 12, 0, 0)
G.TextLabel_80.Size = UDim2.new(1, -70, 1, 0)
G.TextLabel_80.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Medium, Enum.FontStyle.Normal)
G.TextLabel_80.Text = "Play Intro"
G.TextLabel_80.TextColor3 = Color3.fromRGB(220, 239, 228)
G.TextLabel_80.TextSize = 13
G.TextLabel_80.TextXAlignment = Enum.TextXAlignment.Left
G.TextLabel_80.Parent = G.Frame_214

-- Frame_215 (Frame)
G.Frame_215 = Instance.new("Frame")
G.Frame_215.BackgroundColor3 = Color3.fromRGB(24, 168, 84)
G.Frame_215.BorderSizePixel = 0
G.Frame_215.Position = UDim2.new(1, -62, 0.5, -12)
G.Frame_215.Size = UDim2.new(0, 48, 0, 24)
G.Frame_215.ZIndex = 7
G.Frame_215.Parent = G.Frame_214

-- UICorner_222 (UICorner)
G.UICorner_222 = Instance.new("UICorner")
G.UICorner_222.CornerRadius = UDim.new(0, 11)
G.UICorner_222.Parent = G.Frame_215

-- Frame_216 (Frame)
G.Frame_216 = Instance.new("Frame")
G.Frame_216.BackgroundColor3 = Color3.fromRGB(219, 255, 232)
G.Frame_216.BorderSizePixel = 0
G.Frame_216.Position = UDim2.new(1, -18, 0.5, -7)
G.Frame_216.Size = UDim2.new(0, 14, 0, 14)
G.Frame_216.ZIndex = 8
G.Frame_216.Parent = G.Frame_215

-- UICorner_223 (UICorner)
G.UICorner_223 = Instance.new("UICorner")
G.UICorner_223.CornerRadius = UDim.new(0, 7)
G.UICorner_223.Parent = G.Frame_216

-- TextButton_83 (TextButton)
G.TextButton_83 = Instance.new("TextButton")
G.TextButton_83.BackgroundTransparency = 1
G.TextButton_83.BorderSizePixel = 0
G.TextButton_83.Size = UDim2.new(1, 0, 1, 0)
G.TextButton_83.ZIndex = 9
G.TextButton_83.Text = ""
G.TextButton_83.Parent = G.Frame_215

-- TextButton_84 (TextButton)
G.TextButton_84 = Instance.new("TextButton")
G.TextButton_84.BackgroundTransparency = 1
G.TextButton_84.BorderSizePixel = 0
G.TextButton_84.Size = UDim2.new(1, -56, 1, 0)
G.TextButton_84.ZIndex = 5
G.TextButton_84.Text = ""
G.TextButton_84.Parent = G.Frame_214

-- Frame_217 (Frame)
G.Frame_217 = Instance.new("Frame")
G.Frame_217.BackgroundTransparency = 1
G.Frame_217.BorderSizePixel = 0
G.Frame_217.LayoutOrder = 11
G.Frame_217.Size = UDim2.new(1, 0, 0, 6)
G.Frame_217.Parent = G.Settings

-- Frame_218 (Frame)
G.Frame_218 = Instance.new("Frame")
G.Frame_218.BackgroundColor3 = Color3.fromRGB(40, 92, 64)
G.Frame_218.BackgroundTransparency = 0.25
G.Frame_218.BorderSizePixel = 0
G.Frame_218.LayoutOrder = 12
G.Frame_218.Size = UDim2.new(1, -10, 0, 32)
G.Frame_218.Parent = G.Settings

-- UICorner_224 (UICorner)
G.UICorner_224 = Instance.new("UICorner")
G.UICorner_224.CornerRadius = UDim.new(0, 10)
G.UICorner_224.Parent = G.Frame_218

-- UIStroke_100 (UIStroke)
G.UIStroke_100 = Instance.new("UIStroke")
G.UIStroke_100.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
G.UIStroke_100.Color = Color3.fromRGB(24, 65, 38)
G.UIStroke_100.Transparency = 0.40000000596046448
G.UIStroke_100.Parent = G.Frame_218

-- Frame_219 (Frame)
G.Frame_219 = Instance.new("Frame")
G.Frame_219.BackgroundColor3 = Color3.fromRGB(42, 230, 123)
G.Frame_219.BorderSizePixel = 0
G.Frame_219.Position = UDim2.new(0, 10, 0, 9)
G.Frame_219.Size = UDim2.new(0, 4, 1, -18)
G.Frame_219.Parent = G.Frame_218

-- UICorner_225 (UICorner)
G.UICorner_225 = Instance.new("UICorner")
G.UICorner_225.CornerRadius = UDim.new(0, 2)
G.UICorner_225.Parent = G.Frame_219

-- TextLabel_81 (TextLabel)
G.TextLabel_81 = Instance.new("TextLabel")
G.TextLabel_81.BackgroundTransparency = 1
G.TextLabel_81.Position = UDim2.new(0, 22, 0, 0)
G.TextLabel_81.Size = UDim2.new(1, -30, 1, 0)
G.TextLabel_81.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal)
G.TextLabel_81.Text = "INTRO MUSIC"
G.TextLabel_81.TextColor3 = Color3.fromRGB(218, 255, 233)
G.TextLabel_81.TextSize = 13
G.TextLabel_81.TextXAlignment = Enum.TextXAlignment.Left
G.TextLabel_81.Parent = G.Frame_218

-- Frame_220 (Frame)
G.Frame_220 = Instance.new("Frame")
G.Frame_220.BackgroundTransparency = 1
G.Frame_220.BorderSizePixel = 0
G.Frame_220.LayoutOrder = 13
G.Frame_220.Size = UDim2.new(1, 0, 0, 2)
G.Frame_220.Parent = G.Settings

-- Frame_221 (Frame)
G.Frame_221 = Instance.new("Frame")
G.Frame_221.BackgroundColor3 = Color3.fromRGB(19, 33, 26)
G.Frame_221.BorderSizePixel = 0
G.Frame_221.LayoutOrder = 14
G.Frame_221.Size = UDim2.new(1, -10, 0, 42)
G.Frame_221.Parent = G.Settings

-- UICorner_226 (UICorner)
G.UICorner_226 = Instance.new("UICorner")
G.UICorner_226.CornerRadius = UDim.new(0, 10)
G.UICorner_226.Parent = G.Frame_221

-- UIStroke_101 (UIStroke)
G.UIStroke_101 = Instance.new("UIStroke")
G.UIStroke_101.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
G.UIStroke_101.Color = Color3.fromRGB(31, 54, 40)
G.UIStroke_101.Transparency = 0.44999998807907104
G.UIStroke_101.Parent = G.Frame_221

-- TextLabel_82 (TextLabel)
G.TextLabel_82 = Instance.new("TextLabel")
G.TextLabel_82.BackgroundTransparency = 1
G.TextLabel_82.Position = UDim2.new(0, 16, 0, 0)
G.TextLabel_82.Size = UDim2.new(0, 112, 1, 0)
G.TextLabel_82.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal)
G.TextLabel_82.Text = "Intro Music"
G.TextLabel_82.TextColor3 = Color3.fromRGB(220, 239, 228)
G.TextLabel_82.TextSize = 13
G.TextLabel_82.TextXAlignment = Enum.TextXAlignment.Left
G.TextLabel_82.Parent = G.Frame_221

-- TextButton_85 (TextButton)
G.TextButton_85 = Instance.new("TextButton")
G.TextButton_85.BackgroundColor3 = Color3.fromRGB(14, 76, 38)
G.TextButton_85.BorderSizePixel = 0
G.TextButton_85.Position = UDim2.new(1, -154, 0.5, -14)
G.TextButton_85.Size = UDim2.new(0, 70, 0, 28)
G.TextButton_85.ZIndex = 8
G.TextButton_85.AutoButtonColor = false
G.TextButton_85.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Heavy, Enum.FontStyle.Normal)
G.TextButton_85.Text = "Default"
G.TextButton_85.TextColor3 = Color3.fromRGB(145, 255, 185)
G.TextButton_85.TextSize = 11
G.TextButton_85.TextWrapped = true
G.TextButton_85:SetAttribute("SelectorActive", true)
G.TextButton_85.Parent = G.Frame_221

-- UICorner_227 (UICorner)
G.UICorner_227 = Instance.new("UICorner")
G.UICorner_227.Parent = G.TextButton_85

-- SelectorStroke_7 (UIStroke)
G.SelectorStroke_7 = Instance.new("UIStroke")
G.SelectorStroke_7.Name = "SelectorStroke"
G.SelectorStroke_7.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
G.SelectorStroke_7.Color = Color3.fromRGB(80, 255, 145)
G.SelectorStroke_7.Thickness = 1.6000000238418579
G.SelectorStroke_7.Transparency = 0.019999999552965164
G.SelectorStroke_7.Parent = G.TextButton_85

-- SelectorShine_7 (Frame)
G.SelectorShine_7 = Instance.new("Frame")
G.SelectorShine_7.Name = "SelectorShine"
G.SelectorShine_7.BackgroundColor3 = Color3.fromRGB(180, 255, 205)
G.SelectorShine_7.BackgroundTransparency = 1
G.SelectorShine_7.BorderSizePixel = 0
G.SelectorShine_7.Size = UDim2.new(1, 0, 0, 10)
G.SelectorShine_7.ZIndex = 9
G.SelectorShine_7.Parent = G.TextButton_85

-- UICorner_228 (UICorner)
G.UICorner_228 = Instance.new("UICorner")
G.UICorner_228.Parent = G.SelectorShine_7

-- TextButton_86 (TextButton)
G.TextButton_86 = Instance.new("TextButton")
G.TextButton_86.BackgroundColor3 = Color3.fromRGB(6, 14, 10)
G.TextButton_86.BorderSizePixel = 0
G.TextButton_86.Position = UDim2.new(1, -76, 0.5, -14)
G.TextButton_86.Size = UDim2.new(0, 66, 0, 28)
G.TextButton_86.ZIndex = 8
G.TextButton_86.AutoButtonColor = false
G.TextButton_86.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Heavy, Enum.FontStyle.Normal)
G.TextButton_86.Text = "Intro 3"
G.TextButton_86.TextColor3 = Color3.fromRGB(225, 240, 230)
G.TextButton_86.TextSize = 11
G.TextButton_86.TextWrapped = true
G.TextButton_86:SetAttribute("SelectorActive", false)
G.TextButton_86.Parent = G.Frame_221

-- UICorner_229 (UICorner)
G.UICorner_229 = Instance.new("UICorner")
G.UICorner_229.Parent = G.TextButton_86

-- SelectorStroke_8 (UIStroke)
G.SelectorStroke_8 = Instance.new("UIStroke")
G.SelectorStroke_8.Name = "SelectorStroke"
G.SelectorStroke_8.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
G.SelectorStroke_8.Color = Color3.fromRGB(24, 54, 34)
G.SelectorStroke_8.Transparency = 0.64999997615814209
G.SelectorStroke_8.Parent = G.TextButton_86

-- SelectorShine_8 (Frame)
G.SelectorShine_8 = Instance.new("Frame")
G.SelectorShine_8.Name = "SelectorShine"
G.SelectorShine_8.BackgroundColor3 = Color3.fromRGB(180, 255, 205)
G.SelectorShine_8.BackgroundTransparency = 1
G.SelectorShine_8.BorderSizePixel = 0
G.SelectorShine_8.Size = UDim2.new(1, 0, 0, 10)
G.SelectorShine_8.ZIndex = 9
G.SelectorShine_8.Parent = G.TextButton_86

-- UICorner_230 (UICorner)
G.UICorner_230 = Instance.new("UICorner")
G.UICorner_230.Parent = G.SelectorShine_8

-- Frame_222 (Frame)
G.Frame_222 = Instance.new("Frame")
G.Frame_222.BackgroundTransparency = 1
G.Frame_222.BorderSizePixel = 0
G.Frame_222.LayoutOrder = 15
G.Frame_222.Size = UDim2.new(1, 0, 0, 8)
G.Frame_222.Parent = G.Settings

-- Frame_223 (Frame)
G.Frame_223 = Instance.new("Frame")
G.Frame_223.BackgroundColor3 = Color3.fromRGB(40, 92, 64)
G.Frame_223.BackgroundTransparency = 0.25
G.Frame_223.BorderSizePixel = 0
G.Frame_223.LayoutOrder = 16
G.Frame_223.Size = UDim2.new(1, -10, 0, 32)
G.Frame_223.Parent = G.Settings

-- UICorner_231 (UICorner)
G.UICorner_231 = Instance.new("UICorner")
G.UICorner_231.CornerRadius = UDim.new(0, 10)
G.UICorner_231.Parent = G.Frame_223

-- UIStroke_102 (UIStroke)
G.UIStroke_102 = Instance.new("UIStroke")
G.UIStroke_102.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
G.UIStroke_102.Color = Color3.fromRGB(24, 65, 38)
G.UIStroke_102.Transparency = 0.40000000596046448
G.UIStroke_102.Parent = G.Frame_223

-- Frame_224 (Frame)
G.Frame_224 = Instance.new("Frame")
G.Frame_224.BackgroundColor3 = Color3.fromRGB(42, 230, 123)
G.Frame_224.BorderSizePixel = 0
G.Frame_224.Position = UDim2.new(0, 10, 0, 9)
G.Frame_224.Size = UDim2.new(0, 4, 1, -18)
G.Frame_224.Parent = G.Frame_223

-- UICorner_232 (UICorner)
G.UICorner_232 = Instance.new("UICorner")
G.UICorner_232.CornerRadius = UDim.new(0, 2)
G.UICorner_232.Parent = G.Frame_224

-- TextLabel_83 (TextLabel)
G.TextLabel_83 = Instance.new("TextLabel")
G.TextLabel_83.BackgroundTransparency = 1
G.TextLabel_83.Position = UDim2.new(0, 22, 0, 0)
G.TextLabel_83.Size = UDim2.new(1, -30, 1, 0)
G.TextLabel_83.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal)
G.TextLabel_83.Text = "CONFIG"
G.TextLabel_83.TextColor3 = Color3.fromRGB(218, 255, 233)
G.TextLabel_83.TextSize = 13
G.TextLabel_83.TextXAlignment = Enum.TextXAlignment.Left
G.TextLabel_83.Parent = G.Frame_223

-- Frame_225 (Frame)
G.Frame_225 = Instance.new("Frame")
G.Frame_225.BackgroundTransparency = 1
G.Frame_225.BorderSizePixel = 0
G.Frame_225.LayoutOrder = 17
G.Frame_225.Size = UDim2.new(1, 0, 0, 2)
G.Frame_225.Parent = G.Settings

-- Frame_226 (Frame)
G.Frame_226 = Instance.new("Frame")
G.Frame_226.BackgroundTransparency = 1
G.Frame_226.BorderSizePixel = 0
G.Frame_226.LayoutOrder = 18
G.Frame_226.Size = UDim2.new(1, 0, 0, 46)
G.Frame_226.Parent = G.Settings

-- TextButton_87 (TextButton)
G.TextButton_87 = Instance.new("TextButton")
G.TextButton_87.BackgroundColor3 = Color3.fromRGB(42, 230, 123)
G.TextButton_87.BorderSizePixel = 0
G.TextButton_87.Position = UDim2.new(0, 14, 0, 7)
G.TextButton_87.Size = UDim2.new(1, -28, 0, 32)
G.TextButton_87.ZIndex = 5
G.TextButton_87.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal)
G.TextButton_87.Text = "Save Config Now"
G.TextButton_87.TextColor3 = Color3.fromRGB(0, 20, 8)
G.TextButton_87.TextSize = 12
G.TextButton_87.Parent = G.Frame_226

-- UICorner_233 (UICorner)
G.UICorner_233 = Instance.new("UICorner")
G.UICorner_233.CornerRadius = UDim.new(0, 6)
G.UICorner_233.Parent = G.TextButton_87

-- UIStroke_103 (UIStroke)
G.UIStroke_103 = Instance.new("UIStroke")
G.UIStroke_103.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
G.UIStroke_103.Color = Color3.fromRGB(42, 230, 123)
G.UIStroke_103.Parent = G.TextButton_87

-- Frame_227 (Frame)
G.Frame_227 = Instance.new("Frame")
G.Frame_227.BackgroundTransparency = 1
G.Frame_227.LayoutOrder = 19
G.Frame_227.Size = UDim2.new(1, -10, 0, 48)
G.Frame_227.Parent = G.Settings

-- TextButton_88 (TextButton)
G.TextButton_88 = Instance.new("TextButton")
G.TextButton_88.BackgroundColor3 = Color3.fromRGB(80, 25, 25)
G.TextButton_88.BorderSizePixel = 0
G.TextButton_88.Position = UDim2.new(0, 14, 0, 7)
G.TextButton_88.Size = UDim2.new(1, -28, 0, 32)
G.TextButton_88.ZIndex = 5
G.TextButton_88.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal)
G.TextButton_88.Text = " Reset All Settings"
G.TextButton_88.TextColor3 = Color3.fromRGB(255, 200, 200)
G.TextButton_88.TextSize = 12
G.TextButton_88.Parent = G.Frame_227

-- UICorner_234 (UICorner)
G.UICorner_234 = Instance.new("UICorner")
G.UICorner_234.CornerRadius = UDim.new(0, 6)
G.UICorner_234.Parent = G.TextButton_88

-- UIStroke_104 (UIStroke)
G.UIStroke_104 = Instance.new("UIStroke")
G.UIStroke_104.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
G.UIStroke_104.Color = Color3.fromRGB(130, 45, 45)
G.UIStroke_104.Parent = G.TextButton_88

-- Frame_228 (Frame)
G.Frame_228 = Instance.new("Frame")
G.Frame_228.BackgroundTransparency = 1
G.Frame_228.BorderSizePixel = 0
G.Frame_228.LayoutOrder = 20
G.Frame_228.Size = UDim2.new(1, 0, 0, 8)
G.Frame_228.Parent = G.Settings

-- Frame_229 (Frame)
G.Frame_229 = Instance.new("Frame")
G.Frame_229.BackgroundColor3 = Color3.fromRGB(40, 92, 64)
G.Frame_229.BackgroundTransparency = 0.25
G.Frame_229.BorderSizePixel = 0
G.Frame_229.LayoutOrder = 21
G.Frame_229.Size = UDim2.new(1, -10, 0, 32)
G.Frame_229.Parent = G.Settings

-- UICorner_235 (UICorner)
G.UICorner_235 = Instance.new("UICorner")
G.UICorner_235.CornerRadius = UDim.new(0, 10)
G.UICorner_235.Parent = G.Frame_229

-- UIStroke_105 (UIStroke)
G.UIStroke_105 = Instance.new("UIStroke")
G.UIStroke_105.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
G.UIStroke_105.Color = Color3.fromRGB(24, 65, 38)
G.UIStroke_105.Transparency = 0.40000000596046448
G.UIStroke_105.Parent = G.Frame_229

-- Frame_230 (Frame)
G.Frame_230 = Instance.new("Frame")
G.Frame_230.BackgroundColor3 = Color3.fromRGB(42, 230, 123)
G.Frame_230.BorderSizePixel = 0
G.Frame_230.Position = UDim2.new(0, 10, 0, 9)
G.Frame_230.Size = UDim2.new(0, 4, 1, -18)
G.Frame_230.Parent = G.Frame_229

-- UICorner_236 (UICorner)
G.UICorner_236 = Instance.new("UICorner")
G.UICorner_236.CornerRadius = UDim.new(0, 2)
G.UICorner_236.Parent = G.Frame_230

-- TextLabel_84 (TextLabel)
G.TextLabel_84 = Instance.new("TextLabel")
G.TextLabel_84.BackgroundTransparency = 1
G.TextLabel_84.Position = UDim2.new(0, 22, 0, 0)
G.TextLabel_84.Size = UDim2.new(1, -30, 1, 0)
G.TextLabel_84.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal)
G.TextLabel_84.Text = "LAYOUT"
G.TextLabel_84.TextColor3 = Color3.fromRGB(218, 255, 233)
G.TextLabel_84.TextSize = 13
G.TextLabel_84.TextXAlignment = Enum.TextXAlignment.Left
G.TextLabel_84.Parent = G.Frame_229

-- Frame_231 (Frame)
G.Frame_231 = Instance.new("Frame")
G.Frame_231.BackgroundTransparency = 1
G.Frame_231.BorderSizePixel = 0
G.Frame_231.LayoutOrder = 22
G.Frame_231.Size = UDim2.new(1, 0, 0, 2)
G.Frame_231.Parent = G.Settings

-- Frame_232 (Frame)
G.Frame_232 = Instance.new("Frame")
G.Frame_232.BackgroundTransparency = 1
G.Frame_232.BorderSizePixel = 0
G.Frame_232.LayoutOrder = 23
G.Frame_232.Size = UDim2.new(1, 0, 0, 46)
G.Frame_232.Parent = G.Settings

-- TextButton_89 (TextButton)
G.TextButton_89 = Instance.new("TextButton")
G.TextButton_89.BackgroundColor3 = Color3.fromRGB(12, 32, 21)
G.TextButton_89.BorderSizePixel = 0
G.TextButton_89.Position = UDim2.new(0, 14, 0, 7)
G.TextButton_89.Size = UDim2.new(1, -28, 0, 32)
G.TextButton_89.ZIndex = 5
G.TextButton_89.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal)
G.TextButton_89.Text = "Reset Button Positions"
G.TextButton_89.TextColor3 = Color3.fromRGB(190, 239, 207)
G.TextButton_89.TextSize = 12
G.TextButton_89.Parent = G.Frame_232

-- UICorner_237 (UICorner)
G.UICorner_237 = Instance.new("UICorner")
G.UICorner_237.CornerRadius = UDim.new(0, 6)
G.UICorner_237.Parent = G.TextButton_89

-- UIStroke_106 (UIStroke)
G.UIStroke_106 = Instance.new("UIStroke")
G.UIStroke_106.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
G.UIStroke_106.Color = Color3.fromRGB(28, 76, 46)
G.UIStroke_106.Parent = G.TextButton_89

-- Frame_233 (Frame)
G.Frame_233 = Instance.new("Frame")
G.Frame_233.BackgroundTransparency = 1
G.Frame_233.BorderSizePixel = 0
G.Frame_233.LayoutOrder = 24
G.Frame_233.Size = UDim2.new(1, 0, 0, 10)
G.Frame_233.Parent = G.Settings

-- Frame_234 (Frame)
G.Frame_234 = Instance.new("Frame")
G.Frame_234.BackgroundTransparency = 1
G.Frame_234.BorderSizePixel = 0
G.Frame_234.LayoutOrder = 25
G.Frame_234.Size = UDim2.new(1, 0, 0, 22)
G.Frame_234.Parent = G.Settings

-- TextLabel_85 (TextLabel)
G.TextLabel_85 = Instance.new("TextLabel")
G.TextLabel_85.BackgroundTransparency = 1
G.TextLabel_85.Size = UDim2.new(1, 0, 1, 0)
G.TextLabel_85.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal)
G.TextLabel_85.Text = "greenduels powered by luck"
G.TextLabel_85.TextColor3 = Color3.fromRGB(50, 100, 65)
G.TextLabel_85.TextSize = 10
G.TextLabel_85.Parent = G.Frame_234

-- BottomNavigation (Frame)
G.BottomNavigation = Instance.new("Frame")
G.BottomNavigation.Name = "BottomNavigation"
G.BottomNavigation.BackgroundColor3 = Color3.fromRGB(8, 29, 20)
G.BottomNavigation.BackgroundTransparency = 0.079999998211860657
G.BottomNavigation.BorderSizePixel = 0
G.BottomNavigation.Position = UDim2.new(0, 10, 1, -54)
G.BottomNavigation.Size = UDim2.new(1, -20, 0, 44)
G.BottomNavigation.ZIndex = 10
G.BottomNavigation.Parent = G.MainOuter

-- UICorner_238 (UICorner)
G.UICorner_238 = Instance.new("UICorner")
G.UICorner_238.CornerRadius = UDim.new(0, 16)
G.UICorner_238.Parent = G.BottomNavigation

-- UIStroke_107 (UIStroke)
G.UIStroke_107 = Instance.new("UIStroke")
G.UIStroke_107.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
G.UIStroke_107.Color = Color3.fromRGB(58, 143, 99)
G.UIStroke_107.Transparency = 0.34999999403953552
G.UIStroke_107.Parent = G.BottomNavigation

-- Tab_MAIN (TextButton)
G.Tab_MAIN = Instance.new("TextButton")
G.Tab_MAIN.Name = "Tab_MAIN"
G.Tab_MAIN.BackgroundColor3 = Color3.fromRGB(29, 133, 80)
G.Tab_MAIN.BackgroundTransparency = 1
G.Tab_MAIN.BorderSizePixel = 0
G.Tab_MAIN.Position = UDim2.new(0, 3, 0, 4)
G.Tab_MAIN.Size = UDim2.new(0.25, -6, 1, -8)
G.Tab_MAIN.ZIndex = 11
G.Tab_MAIN.AutoButtonColor = false
G.Tab_MAIN.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal)
G.Tab_MAIN.Text = "MAIN"
G.Tab_MAIN.TextColor3 = Color3.fromRGB(143, 185, 160)
G.Tab_MAIN.TextSize = 11
G.Tab_MAIN.Parent = G.BottomNavigation

-- UICorner_239 (UICorner)
G.UICorner_239 = Instance.new("UICorner")
G.UICorner_239.CornerRadius = UDim.new(0, 12)
G.UICorner_239.Parent = G.Tab_MAIN

-- Frame_235 (Frame)
G.Frame_235 = Instance.new("Frame")
G.Frame_235.BackgroundColor3 = Color3.fromRGB(48, 83, 62)
G.Frame_235.BorderSizePixel = 0
G.Frame_235.Position = UDim2.new(0, 13, 1, -6)
G.Frame_235.Size = UDim2.new(1, -26, 0, 3)
G.Frame_235.ZIndex = 12
G.Frame_235.Parent = G.Tab_MAIN

-- UICorner_240 (UICorner)
G.UICorner_240 = Instance.new("UICorner")
G.UICorner_240.CornerRadius = UDim.new(0, 2)
G.UICorner_240.Parent = G.Frame_235

-- Tab_COMBAT (TextButton)
G.Tab_COMBAT = Instance.new("TextButton")
G.Tab_COMBAT.Name = "Tab_COMBAT"
G.Tab_COMBAT.BackgroundColor3 = Color3.fromRGB(29, 133, 80)
G.Tab_COMBAT.BackgroundTransparency = 1
G.Tab_COMBAT.BorderSizePixel = 0
G.Tab_COMBAT.Position = UDim2.new(0.25, 3, 0, 4)
G.Tab_COMBAT.Size = UDim2.new(0.25, -6, 1, -8)
G.Tab_COMBAT.ZIndex = 11
G.Tab_COMBAT.AutoButtonColor = false
G.Tab_COMBAT.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal)
G.Tab_COMBAT.Text = "COMBAT"
G.Tab_COMBAT.TextColor3 = Color3.fromRGB(143, 185, 160)
G.Tab_COMBAT.TextSize = 11
G.Tab_COMBAT.Parent = G.BottomNavigation

-- UICorner_241 (UICorner)
G.UICorner_241 = Instance.new("UICorner")
G.UICorner_241.CornerRadius = UDim.new(0, 12)
G.UICorner_241.Parent = G.Tab_COMBAT

-- Frame_236 (Frame)
G.Frame_236 = Instance.new("Frame")
G.Frame_236.BackgroundColor3 = Color3.fromRGB(48, 83, 62)
G.Frame_236.BorderSizePixel = 0
G.Frame_236.Position = UDim2.new(0, 13, 1, -6)
G.Frame_236.Size = UDim2.new(1, -26, 0, 3)
G.Frame_236.ZIndex = 12
G.Frame_236.Parent = G.Tab_COMBAT

-- UICorner_242 (UICorner)
G.UICorner_242 = Instance.new("UICorner")
G.UICorner_242.CornerRadius = UDim.new(0, 2)
G.UICorner_242.Parent = G.Frame_236

-- Tab_VISUALS (TextButton)
G.Tab_VISUALS = Instance.new("TextButton")
G.Tab_VISUALS.Name = "Tab_VISUALS"
G.Tab_VISUALS.BackgroundColor3 = Color3.fromRGB(29, 133, 80)
G.Tab_VISUALS.BackgroundTransparency = 1
G.Tab_VISUALS.BorderSizePixel = 0
G.Tab_VISUALS.Position = UDim2.new(0.5, 3, 0, 4)
G.Tab_VISUALS.Size = UDim2.new(0.25, -6, 1, -8)
G.Tab_VISUALS.ZIndex = 11
G.Tab_VISUALS.AutoButtonColor = false
G.Tab_VISUALS.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal)
G.Tab_VISUALS.Text = "VISUALS"
G.Tab_VISUALS.TextColor3 = Color3.fromRGB(143, 185, 160)
G.Tab_VISUALS.TextSize = 11
G.Tab_VISUALS.Parent = G.BottomNavigation

-- UICorner_243 (UICorner)
G.UICorner_243 = Instance.new("UICorner")
G.UICorner_243.CornerRadius = UDim.new(0, 12)
G.UICorner_243.Parent = G.Tab_VISUALS

-- Frame_237 (Frame)
G.Frame_237 = Instance.new("Frame")
G.Frame_237.BackgroundColor3 = Color3.fromRGB(48, 83, 62)
G.Frame_237.BorderSizePixel = 0
G.Frame_237.Position = UDim2.new(0, 13, 1, -6)
G.Frame_237.Size = UDim2.new(1, -26, 0, 3)
G.Frame_237.ZIndex = 12
G.Frame_237.Parent = G.Tab_VISUALS

-- UICorner_244 (UICorner)
G.UICorner_244 = Instance.new("UICorner")
G.UICorner_244.CornerRadius = UDim.new(0, 2)
G.UICorner_244.Parent = G.Frame_237

-- Tab_CONFIG (TextButton)
G.Tab_CONFIG = Instance.new("TextButton")
G.Tab_CONFIG.Name = "Tab_CONFIG"
G.Tab_CONFIG.BackgroundColor3 = Color3.fromRGB(29, 133, 80)
G.Tab_CONFIG.BackgroundTransparency = 0.18000000715255737
G.Tab_CONFIG.BorderSizePixel = 0
G.Tab_CONFIG.Position = UDim2.new(0.75, 3, 0, 4)
G.Tab_CONFIG.Size = UDim2.new(0.25, -6, 1, -8)
G.Tab_CONFIG.ZIndex = 11
G.Tab_CONFIG.AutoButtonColor = false
G.Tab_CONFIG.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal)
G.Tab_CONFIG.Text = "CONFIG"
G.Tab_CONFIG.TextColor3 = Color3.fromRGB(232, 255, 242)
G.Tab_CONFIG.TextSize = 11
G.Tab_CONFIG.Parent = G.BottomNavigation

-- UICorner_245 (UICorner)
G.UICorner_245 = Instance.new("UICorner")
G.UICorner_245.CornerRadius = UDim.new(0, 12)
G.UICorner_245.Parent = G.Tab_CONFIG

-- Frame_238 (Frame)
G.Frame_238 = Instance.new("Frame")
G.Frame_238.BackgroundColor3 = Color3.fromRGB(60, 255, 184)
G.Frame_238.BorderSizePixel = 0
G.Frame_238.Position = UDim2.new(0, 13, 1, -6)
G.Frame_238.Size = UDim2.new(1, -26, 0, 3)
G.Frame_238.ZIndex = 12
G.Frame_238.Parent = G.Tab_CONFIG

-- UICorner_246 (UICorner)
G.UICorner_246 = Instance.new("UICorner")
G.UICorner_246.CornerRadius = UDim.new(0, 2)
G.UICorner_246.Parent = G.Frame_238

-- Frame_239 (Frame)
G.Frame_239 = Instance.new("Frame")
G.Frame_239.Active = true
G.Frame_239.BackgroundColor3 = Color3.fromRGB(8, 12, 10)
G.Frame_239.BorderSizePixel = 0
G.Frame_239.Position = UDim2.new(0.5, -200, 0.87999999523162842, 11)
G.Frame_239.Size = UDim2.new(0, 420, 0, 36)
G.Frame_239.Parent = G.greenduelsV2

-- UICorner_247 (UICorner)
G.UICorner_247 = Instance.new("UICorner")
G.UICorner_247.CornerRadius = UDim.new(0, 18)
G.UICorner_247.Parent = G.Frame_239

-- UIStroke_108 (UIStroke)
G.UIStroke_108 = Instance.new("UIStroke")
G.UIStroke_108.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
G.UIStroke_108.Color = Color3.fromRGB(46, 200, 120)
G.UIStroke_108.Thickness = 1.5
G.UIStroke_108.Parent = G.Frame_239

-- UIScale_3 (UIScale)
G.UIScale_3 = Instance.new("UIScale")
G.UIScale_3.Parent = G.Frame_239

-- Frame_240 (Frame)
G.Frame_240 = Instance.new("Frame")
G.Frame_240.BackgroundColor3 = Color3.fromRGB(14, 22, 18)
G.Frame_240.BorderSizePixel = 0
G.Frame_240.ClipsDescendants = true
G.Frame_240.Position = UDim2.new(0, 4, 0, 4)
G.Frame_240.Size = UDim2.new(0, 220, 1, -8)
G.Frame_240.Parent = G.Frame_239

-- UICorner_248 (UICorner)
G.UICorner_248 = Instance.new("UICorner")
G.UICorner_248.CornerRadius = UDim.new(1, 0)
G.UICorner_248.Parent = G.Frame_240

-- Frame_241 (Frame)
G.Frame_241 = Instance.new("Frame")
G.Frame_241.BackgroundColor3 = Color3.fromRGB(0, 220, 80)
G.Frame_241.BorderSizePixel = 0
G.Frame_241.Size = UDim2.new(0, 0, 1, 0)
G.Frame_241.Parent = G.Frame_240

-- UICorner_249 (UICorner)
G.UICorner_249 = Instance.new("UICorner")
G.UICorner_249.CornerRadius = UDim.new(1, 0)
G.UICorner_249.Parent = G.Frame_241

-- TextLabel_86 (TextLabel)
G.TextLabel_86 = Instance.new("TextLabel")
G.TextLabel_86.BackgroundTransparency = 1
G.TextLabel_86.Position = UDim2.new(0, 12, 0, 0)
G.TextLabel_86.Size = UDim2.new(0, 60, 1, 0)
G.TextLabel_86.ZIndex = 5
G.TextLabel_86.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Heavy, Enum.FontStyle.Normal)
G.TextLabel_86.Text = "STEAL"
G.TextLabel_86.TextColor3 = Color3.fromRGB(140, 235, 175)
G.TextLabel_86.TextSize = 12
G.TextLabel_86.TextXAlignment = Enum.TextXAlignment.Left
G.TextLabel_86.Parent = G.Frame_240

-- TextLabel_87 (TextLabel)
G.TextLabel_87 = Instance.new("TextLabel")
G.TextLabel_87.BackgroundTransparency = 1
G.TextLabel_87.Position = UDim2.new(1, -58, 0, 0)
G.TextLabel_87.Size = UDim2.new(0, 50, 1, 0)
G.TextLabel_87.ZIndex = 5
G.TextLabel_87.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Heavy, Enum.FontStyle.Normal)
G.TextLabel_87.Text = "0%"
G.TextLabel_87.TextColor3 = Color3.fromRGB(46, 200, 120)
G.TextLabel_87.TextSize = 13
G.TextLabel_87.TextXAlignment = Enum.TextXAlignment.Right
G.TextLabel_87.Parent = G.Frame_240

-- Frame_242 (Frame)
G.Frame_242 = Instance.new("Frame")
G.Frame_242.BackgroundColor3 = Color3.fromRGB(14, 22, 18)
G.Frame_242.BorderSizePixel = 0
G.Frame_242.Position = UDim2.new(0, 234, 0.5, -12)
G.Frame_242.Size = UDim2.new(0, 70, 0, 24)
G.Frame_242.Parent = G.Frame_239

-- UICorner_250 (UICorner)
G.UICorner_250 = Instance.new("UICorner")
G.UICorner_250.CornerRadius = UDim.new(0, 12)
G.UICorner_250.Parent = G.Frame_242

-- UIStroke_109 (UIStroke)
G.UIStroke_109 = Instance.new("UIStroke")
G.UIStroke_109.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
G.UIStroke_109.Color = Color3.fromRGB(35, 96, 58)
G.UIStroke_109.Parent = G.Frame_242

-- TextLabel_88 (TextLabel)
G.TextLabel_88 = Instance.new("TextLabel")
G.TextLabel_88.BackgroundTransparency = 1
G.TextLabel_88.Position = UDim2.new(0, 8, 0, 0)
G.TextLabel_88.Size = UDim2.new(0, 30, 1, 0)
G.TextLabel_88.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal)
G.TextLabel_88.Text = "FPS"
G.TextLabel_88.TextColor3 = Color3.fromRGB(165, 215, 185)
G.TextLabel_88.TextSize = 10
G.TextLabel_88.TextXAlignment = Enum.TextXAlignment.Left
G.TextLabel_88.Parent = G.Frame_242

-- TextLabel_89 (TextLabel)
G.TextLabel_89 = Instance.new("TextLabel")
G.TextLabel_89.BackgroundTransparency = 1
G.TextLabel_89.Position = UDim2.new(0, 34, 0, 0)
G.TextLabel_89.Size = UDim2.new(1, -40, 1, 0)
G.TextLabel_89.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Heavy, Enum.FontStyle.Normal)
G.TextLabel_89.Text = "59"
G.TextLabel_89.TextColor3 = Color3.fromRGB(245, 255, 248)
G.TextLabel_89.TextSize = 12
G.TextLabel_89.TextXAlignment = Enum.TextXAlignment.Right
G.TextLabel_89.Parent = G.Frame_242

-- Frame_243 (Frame)
G.Frame_243 = Instance.new("Frame")
G.Frame_243.BackgroundColor3 = Color3.fromRGB(14, 22, 18)
G.Frame_243.BorderSizePixel = 0
G.Frame_243.Position = UDim2.new(0, 310, 0.5, -12)
G.Frame_243.Size = UDim2.new(0, 70, 0, 24)
G.Frame_243.Parent = G.Frame_239

-- UICorner_251 (UICorner)
G.UICorner_251 = Instance.new("UICorner")
G.UICorner_251.CornerRadius = UDim.new(0, 12)
G.UICorner_251.Parent = G.Frame_243

-- UIStroke_110 (UIStroke)
G.UIStroke_110 = Instance.new("UIStroke")
G.UIStroke_110.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
G.UIStroke_110.Color = Color3.fromRGB(35, 96, 58)
G.UIStroke_110.Parent = G.Frame_243

-- TextLabel_90 (TextLabel)
G.TextLabel_90 = Instance.new("TextLabel")
G.TextLabel_90.BackgroundTransparency = 1
G.TextLabel_90.Position = UDim2.new(0, 8, 0, 0)
G.TextLabel_90.Size = UDim2.new(0, 30, 1, 0)
G.TextLabel_90.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal)
G.TextLabel_90.Text = "PING"
G.TextLabel_90.TextColor3 = Color3.fromRGB(165, 215, 185)
G.TextLabel_90.TextSize = 10
G.TextLabel_90.TextXAlignment = Enum.TextXAlignment.Left
G.TextLabel_90.Parent = G.Frame_243

-- TextLabel_91 (TextLabel)
G.TextLabel_91 = Instance.new("TextLabel")
G.TextLabel_91.BackgroundTransparency = 1
G.TextLabel_91.Position = UDim2.new(0, 38, 0, 0)
G.TextLabel_91.Size = UDim2.new(0, 34, 1, 0)
G.TextLabel_91.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Heavy, Enum.FontStyle.Normal)
G.TextLabel_91.Text = "16 ms"
G.TextLabel_91.TextColor3 = Color3.fromRGB(245, 255, 248)
G.TextLabel_91.TextSize = 12
G.TextLabel_91.TextXAlignment = Enum.TextXAlignment.Right
G.TextLabel_91.Parent = G.Frame_243

-- Frame_244 (Frame)
G.Frame_244 = Instance.new("Frame")
G.Frame_244.BackgroundColor3 = Color3.fromRGB(14, 22, 18)
G.Frame_244.BorderSizePixel = 0
G.Frame_244.Position = UDim2.new(1, -30, 0.5, -11)
G.Frame_244.Size = UDim2.new(0, 22, 0, 22)
G.Frame_244.Parent = G.Frame_239

-- UICorner_252 (UICorner)
G.UICorner_252 = Instance.new("UICorner")
G.UICorner_252.CornerRadius = UDim.new(0, 11)
G.UICorner_252.Parent = G.Frame_244

-- UIStroke_111 (UIStroke)
G.UIStroke_111 = Instance.new("UIStroke")
G.UIStroke_111.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
G.UIStroke_111.Color = Color3.fromRGB(46, 200, 120)
G.UIStroke_111.Parent = G.Frame_244

-- Frame_245 (Frame)
G.Frame_245 = Instance.new("Frame")
G.Frame_245.BackgroundColor3 = Color3.new(0.0024522275198251009, 0.86167895793914795, 0.31585785746574402)
G.Frame_245.BorderSizePixel = 0
G.Frame_245.Position = UDim2.new(0.5, -5, 0.5, -5)
G.Frame_245.Size = UDim2.new(0, 10, 0, 10)
G.Frame_245.Parent = G.Frame_244

-- UICorner_253 (UICorner)
G.UICorner_253 = Instance.new("UICorner")
G.UICorner_253.CornerRadius = UDim.new(0, 5)
G.UICorner_253.Parent = G.Frame_245

-- StackBtn_drop (TextButton)
G.StackBtn_drop = Instance.new("TextButton")
G.StackBtn_drop.Name = "StackBtn_drop"
G.StackBtn_drop.BackgroundColor3 = Color3.fromRGB(10, 70, 34)
G.StackBtn_drop.BorderSizePixel = 0
G.StackBtn_drop.Position = UDim2.new(1, -138, 0.5, -161)
G.StackBtn_drop.Size = UDim2.new(0, 58, 0, 58)
G.StackBtn_drop.ZIndex = 15
G.StackBtn_drop.AutoButtonColor = false
G.StackBtn_drop.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal)
G.StackBtn_drop.LineHeight = 1.2000000476837158
G.StackBtn_drop.Text = "DROP\nBR"
G.StackBtn_drop.TextColor3 = Color3.fromRGB(230, 255, 236)
G.StackBtn_drop.TextSize = 11
G.StackBtn_drop.TextWrapped = true
G.StackBtn_drop.Parent = G.greenduelsV2

-- UICorner_254 (UICorner)
G.UICorner_254 = Instance.new("UICorner")
G.UICorner_254.CornerRadius = UDim.new(0, 12)
G.UICorner_254.Parent = G.StackBtn_drop

-- UIStroke_112 (UIStroke)
G.UIStroke_112 = Instance.new("UIStroke")
G.UIStroke_112.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
G.UIStroke_112.Color = Color3.fromRGB(56, 210, 108)
G.UIStroke_112.Parent = G.StackBtn_drop

-- StackBtn_autoLeft (TextButton)
G.StackBtn_autoLeft = Instance.new("TextButton")
G.StackBtn_autoLeft.Name = "StackBtn_autoLeft"
G.StackBtn_autoLeft.BackgroundColor3 = Color3.fromRGB(10, 70, 34)
G.StackBtn_autoLeft.BorderSizePixel = 0
G.StackBtn_autoLeft.Position = UDim2.new(1, -72, 0.5, -161)
G.StackBtn_autoLeft.Size = UDim2.new(0, 58, 0, 58)
G.StackBtn_autoLeft.ZIndex = 15
G.StackBtn_autoLeft.AutoButtonColor = false
G.StackBtn_autoLeft.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal)
G.StackBtn_autoLeft.LineHeight = 1.2000000476837158
G.StackBtn_autoLeft.Text = "AUTO\nLEFT"
G.StackBtn_autoLeft.TextColor3 = Color3.fromRGB(230, 255, 236)
G.StackBtn_autoLeft.TextSize = 11
G.StackBtn_autoLeft.TextWrapped = true
G.StackBtn_autoLeft.Parent = G.greenduelsV2

-- UICorner_255 (UICorner)
G.UICorner_255 = Instance.new("UICorner")
G.UICorner_255.CornerRadius = UDim.new(0, 12)
G.UICorner_255.Parent = G.StackBtn_autoLeft

-- UIStroke_113 (UIStroke)
G.UIStroke_113 = Instance.new("UIStroke")
G.UIStroke_113.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
G.UIStroke_113.Color = Color3.fromRGB(56, 210, 108)
G.UIStroke_113.Parent = G.StackBtn_autoLeft

-- StackBtn_aimbot (TextButton)
G.StackBtn_aimbot = Instance.new("TextButton")
G.StackBtn_aimbot.Name = "StackBtn_aimbot"
G.StackBtn_aimbot.BackgroundColor3 = Color3.fromRGB(10, 70, 34)
G.StackBtn_aimbot.BorderSizePixel = 0
G.StackBtn_aimbot.Position = UDim2.new(1, -138, 0.5, -95)
G.StackBtn_aimbot.Size = UDim2.new(0, 58, 0, 58)
G.StackBtn_aimbot.ZIndex = 15
G.StackBtn_aimbot.AutoButtonColor = false
G.StackBtn_aimbot.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal)
G.StackBtn_aimbot.LineHeight = 1.2000000476837158
G.StackBtn_aimbot.Text = "BAT\nAIMBOT"
G.StackBtn_aimbot.TextColor3 = Color3.fromRGB(230, 255, 236)
G.StackBtn_aimbot.TextSize = 11
G.StackBtn_aimbot.TextWrapped = true
G.StackBtn_aimbot.Parent = G.greenduelsV2

-- UICorner_256 (UICorner)
G.UICorner_256 = Instance.new("UICorner")
G.UICorner_256.CornerRadius = UDim.new(0, 12)
G.UICorner_256.Parent = G.StackBtn_aimbot

-- UIStroke_114 (UIStroke)
G.UIStroke_114 = Instance.new("UIStroke")
G.UIStroke_114.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
G.UIStroke_114.Color = Color3.fromRGB(56, 210, 108)
G.UIStroke_114.Parent = G.StackBtn_aimbot

-- StackBtn_autoRight (TextButton)
G.StackBtn_autoRight = Instance.new("TextButton")
G.StackBtn_autoRight.Name = "StackBtn_autoRight"
G.StackBtn_autoRight.BackgroundColor3 = Color3.fromRGB(10, 70, 34)
G.StackBtn_autoRight.BorderSizePixel = 0
G.StackBtn_autoRight.Position = UDim2.new(1, -72, 0.5, -95)
G.StackBtn_autoRight.Size = UDim2.new(0, 58, 0, 58)
G.StackBtn_autoRight.ZIndex = 15
G.StackBtn_autoRight.AutoButtonColor = false
G.StackBtn_autoRight.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal)
G.StackBtn_autoRight.LineHeight = 1.2000000476837158
G.StackBtn_autoRight.Text = "AUTO\nRIGHT"
G.StackBtn_autoRight.TextColor3 = Color3.fromRGB(230, 255, 236)
G.StackBtn_autoRight.TextSize = 11
G.StackBtn_autoRight.TextWrapped = true
G.StackBtn_autoRight.Parent = G.greenduelsV2

-- UICorner_257 (UICorner)
G.UICorner_257 = Instance.new("UICorner")
G.UICorner_257.CornerRadius = UDim.new(0, 12)
G.UICorner_257.Parent = G.StackBtn_autoRight

-- UIStroke_115 (UIStroke)
G.UIStroke_115 = Instance.new("UIStroke")
G.UIStroke_115.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
G.UIStroke_115.Color = Color3.fromRGB(56, 210, 108)
G.UIStroke_115.Parent = G.StackBtn_autoRight

-- StackBtn_tpDown (TextButton)
G.StackBtn_tpDown = Instance.new("TextButton")
G.StackBtn_tpDown.Name = "StackBtn_tpDown"
G.StackBtn_tpDown.BackgroundColor3 = Color3.fromRGB(10, 70, 34)
G.StackBtn_tpDown.BorderSizePixel = 0
G.StackBtn_tpDown.Position = UDim2.new(1, -138, 0.5, -29)
G.StackBtn_tpDown.Size = UDim2.new(0, 58, 0, 58)
G.StackBtn_tpDown.ZIndex = 15
G.StackBtn_tpDown.AutoButtonColor = false
G.StackBtn_tpDown.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal)
G.StackBtn_tpDown.LineHeight = 1.2000000476837158
G.StackBtn_tpDown.Text = "TP\nDOWN"
G.StackBtn_tpDown.TextColor3 = Color3.fromRGB(230, 255, 236)
G.StackBtn_tpDown.TextSize = 11
G.StackBtn_tpDown.TextWrapped = true
G.StackBtn_tpDown.Parent = G.greenduelsV2

-- UICorner_258 (UICorner)
G.UICorner_258 = Instance.new("UICorner")
G.UICorner_258.CornerRadius = UDim.new(0, 12)
G.UICorner_258.Parent = G.StackBtn_tpDown

-- UIStroke_116 (UIStroke)
G.UIStroke_116 = Instance.new("UIStroke")
G.UIStroke_116.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
G.UIStroke_116.Color = Color3.fromRGB(56, 210, 108)
G.UIStroke_116.Parent = G.StackBtn_tpDown

-- StackBtn_carrySpeed (TextButton)
G.StackBtn_carrySpeed = Instance.new("TextButton")
G.StackBtn_carrySpeed.Name = "StackBtn_carrySpeed"
G.StackBtn_carrySpeed.BackgroundColor3 = Color3.fromRGB(10, 70, 34)
G.StackBtn_carrySpeed.BorderSizePixel = 0
G.StackBtn_carrySpeed.Position = UDim2.new(1, -72, 0.5, -29)
G.StackBtn_carrySpeed.Size = UDim2.new(0, 58, 0, 58)
G.StackBtn_carrySpeed.ZIndex = 15
G.StackBtn_carrySpeed.AutoButtonColor = false
G.StackBtn_carrySpeed.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal)
G.StackBtn_carrySpeed.LineHeight = 1.2000000476837158
G.StackBtn_carrySpeed.Text = "CARRY\nSPD"
G.StackBtn_carrySpeed.TextColor3 = Color3.fromRGB(230, 255, 236)
G.StackBtn_carrySpeed.TextSize = 11
G.StackBtn_carrySpeed.TextWrapped = true
G.StackBtn_carrySpeed.Parent = G.greenduelsV2

-- UICorner_259 (UICorner)
G.UICorner_259 = Instance.new("UICorner")
G.UICorner_259.CornerRadius = UDim.new(0, 12)
G.UICorner_259.Parent = G.StackBtn_carrySpeed

-- UIStroke_117 (UIStroke)
G.UIStroke_117 = Instance.new("UIStroke")
G.UIStroke_117.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
G.UIStroke_117.Color = Color3.fromRGB(56, 210, 108)
G.UIStroke_117.Parent = G.StackBtn_carrySpeed

-- StackBtn_laggerCarry (TextButton)
G.StackBtn_laggerCarry = Instance.new("TextButton")
G.StackBtn_laggerCarry.Name = "StackBtn_laggerCarry"
G.StackBtn_laggerCarry.BackgroundColor3 = Color3.fromRGB(10, 70, 34)
G.StackBtn_laggerCarry.BorderSizePixel = 0
G.StackBtn_laggerCarry.Position = UDim2.new(1, -138, 0.5, 37)
G.StackBtn_laggerCarry.Size = UDim2.new(0, 58, 0, 58)
G.StackBtn_laggerCarry.ZIndex = 15
G.StackBtn_laggerCarry.AutoButtonColor = false
G.StackBtn_laggerCarry.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal)
G.StackBtn_laggerCarry.LineHeight = 1.2000000476837158
G.StackBtn_laggerCarry.Text = "LAGGER\nCARRY"
G.StackBtn_laggerCarry.TextColor3 = Color3.fromRGB(230, 255, 236)
G.StackBtn_laggerCarry.TextSize = 11
G.StackBtn_laggerCarry.TextWrapped = true
G.StackBtn_laggerCarry.Parent = G.greenduelsV2

-- UICorner_260 (UICorner)
G.UICorner_260 = Instance.new("UICorner")
G.UICorner_260.CornerRadius = UDim.new(0, 12)
G.UICorner_260.Parent = G.StackBtn_laggerCarry

-- UIStroke_118 (UIStroke)
G.UIStroke_118 = Instance.new("UIStroke")
G.UIStroke_118.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
G.UIStroke_118.Color = Color3.fromRGB(56, 210, 108)
G.UIStroke_118.Parent = G.StackBtn_laggerCarry

-- StackBtn_lagger (TextButton)
G.StackBtn_lagger = Instance.new("TextButton")
G.StackBtn_lagger.Name = "StackBtn_lagger"
G.StackBtn_lagger.BackgroundColor3 = Color3.fromRGB(10, 70, 34)
G.StackBtn_lagger.BorderSizePixel = 0
G.StackBtn_lagger.Position = UDim2.new(1, -72, 0.5, 37)
G.StackBtn_lagger.Size = UDim2.new(0, 58, 0, 58)
G.StackBtn_lagger.ZIndex = 15
G.StackBtn_lagger.AutoButtonColor = false
G.StackBtn_lagger.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal)
G.StackBtn_lagger.LineHeight = 1.2000000476837158
G.StackBtn_lagger.Text = "LAGGER\nMODE"
G.StackBtn_lagger.TextColor3 = Color3.fromRGB(230, 255, 236)
G.StackBtn_lagger.TextSize = 11
G.StackBtn_lagger.TextWrapped = true
G.StackBtn_lagger.Parent = G.greenduelsV2

-- UICorner_261 (UICorner)
G.UICorner_261 = Instance.new("UICorner")
G.UICorner_261.CornerRadius = UDim.new(0, 12)
G.UICorner_261.Parent = G.StackBtn_lagger

-- UIStroke_119 (UIStroke)
G.UIStroke_119 = Instance.new("UIStroke")
G.UIStroke_119.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
G.UIStroke_119.Color = Color3.fromRGB(56, 210, 108)
G.UIStroke_119.Parent = G.StackBtn_lagger

-- StackBtn_aimbot2 (TextButton)
G.StackBtn_aimbot2 = Instance.new("TextButton")
G.StackBtn_aimbot2.Name = "StackBtn_aimbot2"
G.StackBtn_aimbot2.BackgroundColor3 = Color3.fromRGB(10, 70, 34)
G.StackBtn_aimbot2.BorderSizePixel = 0
G.StackBtn_aimbot2.Position = UDim2.new(1, -138, 0.5, 103)
G.StackBtn_aimbot2.Size = UDim2.new(0, 58, 0, 58)
G.StackBtn_aimbot2.ZIndex = 15
G.StackBtn_aimbot2.AutoButtonColor = false
G.StackBtn_aimbot2.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal)
G.StackBtn_aimbot2.LineHeight = 1.2000000476837158
G.StackBtn_aimbot2.Text = "TP\nAIMBOT"
G.StackBtn_aimbot2.TextColor3 = Color3.fromRGB(230, 255, 236)
G.StackBtn_aimbot2.TextSize = 11
G.StackBtn_aimbot2.TextWrapped = true
G.StackBtn_aimbot2.Parent = G.greenduelsV2

-- UICorner_262 (UICorner)
G.UICorner_262 = Instance.new("UICorner")
G.UICorner_262.CornerRadius = UDim.new(0, 12)
G.UICorner_262.Parent = G.StackBtn_aimbot2

-- UIStroke_120 (UIStroke)
G.UIStroke_120 = Instance.new("UIStroke")
G.UIStroke_120.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
G.UIStroke_120.Color = Color3.fromRGB(56, 210, 108)
G.UIStroke_120.Parent = G.StackBtn_aimbot2

-- StackBtn_reset (TextButton)
G.StackBtn_reset = Instance.new("TextButton")
G.StackBtn_reset.Name = "StackBtn_reset"
G.StackBtn_reset.BackgroundColor3 = Color3.fromRGB(10, 70, 34)
G.StackBtn_reset.BorderSizePixel = 0
G.StackBtn_reset.Position = UDim2.new(1, -72, 0.5, 103)
G.StackBtn_reset.Size = UDim2.new(0, 58, 0, 58)
G.StackBtn_reset.ZIndex = 15
G.StackBtn_reset.AutoButtonColor = false
G.StackBtn_reset.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal)
G.StackBtn_reset.LineHeight = 1.2000000476837158
G.StackBtn_reset.Text = "RESET"
G.StackBtn_reset.TextColor3 = Color3.fromRGB(230, 255, 236)
G.StackBtn_reset.TextSize = 11
G.StackBtn_reset.TextWrapped = true
G.StackBtn_reset.Parent = G.greenduelsV2

-- UICorner_263 (UICorner)
G.UICorner_263 = Instance.new("UICorner")
G.UICorner_263.CornerRadius = UDim.new(0, 12)
G.UICorner_263.Parent = G.StackBtn_reset

-- UIStroke_121 (UIStroke)
G.UIStroke_121 = Instance.new("UIStroke")
G.UIStroke_121.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
G.UIStroke_121.Color = Color3.fromRGB(56, 210, 108)
G.UIStroke_121.Parent = G.StackBtn_reset

-- greenduelsClover (TextButton)
G.greenduelsClover = Instance.new("TextButton")
G.greenduelsClover.Name = "greenduelsClover"
G.greenduelsClover.BackgroundColor3 = Color3.fromRGB(22, 86, 38)
G.greenduelsClover.BorderSizePixel = 0
G.greenduelsClover.Position = UDim2.new(0, 13, 0, 102)
G.greenduelsClover.Size = UDim2.new(0, 140, 0, 36)
G.greenduelsClover.ZIndex = 25
G.greenduelsClover.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal)
G.greenduelsClover.Text = "greenduels"
G.greenduelsClover.TextColor3 = Color3.fromRGB(210, 255, 220)
G.greenduelsClover.TextSize = 14
G.greenduelsClover.Parent = G.greenduelsV2

-- UICorner_264 (UICorner)
G.UICorner_264 = Instance.new("UICorner")
G.UICorner_264.CornerRadius = UDim.new(0, 12)
G.UICorner_264.Parent = G.greenduelsClover

-- UIStroke_122 (UIStroke)
G.UIStroke_122 = Instance.new("UIStroke")
G.UIStroke_122.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
G.UIStroke_122.Color = Color3.fromRGB(80, 255, 140)
G.UIStroke_122.Thickness = 1.5
G.UIStroke_122.Parent = G.greenduelsClover

-- UIGradient_2 (UIGradient)
G.UIGradient_2 = Instance.new("UIGradient")
G.UIGradient_2.Color = ColorSequence.new({ColorSequenceKeypoint.new(0, Color3.fromRGB(28, 180, 72)), ColorSequenceKeypoint.new(0.51999998092651367, Color3.fromRGB(80, 255, 140)), ColorSequenceKeypoint.new(1, Color3.fromRGB(220, 255, 90))})
G.UIGradient_2.Rotation = 18
G.UIGradient_2.Parent = G.greenduelsClover

-- mount
G.greenduelsV2.Parent = game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui")


-- â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•
--  Xavi Recorder v4.0 - geleerd gedrag
--  6538 events | 25 toggles | 4 groepen | 1 scrollers | 0 templates
-- â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•

-- â•â•â• Toggles â•â•â•
local _toggles = {
    { button = G.TextButton, target = G.MainOuter, prop = "Visible" },
    { button = G.TextButton_18, target = G.Frame_49, prop = "BackgroundColor3" },
    { button = G.greenduelsClover, target = G.MainOuter, prop = "Visible" },
    { button = G.StackBtn_drop, target = G.TextLabel_89, prop = "Text" },
    { button = G.TextButton_67, target = G.Frame_172, prop = "BackgroundColor3" },
    { button = G.StackBtn_laggerCarry, target = G.TextLabel_9, prop = "Text" },
    { button = G.TextButton_24, target = G.TextLabel_85, prop = "Text" },
    { button = G.TextButton_89, target = G.TextLabel_89, prop = "Text" },
    { button = G.TextButton_60, target = G.TextLabel_85, prop = "Text" },
    { button = G.TextButton_26, target = G.TextLabel_85, prop = "Text" },
    { button = G.Tab_VISUALS, target = G.Visual, prop = "Visible" },
    { button = G.TextButton_44, target = G.TextLabel_89, prop = "Text" },
    { button = G.TextButton_87, target = G.TextButton_87, prop = "BackgroundColor3" },
    { button = G.StackBtn_autoRight, target = G.TextLabel_89, prop = "Text" },
    { button = G.Tab_CONFIG, target = G.Visual, prop = "Visible" },
    { button = G.StackBtn_lagger, target = G.TextLabel_9, prop = "Text" },
    { button = G.StackBtn_aimbot2, target = G.TextLabel_85, prop = "Text" },
    { button = G.TextButton_20, target = G.Frame_52, prop = "BackgroundColor3" },
    { button = G.StackBtn_tpDown, target = G.StackBtn_tpDown, prop = "BackgroundColor3" },
    { button = G.StackBtn_aimbot, target = G.TextLabel_85, prop = "Text" },
    { button = G.StackBtn_reset, target = G.TextLabel_85, prop = "Text" },
    { button = G.Tab_COMBAT, target = G.Speed, prop = "Visible" },
    { button = G.StackBtn_autoLeft, target = G.TextLabel_89, prop = "Text" },
    { button = G.StackBtn_carrySpeed, target = G.TextLabel_85, prop = "Text" },
    { button = G.TextButton_84, target = G.TextLabel_85, prop = "Text" },
}
for _, _t in ipairs(_toggles) do
    _t.button.MouseButton1Click:Connect(function()
        _t.target[_t.prop] = not _t.target[_t.prop]
    end)
end


-- â•â•â• Groepen (radio-style) â•â•â•
--   MainOuter.Visible  <-  TextButton, greenduelsClover
--   TextLabel.Text  <-  StackBtn_drop, StackBtn_laggerCarry, TextButton, TextButton, TextButton, TextButton, TextButton, StackBtn_autoRight, StackBtn_lagger, StackBtn_aimbot2, StackBtn_aimbot, StackBtn_reset, StackBtn_autoLeft, StackBtn_carrySpeed, TextButton
--   Visual.Visible  <-  Tab_VISUALS, Tab_CONFIG
--   Frame.BackgroundColor3  <-  TextButton, TextButton, TextButton
return G.greenduelsV2