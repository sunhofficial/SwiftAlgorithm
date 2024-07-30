//
//  1965.swift
//  Alagorithm_swift
//
//  Created by 235 on 7/30/24.
//

import Foundation
let n = Int(readLine()!)!
let boxs = readLine()!.split(separator: " ").map{ Int(String($0))!}
var dp = Array(repeating: 1, count: 1001)
var maxVal = 1

for i in 0..<n{

    for j in 0..<i {
        if boxs[j] < boxs[i] && dp[i] <= dp[j] { dp[i] = dp[j] + 1 }
    }
    if maxVal < dp[i] { maxVal = dp[i]}
}
print(maxVal)
