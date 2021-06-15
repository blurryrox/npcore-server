-- To Set This Up visit https://forum.cfx.re/t/how-to-updated-discord-rich-presence-custom-image/157686

local playerCount = 0
RegisterNetEvent('GetActivePlayers:CB')
AddEventHandler('GetActivePlayers:CB', function(count)
    playerCount = count
end)

Citizen.CreateThread(function()
	while true do
        -- This is the Application ID (Replace this with you own)
		SetDiscordAppId(845632280335745044)

        -- Here you will have to put the image name for the "large" icon.
		SetDiscordRichPresenceAsset('ognrp')
        
        -- (11-11-2018) New Natives:

        -- Here you can add hover text for the "large" icon.
        SetDiscordRichPresenceAssetText('NPCore')
       
        -- Here you will have to put the image name for the "small" icon.
        SetDiscordRichPresenceAssetSmall('ogn')

        -- Here you can add hover text for the "small" icon.
        SetDiscordRichPresenceAssetSmallText('A FiveM Framework')

        -- Amount of online player (Don't touch)
        -- local playerCount = #GetActivePlayers()
        TriggerServerEvent('GetActivePlayers')

        -- Your own playername (Don't touch)
        local playerName = GetPlayerName(PlayerId())

        -- Set here the amount of slots you have (Edit if needed)
        local maxPlayerSlots = 64

        -- Sets the string with variables as RichPresence (Don't touch)
        SetRichPresence(string.format("%s - %s/%s", playerName, playerCount, maxPlayerSlots))

        -- (26-02-2021) New Native:

        --[[ 
            Here you can add buttons that will display in your Discord Status,
            First paramater is the button index (0 or 1), second is the title and 
            last is the url (this has to start with "fivem://connect/" or "https://") 
        ]]--
        SetDiscordRichPresenceAction(0, "Join NPCore!", "https://discord.gg/ahbEjHTfRm")
        SetDiscordRichPresenceAction(1, "https://discord.gg/ahbEjHTfRm", "https://discord.gg/ahbEjHTfRm")

        -- It updates every minute just in case.
		Citizen.Wait(60000)
	end
end)