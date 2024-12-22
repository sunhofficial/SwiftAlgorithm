//
//  15664.swift
//  Alogrithm2
//
//  Created by Sunho on 12/22/24.
//


let nm = readLine()!.split(separator: " ").map{Int(String($0))!}, n = nm[0], m = nm[1]
let array = Array(1...n)
func dfs(_ a: [Int], _ i: Int = 0) {
    if a.count == m {
        print(a.reduce("") {$0 + "\($1) "})
        return
    }
    for index in (i..<n) {
        if index >= n {
            break
        }
        var next = a
        next.append(array[index])
        dfs(next, index + 1)
    }
}
