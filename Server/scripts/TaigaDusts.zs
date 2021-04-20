import mods.enderio.SagMill;
import mods.immersiveengineering.Crusher;
import mods.mekanism.enrichment;
import mods.mekanism.crusher;
#MC Eternal Scripts

print("--- loading TaigaDusts.zs ---");

#Adding TAIGA Dusts to Ender IO
mods.enderio.SagMill.addRecipe([<taiga:tiberium_ore>], [100], <taiga:tiberium_dust> *2);
mods.enderio.SagMill.addRecipe([<taiga:aurorium_ore>], [100], <taiga:aurorium_dust> *2);
mods.enderio.SagMill.addRecipe([<taiga:jauxum_ore>], [100], <taiga:jauxum_dust> *2);
mods.enderio.SagMill.addRecipe([<taiga:ovium_ore>], [100], <taiga:ovium_dust> *2);
mods.enderio.SagMill.addRecipe([<taiga:karmesine_ore>], [100], <taiga:karmesine_dust> *2);
mods.enderio.SagMill.addRecipe([<taiga:vibranium_ore>], [100], <taiga:vibranium_dust> *2);
mods.enderio.SagMill.addRecipe([<taiga:valyrium_ore>], [100], <taiga:valyrium_dust> *2);
mods.enderio.SagMill.addRecipe([<taiga:duranite_ore>], [100], <taiga:duranite_dust> *2);
mods.enderio.SagMill.addRecipe([<taiga:prometheum_ore>], [100], <taiga:prometheum_dust> *2);
mods.enderio.SagMill.addRecipe([<taiga:eezo_ore>], [100], <taiga:eezo_dust> *2);
mods.enderio.SagMill.addRecipe([<taiga:abyssum_ore>], [100], <taiga:abyssum_dust> *2);
mods.enderio.SagMill.addRecipe([<taiga:osram_ore>], [100], <taiga:osram_dust> *2);
mods.enderio.SagMill.addRecipe([<taiga:uru_ore>], [100], <taiga:uru_dust> *2);
mods.enderio.SagMill.addRecipe([<taiga:palladium_ore>], [100], <taiga:palladium_dust> *2);

#Adding TAIGA Dusts to Immersive Engineering
mods.immersiveengineering.Crusher.addRecipe(<taiga:tiberium_ore>, <taiga:tiberium_dust> * 2, 3048);
mods.immersiveengineering.Crusher.addRecipe(<taiga:aurorium_ore>, <taiga:aurorium_dust> * 2, 3048);
mods.immersiveengineering.Crusher.addRecipe(<taiga:jauxum_ore>, <taiga:jauxum_dust> * 2, 3048);
mods.immersiveengineering.Crusher.addRecipe(<taiga:ovium_ore>, <taiga:ovium_dust> * 2, 3048);
mods.immersiveengineering.Crusher.addRecipe(<taiga:karmesine_ore>, <taiga:karmesine_dust> * 2, 3048);
mods.immersiveengineering.Crusher.addRecipe(<taiga:vibranium_ore>, <taiga:vibranium_dust> * 2, 3048);
mods.immersiveengineering.Crusher.addRecipe(<taiga:valyrium_ore>, <taiga:valyrium_dust> * 2, 3048);
mods.immersiveengineering.Crusher.addRecipe(<taiga:duranite_ore>, <taiga:duranite_dust> * 2, 3048);
mods.immersiveengineering.Crusher.addRecipe(<taiga:prometheum_ore>, <taiga:prometheum_dust> * 2, 3048);
mods.immersiveengineering.Crusher.addRecipe(<taiga:eezo_ore>, <taiga:eezo_dust> * 2, 3048);
mods.immersiveengineering.Crusher.addRecipe(<taiga:abyssum_ore>, <taiga:abyssum_dust> * 2, 3048);
mods.immersiveengineering.Crusher.addRecipe(<taiga:osram_ore>, <taiga:osram_dust> * 2, 3048);
mods.immersiveengineering.Crusher.addRecipe(<taiga:uru_ore>, <taiga:uru_dust> * 2, 3048);
mods.immersiveengineering.Crusher.addRecipe(<taiga:palladium_ore>, <taiga:palladium_dust> * 2, 3048);

