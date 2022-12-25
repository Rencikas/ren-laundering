local dealer = nil
RegisterNUICallback('CloseMenu', function()
    SetNuiFocus(false, false)
end)

RegisterNUICallback('LaunderMoney', function(data)
    SetNuiFocus(false, false)
end)

CreateThread(function()
    for i = 1, #Laundering do 
        RegisterPed(Laundering[i].Dealer)
    end
    SetupCoreObject()
end)

RegisterPed = function(data)
    -- local pData = RPC.Player.GetData()
    LoadModel(data.model)
    dealer = CreatePed(4, data.model, data.pos, data.heading, false, true)  

    AddTarget(dealer, {
        {
            name = 'Dealer',
            event = "ren-laundering:launder:money",
            icon = "fas fa-user-secret",
            label = "Launder money", 
        }
    })

    SetEntityAsMissionEntity(dealer, true, false)
    FreezeEntityPosition(dealer, true)
    SetPedCanRagdoll(dealer, false)
    TaskSetBlockingOfNonTemporaryEvents(dealer, 1)
    SetBlockingOfNonTemporaryEvents(dealer, 1)
    SetPedFleeAttributes(dealer, 0, 0)
    SetPedCombatAttributes(dealer, 17, 1)
    SetEntityInvincible(dealer, true)
    SetPedSeeingRange(dealer, 0)    

    -- if pData.job.name == 'oilstation' then 
    --     murrieta = AddBlipForCoord(data.pos)
    --     SetBlipSprite(murrieta, 769)
    --     SetBlipColour(murrieta, 39)
    --     SetBlipScale(murrieta, 0.80)
    --     SetBlipAsShortRange(murrieta, false)
    --     BeginTextCommandSetBlipName("STRING")
    --     AddTextComponentString("Murrieta Oil Company")
    --     EndTextCommandSetBlipName(murrieta)
    -- end
end

LoadModel = function(model)
    while not HasModelLoaded(model) do
        RequestModel(model)
        Wait(1)
    end
end

RegisterNetEvent('ren-laundering:launder:money', function()
    SetNuiFocus(true, true)
    SendNUIMessage({type = "open", MoneyAmount = 6969})
end)