
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
  { prefab = "axe",        count = EquipCount("��ͷ") },
  { prefab = "pickaxe",    count = EquipCount("����") },
  { prefab = "shovel",     count = EquipCount("����") },
  { prefab = "torch",      count = EquipCount("���") },
  { prefab = "spear",      count = EquipCount("��ì") },
  { prefab = "armorwood",  count = EquipCount("ľ��") },
  { prefab = "meat_dried", count = GetModConfigData("ţ���") },
  { prefab = "log",        count = GetModConfigData("ľͷ")  },
  { prefab = "flint",      count = GetModConfigData("��ʯ")  },
  { prefab = "rocks",      count = GetModConfigData("��ʯ") },
  { prefab = "goldnugget", count = GetModConfigData("�ƽ�") },
  { prefab = "twigs",      count = GetModConfigData("��֦") },
  { prefab = "cutgrass",   count = GetModConfigData("���") },
  { prefab = "poop",       count = GetModConfigData("���") },
  { prefab = "charcoal",   count = GetModConfigData("ľ̿") },
  { prefab = "silk",       count = GetModConfigData("֩����") },
  { prefab = "gears",      count = GetModConfigData("����") },
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


    if(GetModConfigData("С͵����")) then
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

