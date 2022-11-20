#MC Eternal Scripts

print("--- loading Oredict.zs ---");

<ore:RavenFeather>.add(<twilightforest:raven_feather>);
<ore:RavenFeather>.add(<bewitchment:ravens_feather>);

<ore:oreDilithium>.add(<taiga:dilithium_ore>);
<ore:blockWarpCoreRim>.add(<techreborn:storage:2>);

<ore:gemAmethyst>.add(<mysticalworld:amethyst_gem>);
<ore:blockAmethyst>.add(<mysticalworld:amethyst_block>);

<ore:ingotCopper>.add(<mysticalworld:copper_ingot>);
<ore:blockCopper>.add(<mysticalworld:copper_block>);
<ore:nuggetCopper>.add(<mysticalworld:copper_nugget>);
<ore:dustCopper>.add(<mysticalworld:copper_dust>);

<ore:ingotSilver>.add(<mysticalworld:silver_ingot>);
<ore:blockSilver>.add(<mysticalworld:silver_block>);
<ore:nuggetSilver>.add(<mysticalworld:silver_nugget>);
<ore:dustSilver>.add(<mysticalworld:silver_dust>);

#Atum Relics (relicItemAtum)

var relicNames = [
	"eyes_of_atum",
	"body_of_atum",
	"legs_of_atum",
	"feet_of_atum",
	"atums_will",
	"atums_protection",
	"atums_bounty",
	"atums_homecoming",
	"halo_of_ra",
	"body_of_ra",
	"legs_of_ra",
	"feet_of_ra",
	"ras_fury",
	"ptahs_decadence",
	"ptahs_undoing",
	"gebs_toil",
	"gebs_grounding",
	"gebs_might",
	"tefnuts_rain",
	"tefnuts_call",
	"tefnuts_blessing",
	"shus_breath",
	"shus_exile",
	"shus_swiftness",
	"horuss_soaring",
	"horuss_ascension",
	"seths_sting",
	"seths_venom",
	"isis_healing",
	"montus_blast",
	"montus_strike",
	"anubiss_mercy",
	"anubiss_wrath",
	"nuits_vanishing",
	"nuits_duality",
	"nuits_ire",
	"nuits_quarter",
	"anputs_hunger"
] as string[];

for relic in relicNames {
	<ore:relicItemAtum>.add(itemUtils.getItem("atum:"~relic));
}

print("--- Oredict.zs initialized ---");	
