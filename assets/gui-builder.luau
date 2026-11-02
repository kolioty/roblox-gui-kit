--!strict
-- gui-builder.luau — pegar al inicio del código de execute_luau (datamodel Edit).
-- Aplica los tokens medidos en Workspace.guiskills. Ver references/design-tokens.md.

local GUI = {}

GUI.FONT_FAMILY = "rbxasset://fonts/families/GothamSSm.json"
GUI.Tex = {
	Bevel = "rbxassetid://136393561370347",        -- 9-slice
	InnerShine = "rbxassetid://136517247509877",   -- 9-slice
	DropShadow = "rbxassetid://96735047582734",    -- 9-slice
	Studs = "rbxassetid://116016239612262",        -- tile 40px
	StudsWide = "rbxassetid://96154824437669",     -- tile banda ancha
	Pattern = "rbxassetid://90325592797235",       -- tile 32px (ventanas)
	Shadow = "rbxassetid://89372974673819",
	GlossButton = "rbxassetid://96838784635213",
	Glow = "rbxassetid://90037639296620",
	Sunburst = "rbxassetid://123171646849062",
	Check = "rbxassetid://104873662023098",
	Lock = "rbxassetid://99544278596149",
	Close = "rbxassetid://103629884938513",
	Cash = "rbxassetid://100451594632335",
	Speed = "rbxassetid://79732991925872",
}

-- Parejas de gradiente (abajo → arriba con Rotation -90)
GUI.Colors = {
	Green  = { Color3.fromHex("1DCB32"), Color3.fromHex("A6FF00") },
	Blue   = { Color3.fromHex("007BFF"), Color3.fromHex("00EAFF") },
	Purple = { Color3.fromHex("BF00FF"), Color3.fromHex("FF72FF") },
	Red    = { Color3.fromHex("BC0000"), Color3.fromHex("FF6767") },
	Orange = { Color3.fromHex("FF6900"), Color3.fromHex("FFB36B") },
	Gold   = { Color3.fromHex("FFAA00"), Color3.fromHex("FFFF00") },
	Gray   = { Color3.fromHex("969696"), Color3.fromHex("C6C6C6") },
}
GUI.DarkStroke = Color3.fromHex("161A21")

local function new(class: string, props: { [string]: any }?, parent: Instance?): any
	local inst = Instance.new(class)
	if props then
		for k, v in props do
			(inst :: any)[k] = v
		end
	end
	if parent then inst.Parent = parent end
	return inst
end
GUI.new = new

function GUI.font(weight: string?): Font
	return Font.new(GUI.FONT_FAMILY, Enum.FontWeight[weight or "ExtraBold"])
end

function GUI.darken(c: Color3, f: number?): Color3
	local k = f or 0.2
	return Color3.new(c.R * k, c.G * k, c.B * k)
end

function GUI.gradient(parent: Instance, c0: Color3, c1: Color3, rotation: number?)
	return new("UIGradient", { Color = ColorSequence.new(c0, c1), Rotation = rotation or -90 }, parent)
end

function GUI.stroke(parent: Instance, thickness: number?, color: Color3?, border: boolean?, scaled: boolean?)
	return new("UIStroke", {
		Thickness = thickness or 4.5,
		Color = color or GUI.DarkStroke,
		ApplyStrokeMode = border and Enum.ApplyStrokeMode.Border or Enum.ApplyStrokeMode.Contextual,
		LineJoinMode = Enum.LineJoinMode.Round,
		StrokeSizingMode = scaled and Enum.StrokeSizingMode.ScaledSize or Enum.StrokeSizingMode.FixedSize,
	}, parent)
end

function GUI.aspect(parent: Instance, ratio: number)
	return new("UIAspectRatioConstraint", { AspectRatio = ratio }, parent)
end

function GUI.screen(name: string, parent: Instance, displayOrder: number?, windowMode: boolean?)
	return new("ScreenGui", {
		Name = name,
		ResetOnSpawn = false,
		ZIndexBehavior = Enum.ZIndexBehavior.Sibling,
		DisplayOrder = displayOrder or 1,
		IgnoreGuiInset = not windowMode,
		ScreenInsets = windowMode and Enum.ScreenInsets.CoreUISafeInsets or Enum.ScreenInsets.DeviceSafeInsets,
	}, parent)
end

