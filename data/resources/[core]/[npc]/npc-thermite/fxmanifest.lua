fx_version 'cerulean'
games {'gta5'}

client_script "@npc-based-resources/client/errorlog.lua"

client_script 'thermite_client.lua'
server_script 'thermite_server.lua'

ui_page 'html/ui.html'
files {
	'html/ui.html',
	'html/pricedown.ttf',
	'html/button.png',
	'html/styles.css',
	'html/scripts.js',
	'html/debounce.min.js',
	'html/backgroundwhite.png',
	'html/sounds/failure.ogg',
	'html/sounds/hit.ogg',
	'html/sounds/success.ogg',
	'html/sounds/Thermite.ogg'
}

exports{
	'startFireAtLocation',
	'startGame'
}