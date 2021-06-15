fx_version 'cerulean'
games {'gta5'}

dependencies {
    "PolyZone"
}

client_script "@npc-based-resources/client/errorlog.lua"
client_script "@PolyZone/client.lua"

ui_page 'nui/ui.html'

files {
	"nui/ui.html",
	"nui/pricedown.ttf",
	"nui/default.png",
	"nui/background.png",
	"nui/weight-hanging-solid.png",
	"nui/hand-holding-solid.png",
	"nui/search-solid.png",
	"nui/invbg.png",
	"nui/styles.css",
	"nui/scripts.js",
	"nui/debounce.min.js",
	"nui/loading.gif",
	"nui/loading.svg",
	"nui/icons/*"
  }

shared_script 'shared_list.js'
client_script 'client.js'
client_script 'functions.lua'
server_script 'server_degradation.js'
server_script 'server_shops.js'
server_script 'server.js'
server_script 'server.lua'


exports{
	'hasEnoughOfItem',
	'getQuantity',
	'GetCurrentWeapons',
	'GetItemInfo'
}