-- Texto blanco TextScaled con contorno oscuro (estilo A)
function GUI.label(parent: Instance, o: {
	Text: string, Name: string?, Size: UDim2?, Position: UDim2?, AnchorPoint: Vector2?,
	Weight: string?, Color: Color3?, Gradient: { Color3 }?, Align: Enum.TextXAlignment?, Stroke: number?, StrokeColor: Color3?,
})
	local l = new("TextLabel", {
		Name = o.Name or "Title",
		BackgroundTransparency = 1,
		Size = o.Size or UDim2.fromScale(1, 1),
		Position = o.Position or UDim2.fromScale(0.5, 0.5),
		AnchorPoint = o.AnchorPoint or Vector2.new(0.5, 0.5),
		FontFace = GUI.font(o.Weight),
		Text = o.Text,
		TextColor3 = o.Color or Color3.new(1, 1, 1),
		TextScaled = true,
		TextSize = 14,
		TextXAlignment = o.Align or Enum.TextXAlignment.Center,
		ZIndex = 2,
	}, parent)
	new("UIStroke", {
		Name = "Outer", Thickness = o.Stroke or 4.5, Color = o.StrokeColor or GUI.DarkStroke,
		ApplyStrokeMode = Enum.ApplyStrokeMode.Contextual, LineJoinMode = Enum.LineJoinMode.Round,
		StrokeSizingMode = Enum.StrokeSizingMode.FixedSize,
	}, l)
	if o.Gradient then GUI.gradient(l, o.Gradient[1], o.Gradient[2], -90) end
	return l
end

-- Botón estilo A (chunky): gradiente + trazo Border + Bevel + Studs + ButtonTweenScale
function GUI.button(parent: Instance, o: {
	Text: string?, Name: string?, Color: string?, Size: UDim2?, Position: UDim2?, AnchorPoint: Vector2?,
	Aspect: number?, Icon: string?, Corner: number?,
})
	local pair = GUI.Colors[o.Color or "Green"] or GUI.Colors.Green
	local b = new("TextButton", {
		Name = o.Name or "Button",
		Text = "",
		AutoButtonColor = true,
		BackgroundColor3 = Color3.new(1, 1, 1),
		Size = o.Size or UDim2.fromScale(0.2, 0.09),
		Position = o.Position or UDim2.fromScale(0.5, 0.5),
		AnchorPoint = o.AnchorPoint or Vector2.new(0.5, 0.5),
		BorderSizePixel = 0,
	}, parent)
	GUI.gradient(b, pair[1], pair[2], -90).Name = "UiGradient"
	local outer = GUI.stroke(b, 4.5, GUI.darken(pair[1], 0.2), true, false)
	outer.Name = "Outer"
	new("UICorner", { CornerRadius = UDim.new(o.Corner or 0.01, 0) }, b)
	GUI.aspect(b, o.Aspect or 4.12)

	new("ImageLabel", { Name = "Studs", BackgroundTransparency = 1, Size = UDim2.fromScale(1, 1),
		Position = UDim2.fromScale(0.5, 0.5), AnchorPoint = Vector2.new(0.5, 0.5),
		Image = GUI.Tex.Studs, ScaleType = Enum.ScaleType.Tile, TileSize = UDim2.fromOffset(40, 40),
		ImageTransparency = 0.75, ZIndex = -1 }, b)
	new("ImageLabel", { Name = "Bevel", BackgroundTransparency = 1, Size = UDim2.fromScale(1, 1),
		Position = UDim2.fromScale(0.5, 0.5), AnchorPoint = Vector2.new(0.5, 0.5),
		Image = GUI.Tex.Bevel, ScaleType = Enum.ScaleType.Slice, SliceCenter = Rect.new(200, 200, 220, 220),
		SliceScale = 0.1, ImageTransparency = 0.25, ZIndex = 0 }, b)

	local hasIcon = o.Icon ~= nil and o.Icon ~= ""
	if hasIcon then
		local icon = new("ImageLabel", { Name = "Icon", BackgroundTransparency = 1, Image = o.Icon :: string,
			ScaleType = Enum.ScaleType.Fit, Size = UDim2.fromScale(0.925, 0.925),
			Position = UDim2.fromScale(0.046, 0.487), AnchorPoint = Vector2.new(0, 0.5), ZIndex = 1 }, b)
		GUI.aspect(icon, 1)
	end
	if o.Text then
		GUI.label(b, { Text = o.Text, Name = "Title",
			Size = UDim2.fromScale(hasIcon and 0.611 or 0.85, 0.8),
			Position = UDim2.fromScale(hasIcon and 0.575 or 0.5, 0.481) })
	end
	new("UIScale", { Name = "ButtonTweenScale", Scale = 1 }, b)
	return b
end

