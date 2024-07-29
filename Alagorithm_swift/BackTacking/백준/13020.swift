//
//  13023.swift
//  Alagorithm_swift
//
//  Created by 235 on 7/29/24.
//

import Foundation
let nm = readLine()!.split(separator: " ").map{Int(String($0))!}
var realtions = Array(repeating: [Int](), count: nm[0])
for i in 0..<nm[1] {
    let ab = readLine()!.split(separator: " ").map{Int(String($0))!}
    realtions[ab[0]].append( ab[1])
    realtions[ab[1]].append(ab[0])
}
var visited = Array(repeating: false, count: nm[0])
var possible = false
func dfs(_ now: Int, _ depth : Int) {
    if depth == 4 {
        possible = true
        return
    }
    visited[now] = true
    for i in 0..<realtions[now].count {
        let next =  realtions[now][i]
        if !visited[next] {
            dfs(next, depth + 1)

        }
    }
    visited[now] = false
}

for i in 0..<nm[0] {
    dfs(i,0)
    if possible { break}
}
if possible {
    print("1")
}
else {
    print("0")
}
