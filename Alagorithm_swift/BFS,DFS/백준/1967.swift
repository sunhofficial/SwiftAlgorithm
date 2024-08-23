//
//  1967.swift
//  Alogrithm2
//
//  Created by Sunho on 8/23/24.
//

import Foundation
let n = Int(readLine()!)!
var graph = [[(Int,Int)]](repeating: [], count: n+1)
for i in 0..<n-1 {
    let abc = readLine()!.split(separator: " ").map{ Int(String($0))!}
    graph[abc[0]].append((abc[1],abc[2]))
    graph[abc[1]].append((abc[0],abc[2]))
}
var visited = [Bool](repeating: false, count: n + 1)
var endNode: (node: Int, cost: Int) = (node: 0, cost: 0)
func dfs(node: Int, depth: Int) {
    visited[node] = true
    if depth > endNode.cost {
        endNode = (node,depth)
    }
    for (nextNode, distance) in graph[node] {
        if !visited[nextNode] {
            visited[nextNode ] = true
            dfs(node: nextNode, depth: depth + distance)
            visited[nextNode] = false
        }
    }
}
dfs(node: 1, depth: 0)
visited = [Bool](repeating: false, count: n + 1)
dfs(node: endNode.node, depth: 0)
print(endNode.cost)
    