#Adding TAIGA Dusts to Mekanism Encrichment Chamber
mods.mekanism.enrichment.addRecipe(<taiga:tiberium_ore>, <taiga:tiberium_dust> * 2);
mods.mekanism.enrichment.addRecipe(<taiga:aurorium_ore>, <taiga:aurorium_dust> * 2);
mods.mekanism.enrichment.addRecipe(<taiga:jauxum_ore>, <taiga:jauxum_dust> * 2);
mods.mekanism.enrichment.addRecipe(<taiga:ovium_ore>, <taiga:ovium_dust> * 2);
mods.mekanism.enrichment.addRecipe(<taiga:karmesine_ore>, <taiga:karmesine_dust> * 2);
mods.mekanism.enrichment.addRecipe(<taiga:vibranium_ore>, <taiga:vibranium_dust> * 2);
mods.mekanism.enrichment.addRecipe(<taiga:valyrium_ore>, <taiga:valyrium_dust> * 2);
mods.mekanism.enrichment.addRecipe(<taiga:duranite_ore>, <taiga:duranite_dust> * 2);
mods.mekanism.enrichment.addRecipe(<taiga:prometheum_ore>, <taiga:prometheum_dust> * 2);
mods.mekanism.enrichment.addRecipe(<taiga:eezo_ore>, <taiga:eezo_dust> * 2);
mods.mekanism.enrichment.addRecipe(<taiga:abyssum_ore>, <taiga:abyssum_dust> * 2);
mods.mekanism.enrichment.addRecipe(<taiga:osram_ore>, <taiga:osram_dust> * 2);
mods.mekanism.enrichment.addRecipe(<taiga:uru_ore>, <taiga:uru_dust> * 2);
mods.mekanism.enrichment.addRecipe(<taiga:palladium_ore>, <taiga:palladium_dust> * 2);

#Adding TAIGA Dusts to Mekanism Crusher
mods.mekanism.crusher.addRecipe(<taiga:tiberium_ore>, <taiga:tiberium_dust> * 2);
mods.mekanism.crusher.addRecipe(<taiga:aurorium_ore>, <taiga:aurorium_dust> * 2);
mods.mekanism.crusher.addRecipe(<taiga:jauxum_ore>, <taiga:jauxum_dust> * 2);
mods.mekanism.crusher.addRecipe(<taiga:ovium_ore>, <taiga:ovium_dust> * 2);
mods.mekanism.crusher.addRecipe(<taiga:karmesine_ore>, <taiga:karmesine_dust> * 2);
mods.mekanism.crusher.addRecipe(<taiga:vibranium_ore>, <taiga:vibranium_dust> * 2);
mods.mekanism.crusher.addRecipe(<taiga:valyrium_ore>, <taiga:valyrium_dust> * 2);
mods.mekanism.crusher.addRecipe(<taiga:duranite_ore>, <taiga:duranite_dust> * 2);
mods.mekanism.crusher.addRecipe(<taiga:prometheum_ore>, <taiga:prometheum_dust> * 2);
mods.mekanism.crusher.addRecipe(<taiga:eezo_ore>, <taiga:eezo_dust> * 2);
mods.mekanism.crusher.addRecipe(<taiga:abyssum_ore>, <taiga:abyssum_dust> * 2);
mods.mekanism.crusher.addRecipe(<taiga:osram_ore>, <taiga:osram_dust> * 2);
mods.mekanism.crusher.addRecipe(<taiga:uru_ore>, <taiga:uru_dust> * 2);
mods.mekanism.crusher.addRecipe(<taiga:palladium_ore>, <taiga:palladium_dust> * 2);

print("--- TaigaDusts.zs initialized ---");	