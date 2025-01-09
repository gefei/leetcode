var maxProfit = function(prices) {
    let [profit, buy] = [0, prices[0]]
    for (let i = 1; i < prices.length; i++) {
        const p = prices[i]
        if (p < buy) {
            buy = p
        } else {
            if (p-buy > profit) {
                profit = p-buy
            }
        }
    }
    return profit
};

console.log(maxProfit([7,1,5,3,6,4]))
console.log(maxProfit([7,5,3,2,1]))