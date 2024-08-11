//
//  17626.swift
//  Alogrithm2
//
//  Created by Sunho on 8/10/24.
//

import Foundation
let n = Int(readLine()!)!
var dp = Array(repeating: Int.max, count: n + 1 )
dp[0] = 0
dp[1] = 1
if n <= 1 {
    print(dp[n])
} else {
    for i in 2...n {
        var j = 1
        while j * j <= i {
            dp[i] = min(dp[i], dp[i - j*j] + 1)
            j += 1
        }
    }
    print(dp[n])
}
