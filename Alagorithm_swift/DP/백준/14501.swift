//
//  14501.swift
//  Alogrithm2
//
//  Created by Sunho on 5/13/25.
//

import Foundation
let n = Int(readLine()!)!
var maps =  [(Int,Int)]()
for i in 0..<n {
    let tp = readLine()!.split(separator: " ").map{Int(String($0))!}
    maps.append((tp[0], tp[1]))
}
var dp = Array(repeating: 0, count: n + 1)


for i in 0..<n {
    let t = maps[i].0
    let p = maps[i].1
    let nextDay = i + t
    if i + 1 <= n {
        dp[i+1] = max(dp[i+1],dp[i]) //상담안할때
    }
    if nextDay <= n { //상담할때
        dp[nextDay] = max(dp[nextDay],dp[i] + p)
    }
}
print(dp[n])
