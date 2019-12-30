local Player = game.Players.LocalPlayer

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Event = ReplicatedStorage:WaitForChild("DataEvent", 30)
local Item = require(game.ReplicatedStorage.ItemClass)
local InvComponent = ReplicatedStorage:WaitForChild("InvComponent", 30)


local Rocrastinate = require(ReplicatedStorage:WaitForChild("Rocrastinate"))
local RootReducer = require(InvComponent.RootReducer)
local Actions = require(InvComponent.Actions)
local inventoryStore = Rocrastinate.createStore(RootReducer.reducer, {}) -- setting intiial inventory store state
local PlayerGui = Player:WaitForChild("PlayerGui")
local inventoryDisplay = require(ReplicatedStorage:WaitForChild("InventoryDisplay"))
local repr = require(ReplicatedStorage:WaitForChild("Repr"))

local invData

local function deepCopy(orig)
    local orig_type = type(orig)
    local copy
    if orig_type == 'table' then
        copy = {}
        for orig_key, orig_value in next, orig, nil do
            copy[deepCopy(orig_key)] = deepCopy(orig_value)
        end
        setmetatable(copy, deepCopy(getmetatable(orig)))
    else -- number, string, boolean, etc
        copy = orig
    end
    return copy
end

function SetupInv()
	Event:FireServer()
	
	repeat wait() until invData ~=nil
	
end

function UpdateInv(newInv)
	invData = deepCopy(newInv)
	print(repr(invData, {pretty=true}))
	inventoryStore.dispatch(Actions.setInventory(ReturnInv()))
end

function ReturnInv()
	return invData
end

Event.OnClientEvent:Connect(UpdateInv)

SetupInv()


local middle  = Rocrastinate.InspectorMiddleware.createInspectorMiddleware()
inventoryStore.applyMiddleware(middle)
inventoryStore.dispatch(Actions.setInventory(ReturnInv()))
inventoryDisplay.new(inventoryStore, PlayerGui)