pub fn largest_good_integer(num: String) -> String {
    let mut a: char = ' ';
    let mut b: char = ' ';
    let mut c: char;
    let mut i: i32 = 0;
    let mut res: String = String::new();
    let mut max: char = ' ';
    let mut max_str: String = String::new();
    for char in num.chars() {
        if i == 0  {
            a = char;
        } else if i == 1 {
            b = char;
        } else {
            c = char;
            if a == b && b == c {
                res.push(a);
                res.push(b);
                res.push(c);
                if max < a {
                    max = a;
                    max_str = res;
                }
                res = String::new();
            } else {
                a = b;
                b = c;
            }
        }
        i = i + 1;
    }
    return max_str;
}