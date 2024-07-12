//
//  11057.swift
//  Alagorithm_swift
//
//  Created by 235 on 7/13/24.
//

import Foundation
let n = Int(readLine()!)!
var dp = Array(repeating: 1, count: 10)
for _ in 1..<n {
    for i in 1...9 {
        dp[i] = (dp[i-1] + dp[i]) %     10007
    }
}

print(dp.reduce(0, {$0 + $1 }) % 10007)
