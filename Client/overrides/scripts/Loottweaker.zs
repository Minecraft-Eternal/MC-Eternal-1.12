import crafttweaker.item.IItemStack;

import loottweaker.LootTweaker;
import loottweaker.vanilla.loot.LootTable;
import loottweaker.vanilla.loot.LootPool;

// Configuration
val lootTableModif = {
	
	"artifacts:underground_chest/potions;main;remove" : ["minecraft:potion", "minecraft:splash_potion", "minecraft:lingering_potion", "minecraft:tipped_arrow"],
	"arcaneworld:raid_1;raid_1;remove" : ["arcaneworld:potion_orb"]
	
// example add entry
//	"lootTable" : ["item;weight", "anotherItem;weight"]
//ex: 	"minecraft:chests/simple_dungeon" : ["minecraft:end_crystal;10"]
	
} as string[][string];


// Modifying LootTables

for lootTable in lootTableModif {
	for item in lootTableModif[lootTable] {
		if(lootTable.split(";")[2] == "remove"){
			LootTweaker.getTable(lootTable.split(";")[0]).getPool(lootTable.split(";")[1]).removeEntry(item);
		} else if(lootTable.split(";")[2] == "addEntry"){
			LootTweaker.getTable(lootTable.split(";")[0]).getPool(lootTable.split(";")[1]).addItemEntry(itemUtils.getItem(item.split(";")[0]), item.split(";")[1] as int);
		}
	}
}
