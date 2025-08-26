pub fn area_of_max_diagonal(dimensions: Vec<Vec<i32>>) -> i32 {
    let mut max_diag: i32 = 0;
    for row in dimensions.clone() {
        let x = row[0];
        let y = row[1];
        let sqr= x*x+y*y;
        if max_diag <  sqr {
            max_diag = sqr;
        }
    }
    let mut max_area: i32 = 0;
    for row in dimensions {
        let x = row[0];
        let y = row[1];
        let sqr= x*x+y*y;
        if max_diag ==  sqr {
            if max_area < x*y {
                max_area = x*y
            }
        }
    }
    return max_area;
}