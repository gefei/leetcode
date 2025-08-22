var numberOfSubmatrices = function(grid) {
    const up_map = grid[0].map(_ => {return {X: 0, Y: 0, ".": 0}})
    return process_grid(grid, up_map, 0, 0) 
};

function process_grid(grid, up_map, idx, acc) {
    if (idx === grid.length) return acc
    const row_map = process_row(grid[idx], 0, {X: 0, Y: 0, ".": 0}, [])
    let c = 0
    new_up_map = []
    for (let i = 0; i < row_map.length; i++) {
        const one_map = {}
        one_map["X"] = row_map[i]['X'] + up_map[i]['X']
        one_map["Y"] = row_map[i]['Y'] + up_map[i]['Y']
        one_map["."] = row_map[i]['.'] + up_map[i]['.']
        new_up_map[i] = one_map
        if (one_map["X"] > 0 && one_map["Y"] === one_map["X"]) c = c + 1
    }
    return process_grid(grid, new_up_map, idx+1, acc+c)
}

function process_row(row, idx, cur, acc) {
    if (idx === row.length) return acc
    const h = row[idx]
    const c = cur[row[idx]]
    const new_map = {}
    new_map['X'] = cur['X']
    new_map['Y'] = cur['Y']
    new_map['.'] = cur['.']
    new_map[h] = c+1
    acc.push(new_map) // TODO
    return process_row(row, idx+1, new_map, acc)
}