
local MakePlayerCharacter = require "prefabs/player_common"

local assets = {
    Asset( "ANIM", "anim/umi.zip" ),
	Asset("SOUND", "sound/wathgrithr.fsb"),
	Asset( "ANIM", "anim/ghost_umi_build.zip" ),

}
local prefabs = {
"rosebow",
}




local function common_postinit(inst)
	
    inst.MiniMapEntity:SetIcon("umi.tex")
	inst:AddTag("umi") 
end

local function master_postinit(inst)
	
	inst.talker_path_override = "dontstarve_DLC001/characters/"
	inst.soundsname = "wathgrithr"
	
	inst.components.health:SetMaxHealth(150)
	inst.components.hunger:SetMax(150)
	inst.components.sanity:SetMax(150)
	inst.components.combat.damagemultiplier = 1.2
	inst.components.sanity.neg_aura_mult = 2

end




local start_inv = {
-- Custom starting items
	"rosebow",
}


STRINGS.CHARACTER_TITLES.umi = "Umi"
STRINGS.CHARACTER_NAMES.umi = "Umi"
STRINGS.CHARACTER_DESCRIPTIONS.umi = "*Umiװ����֮�����мӳ� \n Umi��ѧԺż�� \n Umi�¹��"
STRINGS.CHARACTER_QUOTES.umi = "\"����Umi�İ�֮����!!!.\""

return MakePlayerCharacter("umi", prefabs, assets, common_postinit, master_postinit, start_inv)
