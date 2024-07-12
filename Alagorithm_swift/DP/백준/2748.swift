//
//  2748.swift
//  Alagorithm_swift
//
//  Created by 235 on 7/12/24.
//

import Foundation
let n = Int( readLine()!)!
var dp = Array(repeating: 0, count: 91)
dp[0] = 0
dp[1] = 1

if n >= 2 {
    for i in 2...n {
        dp[i] = dp[i-1] + dp[i-2]
    }
}
print(dp[n])

