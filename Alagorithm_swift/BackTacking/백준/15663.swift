//
//  15663.swift
//  Alogrithm2
//
//  Created by Sunho on 12/25/24.
//

import Foundation
let nm = readLine()!.split(separator: " ").map{Int(String($0))!}
let arrs = readLine()!.split(separator: " ").map{Int(String($0))!}.sorted()
var visited = Array(repeating: false, count: nm[0])

func dfs(_ cnt: Int, _ arr: String) {
    var last = 0
    if cnt == nm[1] {
        print(arr)
        return
    }
    for i in 0..<nm[0]{
        if !visited[i], last != arrs[i] {
            visited[i] = true
            dfs(cnt+1, "\(arr)\(arrs[i]) ")
            last = arrs[i]
            visited[i] = false
        }
    }
}
dfs(0, "")
