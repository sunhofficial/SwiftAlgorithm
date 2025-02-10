//
//  14728.swift
//  Alogrithm2
//
//  Created by Sunho on 2/9/25.
//

import Foundation
let nt = readLine()!.split(separator: " ").map{Int(String($0))!}
var queue = [(Int,Int)]()
for i in 0..<nt[0] {
    let ks = readLine()!.split(separator: " ").map{Int(String($0))!}
    queue.append((ks[0],ks[1]))
    
}
var dp = Array(repeating: 0, count: 100001)
for (k,s) in queue {
    if k > nt[1] { continue}
    for j in stride(from: nt[1], through: k, by: -1) {
        dp[j] = max(dp[j], dp[j-k] + s)
    }
}
print(dp[nt[1]])
