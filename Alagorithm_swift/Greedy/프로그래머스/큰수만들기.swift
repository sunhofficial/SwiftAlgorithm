//
//  큰수만들기.swift
//  Alogrithm2
//
//  Created by Sunho on 8/15/24.
//
import Foundation

func solution(_ number:String, _ k:Int) -> String {
    var result = [Int]()
    var count: Int = 0
    Array(number).compactMap { Int(String($0))}.forEach {item in
        while count < k {
            if let last = result.last, last < item {
                result.popLast()
                count += 1
            } else { break}
        }
        result.append(item)
    }
    return result[0..<(result.count - k + count)].map{"\($0)"}.joined()
    
//    let nums = number.map{Int(String($0))!}
//    var answer = [Int]()
//    var tempK = k
//    for i in 0..<nums.count {
//        while tempK > 0, !answer.isEmpty, answer.last! < nums[i] {
//            answer.removeLast()
//            tempK -= 1
//        }
//        if tempK <= 0 {
//            answer.append(contentsOf: nums[i...])
//            break
//        } else {
//            answer.append(nums[i])
//        }
//    }
//    return String(answer.map{String($0)}.joined().prefix(number.count-k))
}
