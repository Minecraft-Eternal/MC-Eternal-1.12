#MC Eternal Scripts

print("--- loading ChanceCubes.zs ---");

#Remove Items
recipes.remove(<chancecubes:chance_cube>);

#Add Recipe
recipes.addShaped(<chancecubes:chance_cube>, [[<ore:blockLapis>, <ore:blockLapis>, <ore:blockLapis>], [<ore:blockLapis>, <ore:netherStar>, <ore:blockLapis>], [<ore:blockLapis>, <ore:blockLapis>, <ore:blockLapis>]]);

print("--- ChanceCubes.zs initialized ---");	
