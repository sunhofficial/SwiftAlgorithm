//
//  9084.swift
//  Alogrithm2
//
//  Created by Sunho on 2/9/25.
//

import Foundation
let t = Int(readLine()!)!
var answer = [Int]()
for i in 0..<t {
    let n = Int(readLine()!)!
    let arrs = readLine()!.split(separator: " ").map{Int(String($0))!}
    let goal = Int(readLine()!)!
    var dp = Array(repeating: 0, count: 10001)
    dp[0] = 1
    for coin in arrs {
        if coin > goal {continue}
        for j in coin...goal {
            dp[j] += dp[j-coin]
        }
    }
    answer.append(dp[goal])
}

answer.forEach { print($0) }
