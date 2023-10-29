#packmode challenge

import crafttweaker.event.EntityTravelToDimensionEvent;
import crafttweaker.event.EntityLivingEquipmentChangeEvent;
import crafttweaker.event.PlayerOpenContainerEvent;
import crafttweaker.event.EntityLivingDamageEvent;
import crafttweaker.events.IEventManager;

import crafttweaker.entity.IEntityEquipmentSlot;
import crafttweaker.player.IPlayer;
import crafttweaker.entity.IEntity;
import crafttweaker.entity.IEntityDefinition;
import crafttweaker.data.IData;
import crafttweaker.item.IItemStack;

static scriptDebug as bool = false;
/*
val extraIllegalInBetween = [
    <minecraft:stone>,
    <minecraft:dirt:*>
] as IItemStack[];

<ore:extraIllegalInBetween>.add(extraIllegalInBetween);
/*
    TODO

    Bauble check (and Enderchest check?) - DONE

    Damage Dealt cap and Damage Taken floor
        respects Brews

    Equipment Change drop - DONE
*

//41 entities that can hurt you in BL, a
val damageLimits as float[IEntityDefinition] = {
    <entity:thebetweenlands:swamp_hag> : 0.5
};
*/

val betweenlandsID = 20;

function baubleCheck (player as IPlayer) as bool {
    if(player.nbt.ForgeCaps.asMap()["baubles:container"].Items.length != 0){
        if(scriptDebug) print(player.name +" has Baubles equipped");
        return false;
    }
    return true;
}

function itemCheck (stack as IItemStack) as bool {
    if(!isNull(stack) && stack.definition.owner != "thebetweenlands"){
        if(scriptDebug) print("Item");
        return false;
    }
    return true;
}

function doEquipmentDrop (stack as IItemStack, slot as IEntityEquipmentSlot, player as IPlayer) as void {
        if(scriptDebug) print(player.name +" tried to hold "+ stack.commandString +" in The Betweenlands, it has been forcibly dropped due to Challenge Mode restrictions");
        val itemEntity = stack.createEntityItem(player.world, player.posX as int, player.posY as int + 3, player.posZ as int);
        itemEntity.motionY = 0.3;
        player.world.spawnEntity(itemEntity);
        player.setItemToSlot(slot, null);
}

events.onEntityTravelToDimension(function(event as EntityTravelToDimensionEvent){
    if(!event.entity.world.remote && event.dimension == betweenlandsID){
        if(event.entity instanceof IPlayer){
            val player as IPlayer = event.entity;
            var isAllowedBetween = true;
            var currentStack as IItemStack;
            var equipIndex = 0;

            //Armor, Offhand, and Mainhand check
            for equip in player.equipmentAndArmor {
                if(!isNull(equip) && equip.definition.owner != "thebetweenlands"){
                    if(scriptDebug) print("Item in equip slot "+ equipIndex +": "+ equip.commandString +", Mod: "+ equip.definition.owner);
                    isAllowedBetween = false;
                    break;
                }
                equipIndex += 1;
            }

            //Baubles check
            if(isAllowedBetween) isAllowedBetween = baubleCheck(player);

            //Main Inventory check
            if(isAllowedBetween) for index in 0 to 36 {
                currentStack = player.getInventoryStack(index);
                if(!isNull(currentStack) && player.getInventoryStack(index).definition.owner != "thebetweenlands"){
                    if(scriptDebug) print("Item in slot "+ index +": "+ currentStack.commandString +", Mod: "+ currentStack.definition.owner);
                    isAllowedBetween = false;
                    break;
                }
            }
            /*
            //Enderchest check code incase it needs to be more draconian
            if(isAllowedBetween) for enderItem in player.nbt.EnderItems.asList() {
                if(enderItem.id as string.split(":")[0] != "thebetweenlands"){
                    if(scriptDebug) print("Ender Chest Item in slot "+ enderItem.Slot +": "+ enderItem.id);
                    isAllowedBetween = false;
                    break;
                }
            }
            //*/
            if(scriptDebug) print("Can "+ player.name +" go to The Betweenlands?: "+ isAllowedBetween);

            if(!isAllowedBetween){
                player.sendChat(game.localize("mce.challengemode.betweenlands_restrictions.denied_entry_message.1"));
                player.sendChat(game.localize("mce.challengemode.betweenlands_restrictions.denied_entry_message.2"));
                if(scriptDebug) print(player.name +" attempted travel to The Betweenlands, but was rejected due to having disallowed Items.");
                event.cancel();
            }
            return;

            //Deny non-BL entities travelling to BL
            // prevents very mean entities from going in and being a massive problem, and also cheese of getting non-BL items inside via item entities or those with accessible inventories
        } else if(event.entity.definition.id.split(":")[0] != "thebetweenlands"){
            if(scriptDebug) print("Entity "+ event.entity.definition.id +" attempted entry to The Betweenlands at [x"+ event.entity.x as int +" y"+ event.entity.y as int +" z"+ event.entity.z as int +"], but was rejected due to Challenge Mode restrictions");
            event.cancel();
            return;
        }
    }
});

