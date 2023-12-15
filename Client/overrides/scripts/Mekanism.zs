import crafttweaker.item.IItemStack;
import crafttweaker.item.IIngredient;

import mods.mekanism.combiner;

#MC Eternal Scripts

print("--- loading Mekanism.zs ---");

//todo
//nothing lol

val combinerMap = {
    //Cobblestone
    <minecraft:cobblestone>: {
        //Vanilla
        <minecraft:iron_ore>: <ore:dustIron> *8,
        <minecraft:gold_ore>: <ore:dustGold> *8,
        <minecraft:coal_ore>: <ore:dustCoal> *6,
        <minecraft:lapis_ore>: <ore:dustLapis> * 16,
        <minecraft:redstone_ore>: <ore:dustRedstone> *16,
        <minecraft:diamond_ore>: <ore:dustDiamond> *6,
        <minecraft:emerald_ore>: <ore:dustEmerald> *6,

        //Actually Additions
        <actuallyadditions:block_misc:3>: <ore:dustQuartzBlack> *5,

        //Applied Energistics 2
        <appliedenergistics2:quartz_ore>: <ore:dustCertusQuartz> *6,
        <appliedenergistics2:quartz_ore>: <ore:gemChargedCertusQuartz> *6,

        //Astral Sorcery
        <astralsorcery:blockcustomore:1>: <ore:dustAstralStarmetal> *8,

        //Bewitchment
        <bewitchment:amethyst_ore>: <ore:dustAmethyst> *8,
        <bewitchment:garnet_ore>: <ore:gemGarnet> *6,
        <bewitchment:opal_ore>: <ore:gemOpal> *6,
        <bewitchment:salt_ore>: <ore:dustSalt> *12,

        //Biomes O' Plenty
        <biomesoplenty:gem_ore:1>: <ore:gemRuby> *6,
        <biomesoplenty:gem_ore:2>: <ore:gemPeridot> *6,
        <biomesoplenty:gem_ore:3>: <ore:gemTopaz> *6,
        <biomesoplenty:gem_ore:4>: <ore:gemTanzanite> *6,
        <biomesoplenty:gem_ore:5>: <ore:gemMalachite> *6,
        <biomesoplenty:gem_ore:6>: <ore:gemSapphire> *6,
        <biomesoplenty:gem_ore:7>: <ore:gemAmber> *6,

        //Forestry
        <forestry:resources:0>: <ore:gemApatite> *20,

        //Future MC
        <futuremc:ancient_debris>: <ore:ingotAncientDebris> *8,

        //Mekanism
        <mekanism:oreblock:0>: <ore:dustOsmium> *8,

        //Mystical Agriculture
        <mysticalagriculture:prosperity_ore>: <ore:shardProsperity> *8,
        <mysticalagriculture:inferium_ore>: <ore:essenceInferium> *8,

        //Nuclearcraft
        <nuclearcraft:ore:3>: <ore:dustThorium> *8,
        <nuclearcraft:ore:4>: <ore:dustUranium> *8,
        <nuclearcraft:ore:5>: <ore:dustBoron> *8,
        <nuclearcraft:ore:6>: <ore:dustLithium> *8,
        <nuclearcraft:ore:7>: <ore:dustMagnesium> *8,

        //RFTools
        <rftools:dimensional_shard_ore:0>: <ore:gemDimensionalShard> *8,

        //TechReborn
        <techreborn:ore:0>: <ore:dustGalena> *4,
        <techreborn:ore:4>: <ore:dustBauxite> *6,

        //Thaumcraft
        <thaumcraft:ore_cinnabar>: <ore:quicksilver> *3,
        <thaumcraft:ore_quartz>: <ore:dustQuartz> *8,

        //Thermal Foundation
        <thermalfoundation:ore:0>: <ore:dustCopper> *8,
        <thermalfoundation:ore:1>: <ore:dustTin> *8,
        <thermalfoundation:ore:2>: <ore:dustSilver> *8,
        <thermalfoundation:ore:3>: <ore:dustLead> *8,
        <thermalfoundation:ore:4>: <ore:dustAluminium> *8,
        <thermalfoundation:ore:5>: <ore:dustNickel> *8,
        <thermalfoundation:ore:6>: <ore:dustPlatinum> *8,
        <thermalfoundation:ore:7>: <ore:dustIridium> *8,
        <thermalfoundation:ore:8>: <ore:dustMithril> *8,
        <thermalfoundation:ore_fluid:2>: <ore:crystalRedstone> *6,

        //TAIGA
        <taiga:vibranium_ore>: <ore:dustVibranium> *8,
        <taiga:eezo_ore>: <ore:dustEezo> *8,
        <taiga:dilithium_ore>: <taiga:dilithium_dust> *8,

        //Vulpes Library
        <libvulpes:ore0:8>: <ore:dustTitanium> *8
    },

    //Nether
    <minecraft:netherrack>: {
        //Vanilla
        <minecraft:quartz_ore>: <ore:dustQuartz> *8,

        //Arcane World Nether
        <arcaneworld:ore_amethyst_nether>: <ore:dustAmethyst> *8,

        //Cyclic Nether
        <cyclicmagic:nether_redstone_ore>: <ore:dustRedstone> *12,
        <cyclicmagic:nether_iron_ore>: <ore:dustIron> *8,
        <cyclicmagic:nether_gold_ore>: <ore:dustGold> *8,
        <cyclicmagic:nether_coal_ore>: <ore:dustCoal> *6,
        <cyclicmagic:nether_lapis_ore>: <ore:dustLapis> *16,
        <cyclicmagic:nether_emerald_ore>: <ore:dustEmerald> *6,
        <cyclicmagic:nether_diamond_ore>: <ore:dustDiamond> *6,

        //Mystical Agriculture Nether
        <mysticalagriculture:nether_prosperity_ore>: <ore:shardProsperity> *10,
        <mysticalagriculture:nether_inferium_ore>: <ore:essenceInferium> *10,

        //RFTools Nether
        <rftools:dimensional_shard_ore:1>: <ore:gemDimensionalShard> *8,

        //TechReborn Nether
        <techreborn:ore:5>: <ore:dustPyrite> *8,
        <techreborn:ore:6>: <ore:dustCinnabar> *6,
        <techreborn:ore:7>: <ore:dustSphalerite> *8,

        //Thermal Foundation Nether
        <thermalfoundation:ore_fluid:3>: <ore:crystalGlowstone> *6,

        //TAIGA Nether
        <taiga:tiberium_ore>: <ore:dustTiberium> *6,
        <taiga:prometheum_ore>: <ore:dustPrometheum> *8,
        <taiga:valyrium_ore>: <ore:dustValyrium> *8,
        <taiga:osram_ore>: <ore:dustOsram> *8,

        //TConstruct Nether
        <tconstruct:ore:0>: <ore:dustCobalt> *8,
        <tconstruct:ore:1>: <ore:dustArdite> *8
    },

    //End
    <minecraft:end_stone>: {
        //Biomes O' Plenty End
        <biomesoplenty:gem_ore:0>: <ore:dustAmethyst> *8,

        // Cyclic End
        <cyclicmagic:end_redstone_ore>: <ore:dustRedstone> *12,
        <cyclicmagic:end_coal_ore>: <ore:dustCoal> *6,
        <cyclicmagic:end_lapis_ore>: <ore:dustLapis> *16,
        <cyclicmagic:end_emerald_ore>: <ore:dustEmerald> *6,
        <cyclicmagic:end_diamond_ore>: <ore:dustDiamond> *6,
        <cyclicmagic:end_gold_ore>: <ore:dustGold> *8,
        <cyclicmagic:end_iron_ore>: <ore:dustIron> *8,

        //Quark End
        <quark:biotite_ore>: <ore:gemEnderBiotite> *12,

        //Mystical Agriculture End
        <mysticalagriculture:end_prosperity_ore>: <ore:shardProsperity> *12,
        <mysticalagriculture:end_inferium_ore>: <ore:essenceInferium> *12,

        //RFTools End
        <rftools:dimensional_shard_ore:2>: <ore:gemDimensionalShard> *8,

        //TechReborn End
        <techreborn:ore:8>: <ore:dustTungsten> *8,
        <techreborn:ore:9>: <ore:dustPlatinum> *8,
        <techreborn:ore:10>: <ore:dustPeridot> *6,
        <techreborn:ore:11>: <ore:dustSodalite> *20,

        //Thermal Foundation End
        <thermalfoundation:ore_fluid:4>: <ore:crystalEnder> *6,

        //TAIGA End
        <taiga:aurorium_ore>: <ore:dustAurorium> *8,
        <taiga:palladium_ore>: <ore:dustPalladium> *8,
        <taiga:abyssum_ore>: <ore:dustAbyssum> *8
    },

    //Atum Limestone
    <atum:limestone>: {
        <atum:gold_ore>: <ore:dustGold> *8,
        <atum:iron_ore>: <ore:dustIron> *8,
        <atum:coal_ore>: <ore:dustCoal> *6,
        <atum:lapis_ore>: <ore:dustLapis> *16,
        <atum:diamond_ore>: <ore:dustDiamond> *6,
        <atum:emerald_ore>: <ore:dustEmerald> *6,
        <atum:redstone_ore>: <ore:dustRedstone> *12,
        <atum:bone_ore>: <ore:bone> *6
    },

    //Erebus Umberstone
    <erebus:umberstone:1>: {
        <erebus:ore_iron>: <ore:dustIron> *8,
        <erebus:ore_gold>: <ore:dustGold> *8,
        <erebus:ore_coal>: <ore:dustCoal> *6,
        <erebus:ore_diamond>: <ore:dustDiamond> *6,
        <erebus:ore_emerald>: <ore:dustEmerald> *6,
        <erebus:ore_lapis>: <ore:dustLapis> *16,
        <erebus:ore_quartz>: <ore:dustQuartz> *8,
        <erebus:ore_jade>: <ore:gemJade> *6,
        <erebus:ore_fossil>: <erebus:materials:2> *3,
        <erebus:ore_gneiss>: <erebus:materials:47> *3,
        <erebus:ore_petrified_wood>: <erebus:materials:7> *7
    },
    //Erebus Heartwood
    <erebus:petrified_log_inner>: {
        <erebus:ore_petrified_quartz>: <ore:dustQuartz> *8
    },
    //Erebus Volcanic Rock
    <erebus:volcanic_rock>: {
        <erebus:ore_encrusted_diamond>: <ore:dustDiamond> *6
    },

    //Sand
    <minecraft:sand:0>: {
        //Astral Sorcery
        <astralsorcery:blockcustomsandore:0>: <ore:gemAquamarine> *16,

        //Thermal Foundation
        <thermalfoundation:ore_fluid:0>: <ore:crystalCrudeOil> *4
    },
    //Red Sand
    <minecraft:sand:1>: {
        <thermalfoundation:ore_fluid:5>: <ore:crystalCrudeOil> *4
    },
    //Gravel
    <minecraft:gravel>: {
        <thermalfoundation:ore_fluid:1>: <ore:crystalCrudeOil> *4
    },

    //Midnight Nightstone
    <midnight:nightstone>: {
        <midnight:tenebrum_ore>: <midnight:tenebrum_ingot> *3,
        <midnight:nagrilite_ore>: <midnight:nagrilite_ingot> *3,
        <midnight:ebonys_ore>: <midnight:ebonys> *4
    },
    //Midnight Trenchstone
    <midnight:trenchstone>: {
        <midnight:archaic_ore>: <midnight:archaic_shard> *4
    },

    //Aurorian Stone
    <theaurorian:aurorianstone>: {
        <theaurorian:auroriancoalore>: <theaurorian:auroriancoal> *9,
        <theaurorian:ceruleanore>: <theaurorian:ceruleaningot> *8,
        <theaurorian:geodeore>: <theaurorian:crystal> *6,
        <theaurorian:moonstoneore>: <theaurorian:moonstoneingot> *8
    },

    //Betweenlands Betweenstone
    <thebetweenlands:betweenstone>: {
        <thebetweenlands:octine_ore>: <ore:ingotOctine> *8,
        <thebetweenlands:sulfur_ore>: <ore:gemSulfur> *9,
        <thebetweenlands:slimy_bone_ore>: <thebetweenlands:items_misc:14> *6,
        <thebetweenlands:syrmorite_ore>: <ore:ingotSyrmorite> *8
    },
    //Betweenlands Pitstone
    <thebetweenlands:pitstone>: {
        <thebetweenlands:valonite_ore>: <ore:gemValonite> *6,
        <thebetweenlands:scabyst_ore>: <ore:gemScabyst> *12
    },
    //Betweenlands Mud
    <thebetweenlands:mud>: {
        <thebetweenlands:aqua_middle_gem_ore>: <ore:gemAquaMiddleGem> *3,
        <thebetweenlands:crimson_middle_gem_ore>: <ore:gemCrimsonMiddleGem> *3,
        <thebetweenlands:green_middle_gem_ore>: <ore:gemGreenMiddleGem> *3
    },

    //Other Ores
    //Granite
    <minecraft:stone:1>: {
        <taiga:jauxum_ore>: <ore:dustJauxum> *8,
        <mysticalworld:granite_quartz_ore>: <ore:dustQuartz> *8
    },
    //Diorite
    <minecraft:stone:3>: {
        <taiga:ovium_ore>: <ore:dustOvium> *8
    },
    //Andesite
    <minecraft:stone:5>: {
        <taiga:karmesine_ore>: <ore:dustKarmesine> *8
    },
    //Meteorite
    <taiga:meteorite_block>: {
        <taiga:duranite_ore>: <ore:dustDuranite> *8
    },
    //Obsidiorite
    <taiga:obsidiorite_block>: {
        <taiga:uru_ore>: <ore:dustUru> *8
    },
    //Raw Marbled Cheese
    <rats:marbled_cheese_raw>: {
        <libvulpes:ore0:0>: <ore:dustMozzarellium> *4
    }
} as IIngredient[IItemStack][IItemStack];

mods.mekanism.combiner.removeAllRecipes();

for stone,entryList in combinerMap {
    for ore,resource in entryList {
        combiner.addRecipe(resource, stone, ore);
    }
}

print("--- Mekanism.zs initialized ---");	
