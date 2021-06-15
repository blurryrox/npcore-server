fx_version 'cerulean'
games {'gta5'}

client_script "@npc-based-resources/client/errorlog.lua"

--server_script "@npc-fml/server/lib.lua" -- Missing.
server_scripts {
	'server.lua',
	'boatshop_s.lua'
}
client_script {
	'client.lua',
	'GUI.lua',
	'boatshop.lua'
}