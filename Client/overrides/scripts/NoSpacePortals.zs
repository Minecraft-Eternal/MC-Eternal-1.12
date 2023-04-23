import crafttweaker.events.IEventManager;
import crafttweaker.player.IPlayer;
import crafttweaker.formatting.IFormattedText;

events.onEntityTravelToDimension(function(event as crafttweaker.event.EntityTravelToDimensionEvent){
	if(event.entity instanceof IPlayer){
		val user as IPlayer = event.entity;
		if(event.dimension == 424 || event.dimension == 66 || event.dimension == 1048) {
            val minX = (user.x as int) - 2;
            val maxX = (user.x as int) + 2;
            val minY = (user.y as int) - 2;
            val maxY = (user.y as int) + 2;
            val minZ = (user.z as int) - 2;
            val maxZ = (user.z as int) + 2;
			for X in minX to maxX {
				for Y in minY to maxY {
					for Z in minZ to maxZ {
						if(user.world.getBlock(X, Y, Z).definition.id == "theaurorian:aurorianportal" || user.world.getBlock(X, Y, Z).definition.id == "erebus:portal" || user.world.getBlock(X, Y, Z).definition.id == "atum:portal") {
							event.cancel();	
							if(!user.world.isRemote()) {
								user.sendChat("§c"+ game.localize("mce.advrocketry.message.no_go_through_portal"));
							}
						}
					}
				}
			}
		}
	}
});
