//
//  2002.swift
//  Alogrithm2
//
//  Created by Sunho on 3/6/25.
//

import Foundation
let n = Int(readLine()!)!
var start = [String: Int]()
var exitOrder = [String]()
for i in 0..<n {
    start[readLine()!,default: 0] = i
}
for i in 0..<n {
    let car = readLine()!
    exitOrder.append(car)
}
var cnt = 0

for i in 0..<n {
    for j in i+1..<n {
        if start[exitOrder[i]]! > start[exitOrder[j]]! {
            cnt += 1
            break
        }
    }
}

print(cnt)
