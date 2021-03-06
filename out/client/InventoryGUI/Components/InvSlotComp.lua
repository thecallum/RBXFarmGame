-- Compiled with https://roblox-ts.github.io v0.3.2
-- May 11, 2020, 4:59 PM British Summer Time

local TS = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local exports = {};
local Roact = TS.import(script, TS.getModule(script, "roact").roact.src);
local backgroundColour = Color3.fromRGB(240, 189, 108);
local borderColour = Color3.fromRGB(102, 63, 0);
local selectedBorderColour = Color3.fromRGB(252, 86, 3);
local hoveredBorderColour = Color3.fromRGB(176, 91, 0);
local InvSlot;
do
	InvSlot = Roact.PureComponent:extend("InvSlot");
	function InvSlot:init(props)
		self:setState({
			active = true;
			hovered = false;
		});
		do
			self.selectedBinding, self.changeSelectedBinding = Roact.createBinding(0);
		end;
	end;
	function InvSlot:render()
		local _0 = self.state;
		local active = _0.active;
		local hovered = _0.hovered;
		local clickBorder;
		if self.props.selected then
			clickBorder = selectedBorderColour;
		else
			clickBorder = borderColour;
		end;
		local hoveredBorder;
		if hovered then
			hoveredBorder = hoveredBorderColour;
		else
			hoveredBorder = borderColour;
		end;
						local _1;
						if hovered then
							_1 = 5;
						else
							_1 = 3;
						end;
		return Roact.createElement(
			"Frame",
			{
				LayoutOrder = self.props.order,
				Size = UDim2.new(0, 50, 0, 50),
			},
			{
				["TimeLabel"] = Roact.createElement(
					"TextButton",
					{
						Size = UDim2.new(1, 0, 1, 0),
						Text = self.props.itemName .. " \n " .. tostring(self.props.amount),
						[Roact.Event.MouseEnter] = function(rbx)
							return self:setState({
								hovered = true;
							});
						end,
						[Roact.Event.MouseLeave] = function(rbx)
							return self:setState({
								hovered = false;
							});
						end,
						[Roact.Event.MouseButton1Down] = function(rbx)
							return self.props.onClick();
						end,
						BorderSizePixel = _1,
						BorderColor3 = clickBorder,
						BackgroundColor3 = backgroundColour,
						AutoButtonColor = false,
					}
				),
			}
		);
	end;
end;
exports.InvSlot = InvSlot;
return exports;
