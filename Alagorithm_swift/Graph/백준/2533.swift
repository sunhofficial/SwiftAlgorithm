//
//  2533.swift
//  Alogrithm2
//
//  Created by Sunho on 3/2/25.
//

import Foundation
let n = Int(readLine()!)!
var tree: [Int: [Int]] = [:]
var visited = [Bool](repeating: false, count: n + 1)
for _ in 0..<n - 1{
    let input = readLine()!.split(separator: " ").map{Int(String($0))!}
    tree[input[0],default: []].append(input[1])
    tree[input[1],default: []].append(input[0])
}

var cache = [[Int]](repeating: [Int](repeating: 0, count: 2), count: n + 1)
func dfs(node: Int) {
    visited[node] = true
    cache[node][0] = 0
    cache[node][1] = 1
    for next in tree[node, default: []] {
        if !visited[next] {
            dfs(node: next)
            cache[node][0] += cache[next][1]
            cache[node][1] += min(cache[next][0], cache[next][1])
        }
    }
}
dfs(node: 1)
print(min(cache[1][0], cache[1][1]))
