//
//  2877.swift
//  Alogrithm2
//
//  Created by Sunho on 3/19/25.
//

import Foundation
//let k = Int(readLine()!)!
//var answer = ""
//var num  = k + 1
//while num > 1 {
//    answer = String(num % 2) + answer
//    num /= 2
//}
//
//let result = answer.map{$0 == "0" ? "4" : "7"}.joined()
//print(result)

// 더 좋은 풀이 개쩐다.
let n = Int(readLine()!)!
var s = String(n+1, radix: 2)
s.removeFirst()
print(s.replacingOccurrences(of: "0", with: "4").replacingOccurrences(of: "1", with: "7"))
