local resource  = GetInvokingResource() or GetCurrentResourceName()
local version   = GetResourceMetadata(resource, 'version', 0)
local resourceName = "^5[XMMX Development] ^4Keys Minigame ^0-" 

local function VersionCheck()
	PerformHttpRequest('https://raw.githubusercontent.com/xMaddMackx/xmmx_keysgame/master/version', function(err, responseText, headers)
        Wait(3000)
        
		if not responseText then print("^1[XMMX-DEBUG] Version check for ^3(Keys Game) ^1failed! Github may be down.^0") return end

        if version ~= responseText and tonumber(version) < tonumber(responseText) then
            print("     ^3"..resourceName.." ^0is ^1Outdated!")
            print("                        ^2Latest Version: "..responseText.."")
            print("                        ^1Current Version: "..version.."")
            print(" ^3Download the update from https://keymaster.fivem.net/asset-grants")
        else
            print(""..resourceName.." ^2is up to date. ✅ Enjoy!^0")
        end
	end)
end

if Config.VerChk then
    VersionCheck()
end