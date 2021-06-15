NPC.SettingsData = NPC.SettingsData or {}
NPC.Settings = NPC.Settings or {}

NPC.Settings.Current = {}
-- Current Bind Name & Keys
NPC.Settings.Default = {
	["tokovoip"] = {
    ["stereoAudio"] = true,
    ["localClickOn"] = true,
    ["localClickOff"] = true,
    ["remoteClickOn"] = true,
    ["remoteClickOff"] = true,
    ["mainVolume"] = 6.0,
    ["clickVolume"] = 10.0,
    ["radioVolume"] = 5.0,
  },
	["hud"] = {

  }

}

function NPC.SettingsData.setSettingsTable(settingsTable,shouldSend)
  if settingsTable == nil then
    NPC.Settings.Current = NPC.Settings.Default
    TriggerServerEvent('npc-base:sv:player_settings_set',NPC.Settings.Current)
    NPC.SettingsData.checkForMissing()
  else
    if shouldSend then
      NPC.Settings.Current = settingsTable
      TriggerServerEvent('npc-base:sv:player_settings_set',NPC.Settings.Current)
      NPC.SettingsData.checkForMissing()
    else
       NPC.Settings.Current = settingsTable
       NPC.SettingsData.checkForMissing()
    end
  end

  TriggerEvent("event:settings:update",NPC.Settings.Current)

end

function NPC.SettingsData.setSettingsTableGlobal(self,settingsTable)
  NPC.SettingsData.setSettingsTable(settingsTable,true);
end

function NPC.SettingsData.getSettingsTable()
    return NPC.Settings.Current
end

function NPC.SettingsData.setVarible(self,tablename,atrr,val)
  NPC.Settings.Current[tablename][atrr] = val
  TriggerServerEvent('npc-base:sv:player_settings_set',NPC.Settings.Current)
end

function NPC.SettingsData.getVarible(self,tablename,atrr)
  return NPC.Settings.Current[tablename][atrr]
end

function NPC.SettingsData.checkForMissing()
  local isMissing = false

  for j,h in pairs(NPC.Settings.Default) do
    if NPC.Settings.Current[j] == nil then
      isMissing = true
      NPC.Settings.Current[j] = h
    else
      for k,v in pairs(h) do
        if  NPC.Settings.Current[j][k] == nil then
           NPC.Settings.Current[j][k] = v
           isMissing = true
        end
      end
    end
  end
  
  if isMissing then
    TriggerServerEvent('npc-base:sv:player_settings_set',NPC.Settings.Current)
  end
end

RegisterNetEvent("npc-base:cl:player_settings")
AddEventHandler("npc-base:cl:player_settings", function(settingsTable)
  NPC.SettingsData.setSettingsTable(settingsTable,false)
end)

RegisterNetEvent("npc-base:cl:player_reset")
AddEventHandler("npc-base:cl:player_reset", function(tableName)
  if NPC.Settings.Default[tableName] then
      if NPC.Settings.Current[tableName] then
        NPC.Settings.Current[tableName] = NPC.Settings.Default[tableName]
        NPC.SettingsData.setSettingsTable(NPC.Settings.Current,true)
      end
  end
end)