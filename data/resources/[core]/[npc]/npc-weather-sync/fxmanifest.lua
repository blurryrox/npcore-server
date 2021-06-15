fx_version 'cerulean'
games {'gta5'}

client_script "@npc-based-resources/client/errorlog.lua"

export "SetEnableSync"

server_scripts {
	"server/server.lua"
}

client_scripts {
	"client/client.lua"
}