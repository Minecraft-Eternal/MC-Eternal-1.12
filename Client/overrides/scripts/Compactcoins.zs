#ikwid

import crafttweaker.item.IItemStack;
import crafttweaker.item.IIngredient;
import crafttweaker.recipes.ICraftingInfo;
import crafttweaker.player.IPlayer;

#MC Eternal Scripts

print("--- loading CompactCoins.zs ---");

function getSumCoin(coinArray as IItemStack[string]) as IItemStack {
    var result as IItemStack = null;
    var amount = 0;
    if(!isNull(coinArray)){
        for key,coin in coinArray {
            if(!isNull(coin.tag) && !isNull(coin.tag.value))
                amount += coin.tag.value as long;
        }
        if(amount > 0) result = getCoinSized(amount);
    }
    return result;
}

function getCoinSized(amount as long) as IItemStack {
    val coin = amount < 100 ? <lodsofemone:coin_small> : <lodsofemone:coin_big>;
    return coin.withTag({value: amount as long});
}

//2 Coins
recipes.addShapeless("compact_coin_x2", <lodsofemone:coin_big>.withLore([game.localize("mce.lodsofemone.crafting_info.sum_coin_lore")]), [
        <ore:itemCoin>.marked("coin1"), <ore:itemCoin>.marked("coin2")
    ],
    function(output as IItemStack, input as IItemStack[string], cInfo as ICraftingInfo){
        return getSumCoin(input);
});

//3 Coins
recipes.addShapeless("compact_coin_x3", <lodsofemone:coin_big>.withLore([game.localize("mce.lodsofemone.crafting_info.sum_coin_lore")]), [
        <ore:itemCoin>.marked("coin1"), <ore:itemCoin>.marked("coin2"), <ore:itemCoin>.marked("coin3")
    ],
    function(output as IItemStack, input as IItemStack[string], cInfo as ICraftingInfo){
        return getSumCoin(input);
});

//4 Coins
recipes.addShapeless("compact_coin_x4", <lodsofemone:coin_big>.withLore([game.localize("mce.lodsofemone.crafting_info.sum_coin_lore")]), [
        <ore:itemCoin>.marked("coin1"), <ore:itemCoin>.marked("coin2"), <ore:itemCoin>.marked("coin3"),
        <ore:itemCoin>.marked("coin4")
    ],
    function(output as IItemStack, input as IItemStack[string], cInfo as ICraftingInfo){
        return getSumCoin(input);
});

//5 Coins
recipes.addShapeless("compact_coin_x5", <lodsofemone:coin_big>.withLore([game.localize("mce.lodsofemone.crafting_info.sum_coin_lore")]), [
        <ore:itemCoin>.marked("coin1"), <ore:itemCoin>.marked("coin2"), <ore:itemCoin>.marked("coin3"),
        <ore:itemCoin>.marked("coin4"), <ore:itemCoin>.marked("coin5")
    ],
    function(output as IItemStack, input as IItemStack[string], cInfo as ICraftingInfo){
        return getSumCoin(input);
});

//6 Coins
recipes.addShapeless("compact_coin_x6", <lodsofemone:coin_big>.withLore([game.localize("mce.lodsofemone.crafting_info.sum_coin_lore")]), [
        <ore:itemCoin>.marked("coin1"), <ore:itemCoin>.marked("coin2"), <ore:itemCoin>.marked("coin3"),
        <ore:itemCoin>.marked("coin4"), <ore:itemCoin>.marked("coin5"), <ore:itemCoin>.marked("coin6")
    ],
    function(output as IItemStack, input as IItemStack[string], cInfo as ICraftingInfo){
        return getSumCoin(input);
});

//7 Coins
recipes.addShapeless("compact_coin_x7", <lodsofemone:coin_big>.withLore([game.localize("mce.lodsofemone.crafting_info.sum_coin_lore")]), [
        <ore:itemCoin>.marked("coin1"), <ore:itemCoin>.marked("coin2"), <ore:itemCoin>.marked("coin3"),
        <ore:itemCoin>.marked("coin4"), <ore:itemCoin>.marked("coin5"), <ore:itemCoin>.marked("coin6"),
        <ore:itemCoin>.marked("coin7")
    ],
    function(output as IItemStack, input as IItemStack[string], cInfo as ICraftingInfo){
        return getSumCoin(input);
});

//8 Coins
recipes.addShapeless("compact_coin_x8", <lodsofemone:coin_big>.withLore([game.localize("mce.lodsofemone.crafting_info.sum_coin_lore")]), [
        <ore:itemCoin>.marked("coin1"), <ore:itemCoin>.marked("coin2"), <ore:itemCoin>.marked("coin3"),
        <ore:itemCoin>.marked("coin4"), <ore:itemCoin>.marked("coin5"), <ore:itemCoin>.marked("coin6"),
        <ore:itemCoin>.marked("coin7"), <ore:itemCoin>.marked("coin8")
    ],
    function(output as IItemStack, input as IItemStack[string], cInfo as ICraftingInfo){
        return getSumCoin(input);
});

//9 Coins
recipes.addShapeless("compact_coin_x9", <lodsofemone:coin_big>.withLore([game.localize("mce.lodsofemone.crafting_info.sum_coin_lore")]), [
        <ore:itemCoin>.marked("coin1"), <ore:itemCoin>.marked("coin2"), <ore:itemCoin>.marked("coin3"),
        <ore:itemCoin>.marked("coin4"), <ore:itemCoin>.marked("coin5"), <ore:itemCoin>.marked("coin6"),
        <ore:itemCoin>.marked("coin7"), <ore:itemCoin>.marked("coin8"), <ore:itemCoin>.marked("coin9")
    ],
    function(output as IItemStack, input as IItemStack[string], cInfo as ICraftingInfo){
        return getSumCoin(input);
});

//Divide Coin
recipes.addShapeless("divide_coin", <lodsofemone:coin_small>.withLore([game.localize("mce.lodsofemone.crafting_info.divide_coin_lore")]) *2, [
        <ore:itemCoin>.marked("inputCoin")
    ],
    function(output as IItemStack, input as IItemStack[string], cInfo as ICraftingInfo){
        if(!isNull(input.inputCoin.tag) && !isNull(input.inputCoin.tag.value)){
            var divisor = 2;
            var result as IItemStack = null;
            while divisor < 10 {
                var amount as long = input.inputCoin.tag.value.asLong();
                if(amount % divisor == 0){
                    result = getCoinSized((amount / divisor) as long);
                    break;
                }
                divisor += 1;
            }
            if(!isNull(result)) return result * divisor;
        }
        print("returning null");
        return null;
});

print("--- CompactCoins.zs initialized ---");