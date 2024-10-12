function ShowNotification(msg)
  SetNotificationTextEntry('STRING')
  AddTextComponentString(msg)
  DrawNotification(true, true)
end

RegisterCommand(Config.NameCommands, function(source, args, rawCommand)
  local targetPlayer = tonumber(args[1])
  local message = table.concat(args, " ", 2)

  if targetPlayer and message ~= "" then
    TriggerServerEvent('vapeCheckAdminPermission', targetPlayer, message)
  else
    TriggerEvent('chat:addMessage', {
      color = {255, 0, 0},
      multiline = true,
      args = {"[Utilisation]","/"..Config.NameCommands.." [ID] [Message]"}
    })
  end
end, false)

RegisterNetEvent('vapeSendMessage')
AddEventHandler('vapeSendMessage', function(message)
  TriggerEvent('chat:addMessage', {
    color = {255, 255, 0},
    multiline = true,
    args = {"Message Staff: ", "".. message}
  })
end)

RegisterNetEvent('vapeNoPermission')
AddEventHandler('vapeNoPermission', function()
  TriggerEvent('chat:addMessage', {
    color = {255, 0, 0},
    multiline = true,
    args = {"[Erreur]", "Vous n'avez pas la permission d'exécuter cette commande"}
  })
end)
