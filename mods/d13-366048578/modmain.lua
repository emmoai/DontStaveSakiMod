GetPlayer = GLOBAL.GetPlayer
local require = GLOBAL.require
local STRINGS = GLOBAL.STRINGS

PrefabFiles = {
	"devon",
	"birdy",
}

Assets = {
    Asset( "IMAGE", "images/saveslot_portraits/devon.tex" ),
    Asset( "ATLAS", "images/saveslot_portraits/devon.xml" ),

    Asset( "IMAGE", "images/selectscreen_portraits/devon.tex" ),
    Asset( "ATLAS", "images/selectscreen_portraits/devon.xml" ),

    Asset( "IMAGE", "bigportraits/devon.tex" ),
    Asset( "ATLAS", "bigportraits/devon.xml" ),
	
	Asset( "IMAGE", "images/map_icons/devon.tex" ),
	Asset( "ATLAS", "images/map_icons/devon.xml" ),
	
	Asset( "IMAGE", "images/map_icons/birdy.tex" ),
	Asset( "ATLAS", "images/map_icons/birdy.xml" ),
	
	Asset( "IMAGE", "images/avatars/avatar_devon.tex" ),
    Asset( "ATLAS", "images/avatars/avatar_devon.xml" ),
	
	Asset( "IMAGE", "images/avatars/avatar_ghost_devon.tex" ),
    Asset( "ATLAS", "images/avatars/avatar_ghost_devon.xml" ),
	
	Asset( "IMAGE", "images/inventoryimages/birdy.tex"),
	Asset( "ATLAS", "images/inventoryimages/birdy.xml"),
	
    Asset("SOUNDPACKAGE", "sound/devon.fev"),
    Asset("SOUND", "sound/devon.fsb"),
}


RemapSoundEvent( "dontstarve/characters/devon/death_voice", "devon/characters/devon/death_voice" )
RemapSoundEvent( "dontstarve/characters/devon/hurt", "devon/characters/devon/hurt" )
RemapSoundEvent( "dontstarve/characters/devon/talk_LP", "devon/characters/devon/talk_LP" )

-- The character select screen lines
STRINGS.CHARACTER_TITLES.devon = "���˵���"
STRINGS.CHARACTER_NAMES.devon = "Devon"
STRINGS.CHARACTER_DESCRIPTIONS.devon = "*�ٶ��е�죬���Ӧ�ģ������е��\n*�Դ����;���ѻñ��������ϻظ��Բ�.\n* ������һ�ε�"
STRINGS.CHARACTER_QUOTES.devon = "\"saki����ħ��\""

-- Custom speech strings
STRINGS.CHARACTERS.DEVON = require "speech_devon"

GLOBAL.STRINGS.NAMES.BIRDY = "��ѻñ"
GLOBAL.STRINGS.CHARACTERS.GENERIC.DESCRIBE.BIRDY = "��������·�, �ҿ����������!"

-- The character's name as appears in-game 
STRINGS.NAMES.DEVON = "Devon"

-- The default responses of examining the character
STRINGS.CHARACTERS.GENERIC.DESCRIBE.DEVON = 
{
	GENERIC = "It's Devon!",
	ATTACKER = "That Devon looks shifty...",
	MURDERER = "Murderer!",
	REVIVER = "Devon, friend of ghosts.",
	GHOST = "Devon could use a heart.",
}

-- Let the game know character is male, female, or robot
table.insert(GLOBAL.CHARACTER_GENDERS.MALE, "devon")

AddPrefabPostInit('birdy')
AddMinimapAtlas("images/map_icons/devon.xml")
AddMinimapAtlas("images/map_icons/birdy.xml")
AddModCharacter("devon")

