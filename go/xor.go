package main

import (
    "fmt"
)

func main() {
    nums := []int{23, 23, 19, 19, 1, 88, 88, 3, 3, 2, 56, 56}

    //设两个不重复的数为a1和a2，x = a1 ^ a2，bits为a1和a2某个不一致的位
    var a1, a2, x, bits int

    //将所有的数字异或，得到的结果就为x，因为重复的数经过异或后都为0
    for _, v := range nums {
        x = x ^ v
    }

    //找出a1和a2某个不一致的位，换句话说，就是找出x为1的位（当然，x为1的位有很多，我们这找的是x从右往左第一个为1的位）
    bits = 1
    for i := 31; i >= 0; i++ {
        if x&bits != 0 {
            break
        }
        bits = bits << 1
    }

    //舍去所有bits位为0的数字，将剩下的数字全部异或，这样就能得出两个不重复的数字其中的一个
    for _, v := range nums {
        if v&bits != 0 {
            a1 = a1 ^ v
        }
    }

    //根据x和a1可以很容易求出a2
    a2 = x ^ a1

    fmt.Println("Result : ", a1, a2)
}
