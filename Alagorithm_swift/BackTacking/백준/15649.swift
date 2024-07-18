//
//  15649.swift
//  Alagorithm_swift
//
//  Created by 235 on 7/18/24.
//

import Foundation
let nm = readLine()!.split(separator: " ").map { Int(String($0))!}
var visited = Array(repeating: false, count: nm[0] + 1)
func dfs(nums: [Int]) {
    if nums.count == nm[1] {
        nums.forEach {print($0, terminator: " ")}
        print()
        return
    }
    for i in 1...nm[0] {
        if !visited[i] {
            visited[i] = true
            dfs(nums: nums + [i])
            visited[i] = false
        }

    }
}

dfs(nums: [])
