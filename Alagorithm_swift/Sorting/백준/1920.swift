//
//  1920.swift
//  Alagorithm_swift
//
//  Created by 235 on 7/1/24.
//

import Foundation
let n = Int(readLine()!)!
var narr = readLine()!.split(separator: " ").map {Int($0)!}
let m = Int(readLine()!)!
var marr = readLine()!.split(separator: " ").map { Int($0)!}
narr.sort()
func binarySearch(narr: [Int], target: Int) -> Bool {
    var left = 0
    var right = narr.count - 1
    while left <= right {
        let mid = (left + right) / 2
        if target < narr[mid] {
            right = mid - 1
        } else if target == narr[mid] {
            return true
        } else {
            left = mid + 1
        }
    }
    return false
}
for val in marr {
    print(binarySearch(narr: narr, target: val) ? "1" : "0")
}
// ‼️틀린이유: N,M이 100,000으로 최악의 경우는 100,000 * 100,000 = 10억 But) 1초에 할수있는건 1억번연산. 즉 10초가 걸림. 그래서 O(m * log n)으로 하면 1,700,000번의 연산을 하기에 1초안에 할 수 있다.
//var answer: [Int] = []
//for val in marr {
//    var i = 0
//    var temp = false
//    while  i < narr.count && narr[i] <= val {
//        if narr[i] == val {
//            temp = true
//        }
//        i += 1
//    }
//    print(temp ? "1" : "0")
//}
