//
//  2583ㅣ.swift
//  Alagorithm_swift
//
//  Created by 235 on 7/7/24.
//

import Foundation
let mnk = readLine()!.split(separator: " ").map {Int(String($0))!}
var arr = Array(repeating: Array(repeating: 0, count: mnk[1]), count: mnk[0])

for i in 0..<mnk[2] {
    let xyzw = readLine()!.split(separator: " ").map {Int(String($0))!}

    for j in xyzw[1]..<xyzw[3] {
        for k in xyzw[0]..<xyzw[2] {
            arr[mnk[0] - j - 1 ][k] = -1
        }
    }

}
func dfs(_ x: Int, _ y: Int) -> Int {
    if 0..<mnk[0] ~= y && 0..<mnk[1] ~= x && arr[y][x] == 0 {

        arr[y][x] = -1
        var area = 1
        area += dfs(x, y+1)
        area += dfs(x, y - 1)
        area += dfs(x + 1, y)
        area += dfs(x - 1, y)
        return area
    }
    return 0
}
var results : [Int] = []
for i in 0..<mnk[1] {
    for j in 0..<mnk[0] {
        if arr[j][i] == 0 {
            results.append(dfs(i,j))
        }
    }
}


print(results.count)
print(results.sorted().map{String($0)}.joined(separator: " "))
