//
//  main.swift
//  Alogrithm2
//
//  Created by Sunho on 2/10/25.
//

import Foundation
let nh = readLine()!.split(separator: " ").map{Int(String($0))!}, n = nh[0], h = nh[1]
var heights = [Int]()
for i in 0..<n {
    heights.append(Int(readLine()!)!)
}

var dp = Array(repeating: 0, count: h)
for height in stride(from: 0, to: n, by: 2) {
    for k in 0..<heights[height] {
        dp[k] += 1
    }
}
for k in stride(from:1 , to: n, by: 2) {
    let height = heights[k]
     for k in stride(from: h - 1, through: h - height, by: -1 ) {
        dp[k] += 1
    }
}
let dpmin = dp.min()!
let mincount = dp.filter{$0 == dpmin}.count
print(dpmin, mincount)
