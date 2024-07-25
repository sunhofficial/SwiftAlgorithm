//
//  2225.swift
//  Alagorithm_swift
//
//  Created by 235 on 7/25/24.
//

import Foundation
let nk = readLine()!.split(separator: " ").map {Int(String($0))!}
var dp = Array(repeating: Array(repeating: 1, count: 201), count: 201)
if nk[1] > 1{
    for i in 2...nk[1] {
        for j in 1...nk[0] {
            dp[i][j] = (dp[i-1][j] + dp[i][j-1]) % 1000000000
        }
    }
}
print(dp[nk[1]][nk[0]])
