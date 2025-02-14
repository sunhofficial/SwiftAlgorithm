//
//  17404.swift
//  Alogrithm2
//
//  Created by Sunho on 2/13/25.
//

import Foundation
let n = Int(readLine()!)!

var maps =  Array(repeating: Array(repeating: 0, count: 3), count: 1001)
for i in 1...n {
    let inputs = readLine()!.split(separator: " ").map{Int(String($0))!}
    maps[i] = inputs
}
var result = Int.max
for i in 0...2 {
    var dp = Array(repeating: Array(repeating: Int.max, count: 3), count: 1001)
    dp[1][i] = maps[1][i]
    for j in 0...2 {
        if j != i {
            dp[1][j] = 1001
        }
    }
    for i in 2...n{
        dp[i][0] = min(dp[i-1][1], dp[i-1][2]) + maps[i][0]
        dp[i][1] = min(dp[i-1][0], dp[i-1][2]) + maps[i][1]
        dp[i][2] = min(dp[i-1][0], dp[i-1][1]) + maps[i][2]
    }
    for lastColor in 0...2 {
        if lastColor != i {
            result = min(result, dp[n][lastColor])
        }
    }
}
print(result)
