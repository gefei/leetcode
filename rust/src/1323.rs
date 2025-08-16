pub fn maximum69_number (num: i32) -> i32 {
     let s: String = num.to_string();
     let mut res = String::new();
     let mut i = 0;
     for char in s.chars() {
         if char == '6' && i == 0 {
             res.push('9');
             i = i + 1;
         } else {
             res.push(char);
         }
     }
     return res.parse::<i32>().unwrap();
 }