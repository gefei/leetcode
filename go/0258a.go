package main

import (
    "fmt"
    "strconv"
)

func addDigits(num int) int {
    x := num
    for x >= 10 {
        x = sumDigit(x)
    }
    return x
}

func sumDigit(x int) int {
    s := 0
    var str string = strconv.Itoa(x)
    for _, c := range(str) {
        s += int(c) - 48
    }
    return s
}

func main() {
    fmt.Println(addDigit(38))
    fmt.Println(addDigit(10))
}
