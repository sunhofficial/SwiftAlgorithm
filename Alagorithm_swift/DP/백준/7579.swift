//
//  7579.swift
//  Alogrithm2
//
//  Created by Sunho on 1/30/25.
//

import Foundation
let nm = readLine()!.split(separator: " ").map { Int($0)! }
let (N, M) = (nm[0], nm[1])
let memory = readLine()!.split(separator: " ").map { Int($0)! }
let cost = readLine()!.split(separator: " ").map { Int($0)! }
let maxCost = cost.reduce(0, +)
var dp = Array(repeating: 0, count: maxCost + 1)
for i in 0..<N {
    let (m,c) = (memory[i], cost[i])
    for j in (c...maxCost).reversed() where dp[j] < dp[j-c] + m {
        dp[j] = dp[j-c] + m
    }
}
for k in 0...maxCost {
    if dp[k] >= M {
        print(k)
        break
    }
}
