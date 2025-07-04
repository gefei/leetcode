fn k_items_with_maximum_sum(num_ones: i32, num_zeros: i32, num_neg_ones: i32, k: i32) -> i32 {
       if k <= num_ones  {
          return k;
       } else if k <= num_ones + num_zeros {
          return num_ones;
       } else {
          return num_ones - (k - num_ones - num_zeros)
       }
}