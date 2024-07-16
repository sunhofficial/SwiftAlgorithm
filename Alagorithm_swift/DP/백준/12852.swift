//
//  12852.swift
//  Alagorithm_swift
//
//  Created by 235 on 7/15/24.
//

import Foundation
var n = Int(readLine()!)! //1에서 ->N 으로 만들도록 해보자.
var dp = Array(repeating: (Int.max, 0), count: n+1)
dp[0] = (0,0)
for i in 1...n {
    dp[i] = (dp[i-1].0 + 1, i - 1)
    if i % 3 == 0 && dp[i/3].0 + 1 < dp[i].0 {
        dp[i] = (dp[i/3].0 + 1, i/3)
    }
    if i % 2 == 0 && dp[i/2].0 + 1 < dp[i].0 {
        dp[i] = (dp[i/2].0 + 1, i/2)
    }
}

var answer = [Int]()
while n >= 1{
    answer.append(n)
    n = dp[n].1
}
print(answer.count - 1)
answer.forEach {print($0, terminator: " ")}
