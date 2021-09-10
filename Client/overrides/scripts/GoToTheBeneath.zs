#MC Eternal Scripts

print("--- loading GoToTheBeneath.zs ---");

#Remove Beneath ores from Orechid
mods.botania.Orechid.removeOre("oreOsmium");
mods.botania.Orechid.removeOre("oreBoron");
mods.botania.Orechid.removeOre("oreLithium");
mods.botania.Orechid.removeOre("oreMagnesium");

#Add Missing ores to Orechid
mods.botania.Orechid.addOre("oreThorium", 1200);

print("--- GoToTheBeneath.zs initialized ---");
