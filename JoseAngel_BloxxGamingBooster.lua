-- Servicio para la interfaz y estadísticas
local CoreGui = game:GetService("CoreGui")
local RunService = game:GetService("RunService")
local Stats = game:GetService("Stats")
local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")

local player = Players.LocalPlayer

-- Eliminar GUI anterior si ya estaba ejecutada
if CoreGui:FindFirstChild("JoseAngelBoosterGUI") then
    CoreGui.JoseAngelBoosterGUI:Destroy()
end

-- Crear la pantalla principal (ScreenGui)
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "JoseAngelBoosterGUI"
screenGui.Parent = CoreGui

-- Marco principal (Rojo translúcido y arrastrable)
local mainFrame = Instance.new("Frame")
mainFrame.Size = UDim2.new(0, 200, 0, 100)
mainFrame.Position = UDim2.new(0.05, 0, 0.1, 0)
mainFrame.BackgroundColor3 = Color3.fromRGB(40, 0, 0) -- Fondo rojo oscuro translúcido
mainFrame.BackgroundTransparency = 0.3
mainFrame.BorderSizePixel = 0
mainFrame.Active = true
mainFrame.Draggable = true -- Permite moverlo por la pantalla con el dedo o mouse
mainFrame.Parent = screenGui

-- Esquinas redondeadas
local uiCorner = Instance.new("UICorner")
uiCorner.CornerRadius = UDim.new(0, 12)
uiCorner.Parent = mainFrame

-- Borde brillante rojo
local uiStroke = Instance.new("UIStroke")
uiStroke.Color = Color3.fromRGB(255, 0, 0) -- Rojo brillante
uiStroke.Thickness = 2
uiStroke.Parent = mainFrame

-- Título personalizado en letras rojas
local titleLabel = Instance.new("TextLabel")
titleLabel.Size = UDim2.new(1, 0, 0, 30)
titleLabel.Position = UDim2.new(0, 0, 0, 5)
titleLabel.BackgroundTransparency = 1
titleLabel.Text = "🔥 JoseAngel_Bloxx 🔥"
titleLabel.TextColor3 = Color3.fromRGB(255, 50, 50)
titleLabel.TextSize = 13
titleLabel.Font = Enum.Font.GothamBold
titleLabel.Parent = mainFrame

-- Subtítulo / Modo
local subLabel = Instance.new("TextLabel")
subLabel.Size = UDim2.new(1, 0, 0, 15)
subLabel.Position = UDim2.new(0, 0, 0, 28)
subLabel.BackgroundTransparency = 1
subLabel.Text = "GAMING BOOSTER"
subLabel.TextColor3 = Color3.fromRGB(255, 100, 100)
subLabel.TextSize = 10
subLabel.Font = Enum.Font.GothamBold
subLabel.Parent = mainFrame

-- Etiqueta de FPS (Letras rojas)
local fpsLabel = Instance.new("TextLabel")
fpsLabel.Size = UDim2.new(1, -15, 0, 20)
fpsLabel.Position = UDim2.new(0, 15, 0, 50)
fpsLabel.BackgroundTransparency = 1
fpsLabel.Text = "FPS: Calculating..."
fpsLabel.TextColor3 = Color3.fromRGB(255, 50, 50)
fpsLabel.TextSize = 12
fpsLabel.Font = Enum.Font.GothamMedium
fpsLabel.TextXAlignment = Enum.TextXAlignment.Left
fpsLabel.Parent = mainFrame

-- Etiqueta de Ping (Letras rojas)
local pingLabel = Instance.new("TextLabel")
pingLabel.Size = UDim2.new(1, -15, 0, 20)
pingLabel.Position = UDim2.new(0, 15, 0, 72)
pingLabel.BackgroundTransparency = 1
pingLabel.Text = "PING: Calculating..."
pingLabel.TextColor3 = Color3.fromRGB(255, 50, 50)
pingLabel.TextSize = 12
pingLabel.Font = Enum.Font.GothamMedium
pingLabel.TextXAlignment = Enum.TextXAlignment.Left
pingLabel.Parent = mainFrame

-- Lógica para actualizar FPS y Ping en tiempo real
local lastUpdate = 0
local frameCount = 0

RunService.RenderStepped:Connect(function(dt)
    frameCount = frameCount + 1
    local currentTime = tick()
    
    if currentTime - lastUpdate >= 0.5 then
        local fps = math.floor(frameCount / (currentTime - lastUpdate))
        local ping = math.floor(Stats.Network.ServerStatsItem["Data Ping"]:GetValue())
        
        fpsLabel.Text = "FPS: " .. tostring(fps)
        pingLabel.Text = "PING: " .. tostring(ping) .. " ms"
        
        frameCount = 0
        lastUpdate = currentTime
    end
end)
