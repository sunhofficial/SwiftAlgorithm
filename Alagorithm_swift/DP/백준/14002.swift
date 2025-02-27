//
//  14002.swift
//  Alogrithm2
//
//  Created by Sunho on 2/25/25.
//

import Foundation
let n = Int(readLine()!)!
var arrs = readLine()!.split(separator: " ").map{Int(String($0))!}
var dp = Array(repeating: 1, count: 1001)
var result = [Int]()
for i in 1..<n {
    for j in 0..<i {
        if arrs[i] > arrs[j] {
            dp[i] = max(dp[i], dp[j] + 1)
        }
    }
}
var answer = dp.max()!
print(answer)
for i in stride(from: n - 1, through: 0, by: -1) {
    if dp[i] == answer {
        result.append(arrs[i])
        answer -= 1
    }
}
print(result.reversed().map{String($0)}.joined(separator: " "))
