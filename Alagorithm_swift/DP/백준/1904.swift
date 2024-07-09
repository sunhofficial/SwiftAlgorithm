//
//  1904.swift
//  Alagorithm_swift
//
//  Created by 235 on 7/10/24.
//

import Foundation
let n = Int(readLine()!)!
var dp = Array(repeating: 0, count: 1000001)
dp[1] = 1
dp[2] = 2
dp[3] = 3
if n > 3 {
    for i in 4...n {
        dp[i] = (dp[i-1] + dp[i-2]) % 15746
    }
    print(dp[n] )
}
else {
    print(dp[n])
}