//Drop Non-BL items equipped or held in hand(s) when in BL
events.onEntityLivingEquipmentChange(function(event as EntityLivingEquipmentChangeEvent){
    if(!event.entityLivingBase.world.remote && event.entityLivingBase.dimension == betweenlandsID && event.entityLivingBase instanceof IPlayer && !isNull(event.newItem)){
        val player as IPlayer = event.entityLivingBase;
        if(event.newItem.definition.owner != "thebetweenlands"){
            player.sendChat(game.localize("mce.challengemode.betweenlands_restrictions.equipped_restricted_item"));
            doEquipmentDrop(event.newItem, event.slot, player);
        } else if(event.newItem.isEnchanted){
            player.sendChat(game.localize("mce.challengemode.betweenlands_restrictions.equipped_enchanted_item"));
            doEquipmentDrop(event.newItem, event.slot, player);
        }
    }
});

//Multiplies damage by factor of the player's health above 20, so that you can't just have 9000 health and ignore dying.
// i might make a healing one, but it may have complications with non-BL healing sources.
events.onEntityLivingDamage(function(event as EntityLivingDamageEvent){
    if(!event.entity.world.remote && event.entity.dimension == betweenlandsID){
        if(scriptDebug) print("Starting Damage: "+ event.amount);
        if(event.entity instanceof IPlayer){
            val player as IPlayer = event.entity;
            val playerHealthFactor as float = player.health / 20;
            event.amount *= playerHealthFactor;
            if(scriptDebug) print("Damage after Health Factor adjustment: "+ event.amount);
            /*
            if(!(event.damageSource.trueSource instanceof IPlayer) && event.damageSource.trueSource.definition.id.split(":")[0] == "thebetweenlands"){
                var currentMin = damageLimits[event.damageSource.trueSource.definition] as float;

                for effect in player.activePotionEffects {
                    if(effect.effectName == "effect.resistance"){
                        event.amount *= (1.0 - (0.2 * ((effect.amplifier + 1) < 3 ? effect.amplifier : 3)));
                        if(!scriptDebug) break;
                    }
                    if(scriptDebug){
                        print(effect.effectName);
                        print("Damage after Resistance compensation: "+ event.amount);
                    }
                }

                if(scriptDebug){
                    print("Attacker ID: "+ event.damageSource.trueSource.definition.id);
                    print("Starting Amount: "+ event.amount);
                    print("Cap from this Entity: "+ currentMin);
                    print("Player's active Potion Effects:");
                }

                if(event.amount < currentMin) event.amount = currentMin;
            }
            */
        } else if(event.damageSource.trueSource instanceof IPlayer){
            /*
            val player as IPlayer = event.damageSource.trueSource;
            print("Player-Sourced attack, Details: Source Entity: "+ event.damageSource.trueSource.displayName +", Victim: "+ event.entity.displayName +", Amount: "+ event.amount);
            if(event.amount > 12.0){
                var strengthCompensation as float;
                for effect in player.activePotionEffects {
                    if(effect.effectName == "effect.strength"){
                        strengthCompensation += (3.0 * (effect.amplifier + 1)) as float;
                        break;
                    } else if(effect.effectName == "bl.elixir.strength"){
                        strengthCompensation += (3.5 * (effect.amplifier + 1)) as float;
                    }
                }
                event.amount = 12.0 + strengthCompensation;
            }
            //*/
        } else if(scriptDebug){
            print("Environmental Damage of type: "+ event.damageSource.damageType +", Amount: "+ event.amount);
        }
    }
});
/*
events.onPlayerOpenContainer(function(event as PlayerOpenContainerEvent){
    print(event.container as string);
});
*/
