//
//  25516.swift
//  Alogrithm2
//
//  Created by Sunho on 11/11/24.
//

import Foundation
let nk = readLine()!.split(separator: " ").map{Int(String($0))!}
var maps = Array(repeating: [Int](), count: nk[0])
for i in 0..<nk[0] - 1{
    let pc = readLine()!.split(separator: " ").map{Int(String($0))!}
    maps[pc[0]].append(pc[1])
}
let infoApple =  readLine()!.split(separator: " ").map{Int(String($0))!}
var visited = Array(repeating: false, count: nk[0])
func dfs(_ node: Int, _ distance: Int) -> Int{
    if distance > nk[1] || visited[node] {
        return 0
    }
    visited[node] = true
    var value = infoApple[node]
    for neighbor in maps[node] {
        value += dfs(neighbor, distance + 1)
    }
    visited[node] = false
    return value
    
}
print(dfs(0,0))
