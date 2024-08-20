//
//  2567.swift
//  Alogrithm2
//
//  Created by Sunho on 8/20/24.
//

import Foundation
let n = Int(readLine()!)!
var papaer = Array(repeating: Array(repeating: 0, count: 102), count:  102)
for _ in 0..<n {
    let ab = readLine()!.split(separator: " ").map{Int(String($0))!}
    for i in ab[0]+1...ab[0]+10 {
        for j in ab[1]+1...ab[1]+10 {
            papaer[i][j] = 1
        }
    }
}
let dy = [0,0,1,-1]
let dx = [1,-1,0,0]
var temp = 0
for i in 1...100 {
    for j in 1...100 {
        if papaer[i][j] == 1 {
            for k in 0..<4 {
                let nx = i + dx[k]
                let ny = j + dy[k]
                if papaer[nx][ny] == 0 {
                    temp += 1
                }
            }
        }
    }
}
print(temp)
