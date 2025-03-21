var findAllRecipes = function(recipes, ingredients, supplies) {
    const solved = {}
    const supp = {}
    for (let i = 0; i < supplies.length; i++) {
        supp[supplies[i]] = true
    }
    let changed = true
    while (changed) {
        changed = false
        for (let i = 0; i < recipes.length; i++) {
            let all_in = true
            for (let j of ingredients[i]) {
                all_in = all_in && (supp[j] || solved[j])
                if (!all_in) {
                    break
                }
            }
            if (all_in && !solved[recipes[i]]) {
                solved[recipes[i]] = true
                changed = true
            }
        }
    }
    const res = []
    for (let k of Object.keys(solved)) {
        res.push(k)
    }
    return res
};

console.log(findAllRecipes(["bread"], [["yeast","flour"]], ["yeast","flour","corn"]))
console.log(findAllRecipes(["bread","sandwich"], [["yeast","flour"],["bread","meat"]], ["yeast","flour","meat"]))