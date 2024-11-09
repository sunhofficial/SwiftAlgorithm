//
//  1021.swift
//  Alogrithm2
//
//  Created by Sunho on 11/9/24.
//

import Foundation
let nm =  readLine()!.split(separator: " ").map{Int(String($0))!}, n = nm[0], m = nm[1]
var target = readLine()!.split(separator: " ").map { Int($0)! }
var array = [Int](1...n)
var answer = 0, currentIndex = 0
for dest in target {
    let destIndex = Int(array.firstIndex(of: dest)!)
    let move = abs(destIndex - currentIndex)
    answer += min(move, array.count - move)
    currentIndex = destIndex
    array.remove(at: destIndex)
}
print(answer)
