import crafttweaker.events.IEventManager;
import crafttweaker.enchantments.IEnchantment;
import crafttweaker.enchantments.IEnchantmentDefinition;
import crafttweaker.item.IItemStack;
import crafttweaker.player.IPlayer;
import crafttweaker.entity.IEntityEquipmentSlot;

events.onEntityLivingUseItemStart(function(event as crafttweaker.event.EntityLivingUseItemEvent.Start){
	if(event.isPlayer){
		if(event.item.isEnchanted){
			var multishoot = <enchantment:cofhcore:multishot>.id;
			var listenchants as IEnchantment[] = event.item.enchantments as IEnchantment[];
			for enchts in listenchants {
				if(multishoot == enchts.definition.id){
					event.cancel();
					if (!event.player.world.isRemote()) {
						event.player.sendChat(game.localize("mce.cofhcore.message.multishot_is_infact_disabled").replace("%s", event.player.name));
					}
				}
			}
		}
	}
});


events.onEntityLivingEquipmentChange(function(event as crafttweaker.event.EntityLivingEquipmentChangeEvent){
	if(!isNull(event.newItem)){
		var listenchants as IEnchantment[] = event.newItem.enchantments as IEnchantment[];
		var delete = false;
		for enchts in listenchants {
			if(enchts.level > 35){
				delete = true;
				break;
			}
		}
		if(delete || event.newItem.definition.id == "inventorypets:solstice_sword"){
			if (event.entityLivingBase instanceof IPlayer) {
				val user as IPlayer = event.entityLivingBase;
				if (!event.entityLivingBase.world.isRemote()) {
					event.entityLivingBase.setItemToSlot(event.slot, null);
					user.sendChat(game.localize("mce.generic.message.item_yeeted_from_exist"));
				}
				if (event.entityLivingBase.world.isRemote()) {
					event.entityLivingBase.setItemToSlot(event.slot, null);
					user.sendChat(game.localize("mce.generic.message.item_yeeted_from_exist"));
				}
				
			}				
		}
	}
});

events.onPlayerInteractBlock(function(event as crafttweaker.event.PlayerInteractBlockEvent){
	if(!event.world.remote && event.block.definition.id has "tombstone:decorative_" && event.item.definition.id == "tombstone:book_of_disenchantment" && !isNull(event.player.offHandHeldItem)){
		for obj in event.player.nbt.ForgeCaps.asMap()["baubles:container"].Items.asList() {
			if(obj.id.asString() == "astralsorcery:itemenchantmentamulet"){
				event.player.sendChat("§c"+ game.localize("mce.tombstone.message.remove_resplendent_prism"));
				event.player.setCooldown(<tombstone:book_of_disenchantment>, 10);
				event.cancellationResult = "FAIL";
				event.cancel();
			}
		}
	}
});


//Pet Buff System helper functions
function updateEntityAttributeSafely (entity as IEntityLivingBase, attributeName as string, amount as double, maxAmount as double, operation as int) {
	val attribute = entity.getAttribute(attributeName);
	val attributeUUID = attributeUUIDMap[attributeName];
	val existingAmount = !isNull(attribute.getModifier(attributeUUID)) ? attribute.getModifier(attributeUUID).getAmount() : 0.0;

	if(existingAmount != maxAmount){
		if(!isNull(attribute.getModifier(attributeUUID)))
			attribute.removeModifier(attributeUUID);

		if(existingAmount < maxAmount)
			attribute.applyModifier(AttributeModifier.createModifier("MCE Pet Super Buff - "+ attributeName, amount, operation, attributeUUID));
	}
}

function getTrackerValue (entity as IEntityLivingBase, attributeName as string) as int {
	val attribute = entity.getAttribute(attributeName);
	val attributeUUID = attributeUUIDMap[attributeName] as string;
	val existingAmount as double = !isNull(attribute.getModifier(attributeUUID)) ? attribute.getModifier(attributeUUID).getAmount() : 0.0;
	val itemstack = boostingItemsMap[entity.definition.id][attributeName] as IItemStack;
	val attributeMaxAmount = petAttributeMap[entity.definition.id][attributeName] as double;
	
	if(debugBuffSystem){
		print("No. of items to max "+ attributeName +": "+ itemstack.amount);
		print("existing bonus of "+ attributeName +": "+ existingAmount);
		print("maximum amount of "+ attributeName +": "+ attributeMaxAmount);

		print("current level divided by existing: "+ (existingAmount / attributeMaxAmount));
		print(attributeName +" tracker level: "+ ((existingAmount / attributeMaxAmount) * itemstack.amount));
	}
	
	return ((existingAmount / attributeMaxAmount) * itemstack.amount) as int;
	//return !isNull(entity.nbt.asMap()["mce.bufftracker."+ itemstack.definition.name]) ? entity.nbt.asMap()["mce.bufftracker."+ itemstack.definition.name].asInt() : 0;
}

