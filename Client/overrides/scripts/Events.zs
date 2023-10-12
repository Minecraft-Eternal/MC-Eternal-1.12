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
