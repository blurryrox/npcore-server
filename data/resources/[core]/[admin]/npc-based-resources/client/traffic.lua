TrafficAmount = 100 
PedestrianAmount = 100
ParkedAmount = 200
EnableDispatch = true
EnableBoats = true
EnableTrains = true
EnableGarbageTrucks = true

--[[
	TrafficAmount changes how much traffic there is on the Roads, this goes from 100% to 0%, values over 100% are also supported but not recommended, under 0% will cause a game crash.
	PedestrianAmount changes how many Peds roam the Streets
	ParkedAmount changes how many Parked Cars there are in the world
	EnableDispatch is a toggle between true and false, this enables/disables various features such as:
		- Police Responses
		- Fire Department Responses
		- Swat Responses
		- Ambulance Responses
		- Roadblocks
		- Gangs
	EnableBoats is a toggle between true and false, enables/disables random boats in the ocean.
	EnableTrains is the same as above, with Trains
]]--

Citizen.CreateThread(function()
	for i = 1, 13 do
		EnableDispatchService(i, EnableDispatch)
	end
	while true do
		-- These natives has to be called every frame.
		SetVehicleDensityMultiplierThisFrame((TrafficAmount/100)+.0)
		SetPedDensityMultiplierThisFrame((PedestrianAmount/100)+.0)
		SetRandomVehicleDensityMultiplierThisFrame((TrafficAmount/100)+.0)
		SetParkedVehicleDensityMultiplierThisFrame((ParkedAmount/100)+.0)
		SetScenarioPedDensityMultiplierThisFrame((PedestrianAmount/100)+.0, (PedestrianAmount/100)+.0)
		SetRandomBoats(EnableBoats)
		SetRandomTrains(EnableTrains)
        SetGarbageTrucks(EnableGarbageTrucks)
		Citizen.Wait(0)
	end
end)