//
//  10942.swift
//  Alagorithm_swift
//
//  Created by 235 on 8/6/24.
//

import Foundation
let n = Int(readLine()!)!
let nums = readLine()!.split(separator: " ").map { Int(String($0))!}
let m = Int(readLine()!)!
for _ in 0..<m {
    let se = readLine()!.split(separator: " ").map { Int(String($0))!}, s = se[0] - 1, e = se[1] - 1
    isFalin(Array(nums[s...e])) ? print("1") : print("0")
}
func isFalin(_ arr: [Int]) -> Bool {
    var firstindex = 0
    var lastindex = arr.count - 1
    while firstindex < lastindex {
        if arr[firstindex] == arr[lastindex] {
            firstindex += 1
            lastindex -= 1
        } else {
            return false
        }
    }

    return true
}
