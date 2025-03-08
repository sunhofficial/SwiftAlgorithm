//
//  1717.swift
//  Alogrithm2
//
//  Created by Sunho on 3/7/25.
//

let nm = readLine()!.split(separator: " ").map{Int(String($0))!}, n = nm[0], m = nm[1]
var parent = Array(0...n)
func find(_ node: Int) -> Int {
    if parent[node] == node {
        return node
    }
    parent[node] = find(parent[node])
    return parent[node]
}

func union(_ node1: Int, _ node2: Int) {
    let root1 = find(node1), root2 = find(node2)
    if root1 != root2 {
        parent[root1] = root2
    }
}
for _ in 0..<m {
    let abc = readLine()!.split(separator: " ").map{Int(String($0))!}
    if abc[0] == 0 {
        union(abc[1], abc[2])
    } else {
        if find(abc[1]) == find(abc[2]) {
            print("YES")
        } else {
            print("NO")
        }
    }
}
