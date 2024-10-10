//
//  2110.swift
//  Alogrithm2
//
//  Created by Sunho on 10/10/24.
//

import Foundation
let nc = readLine()!.split(separator: " ").map{Int(String($0))!}, n = nc[0], c = nc[1]
var maps = [Int]()
for i in 0..<n {
    maps.append(Int(readLine()!)!)
}
maps.sort()
var start = 0
var end = maps[n-1] - maps[0]
var result = 0
func canPlaceRouters(_ distance: Int) -> Bool {
    var count = 1
    var lastInstalled = maps[0]
    for i in 1..<n {
        if maps[i] - lastInstalled >= distance {
            count += 1
            lastInstalled = maps[i]
        }
        if count >= c {
            return true
        }
    }
    return count >= c
}


while start <= end {
    let mid = (start + end) / 2
    if canPlaceRouters(mid) {
        result = mid
        start = mid + 1
    } else {
        end = mid - 1
    }
    
}
print(result)
