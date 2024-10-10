//
//  1766.swift
//  Alogrithm2
//
//  Created by Sunho on 10/10/24.
// 문제집

import Foundation
let nm = readLine()!.split(separator: " ").map {Int(String($0))!}, n = nm[0], m = nm[1]
var maps = Array(repeating: [Int](), count: n+1)
var indegrees = Array(repeating: 0, count: n + 1)
indegrees[0] = -1
for i in 0..<m {
    let ab = readLine()!.split(separator: " ").map {Int(String($0))!}, a = ab[0], b = ab[1]
    maps[a].append(b)
    indegrees[b] += 1
}
var queue = [Int]()
var result = [Int]()
for i in 1...n {
    if indegrees[i] == 0 {
        queue.append(i)
    }
}
queue.sort()
while !queue.isEmpty {
    let cur = queue.removeFirst()
    result.append(cur)
    for next in maps[cur] {
        indegrees[next] -= 1
        if indegrees[next] == 0  {
            queue.append(next)
        }
    }
    queue.sort()
}
print(result.map { String($0) }.joined(separator: " "))
