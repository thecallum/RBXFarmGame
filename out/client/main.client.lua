-- Compiled with https://roblox-ts.github.io v0.3.2
-- May 8, 2020, 12:14 PM British Summer Time

local TS = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local makeHello = TS.import(script, game:GetService("ReplicatedStorage"), "TS", "inventory", "module").makeHello;
print(makeHello("main.client.ts"));
