local tArgs = {...}
local targetAir = tonumber(tArgs[1])
local totalAir = settings.get("airship.burners.main.hotair")
local redstone_links = peripheral.wrap("right")
-- Find power for the main burners
local powerMain = 15
while((powerMain/15) * totalAir > targetAir) do
powerMain = powerMain - 1
end
targetAir = targetAir - (powerMain/15) * totalAir
-- find power for the precision burners
totalAir = settings.get("airship.burners.precision.hotair")
local powerPrecision = 15
while((powerPrecision/15) * totalAir > targetAir) do
powerPrecision = powerPrecision - 1
end
-- send link signals
redstone_links.sendLinkSignal(settings.get("airship.burners.main.channel.frequency1"), settings.get("airship.burners.main.channel.frequency2"), powerMain)
redstone_links.sendLinkSignal(settings.get("airship.burners.precision.channel.frequency1"), settings.get("airship.burners.precision.channel.frequency2"), powerPrecision)