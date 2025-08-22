var minimumArea = function(grid) {
    let min_x, min_y, max_x, max_y
    for (let y = 0; y < grid.length; y++) {
        for (let x= 0; x < grid[y].length; x++) {
            if (grid[y][x] !== 1) continue
            if (x < min_x || min_x === undefined) min_x = x
            if (x > max_x || max_x === undefined) max_x = x
            if (y < min_y || min_y === undefined) min_y = y
            if (y > max_y || max_y === undefined) max_y = y
        }
    }
    return (max_x-min_x+1) * (max_y-min_y+1)
};