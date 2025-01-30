//
//  1647.swift
//  Alogrithm2
//
//  Created by Sunho on 1/31/25.
//

import Foundation
let nm = readLine()!.split(separator: " ").map{Int(String($0))!}, n = nm[0], m = nm[1]
var maps = [[Int]]()
for _ in 0..<m {
    let abc = readLine()!.split(separator: " ").map{Int(String($0))!}, a = abc[0], b = abc[1], c = abc[2]
    maps.append([a,b,c])
}
maps.sort{ $0[2] < $1[2]}
var parent = Array(0...n)
func findParent(_ x: Int) -> Int {
    if parent[x] != x {
        parent[x] = findParent(parent[x])  // 경로 압축 적용
    }
    return parent[x]
}
var costs = 0
var maxEdge = 0
func union(_ a: Int, _ b: Int) {
    let aparent = findParent(a)
    let bparent = findParent(b)
    parent[bparent] = aparent
}
for node in maps {
    let px = findParent(node[0]),  py = findParent(node[1])
    
    if px != py {
        union(node[0], node[1])
        costs += node[2]
        maxEdge = node[2]
    }
}
print(costs - maxEdge)