//Pet Buff System
events.onPlayerInteractEntity(function(event as crafttweaker.event.PlayerInteractEntityEvent){
	if(!event.world.remote
	&& !isNull(event.item) && event.item.matches(event.player.mainHandHeldItem)
	&& event.target instanceof IEntityLivingBase
	&& !isNull(event.target.definition)
	&& buffablePets has event.target.definition.id){
		val pet as IEntityLivingBase = event.target;
		var successfulModify = false;

		if(!(!isNull(pet.nbt.OwnerUUID) && pet.nbt.OwnerUUID == event.player.uuid || !isNull(pet.nbt.tameState) && pet.nbt.tameState.asInt() != 0)) return;

		if(debugBuffSystem){
			print("healing item map has entity "+ pet.definition.id +": "+ !isNull(gigaHealingItems[pet.definition.id]));
			if(!isNull(gigaHealingItems[pet.definition.id]))
				print("healing item map for "+ pet.definition.id +" has "+ event.item.definition.id +": "+ !isNull(gigaHealingItems[pet.definition.id][event.item]));
		}
		if(pet.health <= pet.maxHealth
			&& !isNull(gigaHealingItems[pet.definition.id])
			&& !isNull(gigaHealingItems[pet.definition.id][event.item.anyAmount()])){
			val healingItems = gigaHealingItems[pet.definition.id] as double[IItemStack];
			var succesfulHeal = false;

			for entry,amount in healingItems {
				if(debugBuffSystem){
					print("held item: "+ event.item.definition.id +", restores "+ (healingItems[event.item.anyAmount()] * 100) +"%");
					print("mapped item: "+ entry.definition.id +", restores "+ (amount * 100) +"%");
					print("held matches a mapped: "+ entry.matches(event.item));
				}

				if(entry.matches(event.item)){
					pet.heal((pet.getAttribute("generic.maxHealth").attributeValue * amount));
					if(!event.player.creative) event.item.mutable().shrink(1);
					if(debugBuffSystem) print("healing item cooldown: "+ (amount * 200) as int);
					event.player.setCooldown(entry, (amount * 200) as int);
					succesfulHeal = true;
					break;
				}
			}
			if(succesfulHeal) return;
		}

		if(<ore:petAnalyzeTool> has event.item){
			event.player.sendChat(game.localize("mce.petbuff.message.info_start")
				.replace("%s", pet.customName == "" ? pet.displayName : pet.customName +" ("+ game.localize("entity."+ pet.definition.name +".name") +")")
			);
			//mce.petbuff.message.info_line_base=%a (%v): Increase using %i (%t/%m)
			for attribute,item in boostingItemsMap[pet.definition.id] {
				event.player.sendChat(
					game.localize("mce.petbuff.message.info_line_base")
						.replace("%a", game.localize("attribute.name."+ attribute))
						.replace("%v", "§d"+ (pet.getAttribute(attribute).attributeValue != 1.401298464324817E-45 ? pet.getAttribute(attribute).attributeValue as string : "0.0") +"§r")
						.replace("%i", "§6"+ game.localize(item.definition.name +".name") +"§r")
						.replace("%t", "§d"+ getTrackerValue(pet, attribute) as string +"§r")
						.replace("%m", "§6"+ item.amount as string +"§r")
				);
			}
			if(!isNull(gigaHealingItems[pet.definition.id]))
				for entry,amount in gigaHealingItems[pet.definition.id] {
					event.player.sendChat(
						//mce.petbuff.message.info_healing_items_base=Can be healed using %i (%a%)
						game.localize("mce.petbuff.message.info_healing_items_base")
							.replace("%i", "§6"+ game.localize(entry.definition.name +".name") +"§r")
							.replace("%a", "§d"+ (amount * 100) +"%§r")
					);
				}

			event.player.setCooldown(event.item, 20);
			return;
		}

		for attribute,itemstack in boostingItemsMap[pet.definition.id] {
			if(!isNull(event.item) && (event.item * 1).matches(itemstack * 1)){
				val amount = petAttributeMap[pet.definition.id][attribute];
				var trackerValue = getTrackerValue(pet, attribute);
				
				if(debugBuffSystem){
					print("current item: "+ (!isNull(event.item) && !isNull(event.item.definition) ? event.item.definition.id : ""));
					print("mapped item: "+ itemstack.definition.id);

					print("current item NBT: "+ (!isNull(event.item) && !isNull(event.item.tag) ? event.item.tag.asString() : ""));
					print("mapped item NBT: "+ itemstack.tag.asString());
				}
				
				if(trackerValue < itemstack.amount){
					if(debugBuffSystem) print(attribute +" tracker value: "+ trackerValue);

					trackerValue += 1;
					successfulModify = true;

					if(debugBuffSystem) print(attribute +" updated tracker value: "+ trackerValue);
				}
				if(debugBuffSystem) print("");

				updateEntityAttributeSafely(pet, attribute, (amount / itemstack.amount) * trackerValue, amount, 0);
			}
		}
		if(successfulModify){
			if(!event.player.creative) event.item.mutable().shrink(1);
		}
		if(debugBuffSystem) print("");
	}
});


//100% block LCRDRFS mobs spawning where they should not ever be
events.onEntityJoinWorld(function(event as crafttweaker.event.EntityJoinWorldEvent){
	if(!isNull(event.entity.definition)
	&& event.entity.dimension != 1000
	//Avoid deleting projectile entities
	&& event.entity instanceof IEntityLivingBase
	&& event.entity.definition.id.split(":")[0] == "lcrdrfs"
	//Avoid removing tamed T-R3X 1000/ARTHR0-BORG JETLINER 2000
	&& (isNull(event.entity.nbt.tameState) || event.entity.nbt.tameState.asInt() == 0)){
		event.entity.setDead();
		event.cancel();
	}
});

