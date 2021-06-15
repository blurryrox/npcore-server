fx_version 'cerulean'
games {'gta5'}

-- Manifest
--resource_manifest_version '05cfa83c-a124-4cfa-a768-c24a5811d8f9'

client_script "@npc-based-resources/client/errorlog.lua"

-- General
client_scripts {
  'client.lua',
  'client_trunk.lua',
  'evidence.lua'
}

server_scripts {
  'server.lua'
}

exports {
	'getIsInService',
	'getIsCop',
	'getIsCuffed'
} 
