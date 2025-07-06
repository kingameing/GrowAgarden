-- Load Rayfield UI
local Rayfield = loadstring(game:HttpGet("https://sirius.menu/rayfield"))()

local Window = Rayfield:CreateWindow({
    Name = "Grow A Garden | Dark Spawner",
    LoadingTitle = "Initializing...",
    LoadingSubtitle = "by Kingameing",
    ConfigurationSaving = { Enabled = false },
    Discord = { Enabled = false },
    KeySystem = false,
})

local pets = { "Racoon", "Cow", "Dog", "Rabbit", "Dragonfly", "Raccoon" }
local eggs = { "Common Egg", "Rare Egg", "Bug Egg", "Dinosaur Egg" }
local seeds = GrowAGardenItems and GrowAGardenItems.Seeds or { "Carrot", "Pumpkin", "Sunflower" }

local selectedPet, selectedEgg, selectedSeed = pets[1], eggs[1], seeds[1]

-- Tab: Pet
local petTab = Window:CreateTab("Pet", 4483362458)
petTab:CreateDropdown({
    Name = "Select Pet",
    Options = pets,
    CurrentOption = selectedPet,
    Callback = function(val) selectedPet = val end,
})
petTab:CreateInput({
    Name = "Weight",
    PlaceholderText = "e.g. 10.0",
    Callback = function(val) _G.petWeight = tonumber(val) end
})
petTab:CreateInput({
    Name = "Age",
    PlaceholderText = "e.g. 10",
    Callback = function(val) _G.petAge = tonumber(val) end
})
petTab:CreateButton({
    Name = "Spawn Pet",
    Callback = function()
        if typeof(SpawnPet) == "function" then
            SpawnPet(selectedPet, _G.petWeight or 10, _G.petAge or 10)
        else
            Rayfield:Notify({ Title = "Error", Content = "SpawnPet() not found!", Duration = 4 })
        end
    end
})

-- Tab: Egg
local eggTab = Window:CreateTab("Egg", 4483362458)
eggTab:CreateDropdown({
    Name = "Select Egg",
    Options = eggs,
    CurrentOption = selectedEgg,
    Callback = function(val) selectedEgg = val end,
})
eggTab:CreateButton({
    Name = "Spawn Egg",
    Callback = function()
        if typeof(SpawnEgg) == "function" then
            SpawnEgg(selectedEgg)
        else
            Rayfield:Notify({ Title = "Error", Content = "SpawnEgg() not found!", Duration = 4 })
        end
    end
})

-- Tab: Seed
local seedTab = Window:CreateTab("Seed", 4483362458)
seedTab:CreateDropdown({
    Name = "Select Seed",
    Options = seeds,
    CurrentOption = selectedSeed,
    Callback = function(val) selectedSeed = val end,
})
seedTab:CreateButton({
    Name = "Spawn Seed",
    Callback = function()
        if typeof(SpawnSeed) == "function" then
            SpawnSeed(selectedSeed)
        else
            Rayfield:Notify({ Title = "Error", Content = "SpawnSeed() not found!", Duration = 4 })
        end
    end
})

-- Load original script
loadstring(game:HttpGet("https://raw.githubusercontent.com/kingameing/GrowAgarden/refs/heads/main/Dark%20Spawner"))()
