fx_version 'cerulean'
games {'gta5'}

files {
    'index.html',
    'style.css',
    'images/*',
    'script.js',
	'logo.png',
	'html/logo.png',
    'vue.min.js'
}

loadscreen 'index.html'

loadscreen_manual_shutdown "yes"

client_script "client.lua"