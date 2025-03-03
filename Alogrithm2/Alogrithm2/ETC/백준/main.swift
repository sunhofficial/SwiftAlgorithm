//
//  main.swift
//  Alogrithm2
//
//  Created by Sunho on 3/3/25.
//
// 찾았다. 돌리는 라인 맨 왼쪽 아래한칸 - 돌리는 라인 맨 오른쪽 을 더하면 새로운 합이 됨.

import Foundation

let nmk = readLine()!.split(separator: " ").map{Int(String($0))!}
var maps = Array(repeating: [Int](), count: nmk[0])
var rcsList = [[Int]]()
for i in 0..<nmk[0] {
    maps[i].append(contentsOf: readLine()!.split(separator: " ").map{Int(String($0))!})
}
for _ in 0..<nmk[2] {
    rcsList.append(readLine()!.split(separator: " ").map { Int(String($0))! })
}
func rotate(_ rcs: [Int], metrix: inout [[Int]]) {
    let row = rcs[0] - 1
    let col = rcs[1] - 1
    let origin =  metrix
    for s in 1...rcs[2] {
        //위
        for c in col-s..<col+s {
            maps[row-s][c+1] = origin[row-s][c]
        }
        // 아래
        for c in (col-s+1...col+s).reversed() {
            maps[row+s][c-1] = origin[row+s][c]
        }
        //오
        for r in row-s..<row+s {
            maps[r + 1][col + s] = origin[r][col+s]
        }
        for l in (row-s+1...row+s).reversed() {
            maps[r-1][col -s ]
        }
    }
}
