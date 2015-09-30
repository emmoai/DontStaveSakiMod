PrefabFiles = {
	"thomas",
	"diamondmattock",
}

Assets = {
    Asset( "IMAGE", "images/saveslot_portraits/thomas.tex" ),
    Asset( "ATLAS", "images/saveslot_portraits/thomas.xml" ),

    Asset( "IMAGE", "images/selectscreen_portraits/thomas.tex" ),
    Asset( "ATLAS", "images/selectscreen_portraits/thomas.xml" ),

    Asset( "IMAGE", "bigportraits/thomas.tex" ),
    Asset( "ATLAS", "bigportraits/thomas.xml" ),
	
	Asset( "IMAGE", "images/map_icons/thomas.tex" ),
	Asset( "ATLAS", "images/map_icons/thomas.xml" ),
	
	Asset( "IMAGE", "images/avatars/avatar_thomas.tex" ),
    Asset( "ATLAS", "images/avatars/avatar_thomas.xml" ),
	
	Asset( "IMAGE", "images/avatars/avatar_ghost_thomas.tex" ),
    Asset( "ATLAS", "images/avatars/avatar_ghost_thomas.xml" ),
		
	Asset("ATLAS", "images/inventoryimages/diamondmattock.xml"),
	
	Asset("SOUNDPACKAGE", "sound/thomas.fev"),
    Asset("SOUND", "sound/thomas.fsb"),
	
}

RemapSoundEvent( "dontstarve/characters/thomas/death_voice", "thomas/characters/thomas/death_voice" )
RemapSoundEvent( "dontstarve/characters/thomas/hurt", "thomas/characters/thomas/hurt" )
RemapSoundEvent( "dontstarve/characters/thomas/talk_LP", "thomas/characters/thomas/talk_LP" )
RemapSoundEvent( "dontstarve/characters/thomas/emote", "thomas/characters/thomas/emote" )
RemapSoundEvent( "dontstarve/characters/thomas/ghost_LP", "thomas/characters/thomas/ghost_LP" )
RemapSoundEvent( "dontstarve/characters/thomas/yawn", "thomas/characters/thomas/yawn" )

GLOBAL.thomas_voice = "default"

GetPlayer = GLOBAL.GetPlayer
ACTIONS = GLOBAL.ACTIONS

local require = GLOBAL.require
local STRINGS = GLOBAL.STRINGS

-- The character select screen lines
STRINGS.CHARACTER_TITLES.thomas = "托马斯"
STRINGS.CHARACTER_NAMES.thomas = "Thomas"
STRINGS.CHARACTER_DESCRIPTIONS.thomas = "*自带武器，27伤害，可砍树挖矿\n*白天掉脑残，晚上不掉 \n*喜欢烹饪过的食物"
STRINGS.CHARACTER_QUOTES.thomas = "\"章凡是神\""

-- Custom speech strings
STRINGS.CHARACTERS.THOMAS = require "speech_thomas"

-- The character's name as appears in-game 
STRINGS.NAMES.THOMAS = "Thomas"

-- The default responses of examining the character
STRINGS.CHARACTERS.GENERIC.DESCRIBE.THOMAS = 
{
	GENERIC = "Hey, Thomas!",
	ATTACKER = "You look kinda shifty, Thomas...",
	MURDERER = "Hey! Murderer! Go away!",
	REVIVER = "Thomas, reviver of ghosts!",
	GHOST = "You don't look too good, Thomas.",
}


--local inst = GLOBAL.inst
--AddSimPostInit(function(inst) --DLC and mod characters must be in a postinit to get rid of any and all crashes
 --if inst.prefab == "wathgrithr" or inst.prefab == "webber" then

--end
--end)

-- Let the game know character is male, female, or robot
table.insert(GLOBAL.CHARACTER_GENDERS.MALE, "thomas")

GLOBAL.STRINGS.NAMES.DIAMONDMATTOCK = "托马斯的钻石镐"
GLOBAL.STRINGS.CHARACTERS.THOMAS.DESCRIBE.DIAMONDMATTOCK = "砍树和挖矿的时间到了?"
GLOBAL.STRINGS.CHARACTERS.WAXWELL.DESCRIBE.DIAMONDMATTOCK = "I feel it doesn't want me to hold it."
GLOBAL.STRINGS.CHARACTERS.WENDY.DESCRIBE.DIAMONDMATTOCK = "A tool of sorts. It is awkward to hold."
GLOBAL.STRINGS.CHARACTERS.WICKERBOTTOM.DESCRIBE.DIAMONDMATTOCK = "It is composed of pure carbon, incredibly strong, but rather inelegant. "
GLOBAL.STRINGS.CHARACTERS.WILLOW.DESCRIBE.DIAMONDMATTOCK = "This tool so clumsy! How am I supposed to get logs to burn?"
GLOBAL.STRINGS.CHARACTERS.WOLFGANG.DESCRIBE.DIAMONDMATTOCK = "It feels... not-so-comfortable in my hands."
GLOBAL.STRINGS.CHARACTERS.WOODIE.DESCRIBE.DIAMONDMATTOCK = "I like it and all, but it's not much compared to Lucy."
GLOBAL.STRINGS.CHARACTERS.WX78.DESCRIBE.DIAMONDMATTOCK = "THIS TOOL PROHIBITS EFFICIENT USE FROM ALL BUT ITS OWNER."
GLOBAL.STRINGS.CHARACTERS.GENERIC.DESCRIBE.DIAMONDMATTOCK = "It looks useful but feels weird to hold."
GLOBAL.STRINGS.CHARACTERS.WATHGRITHR.DESCRIBE.DIAMONDMATTOCK = "It is nothing compared to my mighty spear!"
GLOBAL.STRINGS.CHARACTERS.WEBBER.DESCRIBE.DIAMONDMATTOCK = "I like the way it looks, but it's awkward to hold in our hands."
AddMinimapAtlas("images/map_icons/thomas.xml")
AddModCharacter("thomas")

