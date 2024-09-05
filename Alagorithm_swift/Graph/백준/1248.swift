//
//  1238.swift
//  Alogrithm2
//
//  Created by Sunho on 9/4/24.
//

import Foundation
let nmx = readLine()!.split(separator: " ").map{Int(String($0))!}
var graph :  [[(Int,Int)]] = Array(repeating: [], count: nmx[0] + 1)
var reversedGraph  :  [[(Int,Int)]] = Array(repeating: [], count: nmx[0] + 1)
for _ in 0..<nmx[1] {
    let data = readLine()!.split(separator: " ").map{Int(String($0))!}
    graph[data[0]].append((data[1],data[2]))
    reversedGraph[data[1]].append((data[0],data[2]))
}
func dijstra(_ x: Int, _ graph: [[(Int,Int)]]) -> [Int] {
    var unvisited = Array(1...nmx[0])
    unvisited.remove(at: unvisited.firstIndex(of: x)!)
    var dist = [Int](repeating: 100 * 10000 + 1, count: nmx[0] + 1)
    for (node, cost ) in graph[x] {
        dist[node] = cost
    }
    dist[x] = 0
    while !unvisited.isEmpty {
        let node = popNode(unvisited, dist)
        unvisited.remove(at: unvisited.firstIndex(of: node)!)
        for (adjNode, cost) in graph[node] {
            let newdist = dist[node] + cost
            if newdist < dist[adjNode] {
                dist[adjNode] = newdist
            }
        }
    }
    return dist
}
func popNode(_ unvisited: [Int], _ dist: [Int]) -> Int {
    var min = Int.max
    var minNode = -1
    for node in unvisited {
        if (dist[node] <= min) {
            min = dist[node]
            minNode = node
        }
    }
    return minNode
}


let distNToX = dijstra(nmx[2], reversedGraph)
let distXTON = dijstra(nmx[2], graph)
var maxresult = 0
for node in 1...nmx[0] {
    let dist = distXTON[node] + distNToX[node]
    if dist > maxresult {
        maxresult = dist
    }
}
print(maxresult)
