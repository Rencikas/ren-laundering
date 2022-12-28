core = nil

CreateThread(function()
    SetupCoreObject() 
end)

SetupCoreObject = function()
    if Core.Core == 'qb-core' then 
        core = exports['qb-core']:GetCoreObject()        
    elseif Core.Core == 'esx' then 
        core = exports['es_extended']:getSharedObject()
    end
end

AddTarget = function(entity, data)
    if Core.Target == 'qb-target' then 
        exports['qb-target']:AddTargetEntity(entity, { options = data, distance = 2 })
    elseif Core.Target == 'ox_target' then 
        exports.ox_target:addEntity(entity, data)
    elseif Core.Target == 'qtarget' then 
        exports.qtarget:AddTargetEntity(entity, { options = data, distance = 2 })
    end
end

TriggerCallBack = function(name, cb, data)
    if Core.Core == 'qb-core' then 
        core.Functions.TriggerCallback(name, function(result)
            cb(result)
        end, data)
    elseif Core.Core == 'esx' then 
        core.TriggerServerCallback(name, function(result)
            cb(result)
        end, data)   
    end
end