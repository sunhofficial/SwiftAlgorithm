//
//  가장먼노드.swift
//  Alagorithm_swift
//
//  Created by 235 on 7/25/24.
//

import Foundation


func solution(_ n:Int, _ edge:[[Int]]) -> Int {
    var graphs = Array(repeating: [Int](), count: n  + 1)
    for i in edge {
        graphs[i[0]].append(i[1])
        graphs[i[1]].append(i[0])
    }
    var moveCntArr = Array(repeating: [Int](), count: 50001)
    var maxCount = 0
    func bfs() {
        var queue = [(Int,Int)]()
        var visited =  Array(repeating: false, count : n + 1)
        queue.append((1,0))
        visited[1] = true
        var index = 0
        while queue.count > index {
            let (node, cnt) = queue[index]
            moveCntArr[cnt].append(node)
            maxCount = max(cnt, maxCount)
            for i in graphs[node] {
                if !visited[i] {
                    queue.append((i,cnt + 1))
                    visited[i] = true
                }
            }
            index += 1
        }
    }
    bfs()
    return moveCntArr[maxCount].count

}
