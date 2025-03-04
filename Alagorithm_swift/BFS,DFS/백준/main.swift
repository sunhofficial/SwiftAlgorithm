//
//  1495.swift
//  Alogrithm2
//
//  Created by Sunho on 3/3/25.
//

import Foundation
let nsm = readLine()!.split(separator: " ").map{Int(String($0))!}, n = nsm[0], s = nsm[1], m = nsm[2]
var inputs = readLine()!.split(separator: " ").map{Int(String($0))!}
var dp = Array(repeating: Array(repeating: false, count: 1001), count: 51)
if s + inputs[0] <= m {
    dp[1][s + inputs[0]] = true
}
if s - inputs[0] >= 0 {
    dp[1][s - inputs[0]] = true
}
for i in stride(from: 2, through: n, by: 1){
    for j in 0...m {
        if dp[i-1][j] {
            if j - inputs[i - 1] >= 0 {
                dp[i][j - inputs[i - 1] ] = true
            }
            if j + inputs[i-1] <= m {
                dp[i][j + inputs[i - 1]] = true
            }
        }
    }
}
var index = -1
for i in stride(from: m, through: 0, by: -1) {
    if dp[n][i] {
        index = i
        break
    }
}
print(index)
