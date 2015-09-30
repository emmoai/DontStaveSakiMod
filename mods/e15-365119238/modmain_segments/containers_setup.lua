local require = GLOBAL.require
require "prefabutil"
require "class"
local containers = require "containers"
local cooking = require "cooking"
containers.old_widgetsetup=containers.widgetsetup

local params = {}
params.cookpot =
{
    widget =
    {
        slotpos =
        {
            --Vanilla
            GLOBAL.Vector3(0, 65+64 + 32 + 8 + 4, 0), 
            GLOBAL.Vector3(0, 65+32 + 4, 0),
            GLOBAL.Vector3(0, 65-(32 + 4), 0), 
            GLOBAL.Vector3(0, 65-(64 + 32 + 8 + 4), 0),
            
            --smarter crock pot image
            -- GLOBAL.Vector3(-55, -0*75 + 436 ,0),
            -- GLOBAL.Vector3(-55, -1*75 + 436 ,0),
            -- GLOBAL.Vector3(-55, -2*75 + 436 ,0),
            -- GLOBAL.Vector3(-55, -3*75 + 436 ,0),
            
        },
        --mod start
        utilslotpos = 
        {
            GLOBAL.Vector3(0, 65-(72+64 + 32 + 8 + 4), 0),
            -- GLOBAL.Vector3(-55, -4*75 + 436 ,0),
        },
        animbank = "ui_cookpot_1x4",
        animbuild = "ui_cookpot_1x4",
        -- bgatlas = "images/ui_cookpot_1x5.xml",
        -- bgimage = "ui_cookpot_1x5.tex",
        --mod end
        pos = GLOBAL.Vector3(200, 0, 0),
        side_align_tip = 100,
        buttoninfo =
        {
            text = "ÅëÖó",
            position = GLOBAL.Vector3(0, -240, 0),
            -- position = GLOBAL.Vector3(-55, -235+256, 0),
        },
        --mod
        buttoninfo2 =
        {
            text = "Ô¤²â",
            position = GLOBAL.Vector3(-0, -185, 0),
            -- position = GLOBAL.Vector3(-55, -180+256, 0),
        },
    },
    acceptsstacks = false,
    type = "cooker",
}
function params.cookpot.itemtestfn(container, item, slot)
    return cooking.IsCookingIngredient(item.prefab)
end
--mod

local function button_push_fn(inst,action)
    --server size
    if inst.components.container ~= nil then
        GLOBAL.BufferedAction(inst.components.container.opener, inst, action):Do()
    --client size
    elseif inst.replica.container ~= nil and not inst.replica.container:IsBusy() then
        GLOBAL.SendRPCToServer(GLOBAL.RPC.DoWidgetButtonAction, action.code, inst,action.mod_name)
    end
end
function params.cookpot.widget.buttoninfo2.fn(inst)
    button_push_fn(inst,GLOBAL.ACTIONS.PREDICT)
end
function params.cookpot.widget.buttoninfo.fn(inst)
    button_push_fn(inst,GLOBAL.ACTIONS.COOK)
end

function params.cookpot.widget.buttoninfo.validfn(inst)
    return inst.replica.container ~= nil and inst.replica.container:IsFull()
end
params.cookpot.widget.buttoninfo2.validfn = params.cookpot.widget.buttoninfo.validfn 



function containers.widgetsetup(container, prefab)
    target = prefab or container.inst.prefab
    if target == "cookpot" then
        local t = params.cookpot
        if t ~= nil then
            for k, v in pairs(t) do
                container[k] = v
            end
            container:SetNumSlots(container.widget.slotpos ~= nil and #container.widget.slotpos or 0)
        end
    else
        containers.old_widgetsetup(container,prefab)
    end

end
