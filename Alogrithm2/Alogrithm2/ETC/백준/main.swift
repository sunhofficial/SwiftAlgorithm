//
//  11049.swift
//  Alogrithm2
//
//  Created by Sunho on 2/4/25.
//

import Foundation
typealias Pair  = (row: Int, col: Int)
let n = Int(readLine()!)!
var matrix = [Pair]()
var dp = Array(repeating: Array(repeating: 0, count: 501), count: 501)
for _ in 0..<n {
    let rc = readLine()!.split(separator: " ").map{Int(String($0))!}
    matrix.append((row: rc[0], col: rc[1]))
}


for len in 1..<n { // 부분 행렬의 길이
    for start in 0..<n-len {
        let end = start + len
        var result = Int.max
        for mid in start..<end {
            result = min(result, dp[start][mid] + dp[mid+1][end] + matrix[start].row * matrix[mid].col * matrix[end].col)
        }
        dp[start][end] = result
    }
}
print(dp[0][n-1])
