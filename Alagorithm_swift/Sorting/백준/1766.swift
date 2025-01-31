//
//  1766.swift
//  Alogrithm2
//
//  Created by Sunho on 10/10/24.
// 문제집

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
var index = 0
while queue.count > index {
    let current = queue[index]
    result.append(current)
    for next in maps[current] {
        indegrees[next] -= 1
        if indegrees[next] == 0 {
            queue.append(next)
        }
    }
    index += 1
}


print(result.map { String($0) }.joined(separator: " "))
