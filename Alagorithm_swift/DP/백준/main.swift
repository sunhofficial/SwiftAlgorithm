//
//  9461.swift
//  Alagorithm_swift
//
//  Created by 235 on 7/9/24.
//

import Foundation
let t = Int(readLine()!)!
var dp = Array(repeating: 0, count: 101)
dp[1] = 1
dp[2] = 1
dp[3] = 1
dp[4] = 2
dp[5] = 2
func findDP(_ start: Int) -> Int {
    if start < 6 {
        return dp[start]
    }else {
        for i in 6...start {
            dp[i] = dp[i-1] + dp[i-5]
        }}
    return dp[start]
}
for j in 0..<t {
    print(findDP(Int(readLine()!)!))
}

