NPC.SpawnManager = {}

function NPC.SpawnManager.Initialize(self)
    Citizen.CreateThread(function()
        FreezeEntityPosition(PlayerPedId(), true)

        TransitionToBlurred(500)
        DoScreenFadeOut(500)

        ShutdownLoadingScreen()

        local cam = CreateCam("DEFAULT_SCRIPTED_CAMERA", 1)

        SetCamRot(cam, 0.0, 0.0, -45.0, 2)
        SetCamCoord(cam, -682.0, -1092.0, 226.0)
        SetCamActive(cam, true)
        RenderScriptCams(true, false, 0, true, true)

        local ped = PlayerPedId()

        SetEntityCoordsNoOffset(ped, -682.0, -1092.0, 200.0, false, false, false, true)

        SetEntityVisible(ped, false)

        TriggerEvent("npc-base:spawnInitialized")
        TriggerServerEvent("npc-base:spawnInitialized")

        DoScreenFadeIn(500)

        while IsScreenFadingIn() do
            Citizen.Wait(0)
        end
    end)
end

function NPC.SpawnManager.InitialSpawn(self)
    Citizen.CreateThread(function()
        DisableAllControlActions(0)

        TransitionToBlurred(500)        
        DoScreenFadeOut(500)

        while IsScreenFadingOut() do
            Citizen.Wait(0)
        end

        local character = NPC.LocalPlayer:getCurrentCharacter()
        local new = character.new == 1


        local spawn = NPC.Enums.SpawnLocations.Initial[1]

        spawn = {
            model = "mp_m_freemode_01",
            x = spawn[1],
            y = spawn[2],
            z = spawn[3],
            heading = spawn[4]
        }

        if spawn.model then
            RequestModel(spawn.model)

            while not HasModelLoaded(spawn.model) do
                RequestModel(spawn.model)
                Wait(0)
            end

            SetPlayerModel(PlayerId(), spawn.model)
            SetModelAsNoLongerNeeded(spawn.model)
            SetPedDefaultComponentVariation(PlayerPedId())
        end

        TriggerEvent("npc-base:initialSpawnModelLoaded")

        RequestCollisionAtCoord(spawn.x, spawn.y, spawn.z)

        local ped = PlayerPedId()

        SetEntityCoordsNoOffset(ped, spawn.x, spawn.y, spawn.z, false, false, false, true)

        SetEntityVisible(ped, true)
        FreezeEntityPosition(PlayerPedId(), false)

        NetworkResurrectLocalPlayer(spawn.x, spawn.y, spawn.z, spawn.heading, true, true, false)
        
        ClearPedTasksImmediately(ped)
        RemoveAllPedWeapons(ped)
        --ClearPlayerWantedLevel(PlayerId())

        local startedCollision = GetGameTimer()

        while not HasCollisionLoadedAroundEntity(ped) do
            if GetGameTimer() - startedCollision > 8000 then break end
            Citizen.Wait(0)
        end

        Citizen.Wait(500)
        
        while IsScreenFadingIn() do
            Citizen.Wait(0)
        end

        TransitionFromBlurred(500)
        EnableAllControlActions(0)

        if new then TriggerEvent("npc-base:newCharacterSpawned") DoScreenFadeIn(500) end
        TriggerEvent("npc-base:playerSpawned")
        TriggerEvent("playerSpawned")
        DoScreenFadeIn(500)
    end)
end

-- RegisterNetEvent("npc-base:newCharacterSpawned")
-- AddEventHandler('npc-base:newCharacterSpawned', function()
--     DestroyAllCams(true)
--     TriggerEvent("raid_clothes:defaultReset")
--     FreezeEntityPosition(PlayerPedId(), false)
-- end)

AddEventHandler("npc-base:firstSpawn", function()
    NPC.SpawnManager:InitialSpawn()

    Citizen.CreateThread(function()
        Citizen.Wait(600)
        DestroyAllCams(true)
        RenderScriptCams(false, true, 1, true, true)
        FreezeEntityPosition(PlayerPedId(), false)
    end)
end)

RegisterNetEvent('npc-base:clearStates')
AddEventHandler('npc-base:clearStates', function()
	TriggerEvent("isJudgeOff")
    TriggerEvent("nowCopSpawnOff")
    TriggerEvent("nowEMSDeathOff")
    TriggerEvent("police:noLongerCop")
    TriggerEvent("nowCopDeathOff")
    TriggerEvent("ResetFirstSpawn")
    TriggerEvent("stopSpeedo")
    TriggerEvent("keys:reset")
    TriggerEvent("phone:reset")
    TriggerServerEvent("fuckmylifelmao")
    TriggerServerEvent("judge:commandsoff")
    TriggerServerEvent("doctor:commandsoff")
    TriggerServerEvent("TokoVoip:removePlayerFromAllRadio",GetPlayerServerId(PlayerId()))
    TriggerEvent("wk:disableRadar")
end)

