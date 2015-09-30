
local DebugSpawn = GLOBAL.DebugSpawn


function EquipCount(name)
  local eq = GetModConfigData(name)
  if eq == true then
    return 1
  else
    return 0
  end
end


local resources = {
  { prefab = "axe",        count = EquipCount("¸«Í·") },
  { prefab = "pickaxe",    count = EquipCount("Ìú¸ä") },
  { prefab = "shovel",     count = EquipCount("²ù×Ó") },
  { prefab = "torch",      count = EquipCount("»ð¾æ") },
  { prefab = "spear",      count = EquipCount("³¤Ã¬") },
  { prefab = "armorwood",  count = EquipCount("Ä¾¼×") },
  { prefab = "meat_dried", count = GetModConfigData("Å£Èâ¸É") },
  { prefab = "log",        count = GetModConfigData("Ä¾Í·")  },
  { prefab = "flint",      count = GetModConfigData("ËéÊ¯")  },
  { prefab = "rocks",      count = GetModConfigData("ÑÒÊ¯") },
  { prefab = "goldnugget", count = GetModConfigData("»Æ½ð") },
  { prefab = "twigs",      count = GetModConfigData("Ê÷Ö¦") },
  { prefab = "cutgrass",   count = GetModConfigData("¸î²Ý") },
  { prefab = "poop",       count = GetModConfigData("´ó±ã") },
  { prefab = "charcoal",   count = GetModConfigData("Ä¾Ì¿") },
  { prefab = "silk",       count = GetModConfigData("Ö©ÖëÍø") },
  { prefab = "gears",      count = GetModConfigData("³ÝÂÖ") },
}





function Give(inst, prefab, count)
  inst.components.inventory.ignoresound = true

  for i=1,count do
    local item = DebugSpawn(prefab)
    inst.components.inventory:GiveItem(item)
  end

  inst.components.inventory.ignoresound = false
end


function GrabAndGo(inst)

  local OnNewSpawn_prev = inst.OnNewSpawn

  local OnNewSpawn_new = function(inst)
    print("I knew it!  The government done gone to hell!")


    if(GetModConfigData("Ð¡Íµ±³°ü")) then
      local krampus_sack = DebugSpawn("krampus_sack")
      inst.components.inventory:Equip(krampus_sack)
    end


    for k, v in pairs(resources) do 
      Give(inst, v["prefab"], v["count"])
    end


    if OnNewSpawn_prev then
      return OnNewSpawn_prev(inst)
    end
  end
  inst.OnNewSpawn = OnNewSpawn_new

end


AddPlayerPostInit(GrabAndGo)

