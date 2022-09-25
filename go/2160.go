package main

import (
    "fmt"
    "sort"
)

func minimumSum(n int) int {
    arr := toArray(n)
    sort.Ints(arr)
    x := arr[0]*10+arr[2] 
    y := arr[1]*10+arr[3] 
    return x+y
}

func toArray(n int) []int {
    arr := make([]int, 4)
    i := 3
    for n > 0 {
        arr[i] = n % 10
        i--
        n = n / 10
    }
    return arr
}

func main() {
    fmt.Println(minimumSum(2932))
    fmt.Println(minimumSum(4009))
}
