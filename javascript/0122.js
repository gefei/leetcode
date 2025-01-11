var maxProfit = function(prices) {
    let sum_profit = profit = 0
    let min = max = prices[0]
    for (let i = 1; i < prices.length; i++) {
        const p = prices[i]
        if (p > max) {
            max = p
            profit = max - min
        } else if (p < min) {
            profit = max - min
            sum_profit += profit
            min = p
            max =p
            profit = 0
        } else {
            if (profit < p - min) {
                profit = p - min
            } else {
                sum_profit = sum_profit + profit
                min = p
                max = p
                profit = 0
            }
        }
    }
    sum_profit += profit
    return sum_profit
};

console.log(maxProfit([7,1,5,3,6,4]))
console.log(maxProfit([1,2,3,4,5,]))
console.log(maxProfit([7,6,4,3,1]))
console.log(maxProfit([3,2,6,5,0,3]))