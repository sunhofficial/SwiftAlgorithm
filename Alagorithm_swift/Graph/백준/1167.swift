//
//  1167.swift
//  Alogrithm2
//
//  Created by Sunho on 3/3/25.
//
// 이건 기본 상식이 없으면 못풀듯 1. 임의의 노드에서 DFS를 통해 제일 먼 노드를 찾는다. 그 노드를 기준으로 가장 멀리있는 노드와의 거리가 지름이다. 왜 제일 멀다는거 자체가 제일끝에있으니까
import Foundation
let n = Int(readLine()!)!
var maps = Array(repeating: [(Int,Int)](), count: n + 1)
for i in 0..<n {
    let inputs = readLine()!.split(separator: " ").map{Int(String($0))!} , start = inputs[0]
    for k in stride(from: 1, to: inputs.count - 1, by: 2) {
        maps[start].append((inputs[k], inputs[k+1]))
    }

}
var visited = Array(repeating: false, count: n + 1)
var endNode = (0,0)
func dfs(_ node: Int, _ cost: Int) {
    visited[node] = true
    if cost > endNode.1 {
        endNode = (node, cost)
    }
    for (nextNode, nextCost) in maps[node]  where !visited[nextNode]{
        visited[nextNode] = true
        dfs(nextNode, cost + nextCost)
        visited[nextNode] = false
    }
    
}

dfs(1, 0)
visited = Array(repeating: false, count: n + 1)
dfs(endNode.0, 0)
print(endNode.1)
