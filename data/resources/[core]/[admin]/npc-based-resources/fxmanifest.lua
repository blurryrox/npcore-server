fx_version 'cerulean'
games { 'gta5' }

this_is_a_map "yes"

description 'NPC-BasedResources'
version '1.0.0'

client_scripts {
	-- NP Based Client Resources
	"client/errorlog.lua",
	"client/actionbar.lua",
	"client/barriers.lua",
	"client/camera.lua",
	"client/carwash.lua",
	--"client/crimeschool.lua",		-- Currently broken.
	"client/dances.lua",
	"client/dirtymoney.lua",
	"client/drugdeliveries.lua",
	"client/drzinteriors.lua",
	"client/eblips.lua",
	"client/firedepartment.lua",
	"client/gangsweaponshop.lua",
	"client/golf.lua",
	"client/gym.lua",
	"client/heatmap.lua",
	"client/hospitalization.lua",
	"client/jewelrob.lua",
	"client/memorial.lua",
	"client/outlawalerts.lua",
	"client/particles.lua",
	"client/propattach.lua",
	"client/ragdoll.lua",
	"client/rehab.lua",
	"client/restart.lua",
	"client/secondaryjobs.lua",
	"client/sirens.lua",
	"client/spikes.lua",
	"client/storage.lua",
	--"client/scoreboard.lua",
	"client/vehiclemods.lua",
	"client/ocam.lua",
	"client/ostress.lua",
	"client/stripclub.lua",
	"client/strippertings.lua",
	"client/trains.lua",
	"client/votesystem.lua",
	"client/weapons.lua",
	"client/weed.lua",
	"client/ohideframes.lua",
	"client/oplayernumbers.lua",
	-- Standalone Client Scripts
	"client/noclip.lua",
	"client/lifetraffic.net.dll",
	"client/lockdoors.lua",
	"client/coords.lua",
	"client/coordsaver.lua",
	"client/debug.lua",
	"client/koil-debug.lua",
	"client/fireworks.lua",
	"client/binoculars.lua",
    "client/calmai.lua",
   	"client/consumables.lua",
    "client/crouchprone.lua",
   	"client/cruise.lua",
   	"client/traffic.lua",
   	"client/discord.lua",
   	"client/engine.lua",
   	"client/fireworks.lua",
	"client/interactivenpcs.lua",
	"client/heli.lua",
	"client/carry.lua",
	"client/suicide.lua",
	"client/piggyback.lua",
	"client/takehostage.lua",
	"client/clientrl.lua",
	"client/removeentities.lua",
	"client/instructionalbuttons.lua",
	"client/engine.lua",
	"client/teleports.lua",
	"client/trunk.lua",
	"client/cameraview.lua",
	"client/weapdraw.lua",
	"client/weapdrop.lua",
	-- Don't make uneccessary changes.
	"@PolyZone/client.lua",
	"@warmenu/warmenu.lua",
	"@npc-infinity/client/cl_lib.lua",
	"@npc-infinity/client/classes/blip.lua",
	"@npc-based-resources/client/errorlog.lua"
}

server_scripts {
	-- NP Based Server Resources
	"server/log.lua",
	"server/errorlog.lua",
	"server/carwash.lua",
	"server/dirtymoney.lua",
	"server/drugdeliveries.lua",
	"server/drzinteriors.lua",
	"server/eblips.lua",
	"server/firedepartment.lua",
	"server/gangsweaponshop.lua",
	"server/golf.lua",
	"server/hospitalization.lua",
	"server/jewelrob.lua",
	"server/outlawalerts.lua",
	"server/particles.lua",
	"server/ragdoll.lua",
	"server/rehab.lua",
	"server/restart.lua",
	"server/secondaryjobs.lua",
	"server/spikes.lua",
	--"server/scoreboard.lua",
	"server/trains.lua",
	"server/vehiclemods.lua",
	"server/votesystem.lua",
	"server/weapons.lua",
	"server/weed.lua",
	"server/whitelist.lua",
	-- Standalone Server Scripts
	"server/api.lua",
	"server/coordsaver.lua",
	"server/debug.lua",
	"server/koil-debug.lua",
	"server/noclip.lua",
	"server/trunk.lua",
	"server/heli.lua",
	"server/carry.lua",
	"server/piggyback.lua",
	"server/takehostage.lua",
	-- Don't make uneccessary changes.
	"@npc-infinity/server/sv_lib.lua",
	"@connectqueue/connectqueue.lua"
}

server_export "AddLog"
data_file 'FIVEM_LOVES_YOU_4B38E96CC036038F' 'events.meta'
data_file 'FIVEM_LOVES_YOU_341B23A2F0E0F131' 'popgroups.ymt'

files {
	'events.meta',
	'popgroups.ymt',
	'relationships.dat'
}

exports {
	"ShowWeashopBlips",
	"getWeaponMetaData",
	"updateWeaponMetaData",
	"particleStart",
	"tryGet",
	"getTax",
	"AddLog",
	"remove",
	"set"
}

dependencies {
	"npc-base",
	"ghmattimysql",
	"connectqueue",
	"PolyZone"
}

