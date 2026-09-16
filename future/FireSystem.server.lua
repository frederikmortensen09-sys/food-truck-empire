--[[
	KLADDE — sæt ikke ind, før du er færdig med at teste den nuværende grill.

	Hvad denne fil er
	-----------------
	Et komplet server-side grill-script med Fire-effekt og et 3-sekunders
	"Sluk brand"-prompt. Tænkt som erstatning for GrillController, ikke som
	et ekstra script ved siden af.

	Kræver (eksisterende)
	---------------------
	Objekter i Studio:
	- Workspace.Grill          → en Part (Anchored). Dette Script skal ligge
	                             INDE i den Part (script.Parent = Grill).
	Scripts, der allerede skal køre:
	- Leaderstats              → scripts/Leaderstats.server.lua i
	                             ServerScriptService. Laver player.leaderstats.Cash.
	- (valgfrit) Orders        → scripts/Orders.server.lua. Bruges IKKE her.
	                             Cash gives stadig for en perfekt burger.

	Må IKKE køre samtidig med
	-------------------------
	- scripts/Grill.server.lua / GrillController på samme Grill-Part
	  (ellers får du to ProximityPrompts og dobbelt tilstand).

	Må ikke forudsætte
	------------------
	- ScreenGui / anden UI
	- RemoteEvents eller RemoteFunctions
	- DataStore
	- Moduler, pakker eller tredjeparts-assets
]]

local grill = script.Parent

-- Stop tidligt, hvis scriptet er sat det forkerte sted.
if not grill:IsA("BasePart") then
	warn("FireSystem: scriptet skal ligge inde i Part'en Grill, ikke i ServerScriptService.")
	return
end

local COOK_TIME = 6
local PERFECT_WINDOW = 4
local REWARD = 10
local EXTINGUISH_HOLD = 3

local state = "Tom"
local fire = nil

-- Almindelig grill-knap (læg på / servér).
local prompt = Instance.new("ProximityPrompt")
prompt.Name = "GrillPrompt"
prompt.ActionText = "Læg burger på"
prompt.ObjectText = "Grill"
prompt.HoldDuration = 0.5
prompt.MaxActivationDistance = 10
prompt.Parent = grill

-- Ekstra knap, som kun er tændt under brand.
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
			-- Fire er et indbygget Roblox-objekt. Ingen assets påkrævet.
			fire = Instance.new("Fire")
			fire.Name = "GrillFire"
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
		-- Skjul den almindelige knap, så spilleren kun kan slukke.
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
