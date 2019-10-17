local Player = game.Players.LocalPlayer

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Event = ReplicatedStorage:WaitForChild("DataEvent", 30)
local Item = require(game.ReplicatedStorage.ItemClass)

local invData

function setupInv()
	Event:FireServer()
	
	wait(invData)
	
	print(Player.Name .. "'s Items:")
	if invData ~= nil then
		for i, item in pairs(invData)do
			print("Name:" .. i .. "\nAmount: " .. item.Amount .. "\nType: " .. item.Content.ItemClass)
		end
	end
	
end

function updateInv(newInv)
	invData = newInv
end

Event.OnClientEvent:Connect(updateInv)

setupInv()