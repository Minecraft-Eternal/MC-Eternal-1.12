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
						event.player.sendChat("Multishot is disabled, but the player " ~ event.player.name ~ " tried to use anyways.");
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
		if(delete){
			if (event.entityLivingBase instanceof IPlayer) {
				val user as IPlayer = event.entityLivingBase;
				if (!event.entityLivingBase.world.isRemote()) {
					event.entityLivingBase.setItemToSlot(event.slot, null);
				}
				if (event.entityLivingBase.world.isRemote()) {
					event.entityLivingBase.setItemToSlot(event.slot, null);
				}
				user.dropItem(event.newItem);
			}				
		}
	}
});
