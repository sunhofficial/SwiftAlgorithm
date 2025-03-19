//
//  2169.swift
//  Alogrithm2
//
//  Created by Sunho on 3/19/25.
//

import Foundation
let nm = readLine()!.split(separator: " ").map{Int(String($0))!}, n = nm[0],  m = nm[1]

var maps = [[Int]]()
for _ in 0..<n{
    maps.append(readLine()!.split(separator: " ").map{Int(String($0))!})
}
for i in 1..<m {
    maps[0][i] += maps[0][i-1]
}

var prev  = maps[0]
for i in 1..<n {
    let current = maps[i]
    var left: [Int] = Array(repeating: 0, count: m)
    var right = Array(repeating: 0, count: m)
    left[0] = prev[0] + current[0]
    right[m-1] = prev[m-1] + current[m-1]
    for j in 1..<m {
        left[j] = max(prev[j], left[j-1]) + current[j]
        right[m-j-1] = max(prev[m-j-1], right[m-j]) + current[m-j-1]
    }
    for j in 0..<m {
        prev[j] = max(left[j],right[j])
    }
}
print(prev.last!)
