-- Placer dette Script i ServerScriptService og kald det Orders.
-- Viser en simpel kundeordre i Workspace som StringValue "CurrentOrder".

local Workspace = game:GetService("Workspace")

local ORDER_ACTIVE = 15
local ORDER_IDLE = 5 -- 15 + 5 = 20 sekunder pr. cyklus

local currentOrder = Workspace:FindFirstChild("CurrentOrder")
if currentOrder and not currentOrder:IsA("StringValue") then
	currentOrder:Destroy()
	currentOrder = nil
end

if not currentOrder then
	currentOrder = Instance.new("StringValue")
	currentOrder.Name = "CurrentOrder"
	currentOrder.Parent = Workspace
end

currentOrder.Value = ""

while true do
	-- Ny ordre: spilleren har 15 sekunder til at nå en burger.
	currentOrder.Value = "Burger"
	task.wait(ORDER_ACTIVE)

	-- Pause, indtil næste 20-sekunders cyklus starter.
	currentOrder.Value = ""
	task.wait(ORDER_IDLE)
end
