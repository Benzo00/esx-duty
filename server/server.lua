local Webhook = "" --- Add your webhook here


RegisterNetEvent("On-Duty")
AddEventHandler("On-Duty", function()
    local xPlayer = ESX.GetPlayerFromId(source)
    local job = xPlayer.job.name
    local grade = xPlayer.job.grade
    local reason = "Went On-Duty" --- For the Webhook
    for k,v in pairs(Config.Zones) do
    if job == v.OffDuty then
        xPlayer.setJob(v.Job, grade)
        TriggerClientEvent("esx:showNotification", source, Config.Trans.OnDuty, "success")
        Discord(source,  reason)
    else
        TriggerClientEvent("esx:showNotification", source, Config.Trans.AlreadyOnDuty, "error")
    end
    end
end)

RegisterNetEvent("Off-Duty")
AddEventHandler("Off-Duty", function()
    local xPlayer = ESX.GetPlayerFromId(source)
    local job = xPlayer.job.name
    local grade = xPlayer.job.grade
    local reason = "Went Off-Duty" --- For the Webhook
    for k,v in pairs(Config.Zones) do
    if job == v.Job then
        xPlayer.setJob(v.OffDuty, grade)
        TriggerClientEvent("esx:showNotification", source, Config.Trans.OffDuty, "success")
        Discord(source,  reason)
    else
        TriggerClientEvent("esx:showNotification", source, Config.Trans.AlreadyOffDuty, "error")
    end
    end
end)


function Discord(source,  reason, color)
    local xPlayer = ESX.GetPlayerFromId(source)
    local connect = {
          {
              ["color"] = 0191102,
              ["title"] = "Duty System",
              ["description"] = "```Name:" .. xPlayer.getName() .. "``` ```" .. reason .. " ``````Date: " .. os.date('%x %X %p') .. "```" ,
              ["footer"] = {
              },
          }
      }
      PerformHttpRequest(Webhook, function(err,  text, headers) end, 'POST', json.encode({" [" .. source .. "]",  embeds = connect, content = message, avatar_url = image, tts = false}), { ['Content-Type'] = 'application/json' })
end

AddEventHandler('onResourceStart', function(resourceName)
    if (GetCurrentResourceName() ~= resourceName) then
      return
    end

        print("-----------------------------------------------------------------------------")
        print("")                        
        print("███████╗███████╗██╗  ██╗    ██████╗ ██╗   ██╗████████╗██╗   ██╗")
        print("██╔════╝██╔════╝╚██╗██╔╝    ██╔══██╗██║   ██║╚══██╔══╝╚██╗ ██╔╝")
        print("█████╗  ███████╗ ╚███╔╝     ██║  ██║██║   ██║   ██║    ╚████╔╝ ")
        print("██╔══╝  ╚════██║ ██╔██╗     ██║  ██║██║   ██║   ██║     ╚██╔╝  ")
        print("███████╗███████║██╔╝ ██╗    ██████╔╝╚██████╔╝   ██║      ██║   ")
        print("╚══════╝╚══════╝╚═╝  ╚═╝    ╚═════╝  ╚═════╝    ╚═╝      ╚═╝    ")                                                                                           
        print("")
        print("                    ^1 Author: Benzo#6565^0")
        print("-----------------------------------------------------------------------------")

  end)
 
 
 