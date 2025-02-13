//
//  9466.swift
//  Alogrithm2
//
//  Created by Sunho on 2/13/25.
//

import Foundation
let t = Int(readLine()!)!
for _ in 0..<t {
    let n = Int(readLine()!)!
    var visited = Array(repeating: false, count: n+1)
    var done = Array(repeating: false, count: n+1)
    let arrs = [0] +  readLine()!.split(separator: " ").map{Int(String($0))!}
    var cnt = 0
    var startofCycle = 0
    func dfs( _ current: Int) {
        if done[current] {
            return
        }
        if visited[current] {
           cnt += 1
            startofCycle = current
            var next = arrs[current]
            while startofCycle != next {
                next = arrs[next]
                cnt += 1
            }
        } else {
            visited[current] = true
            dfs(arrs[current])
        }
        done[current] = true
    }
    for i in 1...n {
        if !visited[i] {
            dfs(i)
        }
    
    }
    print(n-cnt)
}



