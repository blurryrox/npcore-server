RegisterServerEvent('Saw:SyncDoorFall')
AddEventHandler('Saw:SyncDoorFall', function(netid, data)
    TriggerClientEvent('firedepartment:removeDoor', -1, netid, data)
end)

RegisterServerEvent('Saw:StartParticles')
AddEventHandler('Saw:StartParticles', function(sawID)
    TriggerClientEvent('Saw:StartParticles', -1, sawID)
end)

RegisterServerEvent('Saw:SyncStopParticles')
AddEventHandler('Saw:SyncStopParticles', function(sawID)
    TriggerClientEvent('Saw:StopParticles', -1, sawID)
end)