//
//  12865.swift
//  Alogrithm2
//
//  Created by Sunho on 2/7/25.
//

import Foundation

let input = readLine()!.split(separator: " ").map { Int($0)! }
let N = input[0]
let K = input[1]
var queue = [(Int, Int)]()
for i in 0..<N {
    let wv = readLine()!.split(separator: " ").map{ Int(String($0))!}
    queue.append((wv[0],wv[1]))
}
var dp: [Int] = Array(repeating: 0, count: K + 1)
for (w,v) in queue{
    if w > K {
        continue
    }
    for j in stride(from: K, through: w, by: -1) {
       dp[j] = max(dp[j], dp[j-w] + v)
    }
}
print(dp[K])
