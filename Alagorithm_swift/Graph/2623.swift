//
//  2623.swift
//  Alogrithm2
//
//  Created by Sunho on 8/19/24.
//

import Foundation
let nm = readLine()!.split(separator: " ").map{Int(String($0))!}, n = nm[0], m = nm[1]
var arrs = [[Int]]()
var edges = Array(repeating: Array(repeating: false, count: 1001), count: 1001)
var indegrees = Array(repeating: 0, count: 1001)
for i in 0..<m {
    let inputs = readLine()!.split(separator: " ").map{Int(String($0))!}
    for i in 1..<inputs[0] {
        let start = inputs[i]
        let end = inputs[i+1]
        if !edges[start][end] {
            edges[start][end] = true
            indegrees[end] += 1
        }
    }
}
var queue = [Int]()
var result = [Int]()
for i in 1...n {
    if indegrees[i] == 0 {
        queue.append(i)
    }
}
var index = 0
while queue.count > index {
    let current = queue[index]
    index += 1
    result.append(current)
    for end in 1...n {
        if edges[current][end] {
            indegrees[end] -= 1
            if indegrees[end] == 0 {
                queue.append(end)
            }
        }
    }
}
if result.count != n {
    print(0)
} else {
    result.map{print($0)}
}
