-- Placer dette Script INDEN I Part'en, der hedder Grill.
-- Grillens forløb: tom → tilbereder → perfekt → brændt (med ild).

local grill = script.Parent

local COOK_TIME = 6
local PERFECT_WINDOW = 4
local REWARD = 10
local EXTINGUISH_HOLD = 3

local state = "Tom"
local fire = nil

local prompt = Instance.new("ProximityPrompt")
prompt.ActionText = "Læg burger på"
prompt.ObjectText = "Grill"
prompt.HoldDuration = 0.5
prompt.MaxActivationDistance = 10
prompt.Parent = grill

local extinguishPrompt = Instance.new("ProximityPrompt")
extinguishPrompt.Name = "SlukBrand"
extinguishPrompt.ActionText = "Sluk brand"
extinguishPrompt.ObjectText = "Grill"
extinguishPrompt.HoldDuration = EXTINGUISH_HOLD
extinguishPrompt.MaxActivationDistance = 10
extinguishPrompt.Enabled = false
extinguishPrompt.Parent = grill

local function setFire(enabled)
	if enabled then
		if fire == nil or fire.Parent == nil then
			fire = Instance.new("Fire")
			fire.Size = 8
			fire.Heat = 9
			fire.Parent = grill
		end
	elseif fire then
		fire:Destroy()
		fire = nil
	end
end

local function updateGrill()
	if state == "Tom" then
		setFire(false)
		grill.Color = Color3.fromRGB(55, 55, 55)
		prompt.ActionText = "Læg burger på"
		prompt.Enabled = true
		extinguishPrompt.Enabled = false
	elseif state == "Tilbereder" then
		setFire(false)
		grill.Color = Color3.fromRGB(255, 135, 30)
		prompt.ActionText = "Burger tilberedes..."
		prompt.Enabled = true
		extinguishPrompt.Enabled = false
	elseif state == "Perfekt" then
		setFire(false)
		grill.Color = Color3.fromRGB(50, 255, 120)
		prompt.ActionText = "Servér perfekt burger"
		prompt.Enabled = true
		extinguishPrompt.Enabled = false
	elseif state == "Brændt" then
		setFire(true)
		grill.Color = Color3.fromRGB(240, 45, 45)
		prompt.Enabled = false
		extinguishPrompt.Enabled = true
	end
end

local function giveCash(player)
	local leaderstats = player:FindFirstChild("leaderstats")
	local cash = leaderstats and leaderstats:FindFirstChild("Cash")
	if cash then
		cash.Value += REWARD
	end
end

prompt.Triggered:Connect(function(player)
	if state == "Tom" then
		state = "Tilbereder"
		updateGrill()

		task.delay(COOK_TIME, function()
			if state ~= "Tilbereder" then
				return
			end

			state = "Perfekt"
			updateGrill()

			task.delay(PERFECT_WINDOW, function()
				if state == "Perfekt" then
					state = "Brændt"
					updateGrill()
				end
			end)
		end)
	elseif state == "Perfekt" then
		giveCash(player)
		state = "Tom"
		updateGrill()
	end
end)

extinguishPrompt.Triggered:Connect(function()
	if state == "Brændt" then
		state = "Tom"
		updateGrill()
	end
end)

updateGrill()
