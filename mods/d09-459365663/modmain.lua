--[[	Copyright (c) 2015 Kzisor/Ysovuka	]]

-- This library function allows us to use a file in a specified location.
-- Allows use to call global environment variables without initializing them in our files.
modimport("libs/env.lua")

--[[ Initialize data changes. ]]
use "data/init"

Assets = {
	Asset( "IMAGE", "images/avatars/avatar_mortox.tex" ),
    Asset( "ATLAS", "images/avatars/avatar_mortox.xml" ),
	
	Asset( "IMAGE", "images/avatars/avatar_ghost_mortox.tex" ),
    Asset( "ATLAS", "images/avatars/avatar_ghost_mortox.xml" ),

    Asset( "IMAGE", "images/saveslot_portraits/mortox.tex" ),
    Asset( "ATLAS", "images/saveslot_portraits/mortox.xml" ),

    Asset( "IMAGE", "images/selectscreen_portraits/mortox.tex" ),
    Asset( "ATLAS", "images/selectscreen_portraits/mortox.xml" ),

    Asset( "IMAGE", "bigportraits/mortox.tex" ),
    Asset( "ATLAS", "bigportraits/mortox.xml" ),

    Asset( "IMAGE", "images/inventoryimages/wortelisk.tex" ),
    Asset( "ATLAS", "images/inventoryimages/wortelisk.xml" ),

    Asset( "IMAGE", "images/minimap/mortox.tex" ),
    Asset( "ATLAS", "images/minimap/mortox.xml" ),

    Asset("SOUNDPACKAGE", "sound/wortox.fev"),
    Asset("SOUND", "sound/wortox.fsb"),
    
}

RemapSoundEvent( "dontstarve/characters/wortox/talk_LP", "wortox/characters/wortox/talk_LP" )
RemapSoundEvent( "dontstarve/characters/wortx/hurt", "wortox/characters/wortox/hurt" )
RemapSoundEvent( "dontstarve/characters/wortox/death_voice", "wortox/characters/wortox/death" )


PrefabFiles =
{
    "wortelisk",
    "mortox",
}

AddMinimapAtlas("images/minimap/mortox.xml")

AddModCharacter("mortox", "male")