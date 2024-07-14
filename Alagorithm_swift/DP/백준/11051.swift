//
//  11051.swift
//  Alagorithm_swift
//
//  Created by 235 on 7/13/24.
//

import Foundation
let nk = readLine()!.split(separator: " ").map{ Int(String($0))!}, n = nk[0], k = nk[1]
var dp = Array(repeating: Array(repeating: 1, count: 1001), count: 1001)
if n >= 2 {
    for i in 2...n {
        for j in 1..<i{
            dp[i][j] = ( dp[i-1][j] + dp[i-1][j-1]) % 10007
        }
    }
}

print(dp[n][k])