-- Ventana estilo C: Pattern + 2 trazos + cabecera + botón X + ScrollingFrame
function GUI.panel(parent: Instance, o: { Title: string, Name: string?, Size: UDim2?, Aspect: number?, Scroll: boolean? })
	local base = Color3.fromHex("323241")
	local w = new("ImageLabel", {
		Name = o.Name or "Window", BackgroundColor3 = base, Image = GUI.Tex.Pattern,
		ScaleType = Enum.ScaleType.Tile, TileSize = UDim2.fromOffset(32, 32), ImageTransparency = 0.75,
		Size = o.Size or UDim2.fromScale(0.456, 0.734), Position = UDim2.fromScale(0.5, 0.5),
		AnchorPoint = Vector2.new(0.5, 0.5), BorderSizePixel = 0,
	}, parent)
	GUI.aspect(w, o.Aspect or 1.13)
	GUI.stroke(w, 2.98, Color3.fromHex("52526B"), false, false)
	GUI.stroke(w, 8.23, Color3.fromHex("151515"), false, false)

	local header = new("ImageLabel", {
		Name = "Header", BackgroundColor3 = Color3.new(1, 1, 1), Image = GUI.Tex.Pattern,
		ScaleType = Enum.ScaleType.Tile, TileSize = UDim2.fromOffset(32, 32), ImageTransparency = 0.75,
		Size = UDim2.fromScale(1, 0.131), Position = UDim2.fromScale(0.5, 0.004), AnchorPoint = Vector2.new(0.5, 0.5),
		BorderSizePixel = 0, ZIndex = 2,
	}, w)
	GUI.stroke(header, 2.98, Color3.fromHex("52526B"), false, false)
	GUI.stroke(header, 8.23, Color3.fromHex("151515"), false, false)
	new("UIGradient", { Rotation = 0, Color = ColorSequence.new({
		ColorSequenceKeypoint.new(0, Color3.new(1, 1, 1)),
		ColorSequenceKeypoint.new(0.53, Color3.fromHex("5376AA")),
		ColorSequenceKeypoint.new(1, Color3.new(1, 1, 1)),
	}) }, header)

	for _, pass in { "Title2Stroke", "Title" } do
		local l = new("TextLabel", { Name = pass, BackgroundTransparency = 1, Text = o.Title,
			FontFace = GUI.font("Heavy"), TextScaled = true, TextSize = 14, TextXAlignment = Enum.TextXAlignment.Left,
			TextColor3 = pass == "Title" and Color3.new(1, 1, 1) or Color3.new(0, 0, 0),
			Size = UDim2.fromScale(0.45, 0.728), AnchorPoint = Vector2.zero,
			Position = UDim2.fromScale(0.021, pass == "Title" and 0.124 or 0.149), ZIndex = 3 }, header)
		GUI.stroke(l, pass == "Title" and 2.98 or 4.96, pass == "Title" and Color3.new(0, 0, 0) or base, false, false)
	end

	local close = new("ImageButton", {
		Name = "Close", BackgroundColor3 = Color3.fromHex("FF1414"), Image = "",
		Size = UDim2.fromScale(0.084, 0.095), Position = UDim2.fromScale(0.901, -0.044), BorderSizePixel = 0, ZIndex = 5,
	}, w)
	GUI.aspect(close, 1)
	GUI.stroke(close, 2.98, Color3.new(0, 0, 0), false, false)
	new("UIGradient", { Rotation = 90, Color = ColorSequence.new(Color3.new(1, 1, 1), Color3.fromHex("D3D3D3")) }, close)
	local x = new("TextLabel", { Name = "TextLabel", BackgroundTransparency = 1, Text = "X", FontFace = GUI.font("Heavy"),
		TextColor3 = Color3.new(1, 1, 1), TextScaled = true, TextSize = 14, Size = UDim2.fromScale(0.8, 0.8),
		Position = UDim2.fromScale(0.5, 0.5), AnchorPoint = Vector2.new(0.5, 0.5), ZIndex = 6 }, close)
	GUI.stroke(x, 2.98, Color3.fromHex("4F0707"), false, false)
	new("UIScale", { Name = "ButtonTweenScale", Scale = 1 }, close)

	if o.Scroll ~= false then
		local sf = new("ScrollingFrame", { Name = "ScrollingFrame", BackgroundTransparency = 1, BorderSizePixel = 0,
			Size = UDim2.fromScale(1, 0.9), Position = UDim2.fromScale(0.5, 0.541), AnchorPoint = Vector2.new(0.5, 0.5),
			ScrollBarThickness = 8, CanvasSize = UDim2.new(), AutomaticCanvasSize = Enum.AutomaticSize.Y }, w)
		new("UIListLayout", { Padding = UDim.new(0.014, 0), SortOrder = Enum.SortOrder.LayoutOrder,
			HorizontalAlignment = Enum.HorizontalAlignment.Center }, sf)
	end
	return w
end

-- Píldora de moneda: icono + cantidad con gradiente
function GUI.currency(parent: Instance, o: { Name: string?, Icon: string, Amount: string, Gradient: { Color3 }? })
	local f = new("Frame", { Name = o.Name or "Currency", BackgroundTransparency = 1, Size = UDim2.fromScale(1, 1) }, parent)
	local icon = new("ImageLabel", { Name = "Icon", BackgroundTransparency = 1, Image = o.Icon, ScaleType = Enum.ScaleType.Fit,
		Size = UDim2.fromScale(1, 1), Position = UDim2.fromScale(0, 0.5), AnchorPoint = Vector2.new(0, 0.5), ZIndex = 1 }, f)
	GUI.aspect(icon, 1)
	GUI.label(f, { Name = "Amount", Text = o.Amount, Weight = "Heavy", Align = Enum.TextXAlignment.Left,
		Size = UDim2.fromScale(0.7, 0.8), Position = UDim2.fromScale(0.231, 0.5), AnchorPoint = Vector2.new(0, 0.5),
		Gradient = o.Gradient or { Color3.fromHex("04FF00"), Color3.fromHex("AEFF00") }, StrokeColor = Color3.fromHex("323232") })
	return f
end

return GUI
