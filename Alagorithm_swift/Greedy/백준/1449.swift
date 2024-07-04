//
//  1449.swift
//  Alagorithm_swift
//
//  Created by 235 on 7/4/24.
//

import Foundation
let nl = readLine()!.split(separator: " ").map{Int(String($0))!}, n = nl[0], l = nl[1]
var spots = readLine()!.split(separator: " ").map {Int(String($0))!}.sorted()
var isWaters = Array(repeating: false, count: 1001)

for i in spots{
    isWaters[i] = true
}

var k = 1
var cnt = 0
while k <= 1000 {
    if isWaters[k] {
        k += l
        cnt += 1
    } else {
        k += 1
    }
}

print(cnt)
