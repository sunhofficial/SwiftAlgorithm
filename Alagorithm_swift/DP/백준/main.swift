//
//  1309.swift
//  Alagorithm_swift
//
//  Created by 235 on 7/14/24.
//

import Foundation
let n = Int(readLine()!)!
var dp = Array(repeating: 0, count: 100001)
dp[0] = 1
dp[1] = 3
dp[2] = 7
if n >= 3 {
    for i in 3...n {
        dp[i] = (2*dp[i-1] + dp[i-2]) % 9901
    }
}
print(dp[n])
