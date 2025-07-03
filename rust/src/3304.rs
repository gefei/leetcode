fn main() {
    println!("{}", kth_character(5));
    println!("{}", kth_character(10));
}

fn kth_character(k: i32) -> char {
    let mut i: i8 = 0;
    let mut l: i32 = k;
    while l > 0 {
        l = l >> 1;
        i = i + 1;
    }
    l = 1 << (i-1);
    if l == 1 {
        return 'a';
    }
    let j = k - l;
    if j == 0 {
        return next(kth_character(l >> 1))
    } else {
        return next(kth_character(j))
    }
}

fn next(c: char) -> char {
    return (('a' as u8) + ((c as u8) + 1 - ('a' as u8)) % 26) as char;
}