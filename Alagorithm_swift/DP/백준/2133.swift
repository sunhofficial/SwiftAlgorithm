//
//  2133.swift
//  Alagorithm_swift
//
//  Created by 235 on 7/26/24.
//

import Foundation
let n = Int(readLine()!)!
var dp = Array(repeating: 0, count: 31)
dp[0] = 1
dp[2] = 3
if n>=4 {
    for i in stride(from: 4, through: n, by: 2) {
        dp[i] = dp[i-2] * 3
        for j in stride(from: 4, through: i, by: 2) {
            dp[i] += dp[i-j] * 2
        }
    }
}

print(dp[n])
