require("serialize")
serialize(false, "calibrated")
-- defines settings
settings.define("airship.burners.main.hotair", {
    description = "Cubic meters of hot air produced by main lift at full capacity",
    default = 500,
    type = "number",
})
settings.define("airship.burners.precision.hotAir", {
    description = "Cubic meters of hot air produced by precise lift at full capacity",
    default = 500,
    type = "number",
})
settings.define("airship.burners.main.channel.frequency1", {
    description = "First frequency of the main burners' channel",
    default = "minecraft:air",
    type = "string",
})
settings.define("airship.burners.main.channel.frequency2", {
    description = "Second frequency of the main burners' channel",
    default = "minecraft:air",
    type = "string",
})
settings.define("airship.burners.precision.channel.frequency1", {
    description = "First frequency of the precision burners' channel",
    default = "minecraft:air",
    type = "string",
})
settings.define("airship.burners.precision.channel.frequency2", {
    description = "Second frequency of the precision burners' channel",
    default = "minecraft:air",
    type = "string",
})
-- Start of calibration
print("==== Calibration =====================\n")
print("Make sure you follow the pre-setup instructions in the README that came with this program.\n")
-- saves the amount of hot air the balloon produces
print("How many cubic meters of hot air does your main burner collection produce total? If each burner in that collection uses the same amount then you can just multiply that amount by how many there are.\n")
mainBurners = tonumber(io.read())
settings.set("airship.burners.main.hotair", mainBurners)
print("How many cubic meters of hot air does your precision burner collection produce total? If you do not have any precision burners, you can just enter zero.\n")
precisionBurners = tonumber(io.read())
settings.set("airship.burners.precision.hotair", precisionBurners)
-- sets the channel for the main burners
print("What is the redstone link channel that corresponds to the main burners? Input the ID of the item in frequency 1, then the item in frequency 2. DO NOT INPUT THE NAMES OF THE ITEMS. INCLUDE THE MOD ID.\n")
settings.set("airship.burners.main.channel.frequency1", io.read())
settings.set("airship.burners.main.channel.frequency2", io.read())
-- sets the channel for the precision burners
print("What is the redstone link channel that corresponds to the precision burners? Input the ID of the item in frequency 1, then the item in frequency 2.\n")
settings.set("airship.burners.precision.channel.frequency1", io.read())
settings.set("airship.burners.precision.channel.frequency2", io.read())
-- sets calibrated to true and saves settings
serialize(true, "calibrated")
settings.save()