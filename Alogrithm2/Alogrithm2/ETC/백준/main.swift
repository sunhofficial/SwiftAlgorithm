//
//  main.swift
//  Alogrithm2
//
//  Created by Sunho on 3/3/25.
//

import Foundation
var isPrime = [Bool](repeating: true, count : 1004001)

func findPrime() {
    isPrime[0] = false
    isPrime[1] = false
    for i in 2...1000 {
        if isPrime[i] {
            for j in stride(from: i * i , to:1004001, by: i) {
                isPrime[j] = false
            }
        }
    }
}
func isPalindrome(_ num :Int) -> Bool {
    let str = String(num)
    return str == String(str.reversed())
}
if let n = Int(readLine()!) {
    findPrime()
    for num in n...1004000 {
        if isPrime[num] && isPalindrome(num) {
            print(num)
            break
        }
    }
}
