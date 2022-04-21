--███████╗███████╗██╗  ██╗    ██████╗ ██╗   ██╗████████╗██╗   ██╗
--██╔════╝██╔════╝╚██╗██╔╝    ██╔══██╗██║   ██║╚══██╔══╝╚██╗ ██╔╝
--█████╗  ███████╗ ╚███╔╝     ██║  ██║██║   ██║   ██║    ╚████╔╝ 
--██╔══╝  ╚════██║ ██╔██╗     ██║  ██║██║   ██║   ██║     ╚██╔╝  
--███████╗███████║██╔╝ ██╗    ██████╔╝╚██████╔╝   ██║      ██║   
--╚══════╝╚══════╝╚═╝  ╚═╝    ╚═════╝  ╚═════╝    ╚═╝      ╚═╝  

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
 	ESX.PlayerData = xPlayer
	ESX.PlayerLoaded = true
end)

RegisterNetEvent('esx:onPlayerLogout')
AddEventHandler('esx:onPlayerLogout', function()
	ESX.PlayerLoaded = false
	ESX.PlayerData = {}
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
	ESX.PlayerData.job = job
end)

local target = {}

table.insert(target, {
	event = "Duty:Menu",
	icon = "fas fa-box-circle-check",
	label = "Open Duty Menu",
	job = {["police"] = 0, ["off-duty"] = 0}
})                                                       

RegisterNetEvent('notification')
AddEventHandler('notification', function(reason)
	SendNUIMessage({
		part = "Notify",
		reason = reason
	})
end)       

CreateThread(function()
	while true do 
		Wait(0)
		sleep = true
      
		if Config.QTarget == true then
			exports.qtarget:AddTargetModel({1573132612}, {options = target, distance = 2.5})
		else
			local playerCoords = GetEntityCoords(PlayerPedId(), false)
			local dist = Vdist(playerCoords.x, playerCoords.y, playerCoords.z, Config.Utils.Marker.x, Config.Utils.Marker.y, Config.Utils.Marker.z)
			if dist <= Config.Utils.DrawDistance and ESX.PlayerData.job and ESX.PlayerData.job.name  == Config.Job or ESX.PlayerData.job and ESX.PlayerData.job.name == Config.OffDuty then 
				sleep = false
				DrawMarker(20, Config.Utils.Marker.x, Config.Utils.Marker.y, Config.Utils.Marker.z,0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.3, 0.2, 0.2, 187, 255, 0, 255, false, true, 2, nil, nil, false)
				ESX.ShowHelpNotification(Config.Trans.Press)
					
				if IsControlJustReleased(0, Config.Key) then
					TriggerEvent("Duty:Menu")
				end
			end   
		end
		if sleep then
			Wait(500)
		end
	end
end)




AddEventHandler("Duty:Menu", function()
	TriggerEvent("nh-context:createMenu", {
	{
		header = "Police Duty-System",
	},
	{
		header = "On-Duty",
          	context = "Go On-Duty as a police officer",
          	server = true,
          	event = "On-Duty",
          	args = {1,2}
      	},
      	{
          	header = "Off-Duty",
          	context = "Go Off-Duty",
          	server = true,
          	event = "Off-Duty",	
          	args = {1,2}
      	}
  	})
end)
