//
//  11054.swift
//  Alagorithm_swift
//
//  Created by 235 on 7/17/24.
//

import Foundation
let n = Int(readLine()!)!
let aArr = readLine()!.split(separator: " ").map {Int(String($0))!}
var dp = Array(repeating: 1, count: n   )
var shakeDp = Array(repeating: 1, count: n)
var result = [Int]()
for i in 0..<n {
    for j in 0..<i {
        if aArr[i] > aArr[j] {
            dp[i] = max(dp[j ] + 1, dp[i])
        }
    }
}

for i in stride(from: n-1, through: 0, by: -1) {
    for j in stride(from: n-1, through: i, by: -1) {
        if aArr[i] > aArr[j] {
            shakeDp[i] = max(shakeDp[j] + 1, shakeDp[i])
        }
    }
}
for i in 0..<n {
    result.append(dp[i] + shakeDp[i])
}
print(result.max()! - 1)
// 풀이: 증가하는거를 우선으로 각각에서 최대길이를 구하고 감소하는버전도 따로 최대길이를 구하고 두개를 합쳤을때 가장큰놈이 가장 긴 바이오닉 수열이다.
