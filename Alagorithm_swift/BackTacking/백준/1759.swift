//
//  1759.swift
//  Alagorithm_swift
//
//  Created by 235 on 7/22/24.
//

import Foundation
let lc = readLine()!.split(separator: " ").map { Int(String($0))!}
let characters = readLine()!.split(separator: " ").sorted()
let aeiou = ["a","e","i","o","u"]
var visited = Array(repeating: false, count: 16)
func dfs(_ cnt: Int, current: String, start: Int) {
    if cnt == lc[0] {
        let aeiouCount = current.filter {aeiou.contains(String($0))}.count
        if cnt - aeiouCount >= 2 && aeiouCount > 0 {
            print(current)
        }
        return
    }
    for i in start..<lc[1] {
        if !visited[i] {
            visited[i] = true
            dfs(cnt +  1, current: current + characters[i], start: i + 1)
            visited[i] = false
        }
    }
}
dfs(0, current: "", start: 0)
