local SHOW_MESSAGE = true
local KICK_PLAYERS = false

local startupResources = {
	"rsModels",
	"rsBuilding",
	--"rsFirstPerson",
	--"rsGathering",
}

local function processResourceByName(resourceName, start)
	local resource = getResourceFromName(resourceName)
	if not resource then
		return false
	end
	if start then
		startResource(resource)
		if resource.state == "running" then
			return true
		else
			return false
		end
	else
		return stopResource(resource)
	end
end

addEventHandler("onResourceStart", resourceRoot, function ()
	local startedResourcesCount = 0
	for i, resourceName in ipairs(startupResources) do
		if processResourceByName(resourceName, true) then
			startedResourcesCount = startedResourcesCount + 1
		else
			outputDebugString("startup: failed to start '" .. tostring(resourceName) .. "'")
		end
	end
end)

function shutdownGamemode(showMessage, kickPlayers)
	if showMessage then
		for i = 1, 20 do
			outputChatBox(" ", root, 255, 0, 0)
		end
		outputChatBox("*** GAMEMODE SHUTDOWN ***", root, 255, 0, 0)
	end
	-- Кик всех игроков перед выключением
	if kickPlayers then
		for i, player in ipairs(getElementsByType("player")) do
			player:kick("MTA Rust", "GAMEMODE RESTART/SHUTDOWN")
		end
	end
	-- Выключение всех ресурсов
	for i, resourceName in ipairs(startupResources) do
		processResourceByName(resourceName, false)
	end
end

addEventHandler("onResourceStop", resourceRoot, function ()
	shutdownGamemode(SHOW_MESSAGE, KICK_PLAYERS)
end)

function shutdownServer()
	shutdownGamemode(true, true)
	setServerPassword("pls_dont_connect_or_everything_could_fuck_up")
	outputServerLog("startup: Shutdown after 3 seconds...")
	setTimer(function()
		setServerPassword(nil)
		shutdown("Server shutdown/restarting")
	end, 3000, 1)
end
