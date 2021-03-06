#MC Eternal Scripts

print("--- loading ChanceCubes.zs ---");

#Remove Items
recipes.remove(<chancecubes:chance_cube>);

#Add Recipe
recipes.addShaped(<chancecubes:chance_cube>, [[<ore:blockLapis>, <minecraft:lapis_block>, <minecraft:lapis_block>], [<minecraft:lapis_block>, <ore:netherStar>, <ore:blockLapis>], [<minecraft:lapis_block>, <minecraft:lapis_block>, <ore:blockLapis>]]);

print("--- ChanceCubes.zs initialized ---");	