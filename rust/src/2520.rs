pub fn count_digits(num: i32) -> i32 {
    let mut res: i32 = 0;
    let mut n = num;
    while n > 0 {
        let r = n % 10;
        n = n / 10;
        if num%r == 0 {
            res = res + 1;
        }
    }
    return res;
}