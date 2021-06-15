fx_version 'cerulean'
games {'gta5'}

client_script "@npc-based-resources/client/errorlog.lua"

server_script "server.lua"
client_script "client.lua"

ui_page 'html/ui.html'
files {
	"html/clip.png",
	"html/pricedown.ttf",
	"html/ui.html",
	"html/styles.css",
	"html/scripts.js",
	"html/debounce.min.js"
}