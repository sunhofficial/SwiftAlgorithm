//
//  11049.swift
//  Alogrithm2
//
//  Created by Sunho on 8/21/24.
//

import Foundation
let n = Int(readLine()!)!
var ps = readLine()!.split(separator: " ").map{Int(String($0))!}
var dp = [Int](repeating: 999999, count: n + 1)
dp[0] = 0
for i in 1..<n+1 {
    for j in 1..<i+1 {
        dp[i] = min(dp[i], dp[i-j] + ps[j-1])
    }
}
print(dp[n])
