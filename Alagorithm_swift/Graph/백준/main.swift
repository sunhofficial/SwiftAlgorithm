//
//  1446.swift
//  Alogrithm2
//
//  Created by Sunho on 12/23/24.
//

import Foundation
struct Node {
    var start: Int
    var end: Int
    var cost: Int
}
let nd = readLine()!.split(separator: " ").map{Int(String($0))!}
var graph = [Node]()
for _ in 0..<nd[0] {
    let abc = readLine()!.split(separator: " ").map{Int(String($0))!}
    let node = Node(start: abc[0], end: abc[1], cost: abc[2])
    if node.end <= nd[1] {
        graph.append(node)
    }
}
var dist = Array(repeating: Int.max, count: nd[1] + 1)
dist[0] = 0
for i in 0...nd[1] {
    if i > 0 {
        dist[i] = min(dist[i], dist[i - 1] + 1)
    }
    for node in graph where node.start == i {
        dist[node.end] = min(dist[node.end], dist[i] + node.cost)
    }
}
print(dist[nd[1]])
