AddComponentPostInit("playerspawner", function(PlayerSpawner, inst) inst:ListenForEvent("ms_playerdespawn", function (inst, player) if player and player.components.inventory then player.components.inventory:DropEverything(false,false) end end) end)