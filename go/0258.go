package main

import (
    "fmt"
    // "strconv"
)

func addDigit(num int) int {
    x := num
    for x >= 10 {
        x = sumDigit(x)
    }
    return x
}

func sumDigit(x int) int {
    s := 0
    for x > 0 {
        s += x % 10
        x = x / 10
    }
    return s
}

func main() {
    fmt.Println(addDigit(38))
    fmt.Println(addDigit(0))
}
