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


//100% block LCRDRFS mobs spawning where they should not ever be
events.onEntityJoinWorld(function(event as crafttweaker.event.EntityJoinWorldEvent){
	if(!isNull(event.entity.definition)
	&& event.entity.definition.id.split(":")[0] == "lcrdrfs"
	&& event.entity.dimension != 1000
	//Avoid removing tamed T-R3X 1000
	&& (isNull(event.entity.nbt.tameState) || event.entity.nbt.tameState.asInt() == 0)){
		event.entity.setDead();
		event.cancel();
	}
});
