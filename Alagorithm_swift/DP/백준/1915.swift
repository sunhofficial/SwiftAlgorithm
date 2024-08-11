//
//  1915.swift
//  Alogrithm2
//
//  Created by Sunho on 8/11/24.
//

import Foundation
let nm = readLine()!.split(separator: " ").map{Int(String($0))!}
var maps = Array(repeating: [Int](), count: nm[0] + 1)
var dp: [[Int]] = Array(repeating: Array(repeating: 0, count: nm[1]), count: nm[0])
for i in 0..<nm[0] {
    maps[i] = (readLine()!.map{Int(String($0))!})
}

for y in 0..<nm[0] {
    dp[y][0] = maps[y][0]
}
for x in 0..<nm[1] {
    dp[0][x] = maps[0][x]
}
for y in 1..<nm[0] {
    for x in 1..<nm[1] {
        if maps[y][x] == 0 {
            dp[y][x] = 0
        } else  {
            dp[y][x] = min(dp[y-1][x], dp[y][x-1], dp[y-1][x-1]) + 1
        }
    }
}
let maxValue =  dp.flatMap {$0}.max()!
print(maxValue * maxValue)
