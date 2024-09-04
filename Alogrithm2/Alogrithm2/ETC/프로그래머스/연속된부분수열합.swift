//
//  연속된부분수열합.swift
//  Alogrithm2
//
//  Created by Sunho on 9/4/24.
//

import Foundation

func solution(_ sequence:[Int], _ k:Int) -> [Int] {
    var start = 0
    var end = 0
    var diff = Int.max
    var currentSum = sequence[0]
    var answer = [Int]()
    while end < sequence.count {
        if currentSum == k {
            if end - start < diff {
                diff = end - start
                answer = [start, end]
            }
            currentSum -= sequence[start]
            start += 1
        } else if currentSum < k {
            end += 1
            if end < sequence.count {
               currentSum += sequence[end]
            }
        } else {
            currentSum -= sequence[start]
            start += 1
        }
    }
    return answer
}
