//
//  21758.swift
//  Alogrithm2
//
//  Created by Sunho on 1/24/25.
//

import Foundation
let n = Int(readLine()!)!
let maps = readLine()!.split(separator: " ").map{Int(String($0))!}
var psum = Array(repeating: 0, count: n + 1)
for i in 1...n {
    psum[i] = psum[i-1] + maps[i-1]
}
var answer = 0

// 벌 벌 통
for i in 2..<n {
    answer = max(answer, 2 * psum[n] - psum[1] - psum[i] - maps[i-1])
}
// 벌 통 벌
for i in 2..<n {
    answer = max(answer, psum[n-1] + psum[i - 1] - maps[i-1])
}
for i in 2..<n {
    answer = max(answer, psum[i] - psum[1] + psum[n-1] - psum[i-1])
}
print(answer)
