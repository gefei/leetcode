pub fn sum_zero(n: i32) -> Vec<i32> {
    if n == 2 {
        return vec![1,-1];
    }
   let mut collected_iterator: Vec<i32> = (0..n).collect();
   collected_iterator[(n-1) as usize] = -(n-2)*(n-1)/2;
   return collected_iterator
}