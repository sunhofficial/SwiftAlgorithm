//
//  1535.swift
//  Alogrithm2
//
//  Created by Sunho on 2/7/25.
//

import Foundation
let n = Int(readLine()!)!
var loses = [0] + readLine()!.split(separator: " ").map{Int(String($0))!}
var gets = [0] + readLine()!.split(separator: " ").map{Int(String($0))!}
var dp = Array(repeating: Array(repeating:0,count:n+1), count: 100)
var health = 100
for i in 1...n {
    let (h, p ) = (loses[i], gets[i])
    for k in 0...99 {
        if h <= k {
            dp[k][i] = max(dp[k][i-1], dp[k-h][i-1] + p)
        }else {
            dp[k][i] = dp[k][i-1]
        }
    }
}
print(dp[99][n])
