#MC Eternal Scripts

print("--- loading Thermal.zs ---");

#Remove Recipe
recipes.remove(<thermalexpansion:frame>);

#Add Recipe
recipes.addShaped(<thermalfoundation:material:160>, [[<ore:dustObsidian>, <ore:dustCoal>, <ore:dustObsidian>], [<ore:dustCoal>, <ore:ingotBrass>, <ore:dustCoal>], [<ore:dustObsidian>, <ore:dustCoal>, <thermalfoundation:material:770>]]);
recipes.addShaped(<thermalexpansion:frame>, [[<immersiveengineering:sheetmetal:9>, <thermalfoundation:material:322>, <immersiveengineering:sheetmetal:9>], [<ore:springSteel>, <immersiveintelligence:material:13>, <ore:springSteel>], [<immersiveengineering:sheetmetal:9>, <immersiveintelligence:material:18>, <ore:blockSheetmetalIron>]]);

print("--- Thermal.zs initialized ---"):	
