//
//  2032.swift
//  Alogrithm2
//
//  Created by Sunho on 8/13/24.
//

import Foundation
let n = Int(readLine()!)!
func dfs(_ num: Int, _ size: Int) {
    if size == n {
        if isPrime(num) {
            print(num)
        }
        return
    } else {
        for i in stride(from: 1, through: 9, by: 2) {
            let next = num * 10 + i
            if isPrime(next) {
                dfs(next, size + 1)
            }
        }
    }
}
func isPrime(_ num: Int) -> Bool {
    if num < 2 {return false}
    if num == 2{ return true}
    if num % 2 == 0 {return false}
    for i in stride(from: 3,through: Int(Double(num).squareRoot()), by: 2) {
        if num % i == 0 {
            return false
        }
    }
    return true
}

for i in 2...9 {
    if isPrime(i) {
        dfs(i,1)
    }
}
