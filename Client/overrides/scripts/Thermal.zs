#MC Eternal Scripts

print("--- loading Thermal.zs ---");

#Remove Recipe
recipes.remove(<thermalexpansion:frame>);

#Add Recipe
recipes.addShaped(<thermalfoundation:material:160>, [[<ore:dustObsidian>, <ore:dustCoal>, <ore:dustObsidian>], [<ore:dustCoal>, <ore:ingotBrass>, <ore:dustCoal>], [<ore:dustObsidian>, <ore:dustCoal>, <thermalfoundation:material:770>]]);
recipes.addShaped(<thermalexpansion:frame>, [[<ore:blockSheetmetalLead>, <immersiveintelligence:material:4>, <ore:blockSheetmetalLead>], [<immersiveintelligence:material_spring>, <immersiveengineering:metal_decoration0:2>, <immersiveintelligence:material_spring>], [<ore:blockSheetmetalLead>, <immersiveintelligence:metal_decoration:2>, <ore:blockSheetmetalLead>]]);

print("--- Thermal.zs initialized ---");	