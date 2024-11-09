//
//  18111.swift
//  Alogrithm2
//
//  Created by Sunho on 11/9/24.
//

import Foundation
let nmb = readLine()!.split(separator: " ").map{Int(String($0))!}, n = nmb[0], m = nmb[1], b = nmb[2]
var maps = [[Int]]()
for i in 0..<n {
    maps.append( readLine()!.split(separator: " ").map{Int(String($0))!})
}
// 제일 큰거에서제일작은거에 추가해주면 되지않을까?
let flattendMaps = maps.flatMap{$0}
let maxMap = maps.flatMap{$0}.max()!
let minMap = maps.flatMap{$0}.min()!
var resultTime = Int.max
var resultHeight = 0
for target in minMap...maxMap {
    var blocksToAdd = 0
    var blocksToRemove = 0
    for height in flattendMaps {
        if height > target {
            blocksToRemove += height - target
        } else {
            blocksToAdd += target - height
        }
    }
    if blocksToAdd <= blocksToRemove + b {
        let time = blocksToRemove * 2 + blocksToAdd
        if time < resultTime || (time == resultTime && target > resultHeight) {
            resultTime = time
            resultHeight = target
        }
    }
}
print(resultTime, resultHeight)
