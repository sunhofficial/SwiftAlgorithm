//
//  11055.swift
//  Alagorithm_swift
//
//  Created by 235 on 7/11/24.
//

import Foundation
let n = Int(readLine()!)!
let aArrays = readLine()!.split(separator: " ").map {Int(String($0))!}
var dp = Array(repeating: 0, count: n)
dp[0] = aArrays[0]
for i in 1..<n {
    for j in 0..<i {
        if aArrays[i] > aArrays[j] {
            dp[i ] = max(dp[i], aArrays[i] + dp[j])
        } else {
            dp[i] = max(dp[i], aArrays[i])
        }
    }
}
print(dp.max()!)
