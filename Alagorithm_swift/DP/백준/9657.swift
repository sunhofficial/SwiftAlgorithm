//
//  9657.swift
//  Alogrithm2
//
//  Created by Sunho on 11/8/24.
//

import Foundation
let n = Int(readLine()!)!
// 1개 남았을때는 무조건 SK, 2개남았을때는 무조건 CY
// 또한 dp[i-1], dp[i-3], dp[i-4] 중 한개라도 CY가 이긴다면 담턴은 SK가 이김
var dp = Array(repeating: -1, count: 1001)
dp[1] = 1
dp[2] = 0
dp[3] = 1
dp[4] = 1
if n >= 5 {
    for i in 5...n {
        dp[i] = (dp[i-1] == 0 || dp[i-3] == 0 || dp[i-4] == 0)  ? 1 : 0
    }
    print( dp[n] == 1 ? "SK" : "CY")

} else {
    print( dp[n] == 1 ? "SK" : "CY")
}
