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






CreateThread(function()
  while true do 
    local sleep = 500
    for k,v in pairs(Config.Zones) do
    
    if Config.QTarget == true then
      exports.qtarget:AddBoxZone("Benzo-Duty", vector3(441.1, -980.16, 30.69), 1.5, 1.5, {
      name="Benzo-Duty", heading=0,debugPoly=false,minZ=30.77834,maxZ=35.87834,
      job = {["police"] = 0, ["off-duty"] = 0},}, {options = {{event = "Duty:Menu", icon = "fas fa-box-circle-check", label = "Open Duty Menu", },},distance = 2.5})
    else
        local playerCoords = GetEntityCoords(PlayerPedId(), false)
        local dist = #(playerCoords - v.Pos)
        if dist <= v.DrawDistance then
         if ESX.PlayerData.job and ESX.PlayerData.job.name  == v.Job or ESX.PlayerData.job and ESX.PlayerData.job.name == v.OffDuty then 
          sleep = 0
            ESX.TextUI(Config.Trans.Press)
            DrawMarker(20, v.Pos ,0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.3, 0.2, 0.2, 187, 255, 0, 255, false, true, 2, nil, nil, false)
            if IsControlJustReleased(0, Config.Key) then
                TriggerEvent("Duty:Menu")
            end
          end   
          else
              ESX.HideUI()
      end
    end
    end
    Wait(sleep)
  end
end)





RegisterNetEvent("Duty:Menu", function()
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






