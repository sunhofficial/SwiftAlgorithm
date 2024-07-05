//
//  18352.swift
//  Alagorithm_swift
//
//  Created by 235 on 7/5/24.
//

import Foundation
let nmkx = readLine()!.split(separator: " ").map{Int(String($0))!}
let n = nmkx[0], m = nmkx[1], k = nmkx[2], x = nmkx[3]
var roadArray: [[Int]] = Array(repeating: [], count: n + 1)
for i in 0..<m {
    let ab = readLine()!.split(separator: " ").map {Int(String($0))!}
    roadArray[ab[0]].append(ab[1])
}

var dist = Array(repeating: -1, count: n  + 1)
var queue = [Int ]()
queue.append(x)
dist[x] = 0
var index = 0
while index < queue.count {
    let current = queue[index]
    index += 1
    for next in roadArray[current] {
        if dist[next] == -1 {
            dist[next] = dist[current] + 1
            queue.append(next)
        }
    }
}

var result = [Int]()
for i in 1...n {
    if dist[i] == k {
        result.append(i)
    }
}

if result.isEmpty {
    print(-1)
} else {
    result.sorted().forEach { print($0) }
}
