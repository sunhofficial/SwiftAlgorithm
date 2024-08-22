//
//  1404.swift
//  Alogrithm2
//
//  Created by Sunho on 8/22/24.
//

import Foundation
let arrs = readLine()!.split(separator: " ").map{Int(String($0))!},  n = arrs[0],  m = arrs[1]
var dp = Array(repeating: 1, count: 10001)
dp[1] = 1
dp[m] = 2
if n >= 3 && m < n {
    for i in m+1...n {
        dp[i] = (dp[i-1] + dp[i-m]) % 1000000007}
}
print(dp[n] )
