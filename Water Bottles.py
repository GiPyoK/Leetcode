class Solution:
    def numWaterBottles(self, numBottles: int, numExchange: int) -> int:
        canDrink = numBottles
        empty = numBottles
        
        while empty >= numExchange:
            #exchange empty bottles
            exchange = int(empty/numExchange)
            empty = empty%numExchange
            #drink full bottles
            canDrink += exchange
            empty += exchange
        
        return canDrink