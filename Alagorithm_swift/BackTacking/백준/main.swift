//
//  10974.swift
//  Alagorithm_swift
//
//  Created by 235 on 7/20/24.
//

import Foundation
let n = Int(readLine()!)!
var arr = Array(1...n)
func dfs(_ k: Int) {
    if k == n {
        print(arr.map { String($0)}.joined(separator: " "))
        return
    }
    for i in k..<n {
        arr.swapAt(k, i)
        dfs(k+1)
        arr.swapAt(k, i)
    }
}
dfs(0)
