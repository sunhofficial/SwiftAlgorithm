//
//  15652.swift
//  Alagorithm_swift
//
//  Created by 235 on 8/6/24.
//

import Foundation
let nm = readLine()!.split(separator: " ").map{Int(String($0))!}, n = nm[0], m = nm[1]
var result = ""
func dfs(_ now: Int, _ index: Int, cur: String) {
    if now == nm[1] {
        result += "\(cur)\n"
        return
    } else {
        for i in index...nm[0] {
            dfs(now + 1, i, cur: cur + "\(i)")

        }
    }
}
dfs(0, 1, cur: "")
print(result)
