//
//  15591.swift
//  Alogrithm2
//
//  Created by Sunho on 2/11/25.
//

import Foundation
let nq = readLine()!.split(separator: " ").map{Int(String($0))!}, n = nq[0], q = nq[1]
var arr = Array(repeating: [(Int,Int)](), count: n + 1)
for _ in 1..<n {
    let pqrt = readLine()!.split(separator: " ").map{Int(String($0))!}
    arr[pqrt[0]].append((pqrt[1],pqrt[2]))
    arr[pqrt[1]].append((pqrt[0],pqrt[2]))
}

func bfs(_ k: Int, _ start: Int) -> Int {
    var visited = [Bool](repeating: false, count: n + 1)
    var queue = [start]
    visited[start] = true
    var cnt = 0
    var index = 0
    while queue.count > index {
        let node = queue[index]
        index += 1
        for (next, nextV) in arr[node] {
            if !visited[next] && nextV >= k {
                visited[next] = true
                queue.append(next)
                cnt += 1
            }
        }
    }
    return cnt
}
var result = [Int]()
for _ in 0..<q {
    let kv = readLine()!.split(separator: " ").map{Int(String($0))!}, k = kv[0], v = kv[1]
    result.append(bfs(k, v))
}
print(result.map{String($0)}.joined(separator: "\n"))
