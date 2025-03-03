//
//  1495.swift
//  Alogrithm2
//
//  Created by Sunho on 3/3/25.
//

import Foundation
let nsm = readLine()!.split(separator: " ").map{Int(String($0))!}, n = nsm[0], s = nsm[1], m = nsm[2]
var inputs = readLine()!.split(separator: " ").map{Int(String($0))!}
var answer = -1
func dfs(_ current: Int, _ next: Int) {
    if next == n {
        if current > answer {
            answer = current
        }
        return 
    }
    if current + inputs[next] <= m {
        dfs(current + inputs[next], next + 1)
    }
    if current - inputs[next] >= 0 {
        dfs(current - inputs[next], next + 1)
    }
}

dfs(s, 0)
print(answer)
