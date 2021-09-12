import crafttweaker.item.IItemStack;
#MC Eternal Scripts

print("--- loading MobGrindingUtils.zs ---");

var doesnotexist = [<mob_grinding_utils:mob_swab>, <mob_grinding_utils:null_sword>, <mob_grinding_utils:gm_chicken_feed>] as IItemStack[];
for item in doesnotexist {
	mods.jei.JEI.removeAndHide(item);
}

print("--- MobGrindingUtils.zs initialized ---");	
