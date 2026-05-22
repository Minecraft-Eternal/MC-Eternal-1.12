import crafttweaker.item.IIngredient;
import crafttweaker.item.IItemStack;
import crafttweaker.data.IData;

import mods.zensummoning.SummoningDirector;
import mods.zensummoning.SummoningAttempt;
import mods.zensummoning.SummoningInfo;
import mods.zensummoning.MobInfo;

#MC Eternal Scripts

print("--- loading vampirism.zs ---");

//ZenSummoning Vampire Barons
// the spawnrates are bad because of reasons, so summoning!
// replacement for the old Pure Blood crafting.
BaronSummoning(1, [<vampirism:human_heart> *1, <vampirism:vampire_book>, <wings:bat_blood>, EXU2Item.redstoneEye]);
BaronSummoning(2, [<vampirism:human_heart> *2, <vampirism:vampire_book>, <xreliquary:mob_ingredient:5>, <bloodmagic:component:29>]);
BaronSummoning(3, [<vampirism:human_heart> *3, <vampirism:vampire_book>, <thebetweenlands:crimson_middle_gem>, <vampirism:blood_infused_iron_ingot>]);
BaronSummoning(4, [<vampirism:human_heart> *4, <vampirism:vampire_book>, <bewitchment:sigil_battle>, <bloodmagic:blood_shard:0>]);
BaronSummoning(5, [<vampirism:human_heart> *5, <vampirism:vampire_book>, <wings:bat_wings>, <thaumicperiphery:malignant_heart>]);


//Function to make this really simple to do.
function BaronSummoning(level as int, reagents as IIngredient[]) {
    SummoningDirector.addSummonInfo(SummoningInfo.create()
        .setCatalyst(<contenttweaker:vampiric_catalyst>)
        .setConsumeCatalyst(false)
        .setReagents(reagents)
        .addMob(MobInfo.create()
            .setMob("vampirism:vampire_baron")
            .setData({level: level - 1, ActiveEffects: []}) //{Amplifier: 255, duration: 10, Id: <potion:minecraft:regeneration>.id, ShowParticles: false} //<potion:minecraft:regeneration>.makePotionEffect(5, 255)
            .setSpread(5,0,5)
        )
        .setMutator(function (attempt as SummoningAttempt) {
            //print(attempt.world.getBiome(attempt.pos).id);
            if(attempt.world.getBiome(attempt.pos).id != "vampirism:vampireforest") {
                setFail(attempt, "vampire_baron.wrong_biome");
            } else {
                attempt.message = "mce.zensummoning.vampire_baron.success";
            }
        })
    );
}

//Vampiric Catalyst
SummoningDirector.addSummonInfo(
    ItemSummoning(<contenttweaker:vampiric_catalyst>, <vampirism:vampire_book>, [<ebwizardry:spectral_dust:4>, <vampirism:soul_orb_vampire>, getBloodOrb(bloodOrbTiers[1]), <extrautils2:suncrystal>])
        .setConsumeCatalyst(true)
        .setMutator(function(attempt as SummoningAttempt) {
            if(attempt.world.getBiome(attempt.pos).id != "vampirism:vampireforest") {
                    setFail(attempt, "vampiric_catalyst.wrong_biome");
                } else if(attempt.world.dayTime) {
                    setFail(attempt, "vampiric_catalyst.not_night");
                } else if(attempt.world.moonPhase != 0) {
                    setFail(attempt, "vampiric_catalyst.not_full_moon");
                } else {
                    attempt.message = "mce.zensummoning.vampiric_catalyst.success";
                }
        })
);

//Shorthand helper for setting summoning failure
function setFail(attempt as SummoningAttempt, reason as string) {
    attempt.success = false;
    attempt.message = "mce.zensummoning."+ reason;
}


//Helper for recipes that summon an Item
function ItemSummoning(output as IItemStack, catalyst as IIngredient, reagents as IIngredient[]) as SummoningInfo {
    var itemData as IData = {id: output.definition.id, Count: output.amount};
    if(output.hasTag)
        itemData.update({tag: output.tag});
    return SummoningInfo.create()
        .setCatalyst(catalyst)
        .setReagents(reagents)
        .addMob(MobInfo.create()
            .setMob("minecraft:item")
            .setData({Item: itemData})
        );
}


print("--- vampirism.zs initialized ---");
