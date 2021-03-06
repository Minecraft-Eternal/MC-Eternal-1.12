The files in this directory (builtin) exist to ensure that the builtin dungeons also spawn.

The Roguelike Dungeons Mod, when trying to choose a dungeon for a given location, first checks if there are any custom dungeon settings fitting for that locations biome and biome types. If none are found, it defaults to using the builtin dungeons. This is undesirable because they will spawn with the mod's builtin loot tables, rather than using the custom loot configurations.

To work around that, we have base dungeon files for the builtin dungeons which override their loot with empty loot tables.
We then extend these (inherit them) in new dungeon files which also inherit from the custom loot configurations, effectively joining the custom loot tables to the builtin dungeons without loot. 