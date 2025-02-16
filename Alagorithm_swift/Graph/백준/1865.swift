//
//  1865.swift
//  벨만포드: 한노드에서 다른 노드까지의 최단거리를 구하는 알고리즘. 간선의 가중치가 음수일때도 최단거리를 구할 수 있다. 다익스트라와 차이가. 다익스트라는 매번 방문하지 않은 노드중에 최단거리로 노드를 선택한다.왜? 음수간선이 없자는 전제조건하에 푸는겨. 다익스트라는 우선순위 큐를 사용ㅎ면 O(ElogV)로 빠르다. 벨만포드는 모든 간선을 전부 확인하면서 모든 노드간의 최단거리를 구해나감. 그러기에 시간복잡도O(VE).
// 1. 출발노드를 정하고->최단거리테이블초기화->다음의 과정을 반복.

import Foundation
struct Edge {
    let from: Int
    let to: Int
    let cost: Int
}
let tc = Int(readLine()!)!
func bellmanFord(_ edges: [Edge], _ n: Int) -> Bool {
    var dist = Array(repeating: Int.max, count: n + 1)
     dist[0] = 0
    // 1. **N-1번 반복해 최단 거리 갱신**
    for _ in 0..<n {
        for edge in edges {
            if dist[edge.from] != Int.max && dist[edge.from] + edge.cost < dist[edge.to] {
                dist[edge.to] = dist[edge.from] + edge.cost
            }
        }
    }
    
    // 2. **음수 사이클 탐지**
    for edge in edges {
        if  dist[edge.from] + edge.cost < dist[edge.to] &&  dist[edge.from] != Int.max{
            return true // 음수 사이클 존재
        }
    }
    return  false
}

for i in 0..<tc {
    let nmw = readLine()!.split(separator: " ").map{Int(String($0))!}, n = nmw[0], m = nmw[1], w = nmw[2]
    var edges = [Edge]()
    for k in 0..<m {
        let set = readLine()!.split(separator: " ").map{Int(String($0))!}
        edges.append(Edge(from: set[0], to: set[1], cost: set[2]))
        edges.append(Edge(from: set[1], to: set[0], cost: set[2]))
    }
    for _ in 0..<w {
        let set = readLine()!.split(separator: " ").map{Int(String($0))!}
        edges.append(Edge(from: set[0], to: set[1], cost: -set[2]))
    }
    for i in 1...n {
         edges.append(Edge(from: 0, to: i, cost: 0))
     }
    let hasNegativeCycle = bellmanFord(edges, n)
           
           if hasNegativeCycle {
               print("YES")
           } else {
               print("NO")
           }
}
