RegisterServerEvent("npc-base:sv:player_control_set")
AddEventHandler("npc-base:sv:player_control_set", function(controlsTable)
    local src = source
    NPC.DB:UpdateControls(src, controlsTable, function(UpdateControls, err)
            if UpdateControls then
                -- We are good here.
            end
    end)
end)

RegisterServerEvent("npc-base:sv:player_controls")
AddEventHandler("npc-base:sv:player_controls", function()
    local src = source
    NPC.DB:GetControls(src, function(loadedControls, err)
        if loadedControls ~= nil then 
            TriggerClientEvent("npc-base:cl:player_control", src, loadedControls) 
        else 
            TriggerClientEvent("npc-base:cl:player_control",src, nil) print('Controls are messed.') 
        end
    end)
end)