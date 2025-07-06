local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
    Name = "Grow A Garden - Dark Spawner",
    LoadingTitle = "Grow A Garden GUI",
    LoadingSubtitle = "by Kingameing",
    ConfigurationSaving = {
        Enabled = false,
    },
    Discord = {
        Enabled = false,
    },
    KeySystem = false,
})

-- Dropdown Options
local pets = {"Racoon", "Cow", "Dog", "Rabbit", "Dragon"}
local eggs = {"Basic Egg", "Golden Egg", "Mystery Egg"}
local seeds = {"Carrot", "Potato", "Pumpkin", "Corn"}

local selectedPet = pets[1]
local selectedEgg = eggs[1]
local selectedSeed = seeds[1]

-- Tabs
local MainTab = Window:CreateTab("Spawner", 4483362458)

MainTab:CreateDropdown({
    Name = "Select Pet",
    Options = pets,
    CurrentOption = selectedPet,
    Callback = function(option)
        selectedPet = option
    end,
})

MainTab:CreateButton({
    Name = "Spawn Pet",
    Callback = function()
        SpawnPet(selectedPet, 10.0, 10)
    end,
})

MainTab:CreateDropdown({
    Name = "Select Egg",
    Options = eggs,
    CurrentOption = selectedEgg,
    Callback = function(option)
        selectedEgg = option
    end,
})

MainTab:CreateButton({
    Name = "Spawn Egg",
    Callback = function()
        SpawnEgg(selectedEgg)
    end,
})

MainTab:CreateDropdown({
    Name = "Select Seed",
    Options = seeds,
    CurrentOption = selectedSeed,
    Callback = function(option)
        selectedSeed = option
    end,
})

MainTab:CreateButton({
    Name = "Spawn Seed",
    Callback = function()
        SpawnSeed(selectedSeed)
    end,
})
