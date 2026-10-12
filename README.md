# ⚡ JoseAngel_Bloxx Gaming Booster

Un script personalizado en Luau diseñado exclusivamente para **Delta Executor** en Roblox. Este HUD flotante simula el rendimiento de un teléfono gamer de alta gama, mostrando en tiempo real los **FPS** y el **Ping** con una interfaz minimalista y moderna de color rojo.

## 🚀 Características

* **Rendimiento en Vivo:** Monitorea tus FPS actuales y la latencia (Ping) del servidor.
* **Estilo Gamer Personalizado:** Interfaz con temática de **JoseAngel_Bloxx Gaming**, diseñada completamente en tonos rojos translúcidos y bordes brillantes.
* **100% Interactivo:** Totalmente **arrastrable** (draggable) para que puedas colocarlo en la parte de la pantalla que prefieras sin estorbar tu juego.
* **Ligero y Seguro:** Optimizado para ejecutarse en dispositivos móviles y PC mediante Delta Executor sin causar *lag*.

#fpsLabel.TextXAlignment = Enum.TextXAlignment.Left
fpsLabel.Parent = mainFrame

-- Etiqueta de Ping
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

-- Lógica de actualización en tiempo real
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
