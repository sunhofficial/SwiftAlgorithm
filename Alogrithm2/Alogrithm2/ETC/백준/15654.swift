//
//  15654.swift
//  Alogrithm2
//
//  Created by Sunho on 11/11/24.
//

import Foundation
let nm = readLine()!.split(separator: " ").map{Int(String($0))!}
let maps = readLine()!.split(separator: " ").map{Int(String($0))!}.sorted(by: <)
var visited = Array(repeating: false, count: nm[0])
var sequence = ""
func dfs(_ num: Int, seq: String) {
    if num == nm[1] {
        sequence += "\(seq)\n"
        return
    }
    for i in 0..<nm[0] {
        if !visited[i] {
            visited[i] = true
    
            dfs(num+1, seq: seq + "\(maps[i]) ")
            visited[i] = false
           
        }
    }
}
dfs(0, seq: "")
