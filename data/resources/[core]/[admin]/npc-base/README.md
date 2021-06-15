# npc-base
🧩 NoPixel Inspired Framework
![image](https://cdn.discordapp.com/attachments/850552783518171166/850620917616214027/NPCore_Header.png)
👋🏼 Welcome to the NPC-Framework-Base 🧩

#  Wiki: https://github.com/np-core-framework/npc-base/wiki

#  Manifest File
```lua
fx_version 'cerulean'
games { 'gta5' }
--resource_manifest_version "44febabe-d386-4d18-afbe-5e627f4af937"

dependency "ghmattimysql" --> Remember to configure your Database settings.

client_script "@npc-based-resources/client/cl_errorlog.lua" -- Debug Tool.

--[[=====INIT=====]]--
server_script "sh_init.lua"
client_script "sh_init.lua"

--[[=====EVENTS=====]]--
server_script "events/sv_events.lua"
client_script "events/cl_events.lua"

--[[=====CORE=====]]--
server_script "core/sh_core.lua"
server_script "core/sh_enums.lua"
-- Utility
server_script "utility/sh_util.lua"
-- Database
server_script "database/sv_db.lua"
server_script "core/sv_core.lua"
server_script "core/sv_characters.lua"
client_script "core/sh_core.lua"
client_script "core/sh_enums.lua"
-- Utility
client_script "utility/sh_util.lua"
client_script "utility/cl_util.lua"
client_script "core/cl_core.lua"

--[[=====SPAWNMANAGER=====]]--
client_script "spawnmanager/cl_spawnmanager.lua"
server_script "spawnmanager/sv_spawnmanager.lua"

--[[=====PLAYER=====]]--
server_script "player/sv_player.lua"
server_script "player/sv_controls.lua"
server_script "player/sv_settings.lua"
client_script "player/cl_player.lua"
client_script "player/cl_controls.lua"
client_script "player/cl_settings.lua"

--[[=====BLIPMANAGER=====]]--
client_script "blipmanager/cl_blipmanager.lua"
client_script "blipmanager/cl_blips.lua"

--[[=====GAMEPLAY=====]]--
client_script "gameplay/cl_gameplay.lua"

--[[=====COMMANDS=====]]--
client_script "commands/cl_commands.lua"
server_script "commands/sv_commands.lua"

--[[=====INFINITY=====]]--
client_script "@npc-infinity/client/cl_lib.lua"
server_script "@npc-infinity/server/sv_lib.lua"

export "getModule"
export "addModule"
server_export "getModule"
server_export "addModule"
```
#  Resources.cfg
```lua
#-----------------------------#
# Assets Start #
ensure assets_mlo
ensure assets_maps
ensure assets_clothes
ensure assets_weapons
ensure npc-k9
ensure npc-peds
ensure npc-raid-car-menu
ensure npc-raid-cars
ensure npc-towtrucks
ensure npc-policepack
ensure npc-emspack
ensure npc-prison
ensure npc-audio
ensure npc-gunmeta
ensure npc-gunmetaDLC
# Assets End #
#-----------------------------#

#-----------------------------#
# Framework Start #
ensure npc-infinity
ensure npc-base					# -- [Work-in-Progress]!
ensure npc-login				# -- [Work-in-Progress]!
ensure npc-phone				# -- [Work-in-Progress]!
ensure npc-radio				# -- [Work-in-Progress]!
ensure npc-jobmanager			# -- [Work-in-Progress]!
ensure npc-admin				# -- [Work-in-Progress]!
# Framework End #
#-----------------------------#

#-----------------------------#
# NoPixel Start #
ensure npc-raid-clothes
ensure npc-menu
ensure npc-voice
ensure npc-weather-seasons
ensure npc-weather-sync
ensure npc-loading-screen
ensure npc-apartments
ensure npc-interior
ensure npc-hud
ensure npc-emotes
ensure npc-minimap
ensure npc-lootsystem
ensure npc-commands
ensure npc-banking
ensure npc-bennys
ensure npc-uitest
ensure npc-shops
#ensure npc-boatshop 			# -- Needs Testing.
ensure npc-inventory
ensure npc-weapons
ensure npc-actionbar
ensure npc-fish
ensure npc-furniture
ensure npc-taskbar
ensure npc-taximeter
ensure npc-thermite
ensure npc-doors
ensure npc-fx
ensure npc-evidence
ensure npc-notepad
ensure npc-keys
ensure npc-keypad
ensure npc-lockpicking
ensure npc-lost
ensure npc-cid
ensure npc-news
ensure npc-warrants
ensure npc-tunershop
ensure npc-tuner
ensure npc-webpages
ensure npc-gas-stations
ensure npc-stash
ensure npc-stash-house
ensure npc-taskbarskill
ensure npc-taskbarthreat
ensure npc-tasknotify
ensure npc-securityheists
#ensure npc-truckerjob			# -- Needs Testing.
#ensure npc-towtruckjob			# -- Needs Testing.
#ensure npc-robbery				# -- Needs Testing.
ensure npc-driving-instructor
ensure npc-broadcaster
ensure npc-newsjob
ensure npc-driftschool
ensure npc-dispatch
ensure npc-police
ensure npc-dealer
ensure npc-gangs
ensure npc-ems
ensure npc-garages
ensure npc-medicgarage
ensure npc-policegarage
ensure npc-vehicles
ensure npc-vehicleshop
ensure npc-vehiclecontrol
ensure npc-interact-sound
ensure npc-vanilla-car-tweak
ensure npc-diamondblackjack
ensure npc-mhacking
ensure npc-based-resources
#ensure npc-vehicle-shop-imports 	# -- Stoped due to the vehicles being in PDM currently.
# NoPixel End #
#-----------------------------#

#-----------------------------#
# MLOs & Mods Start	  #
#ensure npc-xhair
ensure npc-hair-pack
ensure npc-shoes-pack
#[-- Optional Packs START --]#
#ensure npc-vanilla-cars
#ensure npc-wheels
#ensure npc-import-a
#ensure npc-import-b
#ensure npc-import-c
#ensure npc-import-d
#[-- Licensed Files --]				# Please note, verification is required prior to use of the Gabz paid MLO files. (Visit: https://www.gabzv.com/).
ensure gabz_mrpd					# --> MRPD MLO alternative option (See: https://forum.cfx.re/t/community-mission-row-pd-mlo/803817).
ensure gabz_pillbox_hospital		# --> PBOX MLO alternative option. (See: https://forum.cfx.re/t/release-pillbox-hospital-interior-mlo/609786).
# MLOs & Mods End	  #
#-----------------------------#

#-----------------------------#
#  Required Restarts   #
restart npc-based-resources
#restart npc-robbery
restart npc-news
# End of Resources.CFG #
#-----------------------------#
```
<br>
We appreciate any and all pull requests or issues made to further the development phase!
<br>
<br>
Evolve, Network, & Manifest.
<br>
The FiveM 🐌 NPCore Collective.
<br>
