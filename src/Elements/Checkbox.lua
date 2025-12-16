local TweenService = game:GetService("TweenService")
local Root = script.Parent.Parent
local Creator = require(Root.Creator)

local New = Creator.New
local Components = Root.Components

local Element = {}
Element.__index = Element
Element.__type = "Checkbox"

function Element:New(Idx, Config)
	local Library = self.Library
	assert(Config.Title, "Checkbox - Missing Title")

	local Checkbox = {
		Value = Config.Default or false,
		Callback = Config.Callback or function(Value) end,
		Type = "Checkbox",
	}

	local CheckboxFrame = require(Components.Element)(Config.Title, Config.Description, self.Container, true)
	CheckboxFrame.DescLabel.Size = UDim2.new(1, -54, 0, 14)

	Checkbox.SetTitle = CheckboxFrame.SetTitle
	Checkbox.SetDesc = CheckboxFrame.SetDesc

	-- Checkbox box (สี่เหลี่ยมจัตุรัส)
	local CheckboxBorder = New("UIStroke", {
		Transparency = 0.3,
		ThemeTag = {
			Color = "ElementBorder",
		},
	})

	local CheckboxBox = New("Frame", {
		Size = UDim2.fromOffset(18, 18),
		AnchorPoint = Vector2.new(1, 0.5),
		Position = UDim2.new(1, -10, 0.5, 0),
		Parent = CheckboxFrame.Frame,
		BackgroundTransparency = 1,
		ThemeTag = {
			BackgroundColor3 = "Element",
		},
	}, {
		New("UICorner", {
			CornerRadius = UDim.new(0, 3),
		}),
		CheckboxBorder,
	})

	-- Checkmark icon (จะแสดงเมื่อ checked)
	local Checkmark = New("ImageLabel", {
		Size = UDim2.fromOffset(12, 12),
		AnchorPoint = Vector2.new(0.5, 0.5),
		Position = UDim2.fromScale(0.5, 0.5),
		Image = "rbxassetid://10709791437", -- ใช้ icon เดียวกับ button
		ImageTransparency = 1,
		BackgroundTransparency = 1,
		Parent = CheckboxBox,
		ThemeTag = {
			ImageColor3 = "Accent",
		},
	})

	-- Background fill (จะแสดงเมื่อ checked)
	local CheckboxFill = New("Frame", {
		Size = UDim2.fromScale(1, 1),
		BackgroundTransparency = 1,
		Parent = CheckboxBox,
		ThemeTag = {
			BackgroundColor3 = "Accent",
		},
	}, {
		New("UICorner", {
			CornerRadius = UDim.new(0, 3),
		}),
	})

	function Checkbox:OnChanged(Func)
		Checkbox.Changed = Func
		Func(Checkbox.Value)
	end

	function Checkbox:SetValue(Value)
		Value = not not Value
		Checkbox.Value = Value

		-- Animate checkmark
		TweenService:Create(
			Checkmark,
			TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
			{ ImageTransparency = Checkbox.Value and 0 or 1 }
		):Play()

		-- Animate background fill
		TweenService:Create(
			CheckboxFill,
			TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
			{ BackgroundTransparency = Checkbox.Value and 0.3 or 1 }
		):Play()

		-- Update border color
		if Checkbox.Value then
			Creator.OverrideTag(CheckboxBorder, { Color = "Accent" })
		else
			Creator.OverrideTag(CheckboxBorder, { Color = "ElementBorder" })
		end

		Library:SafeCallback(Checkbox.Callback, Checkbox.Value)
		Library:SafeCallback(Checkbox.Changed, Checkbox.Value)
	end

	function Checkbox:Destroy()
		CheckboxFrame:Destroy()
		Library.Options[Idx] = nil
	end

	Creator.AddSignal(CheckboxFrame.Frame.MouseButton1Click, function()
		Checkbox:SetValue(not Checkbox.Value)
	end)

	Checkbox:SetValue(Checkbox.Value)

	Library.Options[Idx] = Checkbox
	return Checkbox
end

return Element

