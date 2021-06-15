fx_version 'cerulean'
games {'gta5'}

client_script "@npc-based-resources/client/errorlog.lua"

ui_page 'html/ui.html'
files {
	'html/ui.html',
	'html/pricedown.ttf',
	'html/background.png',
	'html/styles.css',
	'html/scripts.js',
	'html/debounce.min.js'
}

client_script 'client.lua'
server_script 'server.lua'
