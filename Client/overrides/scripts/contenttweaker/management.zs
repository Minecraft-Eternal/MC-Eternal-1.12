#priority 1

import crafttweaker.item.IItemStack;
import crafttweaker.item.IIngredient;
import crafttweaker.liquid.ILiquidStack;

#MC Eternal Scripts

print("--- loading contenttweaker/management.zs ---");

static untexturedItems as IItemStack[] = [
    
];

if(!isServer)
    for item in untexturedItems {
        item.addTooltip(format.red(game.localize("mce.contenttweaker.tip.untextured_item")));
    }

//Items
val challengeOnlyItems as IItemStack[] = [
    <contenttweaker:living_alloy>,
    <contenttweaker:amalgameat>,
    <contenttweaker:revival_gem>
];
if(!challengeMode && !isServer)
    for item in challengeOnlyItems {
        mods.jei.JEI.hide(item);
        item.addTooltip(format.red(game.localize("mce.challengemode.generic.tip.challenge_only_item")));
    }

//Oredicts
<ore:ingotLiving>.add(<contenttweaker:living_alloy>);


//Tooltips
val tooltipedItems as string[IItemStack] = {
    <contenttweaker:sky_scarab_crest>: "item.contenttweaker.sky_scarab_crest.desc",
    <contenttweaker:kikoku_stick>: "item.contenttweaker.kikoku_stick.desc",
    <contenttweaker:die_fragment>: "item.contenttweaker.die_fragment.desc",
    <contenttweaker:living_alloy>: "item.contenttweaker.living_alloy.desc",
    <contenttweaker:amalgameat>: "item.contenttweaker.amalgameat.desc",
    <contenttweaker:revival_gem>: "item.contenttweaker.revival_gem.desc",
    <contenttweaker:vampiric_catalyst>: "item.contenttweaker.vampiric_catalyst.desc"
};

if(!isServer){
    for item,tooltip in tooltipedItems {
        for line in game.localize(tooltip).split("<BR>") {
            item.addTooltip(format.italic(format.darkPurple(line)));
        }
    }

    <contenttweaker:revival_gem>.addTooltip(format.gold("item.contenttweaker.revival_gem.desc2"));
}


//Fluid
val challengeOnlyFluids as IItemStack[] = [
    
];

if(!challengeMode && !isServer)
    for fluid in challengeOnlyFluids {
        mods.jei.JEI.hide(fluid);
    }

print("--- contenttweaker/management.zs initialized ---");