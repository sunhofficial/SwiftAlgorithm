//
//  11051.swift
//  Alagorithm_swift
//
//  Created by 235 on 7/10/24.
//

import Foundation
let n = Int(readLine()!)!
let nums = readLine()!.split(separator: " ").map {Int(String($0))!}
var dp = [Int]()
func upperBound(find: Int, numbers: [Int]) -> Int {
    var start = 0
    var end = numbers.count - 1
    var mid = 0
    while start < end {
        mid = (start + end) / 2
        if find < numbers[mid] {
            start = mid + 1
        } else {
            end = mid
        }
    }
    return end
}
for num in nums {
    if dp.isEmpty {
        dp.append(num)
    }
    if num < dp.last! {
        dp.append(num)
    } else {
        let index = upperBound(find: num, numbers: dp)
        dp[index] = num
    }
}

print(dp.count)
