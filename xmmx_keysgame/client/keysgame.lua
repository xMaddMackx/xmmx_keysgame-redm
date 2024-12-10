local gameResultPromise = nil

local function StartKeyGame(mode, keys, time, title, colorOne, colorTwo)
    gameResultPromise = promise.new()

    SetNuiFocus(true, true)

    Wait(500)
    SendNUIMessage({
        type = "StartKeysGame",
        mode = mode,
        totalKeys = keys,
        progressTime = time * 1000,
        title = title,
        colorMain = colorOne,
        colorActive = colorTwo
    })
    
    return Citizen.Await(gameResultPromise)
end

RegisterNUICallback('keysSuccess', function(data, cb)
    SetNuiFocus(false, false)  

    if gameResultPromise then
        gameResultPromise:resolve(true)
        if Config.Debug then print("Keys Game Succeeded") end
        gameResultPromise = nil
    end

    cb('ok')
end)

RegisterNUICallback('keysFailed', function(data, cb)
    SetNuiFocus(false, false) 

    if gameResultPromise then
        gameResultPromise:resolve(false)
        if Config.Debug then print("Keys Game Failed") end
        gameResultPromise = nil
    end

    cb('ok')
end)

exports("StartKeyGame", StartKeyGame)