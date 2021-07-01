import crafttweaker.events.IEventManager;
import crafttweaker.enchantments.IEnchantment;
import crafttweaker.enchantments.IEnchantmentDefinition;
import crafttweaker.item.IItemStack;
import crafttweaker.player.IPlayer;

events.onEntityLivingUseItemStart(function(event as crafttweaker.event.EntityLivingUseItemEvent.Start){
	if(event.isPlayer){
		if(event.item.isEnchanted){
			var multishoot = <enchantment:cofhcore:multishot>.id;
			var listenchants as IEnchantment[] = event.item.enchantments as IEnchantment[];
			for enchts in listenchants {
				if(multishoot == enchts.definition.id){
					if(!isNull(event.player.mainHandHeldItem)){
						if(event.player.mainHandHeldItem.matches(event.item)){
							event.player.dropItem(true);
						}
					}
					if(!isNull(event.player.offHandHeldItem)){
						if(event.player.offHandHeldItem.matches(event.item)){
							event.player.setItemToSlot(crafttweaker.entity.IEntityEquipmentSlot.offhand(), null);
						}
					}
					event.player.sendChat("Multishot is disabled, but the player " ~ event.player.name ~ " tried to use anyways.");
				}
			}
		}
	}
});
