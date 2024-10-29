local areaRadius = 160.0
local certianArea = vector3(195.1, -933.78, 30.68)

AddEventHandler('populationPedCreating', function(x, y, z, model, setters)
    if #(certianArea - vector3(x, y, z)) < areaRadius then
        CancelEvent()
    end
end)