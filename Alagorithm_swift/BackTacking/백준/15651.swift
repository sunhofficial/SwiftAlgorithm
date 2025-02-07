//
//  15651.swift
//  Alogrithm2
//
//  Created by Sunho on 2/7/25.
//

import Foundation
let nm = readLine()!.split(separator: " ").map{Int(String($0))!}
var result = ""
func dfs(arr: [Int]) {
    if arr.count == nm[1] {
        result += arr.map { String($0) }.joined(separator: " ") + "\n"
        return
    }
    for i in 1...nm[0] {
        dfs(arr: arr + [i])
    }
}
dfs(arr: [])

print(result)
