//
//  11000.swift
//  Alagorithm_swift
//
//  Created by 235 on 8/1/24.
//

import Foundation
let n = Int(readLine()!)!
var intervals = [(Int,Int)]()
for _ in 0..<n {
    let st = readLine()!.split(separator: " ").map{ Int(String($0))!}
    intervals.append((st[0], st[1]))
}
intervals.sort {$0.0 < $1.0}
var endtimes = [Int]()
for interval in intervals {
    if let earliesEnd = endtimes.first, earliesEnd <= interval.0 {
        endtimes[0] = interval.1
    } else {
        endtimes.append(interval.1)
    }
    endtimes.sort()
}
print(endtimes.count)
//func greedyAlgoritim(nums: [Int]) {
//    if greedyArr.isEmpty {
//        greedyArr.append(nums)
//    } else {
//        var lastval = 0
//        var adding = false
//        for i in 0..<greedyArr.count {
//            if greedyArr[i].last! <= nums[0] && greedyArr[lastval].last! <= greedyArr[i].last! {
//                lastval = i
//                adding = true
//            }
//        }
//        if adding {
//            greedyArr[lastval] += nums
//        } else {
//            greedyArr.append(nums)
//        }
//    }
//}
//print(greedyArr.count)
