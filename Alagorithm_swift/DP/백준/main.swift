//
//  15988.swift
//  Alagorithm_swift
//
//  Created by 235 on 7/15/24.
//

import Foundation
let t = Int(readLine()!)!
var dp = Array(repeating: 0, count: 1000001)
dp[1] = 1
dp[2] = 2
dp[3] = 4
dp[4] = 7
for c in 5..<1000001 {
    dp[c] = (dp[c-1] + dp[c-2] + dp[c-3]) % 1000000009
}
for _ in 0..<t {
    let k = Int(readLine()!)!
    print(dp[k])
}
