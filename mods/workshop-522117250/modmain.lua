        PrefabFiles = 
        {
            "newbirds", 
            "berryblue",
            "berryblu2", 
            "blueberries", 
            "dug_berryblue", 
            "dug_berryblu2",
            "berrygree",
            "berrygre2", 
            "greenberries", 
            "dug_berrygree", 
            "dug_berrygre2",
            "pineapple",
            "dug_pineapple",
            "pappfruit",
            "pappdish",
            "treeapple",
            "treeapplepie",
            "appletree"
        }

        Assets = 
        {	
           Asset("ATLAS", "images/inventoryimages/bluer.xml"),
           Asset("ATLAS", "images/inventoryimages/robgr.xml"),
           Asset("ATLAS", "images/inventoryimages/robye.xml"),
           Asset("ATLAS", "images/inventoryimages/tucan.xml"),
           Asset("ATLAS", "images/inventoryimages/sickv.xml"),
           Asset("ATLAS", "images/inventoryimages/ntpie.xml"),
	         Asset("ATLAS", "images/inventoryimages/blueberry.xml"),
           Asset("ATLAS", "images/inventoryimages/blueberrydug.xml"),
           Asset("ATLAS", "images/inventoryimages/blueberry2dug.xml"),
           Asset("ATLAS", "images/inventoryimages/pappfruit.xml"),
           Asset("ATLAS", "images/inventoryimages/pappdish.xml"),
           Asset("ATLAS", "images/inventoryimages/treeapple.xml"),           
           Asset("ATLAS", "images/inventoryimages/treeapplepie.xml"),
           Asset("ATLAS", "images/inventoryimages/pineappledug.xml"),           
           Asset("ATLAS", "images/inventoryimages/greenberry.xml"), 
           Asset("ATLAS", "images/inventoryimages/greenberrydug.xml"),
           Asset("ATLAS", "images/inventoryimages/greenberry2dug.xml"),
           Asset( "IMAGE", "minimap/berryblue.tex" ),
           Asset( "ATLAS", "minimap/berryblue.xml" ), 
           Asset( "IMAGE", "minimap/pineapple.tex" ),
           Asset( "ATLAS", "minimap/pineapple.xml" ), 
           Asset( "IMAGE", "minimap/appletree.tex" ),
           Asset( "ATLAS", "minimap/appletree.xml" ), 
           Asset( "IMAGE", "minimap/berryblu2.tex" ),
           Asset( "ATLAS", "minimap/berryblu2.xml" ),
           Asset( "IMAGE", "minimap/berrygree.tex" ),
           Asset( "ATLAS", "minimap/berrygree.xml" ),  
           Asset( "IMAGE", "minimap/berrygre2.tex" ),
           Asset( "ATLAS", "minimap/berrygre2.xml" ),
        }
        AddMinimapAtlas("minimap/berryblue.xml")
        AddMinimapAtlas("minimap/appletree.xml")
        AddMinimapAtlas("minimap/berryblu2.xml")
        AddMinimapAtlas("minimap/pineapple.xml")
        AddMinimapAtlas("minimap/pineapple.xml")
        AddMinimapAtlas("minimap/berrygree.xml")
        AddMinimapAtlas("minimap/berrygre2.xml")
        
        STRINGS = GLOBAL.STRINGS
        RECIPETABS = GLOBAL.RECIPETABS
        Recipe = GLOBAL.Recipe
        Ingredient = GLOBAL.Ingredient
        TECH = GLOBAL.TECH

        GLOBAL.STRINGS.NAMES.BERRYBLUE = "��ݮ������"
        GLOBAL.STRINGS.CHARACTERS.GENERIC.DESCRIBE.BERRYBLUE = "�ޣ���Ȼ����ݮ."
        GLOBAL.STRINGS.NAMES.DUG_BERRYBLUE = "��ݮ������"
        GLOBAL.STRINGS.CHARACTERS.GENERIC.DESCRIBE.DUG_BERRYBLUE = "������������."
        GLOBAL.STRINGS.NAMES.BERRYBLU2 = "��ݮ������"
        GLOBAL.STRINGS.CHARACTERS.GENERIC.DESCRIBE.BERRYBLU2 = "����ɫ��!."
        GLOBAL.STRINGS.NAMES.DUG_BERRYBLU2 = "��ݮ������"
        GLOBAL.STRINGS.CHARACTERS.GENERIC.DESCRIBE.DUG_BERRYBLU2 = "�������������!."
        GLOBAL.STRINGS.NAMES.BERRYBL = "��ݮ"
        GLOBAL.STRINGS.CHARACTERS.GENERIC.DESCRIBE.BERRYBL = "�����ݮ�������!"
        GLOBAL.STRINGS.NAMES.BERRYBL_COOKED = "����ݮ"
        GLOBAL.STRINGS.CHARACTERS.GENERIC.DESCRIBE.BERRYBL_COOKED = "��ô������֭!."

        GLOBAL.STRINGS.NAMES.PINEAPPLE = "���ܴ�"
        GLOBAL.STRINGS.CHARACTERS.GENERIC.DESCRIBE.PINEAPPLE = "�������Լ��ĵ���"
        GLOBAL.STRINGS.NAMES.DUG_PINEAPPLE = "���ܴ�"
        GLOBAL.STRINGS.CHARACTERS.GENERIC.DESCRIBE.DUG_PINEAPPLE = "��㣬����������!"        
        GLOBAL.STRINGS.NAMES.PAPPFRUIT = "����"
        GLOBAL.STRINGS.CHARACTERS.GENERIC.DESCRIBE.PAPPFRUIT = "��������"        
        GLOBAL.STRINGS.NAMES.PAPPFRUIT_COOKED = "������"
        GLOBAL.STRINGS.CHARACTERS.GENERIC.DESCRIBE.PAPPFRUIT_COOKED = "���������������ζ��"
        GLOBAL.STRINGS.NAMES.PAPPDISH = "�����ӻ�"
        GLOBAL.STRINGS.CHARACTERS.GENERIC.DESCRIBE.PAPPDISH = "�����˯����!"
        GLOBAL.STRINGS.NAMES.TREEAPPLE = "Сƻ��"
        GLOBAL.STRINGS.CHARACTERS.GENERIC.DESCRIBE.TREEAPPLE = "��������ϲ���ĵ���!"
        GLOBAL.STRINGS.NAMES.TREEAPPLEPIE = "ƻ����"
        GLOBAL.STRINGS.CHARACTERS.GENERIC.DESCRIBE.TREEAPPLEPIE = "��ó�!"
        GLOBAL.STRINGS.NAMES.APPLETREE = "ƻ����"
        GLOBAL.STRINGS.CHARACTERS.GENERIC.DESCRIBE.APPLETREE = "�ⳤ�Ķ�ô�ߴ�!"

        GLOBAL.STRINGS.NAMES.BERRYGREE = "��÷��"
        GLOBAL.STRINGS.CHARACTERS.GENERIC.DESCRIBE.BERRYGREE = "���ܳ���."
        GLOBAL.STRINGS.NAMES.DUG_BERRYGREE = "��÷��"
        GLOBAL.STRINGS.CHARACTERS.GENERIC.DESCRIBE.DUG_BERRYGREE = "��ô����."
        GLOBAL.STRINGS.NAMES.BERRYGRE2 = "��÷��"
        GLOBAL.STRINGS.CHARACTERS.GENERIC.DESCRIBE.BERRYGRE2 = "�ó���."
        GLOBAL.STRINGS.NAMES.DUG_BERRYGRE2 = "��÷��"
        GLOBAL.STRINGS.CHARACTERS.GENERIC.DESCRIBE.DUG_BERRYGRE2 = "��ҩ."
        GLOBAL.STRINGS.NAMES.BERRYGR = "��÷"
        GLOBAL.STRINGS.CHARACTERS.GENERIC.DESCRIBE.BERRYGR = "���������Ǻܰ�."
        GLOBAL.STRINGS.NAMES.BERRYGR_COOKED = "����÷"
        GLOBAL.STRINGS.CHARACTERS.GENERIC.DESCRIBE.BERRYGR_COOKED = "Ҳ����Գ��˰�."


        GLOBAL.STRINGS.NAMES.BLUER = "����"
        GLOBAL.STRINGS.CHARACTERS.GENERIC.DESCRIBE.BLUER = "����ϲ����ɫ"
        GLOBAL.STRINGS.NAMES.ROBYE = "����"
        GLOBAL.STRINGS.CHARACTERS.GENERIC.DESCRIBE.ROBYE = "ɭ�ֵ���ɫ"
        GLOBAL.STRINGS.NAMES.ROBGR = "����"
        GLOBAL.STRINGS.CHARACTERS.GENERIC.DESCRIBE.ROBGR = "���������������"
        GLOBAL.STRINGS.NAMES.TUCAN = "������"
        GLOBAL.STRINGS.CHARACTERS.GENERIC.DESCRIBE.TUCAN = "�ȴ���"
        GLOBAL.STRINGS.NAMES.NTPIE = "�ʺ���"
        GLOBAL.STRINGS.CHARACTERS.GENERIC.DESCRIBE.NTPIE = "���ع���"
        GLOBAL.STRINGS.NAMES.SICKV = "����"
        GLOBAL.STRINGS.CHARACTERS.GENERIC.DESCRIBE.SICKV = "��Ҫ������"

        local pappfruit = Ingredient( "pappfruit", 1)
        pappfruit.atlas = "images/inventoryimages/pappfruit.xml"
      local pappdishrecipe = {
       name = "pappdish",
       test = function(cooker, names, tags) return names.pappfruit and tags.frozen == 2 end,
       priority = 5,
       weight = 1,
       foodtype = "VEGGIE",
       health = 5,
       hunger = 15,
       perishtime = TUNING.PERISH_ONE_DAY,
       sanity = -(3*TUNING.SANITY_SUPERTINY),
       cooktime = 1,
      }
    AddCookerRecipe("cookpot", pappdishrecipe)

    local treeapple = Ingredient( "treeapple", 1)
        pappfruit.atlas = "images/inventoryimages/treeapple.xml"
      local treeapplepierecipe = {
       name = "treeapplepie",
       test = function(cooker, names, tags) return names.treeapple and names.bird_egg and names.honey end,
       priority = 5,
       weight = 1,
       foodtype = "VEGGIE",
       health = 7,
       hunger = 12,
       perishtime = TUNING.PERISH_FAST,
       sanity = 5,
       cooktime = 1,
      }
    AddCookerRecipe("cookpot", treeapplepierecipe)

        AddPrefabPostInit("forest", function(inst)
          if GLOBAL.TheWorld.ismastersim then 
            inst:AddComponent("newbirdspawner")
          end
        end)





