![image](https://cdn.discordapp.com/attachments/850552783518171166/850620917616214027/NPCore_Header.png)
# 👋🏼 Welcome to the npcore-server wiki! 🧩
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
#  Server.cfg
```lua
#---------------------------------------------------------#
#        Custom NoPixel Inspired Framework V.1.0     	  #
#---------------------------------------------------------#

# Enable OneSync (required for server-side state awareness)!
set onesync on
set onesync_enabled 1
set sv_enforceGameBuild 2189
set onesync_forceMigration true
set onesync_workaround763185 true
set onesync_distanceCullVehicles true

# Only change the IP if you're using a server with multiple network interfaces, otherwise change the port only. #
endpoint_add_tcp "0.0.0.0:30120"
endpoint_add_udp "0.0.0.0:30120"

# Server player slot limit (See https://fivem.net/server-hosting for limits).
sv_maxclients 48
sv_licenseKey ""

# Steam Web API key, if you want to use Steam authentication (https://steamcommunity.com/dev/apikey).
# -> Replace "" with the key.
set steam_webApiKey ""

# Add System Administrators #
add_ace group.admin command allow # Allow all commands.
add_ace group.admin command.quit deny # But don't allow quit.
add_principal identifier.fivem:Your_ID group.admin
add_principal identifier.steam:Your_ID group.admin

# Required Configs #
#exec mysql.cfg -> Always nest MySQL configurations seperately for security purposes. (Should you decide to use MySQL-Async).
exec resources.cfg

# PMA Voice Convars (Onesync Infinity Only) # -- https://github.com/AvarianKnight/pma-voice
#ensure pma-voice
#setr voice_useNativeAudio 1
#setr voice_useSendingRangeOnly 1
#setr voice_zoneRadius 16
#setr voice_enableProximityCycle 1
#setr voice_enableRadios 1
#setr voice_enablePhones 1
#setr voice_enableSubmix 1
#setr voice_defaultCycle "N"
#setr voice_defaultVolume "0.5"

# Default Resources #
#ensure hardcap -- Optional: Uncomment If not using ConnectQueue.
ensure mapmanager
ensure spawnmanager
ensure sessionmanager
ensure rconlog
ensure chat
ensure yarn
ensure cron
ensure isPed

# Dependencies #
ensure ghmattimysql	# -- https://github.com/GHMatti/ghmattimysql
ensure connectqueue	# -- https://github.com/Nick78111/ConnectQueue
ensure dlciplloader 	# -- https://forum.cfx.re/t/cayo-perico-casino-dlc-ipl-loader/2099391
ensure bob74_ipl	# -- https://github.com/Bob74/bob74_ipl
ensure warmenu		# -- https://github.com/warxander/warmenu
ensure PolyZone		# -- https://github.com/mkafrin/PolyZone
ensure wk_wrs		# -- https://github.com/WolfKnight98/wk_wars2x

# This allows players to use scripthook-based plugins such as the legacy Lambda Menu.
# Set this to 1 to allow scripthook. Do note that this does _not_ guarantee players won't be able to use external plugins.
sv_scriptHookAllowed 0

# Uncomment this and set a password to enable RCON. Make sure to change the password - it should look like rcon_password "YOURPASSWORD"
#rcon_password ""

# A comma-separated list of tags for your server.
# For example:
# - sets tags "drifting, cars, racing"
# Or:
# - sets tags "roleplay, military, tanks"
sets tags "og, np, rp, new, npc, alpha, beta, roam, tune, gang, chill, city, chips, fivem, jobs, ems, lspd, taxi, mechanics, cars, race, races, racing, drifting, tuner, tuners, tunerchip, tunerchips, sales, drugs, admin, police, serious, hiring, quality, lifetime, roleplay, freeroam, dawn, summit, spring, summer, winter, solstace, impulse, eclipse, nopixel, notpixel, custom cars, custom peds, custom scripts, custom framework, powered by: NPCore."

# A valid locale identifier for your server's primary language.
# For example "en-US", "fr-CA", "nl-NL", "de-DE", "en-GB", "pt-BR"
sets locale "en-US" 
# please DO replace root-AQ on the line ABOVE with a real language! :)

# Set an optional server info and connecting banner image url.
# Size doesn't matter, any banner sized image will be fine.
sets Microphone "Required"
sets Roleplay "Serious Roleplay"
sets Age Limit "Rated Mature"
sets banner_detail "https://cdn.discordapp.com/attachments/832068126111432716/836571288440012821/OGN_5M_Detail_Banner.png"
sets banner_connecting "https://cdn.discordapp.com/attachments/832068126111432716/840661181723181076/5M_Connecting_Banner_copy.png"
sets Discord "https://discord.gg/ahbEjHTfRm"
sets Website "https://github.com/np-core-framework"

# Set your server's hostname
sv_hostname "^7• ^5NPCore Framework ^9| ^5https://discord.gg/ahbEjHTfRm ^7•"

# Set your server's Project Name
sets sv_projectName "[NPCore]: Mature roleplay server, backed up by a seriously dedicated team looking to take the FiveM community by storm! Join us today and make memories."

# Set your server's Project Description
sets sv_projectDesc "Created by roleplayers for roleplayers. We aim to provide the best roleplay possible, by offering a unique experience for new or experienced roleplayers alike. We hope you enjoy your time with us, and look forward to seeing you in city!"

# Loading a server icon (96x96 PNG file)
load_server_icon NPCore.png

# convars which can be used in scripts
set temp_convar "Hey world!"

# Remove the `#` from the below line if you do not want your server to be listed in the server browser.
# Do not edit it if you *do* want your server listed.
#sv_master1 ""

#---------------------------------------------------------#
#    ***[Please do not make unneccessary changes.]***	  #
#---------------------------------------------------------#
```
#  Resources.cfg
```lua
#-----------------------------#
# Assets Start #
ensure npc-k9
ensure npc-peds
ensure npc-mlo
ensure npc-maps
ensure npc-clothes
ensure npc-firearms
ensure npc-hair-pack
ensure npc-shoes-pack
ensure npc-raid-car-menu
ensure npc-raid-cars
ensure npc-towtrucks
ensure npc-policepack
ensure npc-emspack
ensure npc-prison
ensure npc-audio
ensure npc-gunmeta
ensure npc-gunmetas
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
ensure npc-jobmanager			        # -- [Work-in-Progress]!
ensure npc-admin				# -- [Work-in-Progress]!
ensure npc-scripts				# -- [Small Resources]!
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
#ensure npc-robbery                     # -- Needs Testing.
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
#ensure npc-vehicle-shop-imports 	# -- Stoped due to the vehicles being in PDM currently.
# NoPixel End #
#-----------------------------#

#-----------------------------#
# MLOs & Mods Start	  #
#ensure npc-xhair
#[-- Optional Packs START --]#
#ensure npc-vanilla-cars
#ensure npc-wheels
#ensure npc-import-a
#ensure npc-import-b
#ensure npc-import-c
#ensure npc-import-d
#[-- Licensed Files --]
ensure gabz_mrpd              # --> MRPD MLO alternative option (See: https://forum.cfx.re/t/community-mission-row-pd-mlo/803817).
ensure gabz_pillbox_hospital  # --> PBOX MLO alternative option. (See: https://forum.cfx.re/t/release-pillbox-hospital-interior-mlo/609786).
# MLOs & Mods End	  #
#-----------------------------#

#-----------------------------#
#  Required Restarts   #
restart npc-scripts
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
ensure npc-k9
ensure npc-peds
ensure npc-mlo
ensure npc-maps
ensure npc-clothes
ensure npc-firearms
ensure npc-hair-pack
ensure npc-shoes-pack
ensure npc-raid-car-menu
ensure npc-raid-cars
ensure npc-towtrucks
ensure npc-policepack
ensure npc-emspack
ensure npc-prison
ensure npc-audio
ensure npc-gunmeta
ensure npc-gunmetas
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
ensure npc-jobmanager			        # -- [Work-in-Progress]!
ensure npc-admin				# -- [Work-in-Progress]!
ensure npc-scripts				# -- [Small Resources]!
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
#ensure npc-robbery                     # -- Needs Testing.
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
#ensure npc-vehicle-shop-imports 	# -- Stoped due to the vehicles being in PDM currently.
# NoPixel End #
#-----------------------------#

#-----------------------------#
# MLOs & Mods Start	  #
#ensure npc-xhair
#[-- Optional Packs START --]#
#ensure npc-vanilla-cars
#ensure npc-wheels
#ensure npc-import-a
#ensure npc-import-b
#ensure npc-import-c
#ensure npc-import-d
#[-- Licensed Files --]
ensure gabz_mrpd              # --> MRPD MLO alternative option (See: https://forum.cfx.re/t/community-mission-row-pd-mlo/803817).
ensure gabz_pillbox_hospital  # --> PBOX MLO alternative option. (See: https://forum.cfx.re/t/release-pillbox-hospital-interior-mlo/609786).
# MLOs & Mods End	  #
#-----------------------------#

#-----------------------------#
#  Required Restarts   #
restart npc-scripts
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
