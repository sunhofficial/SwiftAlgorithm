//
//  1197.swift
//  Alagorithm_swift
//
//  Created by 235 on 8/2/24.
//

import Foundation
typealias Edge = (a: Int, b: Int, cost: Int)
let ve = readLine()!.split(separator: " ").map { Int(String($0))!}
var graphs = [Edge]()
var parent = [Int](0...ve[0])
for _ in 0..<ve[1] {
    let abc = readLine()!.split(separator: " ").map { Int(String($0))!}, a = abc[0], b = abc[1], c = abc[2]
    graphs.append(Edge(a,b,c))
}
graphs.sort {$0.cost < $1.cost}
var answer = 0
for edge in graphs {
    if !isSameParent(edge.a, edge.b) {
        union(edge.a, edge.b)
        answer += edge.cost
    }
}
func isSameParent(_ a: Int, _ b: Int) -> Bool {
    return find(a) == find(b)
}
func find(_ x: Int) -> Int {
    if parent[x] == x {
        return x
    }
    parent[x] = find(parent[x])
    return parent[x]
}
func union(_ a: Int, _ b: Int) {
    let a = find(a)
    let b = find(b)
    if a == b {return}
    if a > b {parent[a] = b}
    if a < b {parent[b] = a}
}
print(answer)
