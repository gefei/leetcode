impl Solution {
    pub fn find_closest(x: i32, y: i32, z: i32) -> i32 {
        let xz = (x-z).abs();
        let yz = (y-z).abs();
        if xz == yz {
            return 0;
        } else if xz < yz {
            return 1;
        } else {
            return 2;
        }
    }
}
