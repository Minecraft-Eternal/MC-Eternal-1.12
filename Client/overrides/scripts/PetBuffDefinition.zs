#priority 1

import crafttweaker.item.IItemStack;


//set to true to enable Crafttweaker logging of Pet Buff system details
global debugBuffSystem as bool = false;


global buffablePets as string[] = [
	"lcrdrfs:robo_dino",
	"lcrdrfs:jet_pack_spider",
	"fossil:fossil.tyrannosaurus",
    "minecraft:wolf",
    "iceandfire:hippogryph"
];


global attributeUUIDMap as string[string] = {
	"generic.maxHealth": "d58ec306-d328-4032-87b3-25fc9b778592",
	"generic.attackDamage": "97cb9345-8bd0-4a30-bb1d-c63259f77089",
	"generic.armor": "b1cd9b37-c287-4ad9-9602-2378cfb91cda",
	"generic.armorToughness": "e12465af-070b-4c38-a7f8-da7a09b06832"
};


global boostingItemsMap as IItemStack[string][string] = {
	"lcrdrfs:robo_dino": {
		"generic.maxHealth": <lcrdrfs:robo_dino_part> *64,
		"generic.attackDamage": <lcrdrfs:robo_dino_part> *64,
		"generic.armor": <lcrdrfs:robo_dino_part> *64,
		"generic.armorToughness": <lcrdrfs:robo_dino_part> *64
	},
	"lcrdrfs:jet_pack_spider": {
		"generic.maxHealth": <lcrdrfs:jetpack_spider_part> *32,
		"generic.armor": <lcrdrfs:jetpack_spider_part> *32,
		"generic.armorToughness": <lcrdrfs:jetpack_spider_part> *32
	},
	"fossil:fossil.tyrannosaurus": {
		"generic.maxHealth": <fossil:scarab_gem> *4,
		"generic.attackDamage": <mod_lavacow:scythe_claw> *16,
		"generic.armor": <iceandfire:dragonarmor_iron:*> *1,
		"generic.armorToughness": <iceandfire:dragonarmor_iron:*> *1
	},
    "minecraft:wolf": {
        "generic.maxHealth": <harvestcraft:hotdogitem> *16,
        "generic.attackDamage": <iceandfire:dragonbone> *16,
        "generic.armor": <simplyjetpacks:metaitemmods:22> *3,
        "generic.armorToughness": <simplyjetpacks:metaitemmods:22> *3
    },
    "iceandfire:hippogryph": {
        "generic.maxHealth": <rats:rat_burger> *16
    }
};


global petAttributeMap as double[string][string] = {
	"lcrdrfs:robo_dino": {
		"generic.maxHealth": 4920.0,
		"generic.attackDamage": 234.0,
		"generic.armor": 120.0,
		"generic.armorToughness": 50.0
	},
	"lcrdrfs:jet_pack_spider": {
		"generic.maxHealth": 1970.0,
		"generic.armor": 80.0,
		"generic.armorToughness": 30.0
	},
	"fossil:fossil.tyrannosaurus": {
		"generic.maxHealth": 1118.0,
		"generic.attackDamage": 76.0,
		"generic.armor": 30.0,
		"generic.armorToughness": 10.0
	},
    "minecraft:wolf": {
        "generic.maxHealth": 80.0,
        "generic.attackDamage": 16.0,
        "generic.armor": 15.0,
        "generic.armorToughness": 9.0
    },
    "iceandfire:hippogryph": {
        "generic.maxHealth": 560.0
    }
};


global gigaHealingItems as double[IItemStack][string] = {
	"lcrdrfs:robo_dino": {
		<lcrdrfs:plasma_power_unit>: 1.0
	},
	"lcrdrfs:jet_pack_spider": {
		<lcrdrfs:creeper_chilli_sauce>: 0.25
	},
    "fossil:fossil.tyrannosaurus": {
        <fossil:cooked_chicken_soup>: 0.50
    },
    "minecraft:wolf": {
        <fossil:chicken_essence>: 0.20
    },
    "iceandfire:hippogryph": {
        <tconstruct:edible:15>: 0.20
    }
};
