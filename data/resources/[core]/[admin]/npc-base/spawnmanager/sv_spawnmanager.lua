NPC.SpawnManager = {}

RegisterServerEvent('npc-base:spawnInitialized')
AddEventHandler('npc-base:spawnInitialized', function()
    local src = source
    TriggerClientEvent('npc-base:spawnInitialized', src)
end)