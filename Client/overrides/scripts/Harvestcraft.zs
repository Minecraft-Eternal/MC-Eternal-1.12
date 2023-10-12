#MC Eternal Scripts

print("--- loading Harvestcraft.zs ---");

var pamgarden = ["arid","frost","shaded","soggy","tropical","windy"] as string[];

#Add Recipe
recipes.addShaped(<harvestcraft:toastitem>, [[<ore:cropCinnamon>, <dungeontactics:toast>]]);
recipes.removeShapeless(<harvestcraft:plainyogurtitem> * 4, [<harvestcraft:plainyogurtitem>, <minecraft:leather>]);
for gardens in pamgarden {
	itemUtils.getItem("harvestcraft:"~gardens~"garden").addTooltip(format.red(game.localize("mce.harvestcraft.tip.gardens_disabled_use_market")));
}

//Recipes for Uncraftable Pam's foods

//BBQ Jackfruit
#adding Jackfruit to its proper Oredict lets harvestcraft do the work
#most of the rest of these are dumb mistakes that do not warrant adding a new oredict for, idk what the repercussions of adding an extra oredict entry for 1 item would be but i don't think it's a good idea
<ore:cropJackfruit>.add(<harvestcraft:jackfruititem>);

//Cracklins
recipes.addShapeless("cracklins_mce", <harvestcraft:cracklinsitem>, [<ore:toolPot>.reuse(), <ore:listAllporkraw>, <ore:foodOliveoil>, <ore:cropSpiceleaf>]);

//Garlic Steak
recipes.addShapeless("garlicsteak_mce", <harvestcraft:garlicsteakitem>, [<ore:toolSkillet>.reuse(), <ore:listAllbeefraw>, <ore:cropGarlic>, <ore:foodButter>, <ore:cropSpiceleaf>]);

//Sauced Lamb Kebab
recipes.addShapeless("saucedlambkebab_mce", <harvestcraft:saucedlambkebabitem>, [<ore:toolMixingbowl>.reuse(), <ore:foodLambkebab>, <ore:foodPlainYogurt>, <ore:listAllheavycream>, <ore:cropGarlic>, <ore:cropSpiceleaf>, <ore:cropLime>]);

//Lychee Tea
#adding Lychee to its proper Oredict lets Harvestcraft do the work
<ore:cropLychee>.add(<harvestcraft:lycheeitem>);

//Pork Rinds
recipes.addShapeless("porkrinds_mce", <harvestcraft:porkrindsitem>, [<ore:toolPot>.reuse(), <ore:foodOliveoil>, <ore:listAllporkraw>, <ore:foodSalt>, <ore:foodBlackpepper>]);

#I don't quite know how you mess up so badly as to give a quesadilla other food's recipes, but well, here we are i guess
//Bratwurst
recipes.removeByRecipeName("harvestcraft:bratwurstitem");
recipes.addShapeless("bratwurst_mce", <harvestcraft:bratwurstitem>, [<ore:toolCuttingboard>.reuse(), <ore:foodPorksausage>, <ore:foodPickles>, <ore:cropOnion>, <ore:foodBread>]);

//Schnitzel
recipes.removeByRecipeName("harvestcraft:schnitzelitem_listallporkraw");
recipes.removeByRecipeName("harvestcraft:schnitzelitem_listallmuttonraw");
recipes.addShapeless("schnitzel_mce", <harvestcraft:schnitzelitem>, [<ore:toolSkillet>.reuse(), <ore:listAllporkraw> | <ore:listAllmuttonraw>, <ore:foodFlour>, <ore:cropLemon>, <ore:foodOliveoil>, <ore:foodBlackpepper>]);

//Imitation Crab Sticks
recipes.addShapeless("imitationcrabsticks_mce", <harvestcraft:imitationcrabsticksitem>, [<ore:toolCuttingboard>.reuse(), <ore:cropWheat>, <ore:listAllfishcooked>, <ore:listAllegg>, <ore:dyeRed>]);

print("--- Harvestcraft.zs initialized ---");	
