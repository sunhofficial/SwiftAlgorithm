//
//  10816.swift
//  Alogrithm2
//
//  Created by Sunho on 8/14/24.
//

import Foundation
let n = Int(readLine()!)!
let cardDict  = Dictionary(readLine()!.split(separator: " ").map{(Int($0)!,1)},uniquingKeysWith: +)
let m = Int(readLine()!)!
let cardArray =  readLine()!.split(separator: " ").map { Int($0)! }
for num in cardArray {
    print(cardDict[num, default: 0], terminator: " ")
}
