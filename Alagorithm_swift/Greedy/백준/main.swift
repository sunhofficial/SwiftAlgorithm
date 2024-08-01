//
//  11000.swift
//  Alagorithm_swift
//
//  Created by 235 on 8/1/24.
//

import Foundation
let n = Int(readLine()!)!
var greedyArr = [[Int]]()
for _ in 0..<n {
    let st = readLine()!.split(separator: " ").map{ Int(String($0))!}
    greedyAlgoritim(nums: st)
}

func greedyAlgoritim(nums: [Int]) {
    if greedyArr.isEmpty {
        greedyArr.append(nums)
    } else {
        var lastval = 0
        var adding = false
        for i in 0..<greedyArr.count {
            if greedyArr[i].last! <= nums[0] && greedyArr[lastval].last! <= greedyArr[i].last! {
                lastval = i
                adding = true
            }
        }
        if adding {
            greedyArr[lastval] += nums
        } else {
            greedyArr.append(nums)
        }
    }
}
print(greedyArr.count)
