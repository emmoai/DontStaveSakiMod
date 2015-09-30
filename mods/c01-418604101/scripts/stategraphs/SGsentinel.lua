local WALK_SPEED = 4
local RUN_SPEED = 7

require("stategraphs/commonstates")

local actionhandlers = 
{
    ActionHandler(ACTIONS.GOHOME, "eat"),
    ActionHandler(ACTIONS.GOHOME, "eat"),
	ActionHandler(ACTIONS.TAKEITEM, "eat"),
}

local events=
{
    CommonHandlers.OnFreeze(),
    EventHandler("attacked", function(inst) if not inst.components.health:IsDead() and not inst.sg:HasStateTag("nointerrupt") and not inst.sg:HasStateTag("attack") then inst.sg:GoToState("hit") end end),
    EventHandler("doattack", function(inst) if inst.components.health:GetPercent() > 0 and not inst.sg:HasStateTag("busy") then inst.sg:GoToState("attack") end end),
    EventHandler("death", function(inst) inst.sg:GoToState("death") end),
    EventHandler("locomote", 
        function(inst) 
			if not inst.sg:HasStateTag("busy") then
				
				local is_moving = inst.sg:HasStateTag("moving")
				local wants_to_move = inst.components.locomotor:WantsToMoveForward()
				if not inst.sg:HasStateTag("attack") and is_moving ~= wants_to_move then
					if wants_to_move then
						inst.sg:GoToState("premoving")
					else
						inst.sg:GoToState("idle")
					end
				end
			end
        end),
}

local states=
{
     State{
        name = "death",
        tags = {"busy"},
        
        onenter = function(inst)
            inst.SoundEmitter:PlaySound("dontstarve/creatures/knight/explo")
            inst.AnimState:PlayAnimation("death")
            inst.Physics:Stop()
            RemovePhysicsColliders(inst)            
            inst.components.lootdropper:DropLoot(Vector3(inst.Transform:GetWorldPosition()))
            local sparks = SpawnPrefab("sparks")
            sparks.Transform:SetPosition(inst.Transform:GetWorldPosition() )  
			local small_puff = SpawnPrefab("small_puff")
	        small_puff.Transform:SetPosition(inst.Transform:GetWorldPosition() )	
        end,

    },    
    
    State{
        name = "premoving",
        tags = {"moving", "canrotate"},
        
        onenter = function(inst)
            inst.components.locomotor:WalkForward()
            inst.AnimState:PlayAnimation("walk_pre")
        end,
        
        timeline=
        {
            TimeEvent(3*FRAMES, function(inst) inst.SoundEmitter:PlaySound("dontstarve/creatures/knight/bounce") end),
        },
        
        events=
        {
            EventHandler("animover", function(inst) inst.sg:GoToState("moving") end),
        },
    },
    
    State{
        name = "moving",
        tags = {"moving", "canrotate"},
        
        onenter = function(inst)
            inst.components.locomotor:RunForward()
            inst.AnimState:PushAnimation("walk_loop")
        end,
        
        timeline=
        {
        
            TimeEvent(0*FRAMES, function(inst) inst.SoundEmitter:PlaySound("dontstarve/creatures/knight/bounce") end),
        },
        
        events=
        {
            EventHandler("animover", function(inst) inst.sg:GoToState("moving") end),
        },
        
    },    
    
    State{
        name = "idle",
        tags = {"idle", "canrotate"},
        
        ontimeout = function(inst)
			inst.sg:GoToState("taunt")
        end,
        
        onenter = function(inst, start_anim)
            inst.Physics:Stop()
			if inst.components.health and inst.components.health.currenthealth < inst.components.health.maxhealth
				and (TheWorld.state.israining
					or not ((not inst.components.moisture) or inst.components.moisture.moisture == 0)
				)
			then
				local sparks = SpawnPrefab("sparks2")
				sparks.Transform:SetPosition(inst.Transform:GetWorldPosition() )
			end
            local animname = "idle"
            if math.random() < .3 then
				inst.sg:SetTimeout(math.random()*2 + 1)
			end
            
			if start_anim then
				inst.AnimState:PlayAnimation(start_anim)
				inst.AnimState:PushAnimation("idle", true)
			else
				inst.AnimState:PlayAnimation("idle", true)
			end
        end,
    },
    

    State{
        name = "taunt",
        tags = {"busy"},
        
        onenter = function(inst)
            inst.Physics:Stop()
            inst.AnimState:PlayAnimation("taunt")
            --inst.SoundEmitter:PlaySound("dontstarve/creatures/knight/voice") --HORSE?? Really?
			if inst.components.health and inst.components.health.currenthealth < inst.components.health.maxhealth then
				local sparks = SpawnPrefab("sparks2")
				sparks.Transform:SetPosition(inst.Transform:GetWorldPosition() )    			
			end
        end,
        
        events=
        {
            EventHandler("animover", function(inst) inst.sg:GoToState("idle") end),
        },
    },

    State{
        name = "attack",
        tags = {"attack", "nointerrupt"},
        
        onenter = function(inst, target)
            inst.Physics:Stop()
            inst.components.combat:StartAttack()
            inst.AnimState:PlayAnimation("atk")
            inst.sg.statemem.target = target
        end,
        
        timeline=
        {
            TimeEvent(10*FRAMES, function(inst) inst.SoundEmitter:PlaySound("dontstarve/creatures/knight/attack") end),
            TimeEvent(10*FRAMES, function(inst) inst.SoundEmitter:PlaySound("dontstarve/creatures/knight/attack") end),
            TimeEvent(25*FRAMES, function(inst) inst.components.combat:DoAttack(inst.sg.statemem.target) end),
        },
        
        events=
        {
            EventHandler("animover", function(inst) inst.sg:GoToState("idle") end),
        },
    },

    State{
        name = "hit",
        
        onenter = function(inst)
            inst.SoundEmitter:PlaySound("dontstarve/creatures/knight/hurt")
            inst.AnimState:PlayAnimation("hit")
            inst.Physics:Stop()   
            local sparks = SpawnPrefab("sparks2")
            sparks.Transform:SetPosition(inst.Transform:GetWorldPosition() )   			
        end,
        
        events=
        {
            EventHandler("animover", function(inst) inst.sg:GoToState("idle") end ),
        },
    },    
    
    State{
        name = "hit_stunlock",
        tags = {"busy"},
        
        onenter = function(inst)
            inst.SoundEmitter:PlaySound("dontstarve/creatures/knight/hurt")
            inst.AnimState:PlayAnimation("hit")
            inst.Physics:Stop() 			
        end,
        
        events=
        {
            EventHandler("animover", function(inst) inst.sg:GoToState("idle") end ),
        },
    },  

}
CommonStates.AddFrozenStates(states)

  
return StateGraph("sentinel", states, events, "idle", actionhandlers)

