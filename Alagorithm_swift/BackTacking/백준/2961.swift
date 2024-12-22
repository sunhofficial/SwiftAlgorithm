//
//  2961.swift
//  Alogrithm2
//
//  Created by Sunho on 12/23/24.
//

import Foundation
let n = Int(readLine()!)!
var sArr = [Int]()
var bArr = [Int]()
var visited = Array(repeating: false, count: n+1)
var diff = Int.max
for i in 0..<n {
    let sb = readLine()!.split(separator: " ").map{Int(String($0))!}
    sArr.append(sb[0])
    bArr.append(sb[1])
}
func dfs(_ detph: Int, _ s: Int, _ b: Int, _ cnt: Int)  {
    if cnt > 0 {
        diff = min(diff, abs(s-b))
    }
    if detph == n {
        return
    }
    dfs(detph + 1, s * sArr[detph], b + bArr[detph], cnt + 1)
    dfs(detph + 1, s, b, cnt)
    
}
dfs(0,1, 0, 0)
print(diff)
