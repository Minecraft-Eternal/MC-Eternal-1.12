import crafttweaker.item.IItemStack;
import thaumcraft.aspect.CTAspectStack;

#MC Eternal Scripts

print("--- Loading Thaumcraft.zs ---");

#Nerf basically MA but essentia
// i severely dislike these things, they ruin the puzzle of automating an essentia type or having what you burn into essentia be a choice that somewhat matters
val validSeedAspects = [
		//Base TC
		<aspect:aer>,
		<aspect:terra>,
		<aspect:ignis>,
		<aspect:aqua>,
		<aspect:ordo>,
		<aspect:perditio>,
		<aspect:vacuos>,
		<aspect:lux>,
		<aspect:motus>,
		<aspect:gelum>,
		<aspect:vitreus>,
		<aspect:metallum>,
		<aspect:victus>,
		<aspect:mortuus>,
		<aspect:potentia>,
		<aspect:permutatio>,
		<aspect:praecantatio>,
		<aspect:auram>,
		<aspect:alkimia>,
		<aspect:vitium>,
		<aspect:tenebrae>,
		<aspect:alienis>,
		<aspect:volatus>,
		<aspect:herba>,
		<aspect:instrumentum>,
		<aspect:fabrico>,
		<aspect:machina>,
		<aspect:vinculum>,
		<aspect:spiritus>,
		<aspect:cognitio>,
		<aspect:sensus>,
		<aspect:aversio>,
		<aspect:praemunio>,
		<aspect:desiderium>,
		<aspect:exanimis>,
		<aspect:bestia>,
		<aspect:humanus>,
		
		//TAdditions
		<aspect:fluctus>,
		<aspect:sonus>,
		<aspect:exitium>,
		<aspect:caeles>,
		<aspect:draco>,
		<aspect:infernum>,
		<aspect:ventus>,
		<aspect:visum>,
		<aspect:imperium>
] as CTAspectStack[];
	
for aspectStack in validSeedAspects {
	var aspect = aspectStack.internal.name.toLowerCase();
	mods.thaumcraft.Crucible.removeRecipe("thaumadditions:"+aspect+"_vis_seed");
	mods.thaumcraft.Crucible.registerRecipe("nerf_vistyical_agriculture_"+aspect, "TAR_VIS_SEEDS", itemUtils.getItem("thaumadditions:vis_seeds/"+aspect), itemUtils.getItem("mysticalagriculture:crafting", 20), [aspectStack * 500]);
}
	
print("--- Thaumcraft.zs initialized ---");
