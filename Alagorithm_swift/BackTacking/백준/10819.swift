//
//  10819.swift
//  Alagorithm_swift
//
//  Created by 235 on 7/20/24.
//

import Foundation
//let n = Int(readLine()!)!
//var aArr = readLine()!.split(separator: " ").map { Int(String($0))!}
//var sortArr = aArr.sorted()
//let longArr = sortArr[n/2...n - 1].reversed().map {$0}
//var shortArr = sortArr[0..<n/2]
//var ansArr = Array(repeating: 0, count: n)
//if abs(longArr.last! - shortArr.last!) > abs(shortArr.last! - longArr.first!) {
//    for i in 0..<n {
//        if i % 2 == 0 {
//            ansArr[i] = longArr[i / 2]
//        }else {
//            ansArr[i] = shortArr[i / 2]
//        }
//    }
//} else {
//    ansArr[0] = shortArr.removeLast()
//    for i in 1..<n {
//        if i % 2 == 0 && i / 2 - 1 < shortArr.count   {
//            ansArr[i] = shortArr[i / 2 - 1]
//        } else {
//            ansArr[i] = longArr[i / 2]
//        }
//    }
//}
//
//var sum = 0
//var beforeArr = ansArr[0]
//for i in 1..<n {
//    sum += abs(beforeArr - ansArr[i])
//    beforeArr = ansArr[i]
//}
//print(sum)
////5     -1 -1 0 -3 -4에서 예외발생. 그냥 모든 케ㅁ이스를 커버칠수가없음 점차 할수록 예외도 발생하고... 그냥 모든 순열을 구해놔야할듯
let n = Int(String(readLine()!))!
var arrA = readLine()!.split(separator: " ").map{Int(String($0))!}
arrA.sort()
var sum = 1

