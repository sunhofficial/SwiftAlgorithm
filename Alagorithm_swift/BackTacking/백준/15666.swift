//
//  15666.swift
//  Alogrithm2
//
//  Created by Sunho on 12/27/24.
//

import Foundation
let nm = readLine()!.split(separator: " ").map{Int(String($0))!}
let arrs = readLine()!.split(separator: " ").map{Int(String($0))!}.sorted()
var ans: [String] = []
func dfs(_ depth: Int, _ start: Int) {
    var prev = 0
    if depth == nm[1] {
        print(ans.joined(separator: " "))
        return
    }
    for i in start..<nm[1] where prev != arrs[i] {
        prev = arrs[i]
        ans.append(String(prev))
        dfs(depth+1, i+1)
        ans.removeLast()
    }
}

dfs(0, 0)
