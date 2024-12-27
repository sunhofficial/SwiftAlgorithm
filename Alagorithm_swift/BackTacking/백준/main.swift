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
func dfs(_ cnt: Int, _ str: String, _ i: Int) {
    if cnt == nm[1] {
        if ans.contains(str) { return }
        ans.append(str)
        print(str)
        return
    }
    for i in i..<nm[0] {
        dfs(cnt + 1, "\(str)\(arrs[i]) ", i)
    }
}

dfs(0, "",0)
