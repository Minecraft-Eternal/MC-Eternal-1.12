import crafttweaker.item.IItemStack;
import crafttweaker.recipes.ICraftingInfo;
#MC Eternal Scripts

print("--- loading SimplyJetpacks.zs ---");

#Remove Items
recipes.addShapeless(<simplyjetpacks:itemjetpack:0>.withTag({display:{Lore:[game.localize("mce.simplyjetpacks.crafting_info.creative_jetpack_overflow")]}}), [<simplyjetpacks:itemjetpack:0>.marked("jetpack")],
	function(output as IItemStack, input as IItemStack[string], cInfo as ICraftingInfo){
		return input.jetpack.updateTag({Energy: 1});
	}
);

print("--- SimplyJetpacks.zs initialized ---");	
