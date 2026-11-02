-- button-tween.client.luau
-- LocalScript (poner en StarterPlayerScripts o dentro de la ScreenGui).
-- Anima hover/press de todo botón que tenga un UIScale hijo llamado "ButtonTweenScale"
-- (convención de la librería: 415 botones en guinew). Escala 1 → 1.08 hover → 0.94 press.

local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")

local playerGui = Players.LocalPlayer:WaitForChild("PlayerGui")
local HOVER, PRESS, SPEED = 1.08, 0.94, 0.12
local info = TweenInfo.new(SPEED, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
local wired = setmetatable({}, { __mode = "k" })

local function wire(button: GuiButton)
	if wired[button] then return end
	local scale = button:FindFirstChild("ButtonTweenScale")
	if not (scale and scale:IsA("UIScale")) then return end
	wired[button] = true

	local function to(target: number)
		TweenService:Create(scale, info, { Scale = target }):Play()
	end
	button.MouseEnter:Connect(function() to(HOVER) end)
	button.MouseLeave:Connect(function() to(1) end)
	button.MouseButton1Down:Connect(function() to(PRESS) end)
	button.MouseButton1Up:Connect(function() to(HOVER) end)
end

local function scan(root: Instance)
	for _, d in root:GetDescendants() do
		if d:IsA("GuiButton") then wire(d) end
	end
end

scan(playerGui)
playerGui.DescendantAdded:Connect(function(d)
	if d:IsA("GuiButton") then
		task.defer(wire, d) -- esperar a que existan sus hijos
	end
end)
