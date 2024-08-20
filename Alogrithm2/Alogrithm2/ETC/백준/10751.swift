//
//  10751.swift
//  Alogrithm2
//
//  Created by Sunho on 8/20/24.
//

import Foundation

let n = Int(readLine()!)!
let s = Array(readLine()!)

var dp: [Int] = [0, 0, 0]

for char in s {
    switch char {
    case "C":
        dp[0] += 1
    case "O":
        dp[1] += dp[0]
    case "W":
        dp[2] += dp[1]
    default:
        break
    }
}

print(dp[2])
