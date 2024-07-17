//
//  2294.swift
//  Alagorithm_swift
//
//  Created by 235 on 7/16/24.
//

import Foundation
let nk = readLine()!.split(separator: " ").map{ Int(String($0))!}
var coins = [Int]()
var dp = Array(repeating: 10001, count: 10001)
for _ in 0..<nk[0] {
    coins.append(Int(readLine()!)!)
}
coins.sort()
dp[0] = 0
for coin in coins {
    for j in 1...nk[1] {
        if j - coin < 0 {
            continue
        }
        dp[j] = min(dp[j], dp[j - coin] + 1)
    }
}
if dp[nk[1]] == 10001 {
    print(-1)
}
else {
    print(dp[nk[1]])
}
