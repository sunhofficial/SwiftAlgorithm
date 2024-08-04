//
//  순위.swift
//  Alagorithm_swift
//
//  Created by 235 on 8/4/24.
//

import Foundation

func solution(_ n:Int, _ results:[[Int]]) -> Int {
    var graph = [[Int]](repeating: [Int](), count: n + 1)
    var winAndLose = [(Int, Int )](repeating: (0,0), count: n + 1)
    for result in results {
         graph[result[1]].append(result[0])
    }
    func dfs(_ start: Int) {
        var queue = [start]
        var visited = [Bool](repeating: false, count: n + 1)
        while !queue.isEmpty {
            let node = queue.removeFirst()
            visited[node] = true
             for next in graph[node] {
                if !visited[next] {
                    visited[next] = true
                    winAndLose[next].0 += 1
                    winAndLose[start].1 += 1
                    queue.append(next)
                }
            }
        }
    }
     for i in 1..<graph.count {
        dfs( i)
    }
    return winAndLose.filter{ $0.0 + $0.1 == n - 1  }.count
}
