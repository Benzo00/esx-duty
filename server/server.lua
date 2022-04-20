RegisterNetEvent("On-Duty")
AddEventHandler("On-Duty", function()
    local xPlayer = ESX.GetPlayerFromId(source)
    local job = xPlayer.job.name
    local grade = xPlayer.job.grade
    local reason = "Went On-Duty" --- For the Webhook

    if job == Config.OffDuty then
        xPlayer.setJob(Config.Job, grade)
        TriggerClientEvent("notification", source,  Config.Trans.OnDuty .. " " .. xPlayer.getName())
        Discord(source,  reason)
    else
        TriggerClientEvent("notification", source, Config.Trans.AlreadyOnDuty)
    end
end)

RegisterNetEvent("Off-Duty")
AddEventHandler("Off-Duty", function()
    local xPlayer = ESX.GetPlayerFromId(source)
    local job = xPlayer.job.name
    local reason = "Went Off-Duty" --- For the Webhook
    if job == Config.Job then
        xPlayer.setJob(Config.OffDuty, 0)
        TriggerClientEvent("notification", source, Config.Trans.OffDuty)
        Discord(source,  reason)
    else
        TriggerClientEvent("notification", source, Config.Trans.AlreadyOffDuty)
    end
end)


function Discord(source,  reason, color)
    local xPlayer = ESX.GetPlayerFromId(source)
    local connect = {
          {
              ["color"] = Config.Webhook.Color,
              ["title"] = Config.Webhook.Title,
              ["description"] = "```Name:" .. xPlayer.getName() .. "``` ```" .. reason .. " ``````Date: " .. os.date(Config.Webhook.Date) .. "```" ,
              ["footer"] = {
              },
          }
      }
      PerformHttpRequest(Config.Webhook.Webhook, function(err,  text, headers) end, 'POST', json.encode({" [" .. source .. "]",  embeds = connect, content = message, avatar_url = image, tts = false}), { ['Content-Type'] = 'application/json' })
end

AddEventHandler('onResourceStart', function(duuty)
    if (GetCurrentResourceName() ~= duuty) then
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
 
 

