//
//  1890.swift
//  Alagorithm_swift
//
//  Created by 235 on 7/14/24.
//

import Foundation
let n = Int(readLine()!)!
var maps = [[Int]]()
for _ in 0..<n {
    let lines = readLine()!.split(separator: " ").map {Int(String($0))!}
    maps.append(lines)
}
var dp = Array(repeating: Array(repeating: 0, count: n), count: n)
dp[0][0] = 1
for y in 0..<n {
    for x in 0..<n where maps[y][x] != 0 {
        let value = maps[y][x]
        if y+value < n {
            dp[y+value][x] += dp[y][x]
        }
        if x+value < n{
            dp[y][x+value] += dp[y][x]
        }
    }
}
print(dp[n-1][n-1])
